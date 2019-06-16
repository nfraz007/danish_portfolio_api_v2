<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Email_library {
	protected $CI;

	public function __construct() {
		$this->CI =& get_instance();
	}

	public function send_email($template = "", $data = array()){
		$template = $this->get_template($template, $data);
		$subject = $template["subject"];
		$html = $template["html"];
		$to = $data["to"];
		$to_name = $data["to_name"];

		$email = new \SendGrid\Mail\Mail(); 
		$email->setFrom($this->CI->profile["email"], $this->CI->profile["first_name"]);
		$email->setSubject($subject);
		$email->addTo($to, $to_name);
		$email->addContent(
		    "text/html", $html
		);
		$sendgrid = new \SendGrid(EMAIL_API);
		
		if($subject && $html && $to && $to_name){
			$sendgrid->send($email);
			$this->send_email_admin($data);
		}
	}

	public function get_template($template = "", $data = array()){
		$subject = "";
		$html = "";

		switch($template){
			case "CONTACT_SUCCESS_USER":
				$subject = "Thank You Sir";
				$html = $this->CI->load->view("email/contact_success_user", $data, true);
				break;
		}

		return ["subject" => $subject, "html" => $html];
	}

	public function send_email_admin($data = array()){
		$data_browser = $this->CI->get_browser_data();
		$data = array_merge($data, $data_browser);
		$data["data"] = $data;

		$subject = "Message : ".$data["to_name"]." | ".$data["to"]." | ".$data["phone"];
		$html = $this->CI->load->view("email/success_admin", $data, true);
		$to = $this->CI->profile["email"];
		$to_name = $this->CI->profile["full_name"];

		$email = new \SendGrid\Mail\Mail(); 
		$email->setFrom($data["to"], $data["to_name"]);
		$email->setSubject($subject);
		$email->addTo($to, $to_name);
		$email->addContent(
		    "text/html", $html
		);
		$sendgrid = new \SendGrid(EMAIL_API);
		
		if($subject && $html && $to && $to_name){
			$sendgrid->send($email);
		}
	}
}