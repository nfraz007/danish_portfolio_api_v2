<?php
defined('BASEPATH') OR exit('No direct script access allowed');

require 'vendor/autoload.php';

// this is core controller
class MY_Controller extends CI_Controller {
	public $meta = array();
	public $menu = array();
	public $menu_current = "";
	public $social = array();
	public $profile = array();
	public $section = array();

	public function __construct(){
		parent::__construct();

		// set default time zone
		date_default_timezone_set("Asia/Kolkata");

		// init setting
		$this->set_menu_current();
		$this->set_menu();
		$this->set_social();
		$this->set_section();
		$this->set_profile();
		$this->set_meta();
	}

	public function my_output($status = false, $message = "", $data = array()){
		$this->output->set_content_type('application/json')->set_output(json_encode([
			"status" => true,
			"message" => $message,
			"data" => $data,
			"meta" => $this->meta,
			"menu" => $this->menu,
			"menu_current" => $this->menu_current,
			"social" => $this->social,
			"profile" => $this->profile,
			"section" => $this->section
		]));
	}

	public function my_output_success($data = []){
		return $this->my_output(true, "Successfully got the data.", $data);
	}

	public function my_output_error($message = ""){
		return $this->my_output(false, $message, []);
	}

	public function set_meta(){
		$description = "";
		$keywords = "";
		$common = [ $this->profile["first_name"], $this->profile["last_name"], $this->profile["full_name"] ];

		switch($this->menu_current){
			case "about-me":
				$description = $this->profile["profile_detail"];
				$keywords = implode(",", array_merge($common, [ $this->profile["designation"], $this->profile["website"], $this->profile["city"], $this->profile["country"] ]));
				break;

			case "work-experience":
				$description = $this->section["EXPERIENCE"]["section_detail"];
				$keywords = implode(",", array_merge($common, array_column($this->get_experience(), "company_name")));
				break;

			case "projects":
				$description = $this->section["PROJECT"]["section_detail"];
				$keywords = implode(",", array_merge($common, array_column($this->get_project(), "project_name")));
				break;

			case "certifications":
				$description = $this->section["CERTIFICATE"]["section_detail"];
				$keywords = implode(",", array_merge($common, array_column($this->get_certificate(), "certificate_name")));
				break;

			case "contact":
				$description = $this->section["CONTACT"]["section_detail"];
				$keywords = implode(",", array_merge($common, [ $this->profile["designation"], $this->profile["website"], $this->profile["phone"], $this->profile["email"] ]));
				break;
		}

		$this->meta["author"] = $this->profile["full_name"];
		$this->meta["keywords"] = $keywords;
		$this->meta["description"] = $description;
	}

	public function set_menu_current(){
		$uri_current = uri_string(1);
		$this->menu_current = ($uri_current) ? $uri_current : "about-me";
	}

	public function set_menu(){
		$params = []; $filters = []; $specials = [];
		$params["menu"] = ["*"];
		$filters = ["menu_status" => 1];
		$specials = ["order_by" => "menu_order", "order_type" => "asc"];
		$this->menu = $this->model->gets("menu", $params, $filters, $specials);
	}

	public function set_social(){
		$params = []; $filters = []; $specials = [];
		$params["social"] = ["*"];
		$filters = ["social_status" => 1];
		$specials = ["order_by" => "social_order", "order_type" => "asc"];
		$this->social = $this->model->gets("social", $params, $filters, $specials);
	}

	public function set_section(){
		$params = []; $filters = []; $specials = [];
		$params["section"] = ["*"];
		$filters = ["section_status" => 1];
		$specials = [];
		$sections = $this->model->gets("section", $params, $filters, $specials);

		foreach($sections as $section){
			$this->section[$section["section_value"]] = $section;
		}
	}

	public function set_profile(){
		$params = []; $filters = []; $specials = [];
		$params["profile"] = ["*"];
		$filters = ["profile_status" => 1];
		$specials = ["single" => true];
		$this->profile = $this->model->gets("profile", $params, $filters, $specials);

		$this->profile["full_name"] = implode(" ", [$this->profile["first_name"], $this->profile["last_name"]]);
		$this->profile["address"] = implode(", ", [$this->profile["city"], $this->profile["country"]]);
		$this->profile["phone_text"] = implode(", ", [$this->profile["phone"], $this->profile["phone_alt"]]);
		$this->profile["email_text"] = implode(", ", [$this->profile["email"], $this->profile["email_alt"]]);

		if($this->profile["profile"]){
			$this->profile["profile_url"] = asset_url()."/images/".$this->profile["profile"];
		}else{
			$this->profile["profile_url"] = "#";
		}

		if($this->profile["resume"]){
			$this->profile["resume_url"] = downloads_url($this->profile["resume"]);
		}else{
			$this->profile["resume_url"] = "#";
		}

		if($this->profile["cv"]){
			$this->profile["cv_url"] = downloads_url($this->profile["cv"]);
		}else{
			$this->profile["cv_url"] = "#";
		}
	}

	public function get_skill(){
		$params = []; $filters = []; $specials = [];
		$params["skill"] = ["*"];
		$filters = ["skill_status" => 1];
		$specials = ["order_by" => "skill_order", "order_type" => "asc"];
		
		$skills = $this->model->gets("skill", $params, $filters, $specials);
		
		return $skills;
	}

	public function get_experience($home = false){
		$params = []; $filters = []; $specials = [];
		$params["experience"] = ["*"];
		$filters = ["experience_status" => 1];
		$specials = ["order_by" => "start_at", "order_type" => "desc"];
		if($home){
			$specials["limit"] = 2;
		}
		$experiences = $this->model->gets("experience", $params, $filters, $specials);
		foreach($experiences as $key => $experience){
			if($experience["start_at"]){
				$experiences[$key]["start_at_text"] = date(DATE_DEFAULT, strtotime($experience["start_at"]));
			}else{
				$experiences[$key]["start_at_text"] = "";
			}

			if($experience["end_at"]){
				$experiences[$key]["end_at_text"] = date(DATE_DEFAULT, strtotime($experience["end_at"]));
			}else{
				$experiences[$key]["end_at_text"] = "Present";
			}

			$experiences[$key]["duration"] = $this->get_duration($experience["start_at"], $experience["end_at"]);
		}
		return $experiences;
	}

	public function get_project($project_type = ""){
		$params = []; $filters = []; $specials = [];
		$params["project"] = ["project.*"];
		$params["experience"] = ["company_name"];
		$filters = ["project_status" => 1];
		if($project_type) $filters["project.project_type"] = $project_type;
		$specials = ["order_by" => "project.start_at", "order_type" => "desc"];
		
		$projects = $this->model->gets("project", $params, $filters, $specials);
		foreach($projects as $key => $project){
			if(strpos($project["project_detail"], "\n") !== false){
				$project_detail = $project["project_detail"];
				// means new line is here, then replace in li
				$project_detail_temp = explode("\n", $project_detail);
				$project_detail = "<li>".implode("</li><li>", $project_detail_temp)."</li>";
				$projects[$key]["project_detail"] = $project_detail;
			}

			if($project["start_at"]){
				$projects[$key]["start_at_text"] = date(DATE_DEFAULT, strtotime($project["start_at"]));
			}else{
				$projects[$key]["start_at_text"] = "Present";
			}

			if($project["end_at"]){
				$projects[$key]["end_at_text"] = date(DATE_DEFAULT, strtotime($project["end_at"]));
			}else{
				$projects[$key]["end_at_text"] = "Present";
			}

			$projects[$key]["technology_array"] = explode(",", $project["technology"]);

			$projects[$key]["duration"] = $this->get_duration($project["start_at"], $project["end_at"]);
		}
		return $projects;
	}

	public function get_education(){
		$params = []; $filters = []; $specials = [];
		$params["education"] = ["*"];
		$filters = ["education_status" => 1];
		$specials = ["order_by" => "year", "order_type" => "desc"];
		
		$educations = $this->model->gets("education", $params, $filters, $specials);

		return $educations;
	}

	public function get_achievement(){
		$params = []; $filters = []; $specials = [];
		$params["achievement"] = ["*"];
		$filters = ["achievement_status" => 1];
		$specials = ["order_by" => "achievement_year", "order_type" => "desc"];

		$achievements = $this->model->gets("achievement", $params, $filters, $specials);
		
		return $achievements;
	}

	public function get_award(){
		$params = []; $filters = []; $specials = [];
		$params["award"] = ["*"];
		$filters = ["award_status" => 1];
		$specials = ["order_by" => "award_year", "order_type" => "desc"];

		$awards = $this->model->gets("award", $params, $filters, $specials);
		
		return $awards;
	}

	public function get_certificate(){
		$params = []; $filters = []; $specials = [];
		$params["certificate"] = ["*"];
		$filters = ["certificate_status" => 1];
		$specials = ["order_by" => "issued_at", "order_type" => "desc"];
		
		$certificates = $this->model->gets("certificate", $params, $filters, $specials);
		foreach($certificates as $key => $certificate){
			if($certificate["issued_at"]){
				$certificates[$key]["issued_at_text"] = date(DATE_DEFAULT, strtotime($certificate["issued_at"]));
			}else{
				$certificates[$key]["issued_at_text"] = "";
			}

			if($certificate["certificate_image"]){
				$certificates[$key]["certificate_image_url"] = assets_url("images/certificate/".$certificate["certificate_image"]);
			}else{
				$certificates[$key]["certificate_image_url"] = "#";
			}
		}
		return $certificates;
	}

	public function get_count(){
		$count = array();

		$count["experience"] = $this->get_total_experience();
		$count["project_company"] = count($this->get_project("COMPANY"));
		$count["project_personal"] = count($this->get_project("PERSONAL"));
		$count["project"] = $count["project_personal"] + $count["project_company"];
		$count["certificate"] = count($this->get_certificate());
		$count["achievement"] = count($this->get_achievement());
		$count["award"] = count($this->get_award());

		return $count;
	}

	public function get_total_experience($date_format = ""){
		$total_experience_temp = new DateTime("0000-00-00 00:00:00");
		$total_experience = clone $total_experience_temp;

		$experiences = $this->get_experience();

		foreach($experiences as $experience){
			$start_at = new DateTime($experience["start_at"]);
			$end_at = ($experience["end_at"]) ? new DateTime($experience["end_at"]) : new DateTime(date("Y-m-d H:i:s"));
			
			$date_diff = $start_at->diff($end_at);

			$total_experience_temp->add($date_diff);
		}

		$total_experience = $total_experience->diff($total_experience_temp);

		if($date_format){
			return $total_experience->format($date_format);
		}else{
			$total_experience_year = (int)$total_experience->format("%y");
			$total_experience_month = (int)$total_experience->format("%m");

			return round($total_experience_year + $total_experience_month/12, 1);
		}
	}

	public function get_duration($start_at = "", $end_at = ""){
		$start_at = new DateTime($start_at);
		$end_at = new DateTime($end_at);

		$date_diff = $start_at->diff($end_at);

		$date_diff_year = (int)$date_diff->format("%y");
		$date_diff_month = (int)$date_diff->format("%m");
		$date_diff_day = (int)$date_diff->format("%d");

		$date_diff_text = "";

		if($date_diff_year) $date_diff_text .= $date_diff_year . " yr ";
		if($date_diff_month) $date_diff_text .= $date_diff_month . " mos ";
		if($date_diff_day) $date_diff_text .= $date_diff_day . " days ";

		return $date_diff_text;
	}
}