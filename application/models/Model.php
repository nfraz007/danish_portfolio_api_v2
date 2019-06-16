<?php
defined('BASEPATH') OR exit('No direct script access allowed');
class Model extends CI_model{

    function __construct(){
        parent::__construct();
    }

    // this will add prefix in the table
    public function prefix($table = ""){
        return PREFIX.$table;
    }

    // this function is for update the table
    public function update($table_main = "", $params = array(), $filters = array()){
    	return $this->db->where($filters)->update($this->prefix($table_main), $params);
    }

    // this function is for geting single data within the table
    public function get($table_main = "", $params_main = array(), $filters = array()){
    	$params[$table_main] = $params_main;
    	$specials["single"] = true;
    	return $this->gets($table_main, $params, $filters, $specials);
    }

    // this function is for getting multiple data within any table
    public function gets($table_main = "", $params = array(), $filters = array(), $specials = array()){
    	$this->db->from($this->prefix($table_main)." as ".$table_main);
    	switch ($table_main){
		    case "menu":
    			$primary_key = "menu_id";
    			foreach ($params as $table => $param) {
		            switch ($table) {
		                case $table_main:
		                    $this->db->select($param);
		                    break;
		                /*case "master_module":
		                    $this->db->select($param);
		                    $this->db->join("master_module", "master_module.app_id = $table_main.$primary_key","left");
		                    break;*/
		            }
		        }
		        break;

            case "social":
                $primary_key = "social_id";
                foreach ($params as $table => $param) {
                    switch ($table) {
                        case $table_main:
                            $this->db->select($param);
                            break;
                    }
                }
                break;

            case "section":
                $primary_key = "section_id";
                foreach ($params as $table => $param) {
                    switch ($table) {
                        case $table_main:
                            $this->db->select($param);
                            break;
                    }
                }
                break;

            case "profile":
                $primary_key = "profile_id";
                foreach ($params as $table => $param) {
                    switch ($table) {
                        case $table_main:
                            $this->db->select($param);
                            break;
                    }
                }
                break;

            case "experience":
                $primary_key = "experience_id";
                foreach ($params as $table => $param) {
                    switch ($table) {
                        case $table_main:
                            $this->db->select($param);
                            break;
                    }
                }
                break;

            case "project":
                $primary_key = "project_id";
                foreach ($params as $table => $param) {
                    switch ($table) {
                        case $table_main:
                            $this->db->select($param);
                            break;
                        case "experience":
                            $this->db->select($param);
                            $this->db->join($this->prefix("experience")." as experience", "experience.experience_id = $table_main.experience_id","left");
                            break;
                    }
                }
                break;

            case "education":
                $primary_key = "education_id";
                foreach ($params as $table => $param) {
                    switch ($table) {
                        case $table_main:
                            $this->db->select($param);
                            break;
                    }
                }
                break;

            case "achievement":
                $primary_key = "achievement_id";
                foreach ($params as $table => $param) {
                    switch ($table) {
                        case $table_main:
                            $this->db->select($param);
                            break;
                    }
                }
                break;

            case "award":
                $primary_key = "award_id";
                foreach ($params as $table => $param) {
                    switch ($table) {
                        case $table_main:
                            $this->db->select($param);
                            break;
                    }
                }
                break;

            case "certificate":
                $primary_key = "certificate_id";
                foreach ($params as $table => $param) {
                    switch ($table) {
                        case $table_main:
                            $this->db->select($param);
                            break;
                    }
                }
                break;
    	}

        if(array_key_exists('filters_or', $specials)){
            $filters_or = $specials['filters_or'];
            if(count($filters_or) > 0) {
                $this->db->or_where($filters_or);
            }
        }

        if(array_key_exists('filters_in', $specials)){
            $filters_in = $specials['filters_in'];
            if(count($filters_in) > 0) {
                foreach ($filters_in as $column => $arrayValues) {
                    $this->db->group_start();
                    $chunks = array_chunk($arrayValues, 25);
                    foreach ($chunks as $chunk) {
                        $this->db->or_where_in($column, $chunk);
                    }
                    $this->db->group_end();
                }
            }
        }

        // Code for And Clause
        if($filters != "" || count($filters) > 0) {
            $this->db->where($filters);
        } 


        // Group By Clause
        if(array_key_exists('group_by', $specials)){
            $group_by = $specials['group_by'];
            if($group_by != "") {
                $this->db->group_by($group_by);
            }
        }

        // If there are any like queries
        if(array_key_exists('like', $specials)){
            $like = $specials['like'];
            if(count($like) > 0) {
                $this->db->like($like);
            }
        }


        // If there are search keys
        if(array_key_exists('search_key', $specials)){
            $search_key = $specials['search_key'];
            $search_in = $specials['search_in'];
            if(count($search_in) > 0) {
                    $this->db->group_start();
                    foreach($search_in as $key => $value){
                        $this->db->or_like($value,$search_key);
                    }
                    $this->db->group_end();
            }
        }
        
        // Order By Clause
        if(array_key_exists('order_by', $specials)){
            $order_by = $specials['order_by'];
            $order_type = $specials['order_type'];
            if($order_by != "") {
                $this->db->order_by($order_by, $order_type);
            }
        }

        if(array_key_exists('limit', $specials)){
            $limit = $specials['limit'];
             if($limit != null) {
                $this->db->limit($limit);
            }
        }

        if(array_key_exists('offset', $specials)){
            $offset = $specials['offset'];
            if($offset != null) {
                $this->db->offset($offset);
            }
        }

        if(array_key_exists('single', $specials)){
        	$single = $specials["single"];
        	if($single){
        		return $this->db->get()->row_array();
        	}
        }

        return $this->db->get()->result_array();//echo $this->db->last_query();die;
    }
}