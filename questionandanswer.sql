-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th10 13, 2019 lúc 05:46 PM
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
  `ans_id` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_vietnamese_ci NOT NULL,
  `author` varchar(50) NOT NULL,
  `ans_time` varchar(50) NOT NULL,
  `ghim` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `ans_quest`
--

INSERT INTO `ans_quest` (`ans_id`, `question_id`, `content`, `author`, `ans_time`, `ghim`) VALUES
(1, 1, 'd hay', 'pho', '29/10/2019', 0),
(2, 1, 'bình luận', 'giaovien1', '5/11/2019', 0),
(6, 3, 'bình luận', 'VanVan', '5/11/2019', 0),
(8, 3, 'bình luận', 'van1199anh@gmail.com', '9/11/2019', 0),
(9, 3, 'test ', 'giaovien1', '11/11/2019', 1),
(10, 3, 'tao thử bình luận', '12345van', '13/11/2019', 0),
(11, 3, 'trả lời cậu nhé', '12345van', '13/11/2019', 0),
(12, 15, 'ok', 'giaovien1', '13/11/2019', 0),
(13, 3, 'trả lời đc này', 'o0ovano0o', '13/11/2019', 0);

--
-- Bẫy `ans_quest`
--
DELIMITER $$
CREATE TRIGGER `traloi` BEFORE INSERT ON `ans_quest` FOR EACH ROW INSERT INTO `tbao`
 SET mes ="",
     link=NEW.question_id,
     tbao.date = NOW(),
     tbao.type=3,
     tbao.text=(SELECT context from aquest WHERE aquest.question_id=NEW.question_id),
     tbao.user=(SELECT author from aquest where aquest.question_id= NEW.question_id)
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `aquest`
--

CREATE TABLE `aquest` (
  `sections_id` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  `author` varchar(20) NOT NULL,
  `context` text CHARACTER SET utf8 COLLATE utf8_vietnamese_ci NOT NULL,
  `date_posted` varchar(50) NOT NULL,
  `view` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `aquest`
--

INSERT INTO `aquest` (`sections_id`, `question_id`, `author`, `context`, `date_posted`, `view`) VALUES
(2, 1, 'hay', 'dc ko', '27/10/2019', 0),
(2, 2, 'pho', 'doan xem', '27/10/2019', 0),
(2, 3, 'VanVan', 'câu hỏi thử', '5/11/2019', 0),
(2, 4, '12345van', 'hhhhhhhhhhhhhhhhhhhh\r\njjjjjjjj\r\nkkkkkkkk\r\nkkkkkkkkkkk', '6/11/2019', 0),
(2, 5, 'van1199anh@gmail.com', 'câu hỏi', '9/11/2019', 0),
(2, 6, 'van005618@gmail.com', 'đặt câu hỏi thử nè', '9/11/2019', 0),
(2, 7, 'van005618@gmail.com', 'aaaa', '9/11/2019', 0),
(2, 8, 'van1199', 'thử', '9/11/2019', 0),
(2, 9, 'van005618@gmail.com', 'đặt câu hỏi này', '9/11/2019', 0),
(2, 12, 'giaovien1', 'đặt', '13/11/2019', 0),
(2, 13, '12345van', 'okkkkkkkkkkkkk', '13/11/2019', 0),
(2, 14, '12345van', 'thử nhé', '13/11/2019', 0),
(2, 15, '12345van', 'thử này', '13/11/2019', 0),
(5, 11, 'hay', 'dc ko', '12/11/2019', 0),
(6, 10, 'hay', 'hay ko', '12/11/2019', 0);

--
-- Bẫy `aquest`
--
DELIMITER $$
CREATE TRIGGER `lol` BEFORE INSERT ON `aquest` FOR EACH ROW INSERT INTO `tbao`
 SET mes =(SELECT COUNT(*) FROM `aquest` a GROUP BY `sections_id` HAVING a.sections_id= NEW.sections_id),
     link="/survey?id="+NEW.sections_id,
     tbao.date = NOW(),
     tbao.type=2,
     tbao.text=(SELECT sec_title from section WHERE section.section_id=NEW.sections_id),
     tbao.user=(SELECT author from section where section.section_id= NEW.sections_id)
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `choice_multichoices`
--

CREATE TABLE `choice_multichoices` (
  `ans_id` int(11) NOT NULL,
  `response_id` int(11) NOT NULL,
  `quest_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `choice_multichoices`
--

INSERT INTO `choice_multichoices` (`ans_id`, `response_id`, `quest_id`) VALUES
(1, 18, 114),
(1, 27, 125),
(1, 33, 125),
(2, 27, 125),
(2, 33, 125),
(2, 48, 332),
(3, 41, 320),
(3, 58, 353),
(4, 18, 114),
(4, 41, 320),
(4, 41, 322),
(4, 47, 332),
(4, 48, 332),
(4, 56, 340),
(4, 57, 340),
(4, 58, 353),
(5, 58, 353),
(6, 57, 340),
(7, 27, 125),
(7, 33, 125),
(7, 41, 320),
(7, 41, 322),
(7, 47, 332),
(8, 48, 332),
(9, 47, 332),
(9, 56, 340),
(9, 57, 340),
(113, 19, 114),
(113, 20, 114),
(114, 15, 114),
(114, 19, 114),
(114, 20, 114),
(114, 22, 114),
(115, 15, 114),
(115, 20, 114),
(116, 20, 114),
(116, 22, 114),
(120, 24, 123),
(121, 25, 123),
(122, 14, 123),
(122, 25, 123),
(123, 14, 123),
(123, 24, 123),
(127, 34, 125),
(128, 34, 125),
(418, 46, 313),
(419, 46, 313),
(421, 46, 314),
(424, 46, 314),
(437, 40, 320),
(438, 40, 320),
(443, 41, 321),
(444, 40, 321),
(445, 40, 321),
(446, 41, 321),
(450, 40, 322),
(451, 40, 322),
(458, 42, 327),
(458, 45, 327),
(459, 42, 327),
(459, 43, 327),
(460, 43, 327),
(460, 44, 327),
(461, 44, 327),
(461, 45, 327),
(463, 45, 328),
(464, 43, 328),
(464, 44, 328),
(465, 42, 328),
(465, 45, 328),
(466, 42, 328),
(466, 43, 328),
(466, 44, 328),
(474, 48, 331),
(475, 47, 331),
(475, 48, 331),
(475, 49, 331),
(476, 47, 331),
(476, 48, 331),
(476, 49, 331),
(477, 47, 331),
(477, 48, 331),
(477, 50, 331),
(478, 50, 331),
(478, 64, 331),
(480, 64, 332),
(481, 49, 332),
(481, 50, 332),
(481, 64, 332),
(482, 50, 332),
(483, 49, 332),
(483, 50, 332),
(495, 62, 340),
(496, 62, 340),
(498, 55, 340),
(499, 55, 340),
(530, 63, 352),
(533, 59, 353),
(533, 60, 353),
(535, 60, 354),
(536, 59, 354),
(536, 60, 354),
(537, 59, 354),
(537, 60, 354),
(538, 60, 354),
(539, 60, 354),
(541, 59, 355),
(541, 60, 355),
(542, 59, 355),
(543, 60, 356),
(544, 59, 356),
(544, 60, 356),
(545, 60, 356),
(546, 59, 356),
(546, 60, 356),
(547, 60, 356),
(568, 66, 364),
(568, 67, 364),
(568, 68, 364),
(569, 67, 364),
(570, 68, 364),
(571, 66, 364);

--
-- Bẫy `choice_multichoices`
--
DELIMITER $$
CREATE TRIGGER `mutli1` BEFORE INSERT ON `choice_multichoices` FOR EACH ROW BEGIN
		update s_ans
        set s_ans.number = s_ans.number+1
        where s_ans.ans_id = new.ans_id;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cmt_ans`
--

CREATE TABLE `cmt_ans` (
  `cmt_id` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  `ans_id` int(11) NOT NULL,
  `author` varchar(50) NOT NULL,
  `cmt` varchar(255) CHARACTER SET utf8 COLLATE utf8_vietnamese_ci NOT NULL,
  `cmt_time` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `cmt_ans`
--

INSERT INTO `cmt_ans` (`cmt_id`, `question_id`, `ans_id`, `author`, `cmt`, `cmt_time`) VALUES
(1, 1, 1, 'pho', 'cung dc', '29/10/2019'),
(2, 1, 1, 'giaovien1', 'thử nhé', '5/11/2019'),
(3, 3, 6, 'VanVan', 'comment', '5/11/2019'),
(4, 3, 6, 'van1199anh@gmail.com', 'câu hỏi', '9/11/2019'),
(5, 3, 6, 'van005618@gmail.com', 'test thử', '9/11/2019'),
(6, 3, 6, 'van1199', 'comment', '9/11/2019'),
(7, 3, 6, 'van005618@gmail.com', 'bình luận thử này', '9/11/2019'),
(8, 3, 6, 'van005618@gmail.com', 'ok', '9/11/2019'),
(10, 15, 12, 'giaovien1', 'ok', '13/11/2019'),
(11, 15, 12, 'giaovien1', 'ok', '13/11/2019'),
(12, 15, 12, 'o0ovano0o', 'ok', '13/11/2019'),
(13, 3, 10, 'o0ovano0o', 'đíu đc chắc t đi ngủ quá', '13/11/2019');

--
-- Bẫy `cmt_ans`
--
DELIMITER $$
CREATE TRIGGER `cmt` BEFORE INSERT ON `cmt_ans` FOR EACH ROW INSERT INTO `tbao`
 SET mes ="",
     link=NEW.question_id,
     tbao.date = NOW(),
     tbao.type=4,
     tbao.text=(SELECT content from ans_quest a WHERE a.ans_id=NEW.ans_id),
     tbao.user=(SELECT author from ans_quest where ans_quest.ans_id= NEW.ans_id)
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Cấu trúc đóng vai cho view `multi`
-- (See below for the actual view)
--
CREATE TABLE `multi` (
`question_id` int(11)
,`ans_id` int(11)
,`ans_text` text
,`number` int(11)
,`response_id` int(11)
);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `multichoices`
--

CREATE TABLE `multichoices` (
  `reponse_id` int(11) NOT NULL,
  `quest_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `multichoices`
--

INSERT INTO `multichoices` (`reponse_id`, `quest_id`) VALUES
(14, 123),
(15, 114),
(18, 114),
(19, 114),
(20, 114),
(22, 114),
(23, 123),
(24, 123),
(25, 123),
(27, 125),
(33, 125),
(34, 125),
(36, 313),
(36, 314),
(37, 313),
(37, 314),
(38, 313),
(38, 314),
(40, 320),
(40, 321),
(40, 322),
(41, 320),
(41, 321),
(41, 322),
(42, 327),
(42, 328),
(43, 327),
(43, 328),
(44, 327),
(44, 328),
(45, 327),
(45, 328),
(46, 313),
(46, 314),
(47, 331),
(47, 332),
(48, 331),
(48, 332),
(49, 331),
(49, 332),
(50, 331),
(50, 332),
(55, 340),
(56, 340),
(57, 340),
(58, 353),
(58, 354),
(58, 355),
(59, 353),
(59, 354),
(59, 355),
(59, 356),
(60, 353),
(60, 354),
(60, 355),
(60, 356),
(62, 340),
(63, 352),
(64, 331),
(64, 332),
(66, 364),
(67, 364),
(68, 364);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `questiontype`
--

CREATE TABLE `questiontype` (
  `quest_type_id` int(11) NOT NULL,
  `quest_type_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `quest_type_choice` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `questiontype`
--

INSERT INTO `questiontype` (`quest_type_id`, `quest_type_name`, `quest_type_choice`) VALUES
(1, 'Trắc nghiệm 1 đáp án', 0),
(2, 'Trắc nghiệm nhiều đáp án', 1),
(3, 'Đúng-Sai', 0),
(4, 'Tự luận', 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `section`
--

CREATE TABLE `section` (
  `section_id` int(11) NOT NULL,
  `sec_title` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `sec_desc` text CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `author` varchar(20) NOT NULL,
  `sec_time` varchar(50) NOT NULL,
  `sec_pass` varchar(12) NOT NULL,
  `sec_isopen` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `section`
--

INSERT INTO `section` (`section_id`, `sec_title`, `sec_desc`, `author`, `sec_time`, `sec_pass`, `sec_isopen`) VALUES
(2, 'phiên hỏi đáp lần 2', 'phiên hỏi đáp', 'giaovien1', '2019-10-16', 'giaovien1', 1),
(4, 'okkkkkkk', 'ytfghc', 'giaovien1', '2019-10-16', 'giaovien1', 1),
(5, 'thử', 'ok', 'giaovien1', '2019-10-18', 'giaovien1', 0),
(6, 'phiên hỏi đáp lần 1', 'mô tả', 'giaovien1', '2019-11-05', 'abc123', 1),
(7, 'phiên hỏi đáp lần 1', 'okkkk', 'giaovien1', '2019-11-12', 'giaovien1', 1);

-- --------------------------------------------------------

--
-- Cấu trúc đóng vai cho view `single`
-- (See below for the actual view)
--
CREATE TABLE `single` (
`reponse_id` int(11)
,`quest_id` int(11)
,`choice_id` int(11)
,`question_id` int(11)
,`ans_id` int(11)
,`ans_text` text
,`number` int(11)
);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `singlechoicereponse`
--

CREATE TABLE `singlechoicereponse` (
  `reponse_id` int(11) NOT NULL,
  `quest_id` int(11) NOT NULL,
  `choice_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `singlechoicereponse`
--

INSERT INTO `singlechoicereponse` (`reponse_id`, `quest_id`, `choice_id`) VALUES
(14, 121, 119),
(15, 113, 111),
(18, 113, 112),
(19, 113, 110),
(20, 113, 111),
(22, 113, 112),
(23, 121, 118),
(24, 121, 119),
(25, 121, 119),
(36, 312, 414),
(37, 312, 415),
(38, 312, 414),
(39, 318, 431),
(39, 319, 435),
(40, 318, 432),
(40, 319, 434),
(41, 318, 433),
(41, 319, 434),
(42, 325, 453),
(42, 326, 457),
(43, 325, 454),
(43, 326, 456),
(44, 325, 453),
(44, 326, 455),
(45, 325, 454),
(45, 326, 456),
(46, 312, 415),
(47, 329, 469),
(47, 330, 471),
(48, 329, 468),
(48, 330, 473),
(49, 329, 468),
(49, 330, 473),
(50, 329, 468),
(50, 330, 473),
(51, 335, 485),
(52, 335, 486),
(53, 335, 485),
(54, 335, 486),
(55, 339, 494),
(56, 339, 494),
(57, 339, 493),
(61, 345, 502),
(61, 346, 505),
(61, 348, 513),
(62, 339, 493),
(63, 345, 502),
(63, 346, 504),
(63, 347, 509),
(63, 348, 513),
(63, 349, 518),
(63, 350, 521),
(63, 351, 525),
(64, 329, 469),
(64, 330, 473),
(66, 363, 566),
(67, 363, 564),
(68, 363, 565);

--
-- Bẫy `singlechoicereponse`
--
DELIMITER $$
CREATE TRIGGER `single1` AFTER INSERT ON `singlechoicereponse` FOR EACH ROW BEGIN
		update s_ans
        set s_ans.number = s_ans.number+1
        where s_ans.ans_id = new.choice_id;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `squest`
--

CREATE TABLE `squest` (
  `surveysq_id` int(11) NOT NULL,
  `squest_id` int(11) NOT NULL,
  `squest_text` text CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `quest_type_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `squest`
--

INSERT INTO `squest` (`surveysq_id`, `squest_id`, `squest_text`, `quest_type_id`) VALUES
(3, 1, '1', 1),
(3, 2, '1', 1),
(2, 7, 'câu hỏi 2', 1),
(2, 9, '23123', 1),
(2, 10, '123', 1),
(2, 11, 'okkk', 1),
(3, 12, '3r2341', 1),
(2, 13, 'câu hỏi 1', 1),
(2, 14, 'caaaaaaaaaaaaaaaaaa', 1),
(2, 15, 'caaaaaaaaaaaaaaaaaa', 1),
(2, 16, 'câu hỏi mệt mỏi', 1),
(2, 17, 'ôiiiiiii', 1),
(3, 18, 'okkkkkkkkkkkk', 1),
(2, 19, 'câu hỏi', 1),
(2, 20, 'giọt lệ nam nhi', 1),
(2, 21, 'qrwqrqerer', 1),
(2, 22, 'câu hỏi 1', 1),
(2, 23, 'câu hỏi 1', 1),
(2, 24, 'câu hỏi', 1),
(2, 25, '231', 1),
(2, 26, 'câu hỏi 1', 1),
(2, 27, 'câu hỏi 2', 1),
(2, 28, '1213', 1),
(2, 29, 'câu hỏi 1', 1),
(2, 30, 'nàng', 1),
(2, 31, 'câu hỏi 2', 1),
(2, 32, 'câu hỏi iiiii', 1),
(2, 33, 'mã 33', 1),
(2, 34, 'mã 33', 1),
(2, 35, 'câu 1', 1),
(2, 36, 'câuuuu', 1),
(2, 37, 'câu 1', 1),
(2, 38, 'câu hỏi ', 1),
(2, 39, '1', 1),
(2, 40, '2', 1),
(2, 41, 'tao mệt r', 1),
(2, 42, '2312', 1),
(2, 43, 'câu hỏi', 1),
(2, 44, '2', 1),
(2, 45, '231', 1),
(2, 46, '3123', 1),
(2, 47, '23', 1),
(2, 48, '2', 1),
(2, 49, '2313', 1),
(2, 50, '231', 1),
(2, 51, '23123', 1),
(2, 52, '2412', 1),
(2, 53, '123', 1),
(2, 54, '3123', 1),
(2, 55, 'câu', 1),
(2, 56, '1', 1),
(2, 57, '231', 1),
(2, 58, '2413', 1),
(2, 59, '21312', 1),
(2, 60, '2312', 1),
(2, 61, '1', 1),
(2, 62, '213', 1),
(2, 63, '213', 1),
(2, 64, '213', 1),
(2, 65, '213', 1),
(2, 66, '142', 1),
(2, 67, '2312', 1),
(2, 68, '2312', 1),
(2, 69, '2312', 1),
(2, 70, '31', 1),
(2, 71, '23423', 1),
(2, 72, '123', 1),
(2, 73, '23', 1),
(2, 74, '21312', 1),
(2, 75, '12312', 1),
(2, 76, 'câu 1', 1),
(2, 77, '231', 1),
(2, 78, 'cauu 1', 1),
(2, 79, '123', 1),
(2, 80, '123123', 1),
(2, 81, '1312', 1),
(2, 82, '4124', 1),
(2, 83, '231', 1),
(2, 84, '21312', 1),
(2, 85, '321', 1),
(2, 86, 'câu hỏi 1 nè', 1),
(2, 87, '23', 1),
(2, 88, 'ádas', 1),
(2, 89, '2312', 1),
(2, 90, '2313', 1),
(2, 91, 'fdfewf', 1),
(2, 92, 'tự luận 1', 4),
(2, 93, 'tự luận 2', 4),
(2, 94, '31413', 4),
(2, 95, '342342', 4),
(2, 96, 'câu 1', 1),
(2, 97, 'câu 2', 1),
(2, 98, 'câu đúng sai', 3),
(2, 99, 'câu 2', 3),
(2, 100, 'câu 2', 3),
(1, 101, 'câu nhiều đáp án 1', 2),
(1, 102, 'câu nhiều đáp án 2', 2),
(5, 103, 'etrtrdg', 1),
(6, 104, 'abc', 1),
(6, 105, 'cgd', 1),
(6, 106, 'hjsgd', 1),
(6, 107, 'Bạn học ngành gì', 2),
(6, 108, 'Bạn muốn làm ', 2),
(6, 109, 'Bạn đã học môn gì', 1),
(6, 110, 'Bạn học khóa nào ?', 1),
(6, 111, 'thứ hai ', 1),
(6, 112, '23131', 2),
(11, 113, 'câu loại 1', 1),
(11, 114, 'câu hỏi 2', 2),
(11, 115, 'Cậu có xinh không', 3),
(11, 116, 'Hãy nêu cảm nghĩ của bạn về tớ', 4),
(13, 117, 'Bạn tên gì', 4),
(13, 118, 'Bạn sinh năm bao nhiêu', 4),
(13, 119, 'Cậu có thích tớ không???', 3),
(13, 120, 'Cậu còn nhớ tớ không???', 3),
(13, 121, 'Bạn học khóa nào', 1),
(13, 123, 'Sở thích của bạn là gì ?', 2),
(12, 124, 'Theo bạn có nên nói chuyện trong thư viện', 1),
(16, 125, 'Thủ đô Việt Nam là gì', 2),
(16, 126, 'Việt Nam nằm ở khu vực Đông Nam Á?', 3),
(16, 127, 'Nêu cảm nhận của bạn khi lần đầu đến Việt Nam', 4),
(15, 129, 'câu hỏi 1 đáp án', 1),
(15, 130, 'đúng sai 1', 3),
(15, 131, 'đúng sai 2', 3),
(15, 132, 'đúng sai 3', 3),
(15, 133, 'Tự luận 1', 4),
(15, 134, 'Tự luận 2', 4),
(15, 135, 'câu 1', 1),
(15, 136, 'câu 2', 1),
(12, 137, 'hello', 4),
(12, 138, 'hi', 4),
(12, 139, 'uk', 4),
(12, 140, 'Trái đất tròn', 3),
(12, 141, 'Trái đất vuông?', 3),
(12, 142, 'Bạn học ngành gì', 1),
(12, 143, 'Bạn biết những ngôn ngữ gì', 2),
(12, 144, 'Chào bạn', 2),
(15, 145, 'Bạn là gì ?', 1),
(15, 146, 'Bạn thích gì ?', 2),
(15, 147, 'Bạn là nam?', 3),
(15, 148, 'Bạn có suy nghĩ gì?', 4),
(15, 149, 'Bạn là gì ?', 1),
(15, 150, 'Bạn là gì ?{học sinh/giáo viên/người thứ 3}(1)', 3),
(15, 151, 'Bạn thích gì ?', 2),
(15, 152, 'Bạn là nam?', 3),
(15, 153, 'Bạn có suy nghĩ gì?', 4),
(15, 154, 'Bạn là gì ?', 1),
(15, 155, 'Bạn thích gì ?', 2),
(15, 156, 'Bạn là nam?', 3),
(15, 157, 'Bạn có suy nghĩ gì?', 4),
(15, 166, 'Bạn là gì ?', 1),
(15, 167, 'Bạn thích gì ?', 2),
(15, 168, 'Bạn là nam?', 3),
(15, 169, 'Bạn có suy nghĩ gì?', 4),
(20, 312, 'Bạn là gì ?', 1),
(20, 313, 'Bạn thích gì ?', 2),
(20, 314, 'Bạn thích gì ?', 2),
(20, 316, 'Bạn là nam?', 3),
(20, 317, 'Bạn có suy nghĩ gì?', 4),
(21, 318, 'Bạn là gì ?', 1),
(21, 319, 'Bạn là gì ?', 1),
(21, 320, 'Bạn thích gì ?', 2),
(21, 321, 'Bạn thích gì ?', 2),
(21, 322, 'Bạn thích gì ?', 2),
(21, 323, 'Bạn là nam?', 3),
(21, 324, 'Bạn có suy nghĩ gì?', 4),
(22, 325, 'Bạn là gì ?', 1),
(22, 326, 'Bạn là gì ?', 1),
(22, 327, 'Bạn thích gì ?', 2),
(22, 328, 'Bạn thích gì ?', 2),
(23, 329, 'Bạn là gì ?', 1),
(23, 330, 'Bạn là gì ?', 1),
(23, 331, 'Bạn thích gì ?', 2),
(23, 332, 'Bạn thích gì ?', 2),
(23, 333, 'Bạn là nam?', 3),
(23, 334, 'Bạn có suy nghĩ gì?', 4),
(24, 335, 'Bạn là gì i dont ?', 1),
(24, 338, 'Bạn có suy nghĩ gì?', 4),
(25, 339, 'Bạn là gì ?', 1),
(25, 340, 'Bạn thích gì ?', 2),
(25, 341, 'Bạn là nam?', 3),
(25, 342, 'Bạn có suy nghĩ gì?', 4),
(25, 343, 'Bạn có suy nghĩ gì?', 4),
(25, 344, 'Bạn có suy nghĩ gì?', 4),
(26, 345, 'Bạn là gì ?', 1),
(26, 346, 'Bạn thích gì ?', 1),
(26, 347, 'Bạn là gì ?', 1),
(26, 348, 'Bạn thích gì ?', 1),
(26, 349, 'Bạn là gì ?', 1),
(26, 350, 'Bạn thích gì ?', 1),
(26, 351, 'Bạn là gì ?', 1),
(26, 352, 'Bạn thích gì ?', 2),
(27, 353, 'Bạn là gì ?', 2),
(27, 354, 'Bạn thích gì ?', 2),
(27, 355, 'Bạn là gì ?', 2),
(27, 356, 'Bạn thích gì ?', 2),
(24, 357, 'Bạn là gì ?', 1),
(24, 358, 'Bạn thích gì ?', 2),
(24, 361, 'Bạn là gì ?', 1),
(24, 362, 'Bạn thích gì ?', 2),
(29, 363, 'Bạn là gì ?', 1),
(29, 364, 'Bạn thích gì ?', 2),
(29, 365, 'Bạn là nam?', 3),
(29, 366, 'Bạn có suy nghĩ gì?', 4);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `survey`
--

CREATE TABLE `survey` (
  `survey_id` int(11) NOT NULL,
  `title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_vietnamese_ci NOT NULL,
  `startdate` date NOT NULL,
  `enddate` date NOT NULL,
  `isopen` tinyint(1) NOT NULL,
  `pass` varchar(12) NOT NULL,
  `views` int(11) NOT NULL,
  `author` varchar(20) NOT NULL,
  `num_re` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `survey`
--

INSERT INTO `survey` (`survey_id`, `title`, `description`, `startdate`, `enddate`, `isopen`, `pass`, `views`, `author`, `num_re`) VALUES
(1, 'Khảo sát khóa 64', 'Khảo sát thông tin về nguyện vọng, ước mơ...', '2019-09-30', '2019-10-03', 0, '', 1, 'taikhoan1', 0),
(2, 'Khảo sát sinh viên', 'Khảo sát việc làm thêm của sinh viên', '2019-10-02', '2019-10-19', 1, '', 4, '1234', 0),
(3, 'Khảo sát ngành CNTT', 'Khảo sát dành cho các sinh viên khoa CNTT', '2019-10-02', '2019-10-23', 1, '', 0, '12345', 0),
(5, 'Khảo sát 1', 'Mô tả này', '0000-00-00', '2019-11-11', 1, '', 0, 'giaovien1', 0),
(6, '123', 'Khảo sát aaaaaa', '0000-00-00', '2020-12-11', 1, '', 0, 'giaovien1', 0),
(7, 'phiếu khảo sát 3', 'dugfwdgfkljwef', '0000-00-00', '2019-11-11', 0, '', 2, 'giaovien1', 0),
(8, 'Khảo sát 1', '231232', '0000-00-00', '2019-10-11', 0, '', 2, 'giaovien1', 0),
(10, 'phiếu khảo sát 5', 'Mô tả', '0000-00-00', '2091-11-11', 0, '', 10, 'giaovien1', 0),
(11, 'Phiếu khảo sát ', 'Mô tả về phiếu khảo sát', '2019-10-18', '2019-11-11', 1, '', 85, 'giaovien1', 5),
(12, 'Khảo sát 1', 'okkkk', '2019-10-18', '2019-11-11', 1, '', 33, 'giaovien1', 0),
(13, 'okkk', 'okkk', '2019-10-18', '2019-11-11', 1, '', 14, 'giaovien1', 4),
(15, 'Khảo sát môn học', 'Khảo sát với các Khóa học sinh về  đánh giá một số môn học và Yêu cầu các môn học trong kỳ tới', '2019-11-04', '0000-00-00', 0, '', 43, 'giaovien1', 1),
(16, 'Khảo sát test chỉnh sửa', 'mô tả', '2019-11-05', '0000-00-00', 1, '', 48, 'giaovien1', 1),
(20, 'test lỗi nhiều đáp án', 'test lỗi ', '2019-11-07', '0000-00-00', 0, '', 23, 'giaovien1', 0),
(21, 'test lỗi', 'test lỗi nhiều đáp án', '2019-11-07', '0000-00-00', 0, '', 11, 'giaovien1', 0),
(22, 'Khảo sát 1', 'huhuhu', '2019-11-07', '0000-00-00', 0, '', 16, 'giaovien1', 0),
(23, 'thêm phiếu để test', 'chán lỗi lắm rồi ', '2019-11-07', '0000-00-00', 1, '', 20, 'giaovien1', 0),
(24, 'thêm  2', 'ok', '2019-11-07', '0000-00-00', 1, '', 45, 'giaovien1', 0),
(25, 'tự luận', 'ok', '2019-11-07', '0000-00-00', 1, '', 13, 'giaovien1', 0),
(26, 'loại 1', '1', '2019-11-07', '0000-00-00', 1, '', 11, 'giaovien1', 0),
(27, 'loại 2', '2', '2019-11-07', '0000-00-00', 1, '', 10, 'giaovien1', 0),
(28, 'thu', 'thuas', '2019-11-12', '0000-00-00', 1, '', 3, 'hay', 0),
(29, 'phieu phieu ', 'okikikik', '2019-11-12', '0000-00-00', 1, '', 16, 'giaovien1', 3);

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
  `ans_text` text CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `number` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `s_ans`
--

INSERT INTO `s_ans` (`question_id`, `ans_id`, `ans_text`, `number`) VALUES
(22, 1, 'đáp án 1', 4),
(22, 2, 'đáp án 2', 5),
(23, 3, 'dù sao', 3),
(23, 4, 'dù ngày sao ta vẫn muốn bên người', 13),
(25, 5, '123123', 1),
(25, 6, '23123123', 1),
(25, 7, '123123', 5),
(27, 8, '123123', 1),
(27, 9, '23123123', 4),
(27, 10, '123123', 0),
(28, 11, '23', 0),
(28, 12, '132', 0),
(30, 13, '1', 0),
(30, 14, '2', 0),
(30, 15, '1', 0),
(30, 16, '2', 0),
(34, 17, 'mã 33', 0),
(34, 18, 'câu 2', 0),
(34, 19, 'mã 33', 0),
(34, 20, 'câu 2', 0),
(36, 21, 'tướng quân', 0),
(38, 22, 'sầ', 0),
(38, 23, 'sầ', 0),
(38, 24, 'sầ', 0),
(38, 25, 'sầ', 0),
(40, 26, '123123', 0),
(40, 27, '2', 0),
(40, 28, '123123', 0),
(40, 29, '2', 0),
(42, 30, '31', 0),
(42, 31, '2312', 0),
(42, 32, '31', 0),
(42, 33, '2312', 0),
(46, 34, '23123', 0),
(46, 35, '23123', 0),
(46, 36, '23123', 0),
(46, 37, '23123', 0),
(50, 38, '312', 0),
(50, 39, '312', 0),
(52, 40, '23123', 0),
(52, 41, '23123', 0),
(52, 42, '23123', 0),
(52, 43, '23123', 0),
(54, 44, '131', 0),
(54, 45, '131', 0),
(75, 48, '123', 0),
(75, 49, 'đáp án 2', 0),
(76, 50, '23', 0),
(76, 51, '213', 0),
(78, 52, '213', 0),
(78, 53, '1231', 0),
(78, 54, '213', 0),
(83, 55, '23', 0),
(84, 56, '2312', 0),
(85, 57, '231', 0),
(85, 58, '123', 0),
(85, 59, '1231', 0),
(86, 60, 'chẳng', 0),
(86, 61, 'cần', 0),
(86, 62, '1', 0),
(87, 63, 'ai', 0),
(87, 64, 'nữa', 0),
(88, 65, 'cũng như em hết thương cạn nhớ', 0),
(89, 66, '213', 0),
(90, 67, '213', 0),
(90, 68, '41', 0),
(90, 69, '4214', 0),
(91, 70, 'fewf', 0),
(91, 71, 'fwef', 0),
(96, 72, '23', 0),
(96, 73, '231', 0),
(97, 74, '414', 0),
(97, 75, '32523', 0),
(97, 76, '23523', 0),
(101, 77, '231', 0),
(101, 78, '3123', 0),
(101, 79, '3123', 0),
(102, 80, '23123', 0),
(102, 81, '3123', 0),
(102, 82, '23123', 0),
(103, 83, '1312', 0),
(103, 84, '3123', 0),
(104, 85, '123', 0),
(104, 86, '3213', 0),
(104, 87, '34', 0),
(105, 88, 'tao thích mày', 0),
(105, 89, '23123123', 0),
(106, 90, 'ưe', 0),
(106, 91, 'fd', 0),
(106, 92, 'ffg', 0),
(107, 93, 'CNPM', 0),
(107, 94, 'CNTT', 0),
(107, 95, 'MẠng máy tinh ', 0),
(107, 96, 'TRuyền thông', 0),
(107, 97, 'Kinh tế', 0),
(108, 98, 'Dev', 0),
(108, 99, 'Man', 0),
(108, 100, 'Tes', 0),
(109, 101, 'Hệ quản trị cơ sở dữ liệu', 0),
(109, 102, 'Tín hiệu hệ thống', 0),
(109, 103, 'Trí tuệ nhân tạo', 0),
(111, 104, '3123', 0),
(111, 105, '124134', 0),
(111, 106, '21321', 0),
(112, 107, '21312', 0),
(112, 108, '312312', 0),
(112, 109, '3123123', 0),
(113, 110, 'đáp án 1', 1),
(113, 111, 'đáp án 2', 2),
(113, 112, 'đáp án 3', 2),
(114, 113, 'đáp án 1', 2),
(114, 114, 'aaa hihi', 4),
(114, 115, 'thử nữa ', 2),
(114, 116, 'ok', 2),
(121, 117, 'Khóa 64', 0),
(121, 118, 'Khóa 62', 1),
(121, 119, 'Khóa 63', 3),
(123, 120, 'đọc sách ', 1),
(123, 121, 'học', 1),
(123, 122, 'hát', 2),
(123, 123, 'đàn', 2),
(124, 124, 'Nên', 0),
(124, 125, 'Không', 0),
(124, 126, 'Tôi không quan tâm', 0),
(125, 127, 'Hà Nội', 1),
(125, 128, 'Hải Phòng', 1),
(125, 129, 'HCM', 0),
(129, 130, 'abc', 0),
(129, 131, 'edc', 0),
(129, 132, 'add', 0),
(135, 133, '1', 0),
(135, 134, '2', 0),
(135, 135, '3', 0),
(136, 136, '1', 0),
(136, 137, '2', 0),
(136, 138, '3', 0),
(142, 139, 'CNPM', 0),
(142, 140, 'CNTT', 0),
(142, 141, 'MMT', 0),
(143, 142, 'Java', 0),
(143, 143, 'C++', 0),
(143, 144, 'C', 0),
(144, 145, 'uk', 0),
(144, 146, 'chào', 0),
(144, 147, 'đéo', 0),
(145, 148, 'bim bim', 0),
(145, 149, 'xoài', 0),
(145, 150, 'me', 0),
(145, 151, 'kem', 0),
(145, 152, 'kẹo', 0),
(146, 153, 'bim bim', 0),
(146, 154, 'xoài', 0),
(146, 155, 'me', 0),
(146, 156, 'kem', 0),
(146, 157, 'kẹo', 0),
(149, 158, 'bim bim', 0),
(149, 159, 'xoài', 0),
(149, 160, 'me', 0),
(149, 161, 'kem', 0),
(149, 162, 'kẹo', 0),
(151, 163, 'bim bim', 0),
(151, 164, 'xoài', 0),
(151, 165, 'me', 0),
(151, 166, 'kem', 0),
(151, 167, 'kẹo', 0),
(154, 168, 'bim bim', 0),
(154, 169, 'xoài', 0),
(154, 170, 'me', 0),
(154, 171, 'kem', 0),
(154, 172, 'kẹo', 0),
(155, 173, 'bim bim', 0),
(155, 174, 'xoài', 0),
(155, 175, 'me', 0),
(155, 176, 'kem', 0),
(155, 177, 'kẹo', 0),
(166, 188, 'người thứ 3', 0),
(166, 189, 'giáo viên', 0),
(166, 190, 'học sinh', 0),
(167, 191, 'bim bim', 0),
(167, 192, 'xoài', 0),
(167, 193, 'me', 0),
(167, 194, 'kem', 0),
(167, 195, 'kẹo', 0),
(312, 413, 'học sinh', 0),
(312, 414, 'giáo viên', 1),
(312, 415, 'người thứ 3', 2),
(313, 416, 'kẹo', 0),
(313, 417, 'kem', 1),
(313, 418, 'me', 3),
(313, 419, 'xoài', 3),
(313, 420, 'bim bim', 0),
(314, 421, 'kẹo', 1),
(314, 422, 'kem', 1),
(314, 423, 'me', 1),
(314, 424, 'xoài', 2),
(314, 425, 'bim bim', 0),
(318, 431, 'học sinh', 0),
(318, 432, 'giáo viên', 0),
(318, 433, 'người thứ 3', 0),
(319, 434, 'học sinh', 2),
(319, 435, 'giáo viên', 0),
(319, 436, 'người thứ 3', 0),
(320, 437, 'kẹo', 1),
(320, 438, 'kem', 1),
(320, 439, 'me', 0),
(320, 440, 'xoài', 0),
(320, 441, 'bim bim', 0),
(321, 442, 'kẹo', 0),
(321, 443, 'kem', 1),
(321, 444, 'me', 1),
(321, 445, 'xoài', 1),
(321, 446, 'bim bim', 1),
(322, 447, 'kẹo', 0),
(322, 448, 'kem', 0),
(322, 449, 'me', 0),
(322, 450, 'xoài', 1),
(322, 451, 'bim bim', 1),
(325, 452, 'học sinh', 0),
(325, 453, 'giáo viên', 1),
(325, 454, 'người thứ 3', 2),
(326, 455, 'học sinh', 1),
(326, 456, 'giáo viên', 2),
(326, 457, 'người thứ 3', 2),
(327, 458, 'kẹo', 0),
(327, 459, 'kem', 0),
(327, 460, 'me', 0),
(327, 461, 'xoài', 0),
(327, 462, 'bim bim', 0),
(328, 463, 'kẹo', 0),
(328, 464, 'kem', 0),
(328, 465, 'me', 0),
(328, 466, 'xoài', 0),
(328, 467, 'bim bim', 0),
(329, 468, 'học sinh', 3),
(329, 469, 'giáo viên', 2),
(329, 470, 'người thứ 3', 0),
(330, 471, 'học sinh', 1),
(330, 472, 'giáo viên', 0),
(330, 473, 'người thứ 3', 4),
(331, 474, 'kẹo', 1),
(331, 475, 'kem', 3),
(331, 476, 'me', 3),
(331, 477, 'xoài', 3),
(331, 478, 'bim bim', 2),
(332, 479, 'kẹo', 0),
(332, 480, 'kem', 1),
(332, 481, 'me', 3),
(332, 482, 'xoài', 1),
(332, 483, 'bim bim', 2),
(335, 484, 'học sinh', 0),
(335, 485, 'giáo viên', 2),
(335, 486, 'người thứ 3', 2),
(339, 492, 'học sinh', 0),
(339, 493, 'giáo viên', 2),
(339, 494, 'người thứ 3', 2),
(340, 495, 'kẹo', 1),
(340, 496, 'kem', 1),
(340, 497, 'me', 0),
(340, 498, 'xoài', 1),
(340, 499, 'bim bim', 1),
(345, 500, 'học sinh', 0),
(345, 501, 'giáo viên', 0),
(345, 502, 'người thứ 3', 2),
(346, 503, 'kẹo', 0),
(346, 504, 'kem', 1),
(346, 505, 'me', 1),
(346, 506, 'xoài', 0),
(346, 507, 'bim bim', 0),
(347, 508, 'học sinh', 0),
(347, 509, 'giáo viên', 1),
(347, 510, 'người thứ 3', 0),
(348, 511, 'kẹo', 0),
(348, 512, 'kem', 0),
(348, 513, 'me', 2),
(348, 514, 'xoài', 0),
(348, 515, 'bim bim', 0),
(349, 516, 'học sinh', 0),
(349, 517, 'giáo viên', 0),
(349, 518, 'người thứ 3', 1),
(350, 519, 'kẹo', 0),
(350, 520, 'kem', 0),
(350, 521, 'me', 1),
(350, 522, 'xoài', 0),
(350, 523, 'bim bim', 0),
(351, 524, 'học sinh', 0),
(351, 525, 'giáo viên', 1),
(351, 526, 'người thứ 3', 0),
(352, 527, 'kẹo', 0),
(352, 528, 'kem', 0),
(352, 529, 'me', 0),
(352, 530, 'xoài', 1),
(352, 531, 'bim bim', 0),
(353, 532, 'học sinh', 0),
(353, 533, 'giáo viên', 2),
(353, 534, 'người thứ 3', 0),
(354, 535, 'kẹo', 1),
(354, 536, 'kem', 2),
(354, 537, 'me', 2),
(354, 538, 'xoài', 1),
(354, 539, 'bim bim', 1),
(355, 540, 'học sinh', 0),
(355, 541, 'giáo viên', 2),
(355, 542, 'người thứ 3', 1),
(356, 543, 'kẹo', 1),
(356, 544, 'kem', 2),
(356, 545, 'me', 1),
(356, 546, 'xoài', 2),
(356, 547, 'bim bim', 1),
(357, 548, 'học sinh', 0),
(357, 549, 'giáo viên', 0),
(357, 550, 'người thứ 3', 0),
(358, 551, 'kẹo', 0),
(358, 552, 'kem', 0),
(358, 553, 'me', 0),
(358, 554, 'xoài', 0),
(358, 555, 'bim bim', 0),
(361, 556, 'học sinh', 0),
(361, 557, 'giáo viên', 0),
(361, 558, 'người thứ 3', 0),
(362, 559, 'kẹo', 0),
(362, 560, 'kem', 0),
(362, 561, 'me', 0),
(362, 562, 'xoài', 0),
(362, 563, 'bim bim', 0),
(363, 564, 'học sinh', 1),
(363, 565, 'giáo viên', 1),
(363, 566, 'người thứ 3', 1),
(364, 567, 'kẹo', 0),
(364, 568, 'kem', 3),
(364, 569, 'me', 1),
(364, 570, 'xoài', 1),
(364, 571, 'bim bim', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbao`
--

CREATE TABLE `tbao` (
  `id` int(11) NOT NULL,
  `mes` text COLLATE utf8_vietnamese_ci NOT NULL,
  `link` varchar(255) COLLATE utf8_vietnamese_ci NOT NULL,
  `user` varchar(225) COLLATE utf8_vietnamese_ci NOT NULL,
  `date` datetime NOT NULL,
  `type` int(11) NOT NULL,
  `text` text COLLATE utf8_vietnamese_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `tbao`
--

INSERT INTO `tbao` (`id`, `mes`, `link`, `user`, `date`, `type`, `text`) VALUES
(1, '1', '29', 'giaovien1', '2019-11-12 23:24:42', 1, 'phieu phieu '),
(2, '2', '29', 'giaovien1', '2019-11-12 23:28:21', 1, 'phieu phieu '),
(3, '3', '29', 'giaovien1', '2019-11-13 00:09:15', 1, 'phieu phieu '),
(4, '', '3', 'VanVan', '2019-11-13 21:16:45', 3, 'câu hỏi thử'),
(5, '9', '2', 'giaovien1', '2019-11-13 21:54:18', 2, 'phiên hỏi đáp lần 2'),
(6, '10', '2', 'giaovien1', '2019-11-13 21:54:54', 2, 'phiên hỏi đáp lần 2'),
(7, '11', '2', 'giaovien1', '2019-11-13 21:56:22', 2, 'phiên hỏi đáp lần 2'),
(8, '12', '2', 'giaovien1', '2019-11-13 21:57:24', 2, 'phiên hỏi đáp lần 2'),
(9, '', '15', '12345van', '2019-11-13 22:21:35', 3, 'thử này'),
(10, '', '15', 'giaovien1', '2019-11-13 23:17:06', 4, 'ok'),
(11, '', '3', 'VanVan', '2019-11-13 23:39:27', 3, 'câu hỏi thử'),
(12, '', '15', 'giaovien1', '2019-11-13 23:44:33', 4, 'ok'),
(13, '', '3', '12345van', '2019-11-13 23:46:04', 4, 'tao thử bình luận');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `textreponse`
--

CREATE TABLE `textreponse` (
  `reponse_id` int(11) NOT NULL,
  `quest_id` int(11) NOT NULL,
  `textreponse` varchar(500) CHARACTER SET utf8 COLLATE utf8_vietnamese_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `textreponse`
--

INSERT INTO `textreponse` (`reponse_id`, `quest_id`, `textreponse`) VALUES
(14, 117, 'v?n anh'),
(14, 118, '1999'),
(15, 116, 'okkk'),
(19, 116, 'mày cũng thích tớ'),
(20, 116, 'okkkeyyy được chưa'),
(22, 116, 'oki nóng quá'),
(23, 117, 'Vân '),
(23, 118, '1989'),
(24, 117, 'mai'),
(24, 118, '2000'),
(25, 117, 'leeeee'),
(25, 118, '2001'),
(27, 127, 'Thích'),
(29, 128, 'okkkk'),
(30, 309, 'đíu nghĩ gì cả'),
(30, 310, 'hỏi lắm vậy'),
(31, 309, 'o'),
(31, 310, 'k'),
(32, 309, 'kk'),
(32, 310, 'kk'),
(33, 127, 'Bình thường'),
(34, 127, 'okk'),
(36, 317, 'k'),
(37, 317, 'ok'),
(40, 324, 'ko'),
(46, 317, 'ok'),
(47, 334, 'thinking'),
(48, 334, 'ok'),
(49, 334, 'okk'),
(50, 334, 'k'),
(51, 338, 'k'),
(52, 338, 'koooo'),
(53, 338, 'okkkkkk'),
(54, 338, 'vâng'),
(55, 342, 'mệt'),
(55, 343, 'thích'),
(55, 344, 'gì'),
(57, 342, 'ok'),
(57, 343, 'ok'),
(57, 344, 'ok'),
(62, 342, 'kkk'),
(62, 343, 'k'),
(62, 344, 'k'),
(64, 334, 'jkjk'),
(66, 366, 'kkoooo'),
(67, 366, 'aaaaaaaaa'),
(68, 366, 'cô gái ấy');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user`
--

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL,
  `username` varchar(20) NOT NULL,
  `name` varchar(25) CHARACTER SET utf8 COLLATE utf8_vietnamese_ci NOT NULL,
  `password` varchar(30) CHARACTER SET utf8 COLLATE utf8_vietnamese_ci NOT NULL,
  `email` varchar(50) NOT NULL,
  `date` varchar(50) NOT NULL,
  `isadmin` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `user`
--

INSERT INTO `user` (`user_id`, `username`, `name`, `password`, `email`, `date`, `isadmin`) VALUES
(2, 'VanVan', 'Vân Anh', '12345', 'van005618@gmail.com', '0000-00-00', 0),
(8, 'o0ovano0o', 'Van Anh ', '12345', 'van0056@gmail.com', '1999-11-11', 0),
(9, 'vanvan1199', 'Vân Vân', '12345', 'van@gmail.com', '1999-11-11', 0),
(10, '12345van', 'O0ovano0o ', '12345', 'van@gmail.com', '1999-11-11', 0),
(11, 'van1199', 'Vân Xinh Gái', '12345', 'van@gmail.com', '1999-11-11', 0),
(12, 'giaovien1', 'Giáo viên 1', 'giaovien1', 'GiaoVien@gmail.com', '1967-01-01', 1),
(13, 'hay', 'Hay', '123456', 'truong@gmail.com', '1999-01-01', 1),
(14, 'pho', 'May Con Pho ', '123456', 'tr@gmail.com', '1999-01-01', 0),
(15, 'ngu', 'Doan Xem ', '123456', 'tee@gmail.com', '1999-01-01', 0),
(16, 'giaovien', 'Giáo viên 3', 'giaovien1', 'van@gmail.com', '1997-11-11', 0),
(22, 'van005618@gmail.com', 'van nguyen', 'fb', 'van005618@gmail.com', '', 0),
(23, 'beminah1999@gmail.co', 'Park Minhanh', 'fb', 'beminah1999@gmail.com', '', 0),
(24, 'Nguyen', 'Giaovien222 ', 'giaovien1', 'van123123@gmail.com', '1999-11-11', 0),
(25, 'Nguyen123', 'Giáo viên giả dối', 'giaovien1', 'va231n@gmail.com', '1999-11-11', 0),
(26, '12323hoaroi', 'Test Tên Đây ', 'giaovien1', 'van434@gmail.com', '1992-11-11', 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user_reponse`
--

CREATE TABLE `user_reponse` (
  `surveyid` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `reponse_id` int(11) NOT NULL,
  `reponse_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `user_reponse`
--

INSERT INTO `user_reponse` (`surveyid`, `user_id`, `reponse_id`, `reponse_date`) VALUES
(13, 12, 14, '2019-10-20'),
(11, 11, 15, '2019-11-02'),
(11, 10, 18, '2019-11-03'),
(11, 8, 19, '2019-11-03'),
(11, 2, 20, '2019-11-03'),
(11, 12, 22, '2019-11-03'),
(13, 10, 23, '2019-11-03'),
(13, 2, 24, '2019-11-03'),
(13, 11, 25, '2019-11-03'),
(15, 12, 26, '2019-11-04'),
(16, 12, 27, '2019-11-05'),
(15, 10, 28, '2019-11-05'),
(17, 12, 29, '2019-11-05'),
(19, 2, 30, '2019-11-07'),
(19, 10, 31, '2019-11-07'),
(19, 11, 32, '2019-11-07'),
(16, 11, 33, '2019-11-07'),
(16, 8, 34, '2019-11-07'),
(19, 8, 35, '2019-11-07'),
(20, 10, 36, '2019-11-07'),
(20, 11, 37, '2019-11-07'),
(20, 8, 38, '2019-11-07'),
(21, 10, 39, '2019-11-07'),
(21, 2, 40, '2019-11-07'),
(21, 8, 41, '2019-11-07'),
(22, 10, 42, '2019-11-07'),
(22, 2, 43, '2019-11-07'),
(22, 8, 44, '2019-11-07'),
(22, 11, 45, '2019-11-07'),
(20, 2, 46, '2019-11-07'),
(23, 10, 47, '2019-11-07'),
(23, 2, 48, '2019-11-07'),
(23, 8, 49, '2019-11-07'),
(23, 11, 50, '2019-11-07'),
(24, 10, 51, '2019-11-07'),
(24, 2, 52, '2019-11-07'),
(24, 8, 53, '2019-11-07'),
(24, 11, 54, '2019-11-07'),
(25, 10, 55, '2019-11-07'),
(25, 2, 56, '2019-11-07'),
(25, 8, 57, '2019-11-07'),
(27, 8, 58, '2019-11-07'),
(27, 10, 59, '2019-11-07'),
(27, 11, 60, '2019-11-07'),
(26, 2, 61, '2019-11-09'),
(25, 11, 62, '2019-11-09'),
(26, 11, 63, '2019-11-09'),
(23, 22, 64, '2019-11-09'),
(29, 2, 66, '2019-11-12'),
(29, 10, 67, '2019-11-12'),
(29, 8, 68, '2019-11-13');

--
-- Bẫy `user_reponse`
--
DELIMITER $$
CREATE TRIGGER `mess_song` AFTER INSERT ON `user_reponse` FOR EACH ROW BEGIN
DECLARE number INT;
DECLARE tex  VARCHAR(255);
SEt number= (SELECT num_re FROM survey WHERE `survey_id`=NEW.surveyid)+1;

Set tex= "Có thêm 1 người đã tham gia khảo sát của bạn. Tổng số người tham gia hiện giờ là "+number;
UPDATE `survey` SET `num_re`=`num_re`+1 WHERE `survey_id`=NEW.surveyid;
INSERT INTO `tbao`
 SET mes = tex,
     link="/survey?id="+NEW.surveyid,
     tbao.date = NOW(),
     tbao.type=1,
     tbao.text=(SELECT title from survey WHERE survey.survey_id=NEW.surveyid),
     tbao.user=(SELECT author from survey where `survey_id`= NEW.surveyid); 
 end
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Cấu trúc đóng vai cho view `yesno`
-- (See below for the actual view)
--
CREATE TABLE `yesno` (
`quest_id` int(11)
,`noo` decimal(23,0)
,`total` bigint(21)
);

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
-- Đang đổ dữ liệu cho bảng `yesnoreponse`
--

INSERT INTO `yesnoreponse` (`reponse_id`, `quest_id`, `yesnovalue`) VALUES
(14, 119, 1),
(14, 120, 0),
(15, 115, 0),
(19, 115, 0),
(20, 115, 0),
(22, 115, 1),
(23, 119, 1),
(23, 120, 1),
(24, 119, 0),
(24, 120, 1),
(25, 119, 0),
(25, 120, 1),
(27, 126, 1),
(30, 306, 0),
(30, 307, 1),
(30, 308, 0),
(31, 306, 1),
(31, 307, 0),
(31, 308, 1),
(32, 306, 1),
(32, 307, 0),
(32, 308, 1),
(33, 126, 1),
(34, 126, 1),
(35, 306, 0),
(36, 316, 0),
(37, 316, 0),
(40, 323, 0),
(46, 316, 0),
(47, 333, 0),
(48, 333, 0),
(49, 333, 0),
(50, 333, 1),
(51, 337, 0),
(52, 337, 0),
(53, 337, 0),
(54, 337, 1),
(55, 341, 0),
(56, 341, 1),
(57, 341, 0),
(62, 341, 0),
(64, 333, 0),
(66, 365, 1),
(67, 365, 0),
(68, 365, 0);

-- --------------------------------------------------------

--
-- Cấu trúc cho view `multi`
--
DROP TABLE IF EXISTS `multi`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `multi`  AS  select `s`.`question_id` AS `question_id`,`s`.`ans_id` AS `ans_id`,`s`.`ans_text` AS `ans_text`,`s`.`number` AS `number`,`choice_multichoices`.`response_id` AS `response_id` from (`choice_multichoices` left join `s_ans` `s` on((`s`.`question_id` = `choice_multichoices`.`quest_id`))) group by `s`.`ans_id` ;

-- --------------------------------------------------------

--
-- Cấu trúc cho view `single`
--
DROP TABLE IF EXISTS `single`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `single`  AS  select `singlechoicereponse`.`reponse_id` AS `reponse_id`,`singlechoicereponse`.`quest_id` AS `quest_id`,`singlechoicereponse`.`choice_id` AS `choice_id`,`s_ans`.`question_id` AS `question_id`,`s_ans`.`ans_id` AS `ans_id`,`s_ans`.`ans_text` AS `ans_text`,`s_ans`.`number` AS `number` from (`singlechoicereponse` left join `s_ans` on((`s_ans`.`question_id` = `singlechoicereponse`.`quest_id`))) group by `s_ans`.`ans_id` ;

-- --------------------------------------------------------

--
-- Cấu trúc cho view `yesno`
--
DROP TABLE IF EXISTS `yesno`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `yesno`  AS  select `yesnoreponse`.`quest_id` AS `quest_id`,sum((case when (`yesnoreponse`.`yesnovalue` = 0) then 1 else 0 end)) AS `noo`,count(`yesnoreponse`.`yesnovalue`) AS `total` from `yesnoreponse` group by `yesnoreponse`.`quest_id` ;

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `ans_quest`
--
ALTER TABLE `ans_quest`
  ADD PRIMARY KEY (`ans_id`,`question_id`) USING BTREE,
  ADD KEY `ans_id` (`ans_id`),
  ADD KEY `ans_quest_ibfk_1` (`question_id`);

--
-- Chỉ mục cho bảng `aquest`
--
ALTER TABLE `aquest`
  ADD PRIMARY KEY (`sections_id`,`question_id`) USING BTREE,
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
  ADD PRIMARY KEY (`cmt_id`,`question_id`,`ans_id`) USING BTREE,
  ADD KEY `cmt_id` (`cmt_id`),
  ADD KEY `ans_id` (`ans_id`),
  ADD KEY `question_id` (`question_id`);

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
  ADD KEY `quest_type_id` (`quest_type_id`),
  ADD KEY `survey_id` (`surveysq_id`);

--
-- Chỉ mục cho bảng `survey`
--
ALTER TABLE `survey`
  ADD PRIMARY KEY (`survey_id`);

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
-- Chỉ mục cho bảng `tbao`
--
ALTER TABLE `tbao`
  ADD PRIMARY KEY (`id`);

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
  ADD KEY `surveyid` (`surveyid`),
  ADD KEY `user_reponse_ibfk_1` (`user_id`);

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
-- AUTO_INCREMENT cho bảng `ans_quest`
--
ALTER TABLE `ans_quest`
  MODIFY `ans_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT cho bảng `aquest`
--
ALTER TABLE `aquest`
  MODIFY `question_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT cho bảng `cmt_ans`
--
ALTER TABLE `cmt_ans`
  MODIFY `cmt_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT cho bảng `section`
--
ALTER TABLE `section`
  MODIFY `section_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT cho bảng `squest`
--
ALTER TABLE `squest`
  MODIFY `squest_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=367;

--
-- AUTO_INCREMENT cho bảng `survey`
--
ALTER TABLE `survey`
  MODIFY `survey_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT cho bảng `s_ans`
--
ALTER TABLE `s_ans`
  MODIFY `ans_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=572;

--
-- AUTO_INCREMENT cho bảng `tbao`
--
ALTER TABLE `tbao`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT cho bảng `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT cho bảng `user_reponse`
--
ALTER TABLE `user_reponse`
  MODIFY `reponse_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `ans_quest`
--
ALTER TABLE `ans_quest`
  ADD CONSTRAINT `ans_quest_ibfk_1` FOREIGN KEY (`question_id`) REFERENCES `aquest` (`question_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `aquest`
--
ALTER TABLE `aquest`
  ADD CONSTRAINT `aquest_ibfk_3` FOREIGN KEY (`sections_id`) REFERENCES `section` (`section_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `choice_multichoices`
--
ALTER TABLE `choice_multichoices`
  ADD CONSTRAINT `choice_multichoices_ibfk_2` FOREIGN KEY (`response_id`) REFERENCES `multichoices` (`reponse_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `choice_multichoices_ibfk_3` FOREIGN KEY (`quest_id`) REFERENCES `multichoices` (`quest_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `choice_multichoices_ibfk_4` FOREIGN KEY (`ans_id`) REFERENCES `s_ans` (`ans_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `cmt_ans`
--
ALTER TABLE `cmt_ans`
  ADD CONSTRAINT `cmt_ans_ibfk_1` FOREIGN KEY (`ans_id`) REFERENCES `ans_quest` (`ans_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `multichoices`
--
ALTER TABLE `multichoices`
  ADD CONSTRAINT `multichoices_ibfk_3` FOREIGN KEY (`quest_id`) REFERENCES `squest` (`squest_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `multichoices_ibfk_4` FOREIGN KEY (`reponse_id`) REFERENCES `user_reponse` (`reponse_id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `singlechoicereponse`
--
ALTER TABLE `singlechoicereponse`
  ADD CONSTRAINT `singlechoicereponse_ibfk_4` FOREIGN KEY (`choice_id`) REFERENCES `s_ans` (`ans_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `singlechoicereponse_ibfk_5` FOREIGN KEY (`reponse_id`) REFERENCES `user_reponse` (`reponse_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `squest`
--
ALTER TABLE `squest`
  ADD CONSTRAINT `squest_ibfk_2` FOREIGN KEY (`quest_type_id`) REFERENCES `questiontype` (`quest_type_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `squest_ibfk_3` FOREIGN KEY (`surveysq_id`) REFERENCES `survey` (`survey_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `survey_section`
--
ALTER TABLE `survey_section`
  ADD CONSTRAINT `survey_section_ibfk_3` FOREIGN KEY (`survey_id`) REFERENCES `survey` (`survey_id`),
  ADD CONSTRAINT `survey_section_ibfk_4` FOREIGN KEY (`section_id`) REFERENCES `section` (`section_id`);

--
-- Các ràng buộc cho bảng `s_ans`
--
ALTER TABLE `s_ans`
  ADD CONSTRAINT `s_ans_ibfk_1` FOREIGN KEY (`question_id`) REFERENCES `squest` (`squest_id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `textreponse`
--
ALTER TABLE `textreponse`
  ADD CONSTRAINT `textreponse_ibfk_1` FOREIGN KEY (`reponse_id`) REFERENCES `user_reponse` (`reponse_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `user_reponse`
--
ALTER TABLE `user_reponse`
  ADD CONSTRAINT `user_reponse_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`);

--
-- Các ràng buộc cho bảng `yesnoreponse`
--
ALTER TABLE `yesnoreponse`
  ADD CONSTRAINT `yesnoreponse_ibfk_1` FOREIGN KEY (`reponse_id`) REFERENCES `user_reponse` (`reponse_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
