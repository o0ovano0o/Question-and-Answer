-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th9 17, 2019 lúc 07:43 AM
-- Phiên bản máy phục vụ: 10.1.37-MariaDB
-- Phiên bản PHP: 5.6.40

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `qanda`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ans_quest`
--

CREATE TABLE `ans_quest` (
  `section_id` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  `ans_id` int(11) NOT NULL,
  `author` varchar(20) NOT NULL,
  `content` varchar(500) NOT NULL,
  `ans_time` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `aquest`
--

CREATE TABLE `aquest` (
  `section_id` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  `author` varchar(20) NOT NULL,
  `title` varchar(40) NOT NULL,
  `context` text NOT NULL,
  `date_posted` date NOT NULL,
  `answer_id` int(11) NOT NULL,
  `view` int(11) NOT NULL,
  `isopen` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cmt_ans`
--

CREATE TABLE `cmt_ans` (
  `question_id` int(11) NOT NULL,
  `ans_id` int(11) NOT NULL,
  `cmt_id` int(11) NOT NULL,
  `author` varchar(20) NOT NULL,
  `cmt` varchar(500) NOT NULL,
  `cmt_time` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `section`
--

CREATE TABLE `section` (
  `section_id` int(11) NOT NULL,
  `sec_title` varchar(64) NOT NULL,
  `sec_desc` text NOT NULL,
  `author` varchar(20) NOT NULL,
  `sec_time` date NOT NULL,
  `sec_pass` varchar(12) NOT NULL,
  `sec_isopen` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `squest`
--

CREATE TABLE `squest` (
  `squest_id` int(11) NOT NULL,
  `squest_text` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `squest_ans`
--

CREATE TABLE `squest_ans` (
  `surveyid` int(11) NOT NULL,
  `squest_id` int(11) NOT NULL,
  `ans_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `survey`
--

CREATE TABLE `survey` (
  `section_id` int(11) NOT NULL,
  `survey_id` int(11) NOT NULL,
  `description` text NOT NULL,
  `startdate` date NOT NULL,
  `enddate` date NOT NULL,
  `isopen` tinyint(1) NOT NULL,
  `pass` varchar(12) NOT NULL,
  `author` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `survey_question`
--

CREATE TABLE `survey_question` (
  `survey_id` int(11) NOT NULL,
  `squest_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `s_ans`
--

CREATE TABLE `s_ans` (
  `ans_id` int(11) NOT NULL,
  `ans_text` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user`
--

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL,
  `username` int(11) NOT NULL,
  `password` int(11) NOT NULL,
  `email` int(11) NOT NULL,
  `isadmin` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `u_ans`
--

CREATE TABLE `u_ans` (
  `surveyid` int(11) NOT NULL,
  `squest_id` int(11) NOT NULL,
  `ans_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `othertext` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `ans_quest`
--
ALTER TABLE `ans_quest`
  ADD PRIMARY KEY (`ans_id`) USING BTREE,
  ADD UNIQUE KEY `question_id` (`question_id`,`section_id`) USING BTREE,
  ADD KEY `section_id` (`section_id`);

--
-- Chỉ mục cho bảng `aquest`
--
ALTER TABLE `aquest`
  ADD PRIMARY KEY (`section_id`,`question_id`) USING BTREE,
  ADD KEY `question_id` (`question_id`);

--
-- Chỉ mục cho bảng `cmt_ans`
--
ALTER TABLE `cmt_ans`
  ADD PRIMARY KEY (`cmt_id`) USING BTREE,
  ADD UNIQUE KEY `question_id` (`question_id`,`ans_id`) USING BTREE,
  ADD KEY `ans_id` (`ans_id`);

--
-- Chỉ mục cho bảng `section`
--
ALTER TABLE `section`
  ADD PRIMARY KEY (`section_id`);

--
-- Chỉ mục cho bảng `squest`
--
ALTER TABLE `squest`
  ADD PRIMARY KEY (`squest_id`);

--
-- Chỉ mục cho bảng `squest_ans`
--
ALTER TABLE `squest_ans`
  ADD PRIMARY KEY (`surveyid`,`squest_id`,`ans_id`),
  ADD KEY `ans_id` (`ans_id`),
  ADD KEY `squest_id` (`squest_id`);

--
-- Chỉ mục cho bảng `survey`
--
ALTER TABLE `survey`
  ADD PRIMARY KEY (`section_id`,`survey_id`),
  ADD KEY `survey_id` (`survey_id`);

--
-- Chỉ mục cho bảng `survey_question`
--
ALTER TABLE `survey_question`
  ADD PRIMARY KEY (`survey_id`,`squest_id`),
  ADD KEY `squest_id` (`squest_id`),
  ADD KEY `survey_id` (`survey_id`);

--
-- Chỉ mục cho bảng `s_ans`
--
ALTER TABLE `s_ans`
  ADD PRIMARY KEY (`ans_id`);

--
-- Chỉ mục cho bảng `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`);

--
-- Chỉ mục cho bảng `u_ans`
--
ALTER TABLE `u_ans`
  ADD PRIMARY KEY (`surveyid`,`squest_id`,`ans_id`,`user_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `ans_id` (`ans_id`),
  ADD KEY `squest_id` (`squest_id`);

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `ans_quest`
--
ALTER TABLE `ans_quest`
  ADD CONSTRAINT `ans_quest_ibfk_1` FOREIGN KEY (`section_id`) REFERENCES `aquest` (`section_id`);

--
-- Các ràng buộc cho bảng `aquest`
--
ALTER TABLE `aquest`
  ADD CONSTRAINT `aquest_ibfk_1` FOREIGN KEY (`section_id`) REFERENCES `section` (`section_id`),
  ADD CONSTRAINT `aquest_ibfk_2` FOREIGN KEY (`question_id`) REFERENCES `ans_quest` (`question_id`);

--
-- Các ràng buộc cho bảng `cmt_ans`
--
ALTER TABLE `cmt_ans`
  ADD CONSTRAINT `cmt_ans_ibfk_1` FOREIGN KEY (`ans_id`) REFERENCES `ans_quest` (`ans_id`),
  ADD CONSTRAINT `cmt_ans_ibfk_2` FOREIGN KEY (`question_id`) REFERENCES `ans_quest` (`question_id`);

--
-- Các ràng buộc cho bảng `squest_ans`
--
ALTER TABLE `squest_ans`
  ADD CONSTRAINT `squest_ans_ibfk_1` FOREIGN KEY (`surveyid`) REFERENCES `survey_question` (`survey_id`),
  ADD CONSTRAINT `squest_ans_ibfk_2` FOREIGN KEY (`ans_id`) REFERENCES `s_ans` (`ans_id`),
  ADD CONSTRAINT `squest_ans_ibfk_3` FOREIGN KEY (`squest_id`) REFERENCES `survey_question` (`squest_id`);

--
-- Các ràng buộc cho bảng `survey`
--
ALTER TABLE `survey`
  ADD CONSTRAINT `survey_ibfk_1` FOREIGN KEY (`survey_id`) REFERENCES `survey_question` (`survey_id`),
  ADD CONSTRAINT `survey_ibfk_2` FOREIGN KEY (`section_id`) REFERENCES `section` (`section_id`);

--
-- Các ràng buộc cho bảng `survey_question`
--
ALTER TABLE `survey_question`
  ADD CONSTRAINT `survey_question_ibfk_2` FOREIGN KEY (`squest_id`) REFERENCES `squest` (`squest_id`);

--
-- Các ràng buộc cho bảng `u_ans`
--
ALTER TABLE `u_ans`
  ADD CONSTRAINT `u_ans_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  ADD CONSTRAINT `u_ans_ibfk_2` FOREIGN KEY (`surveyid`) REFERENCES `squest_ans` (`surveyid`),
  ADD CONSTRAINT `u_ans_ibfk_3` FOREIGN KEY (`ans_id`) REFERENCES `squest_ans` (`ans_id`),
  ADD CONSTRAINT `u_ans_ibfk_4` FOREIGN KEY (`squest_id`) REFERENCES `squest_ans` (`squest_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
