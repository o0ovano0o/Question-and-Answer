-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th9 25, 2019 lúc 04:08 PM
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
-- Cơ sở dữ liệu: `questionandanswer`
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
-- Cấu trúc bảng cho bảng `choice_multichoices`
--

CREATE TABLE `choice_multichoices` (
  `ans_id` int(11) NOT NULL,
  `response_id` int(11) NOT NULL,
  `quest_id` int(11) NOT NULL
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
-- Cấu trúc bảng cho bảng `multichoices`
--

CREATE TABLE `multichoices` (
  `reponse_id` int(11) NOT NULL,
  `quest_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `questiontype`
--

CREATE TABLE `questiontype` (
  `quest_type_id` int(11) NOT NULL,
  `quest_type_name` varchar(64) NOT NULL,
  `quest_type_choice` tinyint(1) NOT NULL
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
-- Cấu trúc bảng cho bảng `singlechoicereponse`
--

CREATE TABLE `singlechoicereponse` (
  `reponse_id` int(11) NOT NULL,
  `quest_id` int(11) NOT NULL,
  `choice_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `squest`
--

CREATE TABLE `squest` (
  `survey_id` int(11) NOT NULL,
  `squest_id` int(11) NOT NULL,
  `squest_text` text NOT NULL,
  `quest_type_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `survey`
--

CREATE TABLE `survey` (
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
-- Cấu trúc bảng cho bảng `survey_section`
--

CREATE TABLE `survey_section` (
  `section_id` int(11) NOT NULL,
  `survey_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `s_ans`
--

CREATE TABLE `s_ans` (
  `question_id` int(11) NOT NULL,
  `ans_id` int(11) NOT NULL,
  `ans_text` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `textreponse`
--

CREATE TABLE `textreponse` (
  `reponse_id` int(11) NOT NULL,
  `quest_id` int(11) NOT NULL,
  `textreponse` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user`
--

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(30) NOT NULL,
  `email` varchar(50) NOT NULL,
  `isadmin` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `user`
--

INSERT INTO `user` (`user_id`, `username`, `password`, `email`, `isadmin`) VALUES
(1, '0', '0', '0', 0),
(2, 'VanVan', '12345', 'van005618@gmail.com', 0),
(3, 'VanVan', '12345', 'van005618@gmail.com', 0),
(4, 'VanVan1123', '1244', 'van005618@gmail.com', 0),
(5, 'VanVan112', 'j2LbMc7G9duuCU7', 'van005618@gmail.com', 0),
(6, 'VanVan112', '1244', 'van005618@gmail.com', 0),
(7, 'Van123', '1244', 'van005618@gmail.com', 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user_reponse`
--

CREATE TABLE `user_reponse` (
  `surveyid` int(11) NOT NULL,
  `squest_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `reponse_id` int(11) NOT NULL,
  `reponse_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `yesnoreponse`
--

CREATE TABLE `yesnoreponse` (
  `reponse_id` int(11) NOT NULL,
  `quest_id` int(11) NOT NULL,
  `yesnovalue` tinyint(1) NOT NULL
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
-- Chỉ mục cho bảng `choice_multichoices`
--
ALTER TABLE `choice_multichoices`
  ADD PRIMARY KEY (`ans_id`,`response_id`,`quest_id`),
  ADD KEY `response_id` (`response_id`),
  ADD KEY `quest_id` (`quest_id`);

--
-- Chỉ mục cho bảng `cmt_ans`
--
ALTER TABLE `cmt_ans`
  ADD PRIMARY KEY (`cmt_id`) USING BTREE,
  ADD UNIQUE KEY `question_id` (`question_id`,`ans_id`) USING BTREE,
  ADD KEY `ans_id` (`ans_id`);

--
-- Chỉ mục cho bảng `multichoices`
--
ALTER TABLE `multichoices`
  ADD PRIMARY KEY (`reponse_id`,`quest_id`),
  ADD KEY `quest_id` (`quest_id`);

--
-- Chỉ mục cho bảng `questiontype`
--
ALTER TABLE `questiontype`
  ADD PRIMARY KEY (`quest_type_id`);

--
-- Chỉ mục cho bảng `section`
--
ALTER TABLE `section`
  ADD PRIMARY KEY (`section_id`);

--
-- Chỉ mục cho bảng `singlechoicereponse`
--
ALTER TABLE `singlechoicereponse`
  ADD PRIMARY KEY (`reponse_id`,`quest_id`,`choice_id`),
  ADD KEY `choice_id` (`choice_id`),
  ADD KEY `quest_id` (`quest_id`);

--
-- Chỉ mục cho bảng `squest`
--
ALTER TABLE `squest`
  ADD PRIMARY KEY (`squest_id`),
  ADD UNIQUE KEY `survey_id` (`survey_id`),
  ADD KEY `quest_type_id` (`quest_type_id`);

--
-- Chỉ mục cho bảng `survey`
--
ALTER TABLE `survey`
  ADD PRIMARY KEY (`survey_id`),
  ADD KEY `survey_id` (`survey_id`);

--
-- Chỉ mục cho bảng `survey_section`
--
ALTER TABLE `survey_section`
  ADD PRIMARY KEY (`section_id`,`survey_id`),
  ADD KEY `survey_id` (`survey_id`);

--
-- Chỉ mục cho bảng `s_ans`
--
ALTER TABLE `s_ans`
  ADD PRIMARY KEY (`ans_id`),
  ADD KEY `question_id` (`question_id`);

--
-- Chỉ mục cho bảng `textreponse`
--
ALTER TABLE `textreponse`
  ADD PRIMARY KEY (`reponse_id`,`quest_id`),
  ADD KEY `quest_id` (`quest_id`);

--
-- Chỉ mục cho bảng `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`);

--
-- Chỉ mục cho bảng `user_reponse`
--
ALTER TABLE `user_reponse`
  ADD PRIMARY KEY (`reponse_id`) USING BTREE,
  ADD UNIQUE KEY `user_id` (`user_id`),
  ADD KEY `squest_id` (`squest_id`),
  ADD KEY `surveyid` (`surveyid`);

--
-- Chỉ mục cho bảng `yesnoreponse`
--
ALTER TABLE `yesnoreponse`
  ADD PRIMARY KEY (`reponse_id`,`quest_id`),
  ADD KEY `quest_id` (`quest_id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

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
-- Các ràng buộc cho bảng `choice_multichoices`
--
ALTER TABLE `choice_multichoices`
  ADD CONSTRAINT `choice_multichoices_ibfk_1` FOREIGN KEY (`ans_id`) REFERENCES `s_ans` (`ans_id`),
  ADD CONSTRAINT `choice_multichoices_ibfk_2` FOREIGN KEY (`response_id`) REFERENCES `multichoices` (`reponse_id`),
  ADD CONSTRAINT `choice_multichoices_ibfk_3` FOREIGN KEY (`quest_id`) REFERENCES `multichoices` (`quest_id`);

--
-- Các ràng buộc cho bảng `cmt_ans`
--
ALTER TABLE `cmt_ans`
  ADD CONSTRAINT `cmt_ans_ibfk_1` FOREIGN KEY (`ans_id`) REFERENCES `ans_quest` (`ans_id`),
  ADD CONSTRAINT `cmt_ans_ibfk_2` FOREIGN KEY (`question_id`) REFERENCES `ans_quest` (`question_id`);

--
-- Các ràng buộc cho bảng `multichoices`
--
ALTER TABLE `multichoices`
  ADD CONSTRAINT `multichoices_ibfk_1` FOREIGN KEY (`quest_id`) REFERENCES `squest` (`squest_id`),
  ADD CONSTRAINT `multichoices_ibfk_2` FOREIGN KEY (`reponse_id`) REFERENCES `user_reponse` (`reponse_id`);

--
-- Các ràng buộc cho bảng `singlechoicereponse`
--
ALTER TABLE `singlechoicereponse`
  ADD CONSTRAINT `singlechoicereponse_ibfk_1` FOREIGN KEY (`choice_id`) REFERENCES `s_ans` (`ans_id`),
  ADD CONSTRAINT `singlechoicereponse_ibfk_2` FOREIGN KEY (`quest_id`) REFERENCES `squest` (`squest_id`),
  ADD CONSTRAINT `singlechoicereponse_ibfk_3` FOREIGN KEY (`reponse_id`) REFERENCES `user_reponse` (`reponse_id`);

--
-- Các ràng buộc cho bảng `squest`
--
ALTER TABLE `squest`
  ADD CONSTRAINT `squest_ibfk_1` FOREIGN KEY (`survey_id`) REFERENCES `survey` (`survey_id`),
  ADD CONSTRAINT `squest_ibfk_2` FOREIGN KEY (`quest_type_id`) REFERENCES `questiontype` (`quest_type_id`);

--
-- Các ràng buộc cho bảng `survey`
--
ALTER TABLE `survey`
  ADD CONSTRAINT `survey_ibfk_1` FOREIGN KEY (`survey_id`) REFERENCES `survey_question` (`survey_id`);

--
-- Các ràng buộc cho bảng `survey_section`
--
ALTER TABLE `survey_section`
  ADD CONSTRAINT `survey_section_ibfk_1` FOREIGN KEY (`survey_id`) REFERENCES `survey` (`survey_id`),
  ADD CONSTRAINT `survey_section_ibfk_2` FOREIGN KEY (`section_id`) REFERENCES `section` (`section_id`);

--
-- Các ràng buộc cho bảng `s_ans`
--
ALTER TABLE `s_ans`
  ADD CONSTRAINT `s_ans_ibfk_1` FOREIGN KEY (`question_id`) REFERENCES `squest` (`squest_id`);

--
-- Các ràng buộc cho bảng `textreponse`
--
ALTER TABLE `textreponse`
  ADD CONSTRAINT `textreponse_ibfk_1` FOREIGN KEY (`quest_id`) REFERENCES `squest` (`squest_id`),
  ADD CONSTRAINT `textreponse_ibfk_2` FOREIGN KEY (`reponse_id`) REFERENCES `user_reponse` (`reponse_id`);

--
-- Các ràng buộc cho bảng `user_reponse`
--
ALTER TABLE `user_reponse`
  ADD CONSTRAINT `user_reponse_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  ADD CONSTRAINT `user_reponse_ibfk_2` FOREIGN KEY (`squest_id`) REFERENCES `squest` (`squest_id`),
  ADD CONSTRAINT `user_reponse_ibfk_3` FOREIGN KEY (`surveyid`) REFERENCES `survey` (`survey_id`);

--
-- Các ràng buộc cho bảng `yesnoreponse`
--
ALTER TABLE `yesnoreponse`
  ADD CONSTRAINT `yesnoreponse_ibfk_1` FOREIGN KEY (`quest_id`) REFERENCES `squest` (`squest_id`),
  ADD CONSTRAINT `yesnoreponse_ibfk_2` FOREIGN KEY (`reponse_id`) REFERENCES `user_reponse` (`reponse_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
