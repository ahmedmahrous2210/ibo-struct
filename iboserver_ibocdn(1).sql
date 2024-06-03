-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 03, 2024 at 03:50 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `iboserver_ibocdn`
--

-- --------------------------------------------------------

--
-- Table structure for table `activation_codes`
--

CREATE TABLE `activation_codes` (
  `id` int(11) NOT NULL,
  `type` enum('yearly','lifetime','halfyearly','quarterly') NOT NULL DEFAULT 'yearly',
  `value` varchar(100) NOT NULL,
  `activated_by` varchar(200) DEFAULT NULL,
  `generated_by` varchar(100) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `used_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `applications`
--

CREATE TABLE `applications` (
  `id` int(11) NOT NULL,
  `app_name` varchar(200) NOT NULL,
  `app_logo` varchar(250) NOT NULL,
  `app_phone` varchar(100) NOT NULL,
  `app_email` varchar(250) NOT NULL,
  `app_place_location` varchar(200) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `app_tag_line` varchar(100) DEFAULT NULL,
  `app_description` varchar(250) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `arch_user_activation_trans_logs`
--

CREATE TABLE `arch_user_activation_trans_logs` (
  `id` int(11) NOT NULL,
  `reseller_id` varchar(50) NOT NULL,
  `user_id` varchar(50) NOT NULL,
  `module` varchar(50) NOT NULL,
  `comment` varchar(250) DEFAULT NULL,
  `credit_point` varchar(100) NOT NULL,
  `mac_address` varchar(50) DEFAULT NULL,
  `box_expiry_date` datetime DEFAULT NULL,
  `activated_from` varchar(50) DEFAULT 'MAIN',
  `is_disable_processed` tinyint(4) DEFAULT NULL,
  `disabling_process_date` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `client_activation_trans_logs`
--

CREATE TABLE `client_activation_trans_logs` (
  `id` int(11) NOT NULL,
  `reseller_id` varchar(50) NOT NULL,
  `user_id` varchar(50) NOT NULL,
  `module` varchar(50) NOT NULL,
  `channel_id` varchar(100) NOT NULL,
  `mac_address` varchar(50) DEFAULT NULL,
  `credit_point` int(11) NOT NULL,
  `box_expiry_date` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `client_app_ref`
--

CREATE TABLE `client_app_ref` (
  `id` int(11) NOT NULL,
  `app_ref_id` varchar(25) NOT NULL,
  `channel_id` varchar(50) DEFAULT NULL,
  `client_id` varchar(50) DEFAULT NULL,
  `request_id` varchar(100) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `req_json` varchar(400) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `client_mapping`
--

CREATE TABLE `client_mapping` (
  `id` int(11) NOT NULL,
  `channel_name` varchar(200) NOT NULL,
  `client_id` varchar(100) NOT NULL,
  `secret_key` varchar(200) NOT NULL,
  `email_id` varchar(250) DEFAULT NULL,
  `credit_point` varchar(500) DEFAULT NULL,
  `status` tinyint(4) NOT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ibocdn_resellers`
--

CREATE TABLE `ibocdn_resellers` (
  `id` int(11) NOT NULL,
  `name` varchar(200) DEFAULT NULL,
  `email` varchar(300) NOT NULL,
  `password` varchar(300) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `expiry_date` date DEFAULT NULL,
  `credit_point` bigint(20) NOT NULL DEFAULT 0,
  `masa_credit_point` varchar(100) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `parent_reseller_id` int(11) NOT NULL DEFAULT 0,
  `updated_by` int(11) DEFAULT NULL,
  `group_id` int(11) DEFAULT 2,
  `application_allowed` varchar(200) DEFAULT NULL,
  `web_logo` longtext DEFAULT NULL,
  `web_title` varchar(200) DEFAULT NULL,
  `last_login_time` datetime DEFAULT NULL,
  `login_ip` varchar(200) DEFAULT NULL COMMENT 'Resellers Last Login IP',
  `is_verified` tinyint(4) DEFAULT 0,
  `verification_token` varchar(250) DEFAULT NULL,
  `verify_at` datetime DEFAULT NULL,
  `is_disable_by_admin` tinyint(4) NOT NULL DEFAULT 0,
  `credit_share_passcode` varchar(25) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ibocdn_social_widget`
--

CREATE TABLE `ibocdn_social_widget` (
  `id` int(11) NOT NULL,
  `whatsapp_number` varchar(20) DEFAULT NULL,
  `teligram_number` varchar(20) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `iboiptv_registration_request`
--

CREATE TABLE `iboiptv_registration_request` (
  `id` int(11) NOT NULL,
  `mac_id` varchar(200) DEFAULT NULL,
  `request_logs` varchar(400) DEFAULT NULL,
  `request_ip` varchar(200) DEFAULT NULL,
  `user_agent` varchar(400) DEFAULT NULL,
  `app_reg_by` varchar(100) NOT NULL DEFAULT 'FAKER',
  `request_id` varchar(100) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ibo_player_servers`
--

CREATE TABLE `ibo_player_servers` (
  `id` int(11) NOT NULL,
  `domain_name` varchar(200) NOT NULL,
  `domain_id` varchar(50) NOT NULL,
  `domain_url` varchar(250) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` int(11) NOT NULL,
  `title` varchar(200) NOT NULL,
  `description` varchar(400) NOT NULL,
  `start_time` datetime NOT NULL,
  `end_time` datetime NOT NULL,
  `status` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `passipay_payload_data`
--

CREATE TABLE `passipay_payload_data` (
  `id` int(11) NOT NULL,
  `approve` varchar(3) DEFAULT NULL,
  `payment_id` varchar(100) DEFAULT NULL,
  `order_id` varchar(100) NOT NULL,
  `address_to` varchar(200) DEFAULT NULL,
  `amount` varchar(200) DEFAULT NULL,
  `fee` varchar(100) DEFAULT NULL,
  `txhash` varchar(100) DEFAULT NULL,
  `credit_points` varchar(10) DEFAULT NULL,
  `user_id` varchar(250) DEFAULT NULL,
  `invoice_url` varchar(250) DEFAULT NULL,
  `amount_paid` varchar(100) DEFAULT NULL,
  `order_status` varchar(50) DEFAULT NULL,
  `order_status_checked_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reseller_applications`
--

CREATE TABLE `reseller_applications` (
  `id` int(11) NOT NULL,
  `app_id` int(11) NOT NULL,
  `reseller_id` int(11) NOT NULL,
  `app_name` varchar(200) NOT NULL,
  `app_logo` varchar(250) NOT NULL,
  `app_phone` varchar(100) NOT NULL,
  `app_email` varchar(250) NOT NULL,
  `app_place_location` varchar(200) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `app_tag_line` varchar(100) DEFAULT NULL,
  `app_description` varchar(250) NOT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reseller_credit_assignment_logs`
--

CREATE TABLE `reseller_credit_assignment_logs` (
  `id` int(11) NOT NULL,
  `debitor_id` int(11) NOT NULL,
  `creditor_id` int(11) NOT NULL,
  `credit_point` varchar(100) NOT NULL,
  `tr_type` varchar(20) DEFAULT 'CREDIT',
  `created_by` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reseller_notifications`
--

CREATE TABLE `reseller_notifications` (
  `id` int(11) NOT NULL,
  `title` varchar(200) NOT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tickets`
--

CREATE TABLE `tickets` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(250) NOT NULL,
  `description` varchar(400) NOT NULL,
  `status` varchar(15) NOT NULL DEFAULT '1' COMMENT '{0:"WITHDRAW", 1:"OPEN", 2:"RESOLVED", 3:"REOPEN", 4:"CLOSED"}',
  `created_by` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `attended_by` int(11) DEFAULT NULL,
  `attended_at` datetime DEFAULT NULL,
  `admin_comment` varchar(400) DEFAULT NULL,
  `updated_at` datetime NOT NULL,
  `updated_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_activation_trans_logs`
--

CREATE TABLE `user_activation_trans_logs` (
  `id` int(11) NOT NULL,
  `reseller_id` varchar(50) NOT NULL,
  `user_id` varchar(50) NOT NULL,
  `module` varchar(50) NOT NULL,
  `comment` varchar(250) DEFAULT NULL,
  `credit_point` varchar(100) NOT NULL,
  `mac_address` varchar(50) DEFAULT NULL,
  `box_expiry_date` datetime DEFAULT NULL,
  `activated_from` varchar(50) DEFAULT 'MAIN',
  `is_disable_processed` tinyint(4) DEFAULT NULL,
  `disabling_process_date` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `activation_codes`
--
ALTER TABLE `activation_codes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `applications`
--
ALTER TABLE `applications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `arch_user_activation_trans_logs`
--
ALTER TABLE `arch_user_activation_trans_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `DISABLINGDATE` (`disabling_process_date`);

--
-- Indexes for table `client_activation_trans_logs`
--
ALTER TABLE `client_activation_trans_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `client_app_ref`
--
ALTER TABLE `client_app_ref`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `client_mapping`
--
ALTER TABLE `client_mapping`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ibocdn_resellers`
--
ALTER TABLE `ibocdn_resellers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `LASTLOGIN` (`last_login_time`),
  ADD KEY `isVerified` (`is_verified`),
  ADD KEY `verifiedAt` (`verify_at`),
  ADD KEY `ISDISABLEBYADMIN` (`is_disable_by_admin`),
  ADD KEY `CREDITSHAREPASSCODE` (`credit_share_passcode`);

--
-- Indexes for table `ibocdn_social_widget`
--
ALTER TABLE `ibocdn_social_widget`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `iboiptv_registration_request`
--
ALTER TABLE `iboiptv_registration_request`
  ADD PRIMARY KEY (`id`),
  ADD KEY `REGBY` (`app_reg_by`);

--
-- Indexes for table `ibo_player_servers`
--
ALTER TABLE `ibo_player_servers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `passipay_payload_data`
--
ALTER TABLE `passipay_payload_data`
  ADD PRIMARY KEY (`id`),
  ADD KEY `INVOICEURL` (`invoice_url`),
  ADD KEY `ORDERID` (`order_id`);

--
-- Indexes for table `reseller_applications`
--
ALTER TABLE `reseller_applications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reseller_credit_assignment_logs`
--
ALTER TABLE `reseller_credit_assignment_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reseller_notifications`
--
ALTER TABLE `reseller_notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tickets`
--
ALTER TABLE `tickets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_activation_trans_logs`
--
ALTER TABLE `user_activation_trans_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `DISABLINGDATE` (`disabling_process_date`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `activation_codes`
--
ALTER TABLE `activation_codes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `applications`
--
ALTER TABLE `applications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `arch_user_activation_trans_logs`
--
ALTER TABLE `arch_user_activation_trans_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `client_activation_trans_logs`
--
ALTER TABLE `client_activation_trans_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `client_app_ref`
--
ALTER TABLE `client_app_ref`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `client_mapping`
--
ALTER TABLE `client_mapping`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ibocdn_resellers`
--
ALTER TABLE `ibocdn_resellers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ibocdn_social_widget`
--
ALTER TABLE `ibocdn_social_widget`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `iboiptv_registration_request`
--
ALTER TABLE `iboiptv_registration_request`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ibo_player_servers`
--
ALTER TABLE `ibo_player_servers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `passipay_payload_data`
--
ALTER TABLE `passipay_payload_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reseller_applications`
--
ALTER TABLE `reseller_applications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reseller_credit_assignment_logs`
--
ALTER TABLE `reseller_credit_assignment_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reseller_notifications`
--
ALTER TABLE `reseller_notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tickets`
--
ALTER TABLE `tickets`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_activation_trans_logs`
--
ALTER TABLE `user_activation_trans_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
