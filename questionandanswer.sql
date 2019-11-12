-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th10 12, 2019 lúc 10:07 AM
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
(9, 3, 'test nào', 'giaovien1', '11/11/2019', 0);

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
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `ans_quest`
--
ALTER TABLE `ans_quest`
  MODIFY `ans_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `ans_quest`
--
ALTER TABLE `ans_quest`
  ADD CONSTRAINT `ans_quest_ibfk_1` FOREIGN KEY (`question_id`) REFERENCES `aquest` (`question_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
