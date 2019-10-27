-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th10 27, 2019 lúc 10:22 AM
-- Phiên bản máy phục vụ: 10.1.38-MariaDB
-- Phiên bản PHP: 7.3.2

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
  `question_id` int(11) NOT NULL,
  `ans_id` int(11) NOT NULL,
  `author` varchar(20) NOT NULL,
  `content` varchar(500) CHARACTER SET utf8 COLLATE utf8_vietnamese_ci NOT NULL,
  `ans_time` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `ans_quest`
--

INSERT INTO `ans_quest` (`question_id`, `ans_id`, `author`, `content`, `ans_time`) VALUES
(1, 2, 'hay', 'hay', '27/10/2019'),
(1, 4, 'hay', 'ko hay', '27/10/2019'),
(1, 5, 'pho', 'cha ra gi', '27/10/2019'),
(2, 6, 'hay', 'd cai l', '27/10/2019');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `ans_quest`
--
ALTER TABLE `ans_quest`
  ADD PRIMARY KEY (`ans_id`) USING BTREE;

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `ans_quest`
--
ALTER TABLE `ans_quest`
  MODIFY `ans_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `ans_quest`
--
ALTER TABLE `ans_quest`
  ADD CONSTRAINT `ans_quest_ibfk_2` FOREIGN KEY (`question_id`) REFERENCES `aquest` (`question_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
