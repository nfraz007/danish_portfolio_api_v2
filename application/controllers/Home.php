<?php
defined('BASEPATH') OR exit('No direct script access allowed');
header('Access-Control-Allow-Origin: *');

class Home extends MY_Controller {

	public function index(){
		try{
			$data = array();

			$data["skills"] = $this->get_skill();
			$data["experiences"] = $this->get_experience(true);
			$data["educations"] = $this->get_education();
			$data["achievements"] = $this->get_achievement();
			$data["awards"] = $this->get_award();
			$data["count"] = $this->get_count();

			$this->my_output_success($data);
		}catch(Exception $e){
			$this->my_output_error($e->getMessage());
		}
	}

	public function work_experience(){
		try{
			$data = array();

			$data["experiences"] = $this->get_experience();

			$this->my_output_success($data);
		}catch(Exception $e){
			$this->my_output_error($e->getMessage());
		}
	}

	public function projects(){
		try{
			$data = array();

			$data["projects"] = $this->get_project();

			$this->my_output_success($data);
		}catch(Exception $e){
			$this->my_output_error($e->getMessage());
		}
	}

	public function certifications(){
		try{
			$data = array();

			$data["certificates"] = $this->get_certificate();

			$this->my_output_success($data);
		}catch(Exception $e){
			$this->my_output_error($e->getMessage());
		}
	}
}