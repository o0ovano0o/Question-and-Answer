-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th10 03, 2019 lúc 02:22 PM
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
  `ans_time` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `ans_quest`
--

INSERT INTO `ans_quest` (`ans_id`, `question_id`, `content`, `author`, `ans_time`) VALUES
(1, 1, 'd hay', 'pho', '29/10/2019');

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
(2, 2, 'pho', 'doan xem', '27/10/2019', 0);

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
(4, 18, 114),
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
(123, 24, 123);

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
(1, 1, 1, 'pho', 'cung dc', '29/10/2019');

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
(25, 123);

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
(3, '', '', 'giaovien1', '2019-10-16', 'giaovien1', 1),
(4, 'ffjghvh', 'ytfghc', 'giaovien1', '2019-10-16', 'giaovien1', 1),
(5, 'thử', 'ok', 'giaovien1', '2019-10-18', 'giaovien1', 1);

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
(25, 121, 119);

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
(2, 3, 'cauau hỏi ', 1),
(2, 4, 'câu hỏi 2', 1),
(2, 5, 'câu hỏi 1', 1),
(2, 6, 'câu vớ vẩn', 1),
(2, 7, 'câu hỏi 2', 1),
(2, 8, '23213123', 1),
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
(13, 123, 'Sở thích của bạn là gì ?', 2);

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
  `author` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `survey`
--

INSERT INTO `survey` (`survey_id`, `title`, `description`, `startdate`, `enddate`, `isopen`, `pass`, `views`, `author`) VALUES
(1, 'Khảo sát khóa 64', 'Khảo sát thông tin về nguyện vọng, ước mơ...', '2019-09-30', '2019-10-03', 0, '', 0, 'taikhoan1'),
(2, 'Khảo sát sinh viên', 'Khảo sát việc làm thêm của sinh viên', '2019-10-02', '2019-10-19', 1, '', 2, '1234'),
(3, 'Khảo sát ngành CNTT', 'Khảo sát dành cho các sinh viên khoa CNTT', '2019-10-02', '2019-10-23', 1, '', 0, '12345'),
(4, 'Khảo sát ngành CNTT', 'Khảo sát dành cho các sinh viên khoa CNTT K62', '2019-10-02', '2019-10-03', 0, '', 0, '12345'),
(5, 'Khảo sát 1', 'Mô tả này', '0000-00-00', '2019-11-11', 1, '', 0, 'giaovien1'),
(6, '123', 'Khảo sát aaaaaa', '0000-00-00', '2020-12-11', 1, '', 0, 'giaovien1'),
(7, 'phiếu khảo sát 3', 'dugfwdgfkljwef', '0000-00-00', '2019-11-11', 1, '', 0, 'giaovien1'),
(8, 'Khảo sát 1', '231232', '0000-00-00', '2019-10-11', 1, '', 0, 'giaovien1'),
(9, '123', 'OK 123', '0000-00-00', '2019-11-11', 1, '', 0, 'giaovien1'),
(10, 'phiếu khảo sát 5', 'Mô tả', '0000-00-00', '2091-11-11', 1, '', 1, 'giaovien1'),
(11, 'mụn ơi', 'ơi', '2019-10-18', '2019-11-11', 1, '', 44, 'giaovien1'),
(12, 'Khảo sát 1', 'okkkk', '2019-10-18', '2019-11-11', 1, '', 4, 'giaovien1'),
(13, 'okkk', 'okkk', '2019-10-18', '2019-11-11', 1, '', 13, 'giaovien1'),
(14, 'Khảo sát 1', 'thhh', '2019-10-18', '2019-10-27', 1, '', 0, 'giaovien1');

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
(22, 1, 'đáp án 1', 1),
(22, 2, 'đáp án 2', 0),
(23, 3, 'dù sao', 0),
(23, 4, 'dù ngày sao ta vẫn muốn bên người', 1),
(25, 5, '123123', 0),
(25, 6, '23123123', 0),
(25, 7, '123123', 0),
(27, 8, '123123', 0),
(27, 9, '23123123', 0),
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
(123, 123, 'đàn', 2);

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
(25, 118, '2001');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user`
--

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL,
  `username` varchar(20) NOT NULL,
  `name` varchar(25) NOT NULL,
  `password` varchar(30) NOT NULL,
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
(9, 'vanvan1199', 'Vân Vân ', '12345', 'van@gmail.com', '1999-11-11', 0),
(10, '12345van', 'O0ovano0o ', '12345', 'van@gmail.com', '1999-11-11', 0),
(11, 'van1199', 'Vân Xinh Gái ', '12345', 'van@gmail.com', '1999-11-11', 0),
(12, 'giaovien1', 'Giáo Viên 1', 'giaovien1', 'GiaoVien@gmail.com', '1967-01-01', 1),
(13, 'hay', 'Hay', '123456', 'truong@gmail.com', '1999-01-01', 1),
(14, 'pho', 'May Con Pho ', '123456', 'tr@gmail.com', '1999-01-01', 0),
(15, 'ngu', 'Doan Xem ', '123456', 'tee@gmail.com', '1999-01-01', 0);

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
(13, 11, 25, '2019-11-03');

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
(25, 120, 1);

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
  ADD KEY `ans_id` (`ans_id`);

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
-- AUTO_INCREMENT cho bảng `ans_quest`
--
ALTER TABLE `ans_quest`
  MODIFY `ans_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `aquest`
--
ALTER TABLE `aquest`
  MODIFY `question_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `cmt_ans`
--
ALTER TABLE `cmt_ans`
  MODIFY `cmt_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `section`
--
ALTER TABLE `section`
  MODIFY `section_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `squest`
--
ALTER TABLE `squest`
  MODIFY `squest_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=124;

--
-- AUTO_INCREMENT cho bảng `survey`
--
ALTER TABLE `survey`
  MODIFY `survey_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT cho bảng `s_ans`
--
ALTER TABLE `s_ans`
  MODIFY `ans_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=124;

--
-- AUTO_INCREMENT cho bảng `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT cho bảng `user_reponse`
--
ALTER TABLE `user_reponse`
  MODIFY `reponse_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `aquest`
--
ALTER TABLE `aquest`
  ADD CONSTRAINT `aquest_ibfk_3` FOREIGN KEY (`sections_id`) REFERENCES `section` (`section_id`);

--
-- Các ràng buộc cho bảng `choice_multichoices`
--
ALTER TABLE `choice_multichoices`
  ADD CONSTRAINT `choice_multichoices_ibfk_2` FOREIGN KEY (`response_id`) REFERENCES `multichoices` (`reponse_id`),
  ADD CONSTRAINT `choice_multichoices_ibfk_3` FOREIGN KEY (`quest_id`) REFERENCES `multichoices` (`quest_id`),
  ADD CONSTRAINT `choice_multichoices_ibfk_4` FOREIGN KEY (`ans_id`) REFERENCES `s_ans` (`ans_id`);

--
-- Các ràng buộc cho bảng `cmt_ans`
--
ALTER TABLE `cmt_ans`
  ADD CONSTRAINT `cmt_ans_ibfk_1` FOREIGN KEY (`ans_id`) REFERENCES `ans_quest` (`ans_id`),
  ADD CONSTRAINT `cmt_ans_ibfk_2` FOREIGN KEY (`question_id`) REFERENCES `aquest` (`question_id`);

--
-- Các ràng buộc cho bảng `multichoices`
--
ALTER TABLE `multichoices`
  ADD CONSTRAINT `multichoices_ibfk_3` FOREIGN KEY (`quest_id`) REFERENCES `squest` (`squest_id`),
  ADD CONSTRAINT `multichoices_ibfk_4` FOREIGN KEY (`reponse_id`) REFERENCES `user_reponse` (`reponse_id`);

--
-- Các ràng buộc cho bảng `singlechoicereponse`
--
ALTER TABLE `singlechoicereponse`
  ADD CONSTRAINT `singlechoicereponse_ibfk_4` FOREIGN KEY (`choice_id`) REFERENCES `s_ans` (`ans_id`),
  ADD CONSTRAINT `singlechoicereponse_ibfk_5` FOREIGN KEY (`reponse_id`) REFERENCES `user_reponse` (`reponse_id`);

--
-- Các ràng buộc cho bảng `squest`
--
ALTER TABLE `squest`
  ADD CONSTRAINT `squest_ibfk_2` FOREIGN KEY (`quest_type_id`) REFERENCES `questiontype` (`quest_type_id`),
  ADD CONSTRAINT `squest_ibfk_3` FOREIGN KEY (`surveysq_id`) REFERENCES `survey` (`survey_id`);

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
  ADD CONSTRAINT `s_ans_ibfk_1` FOREIGN KEY (`question_id`) REFERENCES `squest` (`squest_id`);

--
-- Các ràng buộc cho bảng `textreponse`
--
ALTER TABLE `textreponse`
  ADD CONSTRAINT `textreponse_ibfk_1` FOREIGN KEY (`reponse_id`) REFERENCES `user_reponse` (`reponse_id`);

--
-- Các ràng buộc cho bảng `user_reponse`
--
ALTER TABLE `user_reponse`
  ADD CONSTRAINT `user_reponse_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`);

--
-- Các ràng buộc cho bảng `yesnoreponse`
--
ALTER TABLE `yesnoreponse`
  ADD CONSTRAINT `yesnoreponse_ibfk_1` FOREIGN KEY (`reponse_id`) REFERENCES `user_reponse` (`reponse_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
