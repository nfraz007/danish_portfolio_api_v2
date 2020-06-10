-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jun 16, 2019 at 01:40 PM
-- Server version: 5.7.26-0ubuntu0.16.04.1
-- PHP Version: 7.0.33-0ubuntu0.16.04.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `danish_portfolio_v2`
--

-- --------------------------------------------------------

--
-- Table structure for table `gd2_achievement`
--

CREATE TABLE `gd2_achievement` (
  `achievement_id` int(11) NOT NULL,
  `achievement_title` varchar(500) NOT NULL,
  `achievement_url` varchar(500) NOT NULL,
  `achievement_year` varchar(50) NOT NULL,
  `achievement_status` int(11) NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `gd2_achievement`
--

INSERT INTO `gd2_achievement` (`achievement_id`, `achievement_title`, `achievement_url`, `achievement_year`, `achievement_status`, `created_at`) VALUES
(1, 'Published a conference paper on “Novel FEM Formulations for Maxwell’s Equation” at IISc Bangalore', '', '2011', 1, '2019-06-16 00:00:00'),
(2, 'Developed C code for a computational solver using edge-based FEM formulation for 2D and 3D FE Waveguide\r\nDiscontinuity Problem; This work was showcased at CFD workshop at C-DAC and ADA, Bangalore', '', '2010', 1, '2019-06-16 00:00:00'),
(3, 'Core Team Head Of Fine Arts Society, IIT Bhubaneswar', '', '2009 - 2011', 1, '2019-06-16 00:00:00'),
(4, 'All India Rank 6506 in IIT-JEE', '', '2008', 1, '2019-06-16 00:00:00'),
(5, 'Appeared For National Mathematics Olympiad.', '', '2007', 1, '2019-06-16 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `gd2_award`
--

CREATE TABLE `gd2_award` (
  `award_id` int(11) NOT NULL,
  `award_title` varchar(100) DEFAULT NULL,
  `award_description` varchar(500) DEFAULT NULL,
  `award_year` varchar(50) NOT NULL,
  `award_status` int(11) NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `gd2_award`
--

INSERT INTO `gd2_award` (`award_id`, `award_title`, `award_description`, `award_year`, `award_status`, `created_at`) VALUES
(1, 'Insta Award', 'Received Insta Award for Python Expertise', '2017', 1, '2019-06-15 00:00:00'),
(2, 'Most Valuable Player', 'Received Most Valuable Player (MVP) Award for outstanding leadership', '2017', 1, '2019-06-15 00:00:00'),
(3, 'Insta Award', 'Received Insta Award for all-round performance in all modules', '2016', 1, '2019-06-15 00:00:00'),
(4, 'Spot Award', 'Received Spot Award for outstanding work ethic and technical excellence', '2015', 1, '2019-06-15 00:00:00'),
(5, 'Team Magnet Badge', 'Received Team Magnet Badge for excellent leadership and team working skills in Airbus A350 Project.', '2014', 1, '2019-06-15 00:00:00'),
(6, 'Merit Cum Means Scholarship', ' Received Merit-Cum-Means (MCM) Scholarship for four consecutive years at IIT Bhubaneswar', '2008 - 2012', 1, '2019-06-15 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `gd2_certificate`
--

CREATE TABLE `gd2_certificate` (
  `certificate_id` int(11) NOT NULL,
  `certificate_name` varchar(500) NOT NULL,
  `event` varchar(500) NOT NULL,
  `website` varchar(500) NOT NULL,
  `certificate_url` varchar(1000) NOT NULL DEFAULT '#',
  `license` varchar(500) NOT NULL DEFAULT 'NA',
  `certificate_image` varchar(500) NOT NULL DEFAULT 'default.jpg',
  `issued_at` date NOT NULL,
  `certificate_status` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `gd2_certificate`
--

INSERT INTO `gd2_certificate` (`certificate_id`, `certificate_name`, `event`, `website`, `certificate_url`, `license`, `certificate_image`, `issued_at`, `certificate_status`, `created_at`) VALUES
(1, 'Deep Learning Fundamentals', 'IBM', 'Cognitive Class', 'https://courses.cognitiveclass.ai/certificates/2e76ed7c319c4d50b045823c63a049ed', '2e76ed7c319c4d50b045823c63a049ed', 'deep_learning_fundamentals.png', '2019-05-31', 1, '2019-06-15 00:00:00'),
(2, 'Exploring Spark\'s GraphX', 'IBM', 'Cognitive Class', 'https://courses.cognitiveclass.ai/certificates/922f0878be6c44fdaab4088c9e360548', '922f0878be6c44fdaab4088c9e360548', 'exploring_sparks_graphx.png', '2019-03-24', 1, '2019-06-15 00:00:00'),
(3, 'Spark - Level 1', 'IBM', 'Acclaim', 'https://www.youracclaim.com/badges/a7f181a8-072b-4f18-ab59-827bf86b4180/linked_in_profile', 'a7f181a8-072b-4f18-ab59-827bf86b4180', 'spark_level_1.png', '2019-03-30', 1, '2019-06-15 00:00:00'),
(4, 'Flight Vehicle Aerodynamics', '', 'Edx', '', '', 'default.jpg', '2016-05-01', 1, '2019-06-15 00:00:00'),
(5, 'Material Overview For Engineer', '', 'Edx', '', '', 'default.jpg', '2015-02-15', 1, '2019-06-15 00:00:00'),
(6, 'Mechanical Behavior of Materials', 'MITx', 'Edx', 'https://s3.amazonaws.com/verify.edx.org/downloads/39e722bc261543c69b565f5c03f0bf01/Certificate.pdf', '39e722bc261543c69b565f5c03f0bf01', 'mechanical_behaviour_of_materials.png', '2014-12-19', 1, '2019-06-15 00:00:00'),
(7, 'Elements of Structures', 'MITx', 'Edx', 'https://s3.amazonaws.com/verify.edx.org/downloads/440408abc368408287f850e8f194ce4c/Certificate.pdf', '440408abc368408287f850e8f194ce4c', 'elements_of_structures.png', '2014-08-29', 1, '2019-06-15 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `gd2_education`
--

CREATE TABLE `gd2_education` (
  `education_id` int(11) NOT NULL,
  `institute_name` varchar(50) NOT NULL,
  `institute_icon` varchar(50) NOT NULL,
  `institute_url` varchar(100) NOT NULL,
  `degree` varchar(50) NOT NULL,
  `field_of_study` varchar(50) NOT NULL,
  `grade` varchar(50) NOT NULL,
  `year` varchar(50) NOT NULL,
  `education_status` int(11) NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `gd2_education`
--

INSERT INTO `gd2_education` (`education_id`, `institute_name`, `institute_icon`, `institute_url`, `degree`, `field_of_study`, `grade`, `year`, `education_status`, `created_at`) VALUES
(1, 'IIT Bhubaneswar', '', 'http://www.iitbbs.ac.in', 'B.Tech', 'Mechanical', '8.48 GGPA', '2008 - 2012', 1, '2019-06-15 00:00:00'),
(2, 'MK DAV Public School', '', 'http://mkdav.in/', '12th', 'CBSE', '89.6 %', '2007', 1, '2019-06-15 00:00:00'),
(3, 'Rotary School', '', '', '10th', 'CBSE', '92.8 %', '2005', 1, '2019-06-15 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `gd2_experience`
--

CREATE TABLE `gd2_experience` (
  `experience_id` int(11) NOT NULL,
  `experience_type` varchar(50) NOT NULL DEFAULT 'FULL_TIME' COMMENT 'FULL_TIME, FREELANCE, INTERNSHIP',
  `company_name` varchar(50) NOT NULL,
  `company_logo` varchar(100) NOT NULL,
  `company_url` varchar(100) NOT NULL,
  `designation` varchar(50) NOT NULL,
  `city` varchar(50) NOT NULL,
  `country` varchar(50) NOT NULL,
  `start_at` datetime NOT NULL,
  `end_at` datetime DEFAULT NULL,
  `detail` text NOT NULL,
  `experience_status` int(11) NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `gd2_experience`
--

INSERT INTO `gd2_experience` (`experience_id`, `experience_type`, `company_name`, `company_logo`, `company_url`, `designation`, `city`, `country`, `start_at`, `end_at`, `detail`, `experience_status`, `created_at`) VALUES
(1, 'FULL_TIME', 'Infosys', '', 'https://www.infosys.com', 'Machine Learning Engineer', 'Mysore', 'India', '2017-10-01 00:00:00', '2018-06-01 00:00:00', 'Predicting Pump Failure using SVM classification for Time Series data. Predicting Remaining Useful Life of Pump using Random Forest Algorithm. Detecting Failure/Anomaly using Self-Organizing Maps (SOM). Expertise in implementing end-to-end Machine Learning project for Engineering Systems.', 1, '2019-06-15 00:00:00'),
(2, 'FULL_TIME', 'Hindustan Aeronautic Limited', '', 'https://hal-india.co.in', 'Summer Internship', 'Orisa', 'India', '2010-05-01 00:00:00', '2010-07-01 00:00:00', 'I observed and understood the principle and working of Electron Beam Welding (EBW) machine.', 1, '2019-06-15 00:00:00'),
(3, 'FULL_TIME', 'BDI Plus Pvt Ltd', '', 'https://bdiplus.com', 'Data Scientist', 'Bengaluru', 'India', '2018-07-01 00:00:00', NULL, 'For the last year, I have been working on the company\'s signature product which deals with a new branch of data science aimed at providing Customer Profiling solutions to prospective clients. I have learnt many new things and used it to implement Customer Network Anaytics and 360 View Creation. I have gained significant experience in developing big data solutions using Scala and Spark.', 1, '2019-06-15 00:00:00'),
(4, 'FULL_TIME', 'Zeus Numerix', '', 'http://www.zeusnumerix.com', 'Summer Internship', 'Mumbai', 'India', '2011-05-01 00:00:00', '2011-07-01 00:00:00', 'Developed a computational solver based on C programming language to solve the waveguide discontinuity problem encountered in computational electromagnetics. Although many commercial software do exist that could solve this problem but they use conventional nodal finite elements analysis which poses extraneous solutions in some cases. That\'s where vector finite elements come into play. Our challenge was to go to the basics, understand the problem, discretize the maxwell\'s electromagnetic equations for a given geometry using vector FEM and solve the resulting linear system of equations. At first, we solved the problem for 8 elements/9 nodes rectangular geometry. The results matched. Then we extended it to n-elements too. We showcased our work at CEM workshop at C-DAC Bangalore. Our effort was appreciated by our peers and was published in 13th AesI CFD symposium, IISc Bangalore, 2011.', 1, '2019-06-15 00:00:00'),
(5, 'FULL_TIME', 'Infosys', '', 'https://www.infosys.com', 'Data Analyst', 'Mysore', 'India', '2017-06-01 00:00:00', '2017-10-01 00:00:00', 'Loads Database Generation Python for aerospace client. Insta Award for quick learning Python for critical project.', 1, '2019-06-15 00:00:00'),
(6, 'FULL_TIME', 'Infosys', '', 'https://www.infosys.com', 'Engineering Analyst', 'Mysore', 'India', '2012-08-01 00:00:00', '2017-05-01 00:00:00', 'Stress analysis of aircraft components. Technical documentation.', 1, '2019-06-15 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `gd2_menu`
--

CREATE TABLE `gd2_menu` (
  `menu_id` int(11) NOT NULL,
  `menu_name` varchar(50) NOT NULL,
  `menu_url` varchar(50) NOT NULL,
  `menu_icon` varchar(50) NOT NULL,
  `parent_id` int(11) NOT NULL,
  `menu_status` int(11) NOT NULL,
  `menu_order` decimal(10,2) NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `gd2_menu`
--

INSERT INTO `gd2_menu` (`menu_id`, `menu_name`, `menu_url`, `menu_icon`, `parent_id`, `menu_status`, `menu_order`, `created_at`) VALUES
(1, 'About Me', '/', 'fa fa-user-circle', 0, 1, '1.00', '2018-08-10 12:00:00'),
(2, 'Work Experience', 'work-experience', 'fa fa-briefcase', 0, 1, '2.00', '2018-08-10 12:00:00'),
(3, 'Projects', 'projects', 'fa fa-code', 0, 1, '3.00', '2018-08-10 12:00:00'),
(4, 'Certifications', 'certifications', 'fa fa-certificate', 0, 1, '4.00', '2018-08-10 12:00:00'),
(5, 'Blog', 'https://medium.com/@nfraz007', 'fa fa-rss', 0, 0, '5.00', '2018-08-10 12:00:00'),
(6, 'Contact', 'contact', 'fa fa-address-book', 0, 0, '6.00', '2018-08-10 12:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `gd2_profile`
--

CREATE TABLE `gd2_profile` (
  `profile_id` int(11) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `designation` varchar(50) NOT NULL,
  `phone` varchar(50) NOT NULL,
  `phone_alt` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `email_alt` varchar(50) NOT NULL,
  `website` varchar(50) NOT NULL,
  `website_alt` varchar(50) NOT NULL,
  `city` varchar(50) NOT NULL,
  `country` varchar(50) NOT NULL,
  `profile` varchar(50) DEFAULT 'profile.jpg',
  `resume` varchar(100) NOT NULL DEFAULT 'resume.pdf',
  `cv` varchar(100) DEFAULT 'cv.pdf',
  `profile_detail` varchar(1000) NOT NULL,
  `profile_status` int(11) NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `gd2_profile`
--

INSERT INTO `gd2_profile` (`profile_id`, `first_name`, `last_name`, `designation`, `phone`, `phone_alt`, `email`, `email_alt`, `website`, `website_alt`, `city`, `country`, `profile`, `resume`, `cv`, `profile_detail`, `profile_status`, `created_at`) VALUES
(1, 'Gouher', 'Danish', 'Data Scientist', '8792558264', '7004247708', 'gouherdanishiitkgp@gmail.com', '', 'http://gouherdanish.co.nf', '', 'Bangalore', 'India', 'profile.png', 'resume.pdf', 'cv.pdf', 'I love Maths and I know how to use coding to solve real world problems. I love to learn new technologies and implement it in my projects. I strive constantly to improve myself, to be better than yesterday not only professionally but personally. I like to read articles on data science and ardently follow latest discoveries.', 1, '2018-08-10 12:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `gd2_project`
--

CREATE TABLE `gd2_project` (
  `project_id` int(11) NOT NULL,
  `experience_id` int(11) DEFAULT NULL,
  `project_type` varchar(50) NOT NULL DEFAULT 'PERSONAL' COMMENT 'PERSONAL,FREELANCE,COMPANY',
  `project_name` varchar(100) NOT NULL,
  `project_icon` varchar(100) NOT NULL,
  `project_image` varchar(1000) NOT NULL COMMENT 'comma seprated image',
  `project_demo` varchar(1000) NOT NULL,
  `project_url` varchar(100) NOT NULL,
  `project_detail` text NOT NULL,
  `technology` varchar(100) NOT NULL,
  `start_at` datetime NOT NULL,
  `end_at` datetime DEFAULT NULL,
  `project_status` int(11) NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `gd2_project`
--

INSERT INTO `gd2_project` (`project_id`, `experience_id`, `project_type`, `project_name`, `project_icon`, `project_image`, `project_demo`, `project_url`, `project_detail`, `technology`, `start_at`, `end_at`, `project_status`, `created_at`) VALUES
(1, 3, 'COMPANY', 'Network Analytics', '', '', '', '', 'Implemented Graph Algorithms e.g. Djikstra’s Shortest Path and Shortest Strongest Path Algorithms to find the shortest path between two persons in a network.\nImplemented Graph modification algorithms e.g. Graph Min Cut to cut a large graph into two small graphs.\nDeveloped Graph message-passing algorithms e.g. Belief Propagation to find the influence of one person onto another person in a network based on the strength of their relationship.\nUsed statistical techniques and implemented into the Graph to find important network parameters e.g. Network\nDensity score, Quality score, Node Centrality, Closeness and Betweenness scores etc.', 'Scala,Spark,Hive', '2018-10-11 00:00:00', NULL, 1, '2019-06-16 00:00:00'),
(2, 3, 'COMPANY', 'Customer 360 View', '', '', '', '', 'Prepared customer PII and events information as a JSON file and stored in Mongo DB. \nEvaluated Customer signal scores using Belief Propagation algorithms based on his events e.g. Fraud signals, Attrition signals, Transaction score etc.', 'Scala,Spark,Hive,MongoDB', '2018-09-11 00:00:00', NULL, 1, '2019-06-16 00:00:00'),
(3, 3, 'COMPANY', 'Customer Data Creation', '', '', '', '', 'Prepared synthetic data according to the customers demographics e.g. for US, Middle East, India.\nStudied about the business and product line of a company and tailored the customer data as needed.\nCreated PII data and customer events data to capture the customer’s transaction, payments behaviour.', 'R,SQL', '2018-07-11 00:00:00', NULL, 1, '2019-06-16 00:00:00'),
(4, 1, 'COMPANY', 'Pump Data Analytics', '', '', '', '', 'Initial trials using SVM and Random Forest.\nAlso tried anomaly detection using Self-Organizing Maps (SOM).\nFinally found good result with Multivariate Time Series using Vector Auto-Regression (VAR).', 'SVM,Random Forest,VAR', '2018-02-16 00:00:00', '2018-06-28 00:00:00', 1, '2019-06-16 00:00:00'),
(5, 1, 'COMPANY', 'Chiller Data Analytics', '', '', '', '', 'Diagnosing the chiller sensor data using Exploratory Data analysis.\nForecasting Chiller data using VAR multivariate Time Series model.\nFinding optimum parameters to gain energy and cost savings.', 'R,ggplot2', '2018-01-06 00:00:00', '2018-02-11 00:00:00', 1, '2019-06-16 00:00:00'),
(6, 1, 'COMPANY', 'Water Demanding Forecasting', '', '', '', '', 'Predicting daily water demand using Time Series Forecasting.\r\nImplementing multivariate VAR model to improve prediction accuracy.\r\nUsed various algorithms such as fbProphet, Linear Regression, SVM and MLP ANNs.', 'Facebook Prophet', '2017-06-19 00:00:00', '2017-06-20 00:00:00', 1, '2019-06-16 00:00:00'),
(7, 1, 'COMPANY', 'Aircraft Stress Analysis', '', '', '', '', 'Stress analysis of MAX Airplane Tail components - Torque Box and Texas Star.\r\nStress analysis of Fuselage Frames, Doorsills, Shear Ties, Stringer Clips etc.\r\nStrength Check Note (SCN) Documentation.', 'Finite Element Analysis', '2015-01-16 00:00:00', '2017-06-17 00:00:00', 1, '2019-06-16 00:00:00'),
(8, 1, 'COMPANY', 'Aircraft Stress Analysis and Concessions', '', '', '', '', 'Stress analysis of A350 Fuselage, Spar and Frames.\r\nStress Dossier Documentation.', 'Finite Element Analysis', '2012-08-16 00:00:00', '2015-01-11 00:00:00', 1, '2019-06-16 00:00:00'),
(9, NULL, 'PERSONAL', 'Airport Dataset Study', '', '', '', 'https://github.com/gouherdanish/graphx_airport', 'The airport data contained information about the airports in the World. Taken this as vertex RDD.\r\nThe route data contained information about source and destination airports. Taken as edge RDD.\r\nCreated a Graph using the vertex and edge RDD and found the busiest airport as Atlanta Intl, USA.', 'Scala,GraphX', '2019-03-06 00:00:00', '2019-03-07 00:00:00', 1, '2019-06-16 00:00:00'),
(10, NULL, 'PERSONAL', 'WHO Suicide Data Study', '', '', '', '', 'Exploratory Data Analysis found the following observations on suicides stats\r\nRussia, USA and Japan had highest number of suicides reported till 2016\r\nSuicides in USA are rising at an alarming rate in the recent years\r\nMiddle Aged suicides in USA have almost doubled between 1985 and 2015\r\nPublished a Kaggle kernel', 'R,ggplot2', '2019-01-12 00:00:00', '2019-01-13 00:00:00', 1, '2019-06-16 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `gd2_section`
--

CREATE TABLE `gd2_section` (
  `section_id` int(11) NOT NULL,
  `section_name` varchar(50) NOT NULL,
  `section_value` varchar(50) NOT NULL,
  `section_detail` varchar(500) NOT NULL,
  `section_status` int(11) NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `gd2_section`
--

INSERT INTO `gd2_section` (`section_id`, `section_name`, `section_value`, `section_detail`, `section_status`, `created_at`) VALUES
(1, 'Skills', 'SKILL', 'I believe that in order to improve my skill set, I must indulge myself in learning continuously. Not only does it sharpen my knowledge but it also increases my interest.', 1, '2018-08-10 12:00:00'),
(2, 'Experiences', 'EXPERIENCE', 'I have gained firsthand experience working in crucial project timelines.', 1, '2018-08-10 12:00:00'),
(3, 'Education', 'EDUCATION', 'All my life I have been driven by my strong belief that education is important. I try to learn something new every single day.', 1, '2018-08-10 12:00:00'),
(4, 'Achievements', 'ACHIEVEMENT', 'Coding has always been my passion and when I reached college I got lots of opportunities to pursue it. I utilized this time to participate in various coding competitions.', 1, '2018-08-10 12:00:00'),
(5, 'Projects', 'PROJECT', 'Whenever I learn something new, I make a project on this and add it to my github profile because I firmly believe that knowledge sharing is very important.', 1, '2018-08-10 12:00:00'),
(6, 'Certifications', 'CERTIFICATE', 'In addition to my work and education, I have participated in many coding competitions and conferences. Moreover, I have completed many online courses from reputed colleges and organizations.', 1, '2018-08-10 12:00:00'),
(7, 'Contact', 'CONTACT', 'If you think that I am a good fit for your company, please feel free to contact me anytime. If you have any suggestions for me, then please fill the form below, I will surely work on it.', 1, '2018-08-10 12:00:00'),
(8, 'Awards', 'AWARD', 'From time to time, I have been awarded for my contributions to the project.', 1, '2018-08-10 12:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `gd2_skill`
--

CREATE TABLE `gd2_skill` (
  `skill_id` int(11) NOT NULL,
  `skill_type` varchar(50) NOT NULL COMMENT 'PROGRAMMING, MACHINE_LEARNING, ALGORITHM',
  `skill` varchar(500) NOT NULL COMMENT 'comma seperated skill',
  `skill_status` int(11) NOT NULL,
  `skill_order` decimal(10,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `gd2_skill`
--

INSERT INTO `gd2_skill` (`skill_id`, `skill_type`, `skill`, `skill_status`, `skill_order`) VALUES
(1, 'PROGRAMMING', 'R, Python, Scala, Spark, SQL, Excel', 1, '1'),
(2, 'MACHINE_LEARNING', 'Classification, Regression, Deep Learning , Time Series', 1, '2'),
(3, 'ALGORITHM', 'SVM, VAR, SOM, Neural Networks, Random Forest', 1, '3');

-- --------------------------------------------------------

--
-- Table structure for table `gd2_social`
--

CREATE TABLE `gd2_social` (
  `social_id` int(11) NOT NULL,
  `social_name` varchar(50) NOT NULL,
  `social_url` varchar(100) NOT NULL,
  `social_icon` varchar(50) NOT NULL,
  `social_status` int(11) NOT NULL,
  `social_order` decimal(10,2) NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `gd2_social`
--

INSERT INTO `gd2_social` (`social_id`, `social_name`, `social_url`, `social_icon`, `social_status`, `social_order`, `created_at`) VALUES
(1, 'LinkedIn', 'https://www.linkedin.com/in/gouher-danish/', 'fa fa-linkedin-square', 1, '1.00', '2018-08-10 12:00:00'),
(2, 'Github', 'https://github.com/gouherdanish', 'fa fa-github-square', 1, '2.00', '2018-08-10 12:00:00'),
(3, 'Medium', 'https://medium.com/@gouherdanishiitkgp', 'fa fa-medium', 1, '3.00', '2018-08-10 12:00:00'),
(4, 'Codepen', '', 'fa fa-codepen', 0, '0.00', '2018-08-10 12:00:00'),
(5, 'Angellist', '', 'fa fa-angellist', 0, '0.00', '2018-08-10 12:00:00'),
(6, 'Stack Overflow', 'https://stackoverflow.com/users/11474166/gouherdanish', 'fa fa-stack-overflow', 1, '4.00', '2018-08-10 12:00:00'),
(7, 'Analytics Vidhya', 'https://datahack.analyticsvidhya.com/user/profile/gouherdanish', 'fa fa-line-chart', 1, '5.00', '2018-08-10 12:00:00'),
(8, 'Kaggle', 'https://www.kaggle.com/gouherdanishiitkgp', 'fa fa-database', 1, '6.00', '2018-08-10 12:00:00'),
(9, 'Hackerearth', 'https://www.hackerearth.com/@gouher1', 'fa fa-hacker-news', 0, '0.00', '2018-08-10 12:00:00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `gd2_achievement`
--
ALTER TABLE `gd2_achievement`
  ADD PRIMARY KEY (`achievement_id`);

--
-- Indexes for table `gd2_award`
--
ALTER TABLE `gd2_award`
  ADD PRIMARY KEY (`award_id`);

--
-- Indexes for table `gd2_certificate`
--
ALTER TABLE `gd2_certificate`
  ADD PRIMARY KEY (`certificate_id`);

--
-- Indexes for table `gd2_education`
--
ALTER TABLE `gd2_education`
  ADD PRIMARY KEY (`education_id`);

--
-- Indexes for table `gd2_experience`
--
ALTER TABLE `gd2_experience`
  ADD PRIMARY KEY (`experience_id`);

--
-- Indexes for table `gd2_menu`
--
ALTER TABLE `gd2_menu`
  ADD PRIMARY KEY (`menu_id`);

--
-- Indexes for table `gd2_profile`
--
ALTER TABLE `gd2_profile`
  ADD PRIMARY KEY (`profile_id`);

--
-- Indexes for table `gd2_project`
--
ALTER TABLE `gd2_project`
  ADD PRIMARY KEY (`project_id`);

--
-- Indexes for table `gd2_section`
--
ALTER TABLE `gd2_section`
  ADD PRIMARY KEY (`section_id`);

--
-- Indexes for table `gd2_skill`
--
ALTER TABLE `gd2_skill`
  ADD PRIMARY KEY (`skill_id`);

--
-- Indexes for table `gd2_social`
--
ALTER TABLE `gd2_social`
  ADD PRIMARY KEY (`social_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `gd2_achievement`
--
ALTER TABLE `gd2_achievement`
  MODIFY `achievement_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `gd2_award`
--
ALTER TABLE `gd2_award`
  MODIFY `award_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `gd2_certificate`
--
ALTER TABLE `gd2_certificate`
  MODIFY `certificate_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `gd2_education`
--
ALTER TABLE `gd2_education`
  MODIFY `education_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `gd2_experience`
--
ALTER TABLE `gd2_experience`
  MODIFY `experience_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `gd2_menu`
--
ALTER TABLE `gd2_menu`
  MODIFY `menu_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `gd2_profile`
--
ALTER TABLE `gd2_profile`
  MODIFY `profile_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `gd2_project`
--
ALTER TABLE `gd2_project`
  MODIFY `project_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `gd2_section`
--
ALTER TABLE `gd2_section`
  MODIFY `section_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `gd2_skill`
--
ALTER TABLE `gd2_skill`
  MODIFY `skill_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `gd2_social`
--
ALTER TABLE `gd2_social`
  MODIFY `social_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;


UPDATE `gd2_experience` SET `end_at` = '2019-12-06 00:00:00' WHERE `gd2_experience`.`experience_id` = 3;

INSERT INTO `gd2_experience` (`experience_id`, `experience_type`, `company_name`, `company_logo`, `company_url`, `designation`, `city`, `country`, `start_at`, `end_at`, `detail`, `experience_status`, `created_at`) VALUES (NULL, 'FULL_TIME', 'Alten India Pvt. Ltd', '', 'https://alten.com', 'Data Scientist', 'Bengaluru', 'India', '2019-12-09 00:00:00', NULL, 'Currently I am working at Alten India as Project Lead for their Big Data Analytics and Predictive Modeling Team. We have developed a demo app to showcase Aircraft Engine Predictive Maintenance which helped us secure a big data analytics and development project from Airbus. During Covid-19, we also developed analytics and forecasting dashboard to track the pandemic status. I handled a team of 5 people who included 3 Front-End engineers, 1 Big Data developers and 1 Data Scientist. Along with this, I co-ordinated with business stakeholders and deployed the app on AWS.\r\n', '1', '2020-06-10 00:00:00');

UPDATE `gd2_experience` SET `detail` = 'I was working on the company\'s signature product which deals with a new branch of data science aimed at providing Customer Profiling solutions to prospective clients. I have learnt many new things and used it to implement Customer Network Anaytics and 360 View Creation. I have gained significant experience in developing big data solutions using Scala and Spark.I have been working on the company\'s signature product which deals with a new branch of data science aimed at providing Customer Profiling solutions to prospective clients. I have learnt many new things and used it to implement Customer Network Anaytics and 360 View Creation. I have gained significant experience in developing big data solutions using Scala and Spark.' WHERE `gd2_experience`.`experience_id` = 3;

INSERT INTO `gd2_project` (`project_id`, `experience_id`, `project_type`, `project_name`, `project_icon`, `project_image`, `project_demo`, `project_url`, `project_detail`, `technology`, `start_at`, `end_at`, `project_status`, `created_at`) VALUES (NULL, '7', 'COMPANY', 'Skywise Project', '', '', '', '', 'Created a demo app for Aircraft Engine Predictive Maintenance use case\r\nLead a team of 5 developers to access, train and develop on Skywise Platform', 'Python,PySpark,Big Data', '2019-12-01 00:00:00', '2020-06-01 00:00:00', '1', '2020-06-10 00:00:00');
INSERT INTO `gd2_project` (`project_id`, `experience_id`, `project_type`, `project_name`, `project_icon`, `project_image`, `project_demo`, `project_url`, `project_detail`, `technology`, `start_at`, `end_at`, `project_status`, `created_at`) VALUES (NULL, '7', 'COMPANY', 'Covid-19 Analytics and Forecasting', '', '', '', '', 'Pitched the idea to develop a dashboard to track the pandemic spread\r\nDeveloped APIs, co-ordinated with team and deployed the website on AWS', 'Python,Flask,Jupyter Notebook,Time Series Forecasting,Regression', '2020-04-01 00:00:00', '2020-06-01 00:00:00', '1', '2020-06-10 00:00:00');
