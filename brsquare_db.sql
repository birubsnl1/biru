-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 01, 2026 at 06:32 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `brsquare_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `username`, `email`, `password`, `created_at`) VALUES
(1, 'CEO BR SQUARE', 'ceobrsquare@gmail.com', '$2y$10$LXYqTePqRi3seWIj2qoSKeIIb3Mny4KpXnp4h55L/HEDXFUnsGogK', '2026-04-01 11:13:53');

-- --------------------------------------------------------

--
-- Table structure for table `classes`
--

CREATE TABLE `classes` (
  `id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `live_link` text DEFAULT NULL,
  `batch_target` enum('Online','Offline','Both') DEFAULT NULL,
  `stream_target` enum('Science','Arts','Both') DEFAULT NULL,
  `class_date` datetime DEFAULT NULL,
  `status` enum('Live','Upcoming','Ended') DEFAULT 'Upcoming'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `classes`
--

INSERT INTO `classes` (`id`, `title`, `live_link`, `batch_target`, `stream_target`, `class_date`, `status`) VALUES
(1, 'झारखंड शिक्षक पात्रता परीक्षा (JHTET)', 'https://www.youtube.com/@brsquare1402', 'Both', 'Both', NULL, 'Live');

-- --------------------------------------------------------

--
-- Table structure for table `ebooks`
--

CREATE TABLE `ebooks` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `subject_id` int(11) DEFAULT NULL,
  `category` enum('Syllabus','Subject-Wise','Notes','Other') DEFAULT NULL,
  `file_name` varchar(255) DEFAULT NULL,
  `uploaded_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ebooks`
--

INSERT INTO `ebooks` (`id`, `title`, `subject_id`, `category`, `file_name`, `uploaded_at`) VALUES
(1, 'Syllabus-2026', NULL, 'Syllabus', '1775050342_2026_JHTET_SYLLABUS.pdf', '2026-04-01 13:32:22');

-- --------------------------------------------------------

--
-- Table structure for table `exams`
--

CREATE TABLE `exams` (
  `id` int(11) NOT NULL,
  `exam_title` varchar(255) NOT NULL,
  `duration` int(11) DEFAULT 150,
  `total_marks` int(11) DEFAULT 150,
  `passing_marks` int(11) DEFAULT 90,
  `status` enum('active','inactive') DEFAULT 'inactive',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `exams`
--

INSERT INTO `exams` (`id`, `exam_title`, `duration`, `total_marks`, `passing_marks`, `status`, `created_at`) VALUES
(3, 'JHTET 2026 Mock Test 01', 150, 150, 90, 'active', '2026-04-01 14:00:27');

-- --------------------------------------------------------

--
-- Table structure for table `exam_attempts`
--

CREATE TABLE `exam_attempts` (
  `id` int(11) NOT NULL,
  `student_id` int(11) DEFAULT NULL,
  `exam_id` int(11) DEFAULT NULL,
  `attempt_number` int(11) DEFAULT 1,
  `obtained_marks` int(11) DEFAULT NULL,
  `total_questions` int(11) DEFAULT NULL,
  `correct_answers` int(11) DEFAULT NULL,
  `wrong_answers` int(11) DEFAULT NULL,
  `status` enum('Pass','Fail') DEFAULT NULL,
  `submitted_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `exam_attempts`
--

INSERT INTO `exam_attempts` (`id`, `student_id`, `exam_id`, `attempt_number`, `obtained_marks`, `total_questions`, `correct_answers`, `wrong_answers`, `status`, `submitted_at`) VALUES
(2, 1, 3, 1, 4, 212, 4, 208, 'Fail', '2026-04-01 15:24:57');

-- --------------------------------------------------------

--
-- Table structure for table `fee_ledgers`
--

CREATE TABLE `fee_ledgers` (
  `id` int(11) NOT NULL,
  `student_id` int(11) DEFAULT NULL,
  `total_fee` decimal(10,2) DEFAULT NULL,
  `paid_amount` decimal(10,2) DEFAULT NULL,
  `due_amount` decimal(10,2) DEFAULT NULL,
  `payment_mode` enum('Online','Cash','UPI') DEFAULT NULL,
  `transaction_id` varchar(100) DEFAULT NULL,
  `receipt_no` varchar(50) DEFAULT NULL,
  `status` enum('Paid','Partial','Unpaid') DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `fee_ledgers`
--

INSERT INTO `fee_ledgers` (`id`, `student_id`, `total_fee`, `paid_amount`, `due_amount`, `payment_mode`, `transaction_id`, `receipt_no`, `status`, `updated_at`) VALUES
(1, 1, 600.00, 200.00, 400.00, NULL, NULL, 'BR1775042744', 'Partial', '2026-04-01 11:25:44');

-- --------------------------------------------------------

--
-- Table structure for table `questions`
--

CREATE TABLE `questions` (
  `id` int(11) NOT NULL,
  `exam_id` int(11) DEFAULT NULL,
  `section_type` enum('CDP','Language-I','Language-II','Math-Science','Social-Science','Computer') DEFAULT NULL,
  `topic` varchar(255) DEFAULT NULL,
  `difficulty` enum('Easy','Medium','Hard') DEFAULT 'Easy',
  `question_en` text DEFAULT NULL,
  `question_hi` text DEFAULT NULL,
  `opt_a_en` text DEFAULT NULL,
  `opt_a_hi` varchar(255) DEFAULT NULL,
  `opt_b_en` text DEFAULT NULL,
  `opt_b_hi` varchar(255) DEFAULT NULL,
  `opt_c_en` text DEFAULT NULL,
  `opt_c_hi` varchar(255) DEFAULT NULL,
  `opt_d_en` text DEFAULT NULL,
  `opt_d_hi` varchar(255) DEFAULT NULL,
  `correct_option` enum('A','B','C','D') DEFAULT NULL,
  `marks` int(11) DEFAULT 1,
  `explanation_en` text DEFAULT NULL,
  `explanation_hi` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `questions`
--

INSERT INTO `questions` (`id`, `exam_id`, `section_type`, `topic`, `difficulty`, `question_en`, `question_hi`, `opt_a_en`, `opt_a_hi`, `opt_b_en`, `opt_b_hi`, `opt_c_en`, `opt_c_hi`, `opt_d_en`, `opt_d_hi`, `correct_option`, `marks`, `explanation_en`, `explanation_hi`) VALUES
(1, 3, 'Math-Science', 'Number System', 'Easy', 'The smallest natural number is:', 'सबसे छोटी प्राकृतिक संख्या है:', '0', '0', '1', '1', '2', '2', '10', '10', 'B', 1, 'In school mathematics, natural numbers usually start from 1.', 'स्कूली गणित में प्राकृतिक संख्याएँ सामान्यतः 1 से शुरू होती हैं।'),
(2, 3, 'Math-Science', 'Number System', 'Easy', 'Which of the following is an integer?', 'निम्नलिखित में से कौन पूर्णांक है?', '3/4', '3/4', '√2', '√2', '-7', '-7', '2.5', '2.5', 'C', 1, '-7 is a whole number with sign, so it is an integer.', '-7 चिन्ह सहित पूर्ण संख्या है, इसलिए यह पूर्णांक है।'),
(3, 3, 'Math-Science', 'Number System', 'Easy', 'HCF of 12 and 18 is:', '12 और 18 का HCF है:', '2', '2', '3', '3', '6', '6', '9', '9', 'C', 1, 'Common factors are 1,2,3,6; highest is 6.', 'सामान्य गुणनखंड 1,2,3,6 हैं; सबसे बड़ा 6 है।'),
(4, 3, 'Math-Science', 'Number System', 'Easy', 'LCM of 4 and 6 is:', '4 और 6 का LCM है:', '6', '6', '8', '8', '12', '12', '24', '24', 'C', 1, 'The smallest common multiple of 4 and 6 is 12.', '4 और 6 का लघुत्तम समापवर्त्य 12 है।'),
(5, 3, 'Math-Science', 'Fractions', 'Easy', 'Which fraction is the largest?', 'कौन-सा भिन्न सबसे बड़ा है?', '1/2', '1/2', '2/3', '2/3', '3/5', '3/5', '4/9', '4/9', 'B', 1, '2/3 is about 0.667, greater than others.', '2/3 लगभग 0.667 है, जो अन्य से बड़ा है।'),
(6, 3, 'Math-Science', 'Fractions', 'Easy', 'Equivalent fraction of 1/2 is:', '1/2 के समतुल्य भिन्न है:', '2/3', '2/3', '2/4', '2/4', '3/8', '3/8', '4/10', '4/10', 'B', 1, 'Multiplying numerator and denominator by 2 gives 2/4.', 'अंश और हर को 2 से गुणा करने पर 2/4 मिलता है।'),
(7, 3, 'Math-Science', 'Integers', 'Easy', '(-5) + 3 =', '(-5) + 3 =', '-8', '-8', '-2', '-2', '2', '2', '8', '8', 'B', 1, 'Adding 3 to -5 gives -2.', '-5 में 3 जोड़ने पर -2 मिलता है।'),
(8, 3, 'Math-Science', 'Integers', 'Easy', '7 - 12 =', '7 - 12 =', '5', '5', '-5', '-5', '-19', '-19', '19', '19', 'B', 1, 'Subtracting 12 from 7 gives -5.', '7 में से 12 घटाने पर -5 मिलता है।'),
(9, 3, 'Math-Science', 'Exponents', 'Easy', '2³ =', '2³ =', '6', '6', '8', '8', '9', '9', '12', '12', 'B', 1, '2×2×2 = 8.', '2×2×2 = 8।'),
(10, 3, 'Math-Science', 'Squares & Roots', 'Easy', 'Square root of 81 is:', '81 का वर्गमूल है:', '7', '7', '8', '8', '9', '9', '10', '10', 'C', 1, '9×9 = 81.', '9×9 = 81।'),
(11, 3, 'Math-Science', 'Cubes & Cube Roots', 'Easy', 'Cube of 4 is:', '4 का घन है:', '8', '8', '12', '12', '16', '16', '64', '64', 'D', 1, '4×4×4 = 64.', '4×4×4 = 64।'),
(12, 3, 'Math-Science', 'Cubes & Cube Roots', 'Easy', 'Cube root of 27 is:', '27 का घनमूल है:', '2', '2', '3', '3', '6', '6', '9', '9', 'B', 1, '3×3×3 = 27.', '3×3×3 = 27।'),
(13, 3, 'Math-Science', 'Ratio & Proportion', 'Easy', 'Simplify the ratio 8:12', 'अनुपात 8:12 को सरल कीजिए', '1:2', '1:2', '2:3', '2:3', '3:2', '3:2', '4:5', '4:5', 'B', 1, 'Divide both terms by 4.', 'दोनों पदों को 4 से भाग दें।'),
(14, 3, 'Math-Science', 'Ratio & Proportion', 'Easy', 'If 2 pens cost ₹10, cost of 1 pen is:', 'यदि 2 पेन की कीमत ₹10 है, तो 1 पेन की कीमत है:', '₹2', '₹2', '₹3', '₹3', '₹5', '₹5', '₹10', '₹10', 'C', 1, '10 ÷ 2 = 5.', '10 ÷ 2 = 5।'),
(15, 3, 'Math-Science', 'Percentage', 'Easy', '25% of 200 is:', '200 का 25% है:', '25', '25', '40', '40', '50', '50', '75', '75', 'C', 1, '25/100 × 200 = 50.', '25/100 × 200 = 50।'),
(16, 3, 'Math-Science', 'Percentage', 'Easy', '100% of a number means:', 'किसी संख्या का 100% का अर्थ है:', 'Half the number', 'Half the number', 'Double the number', 'Double the number', 'The whole number', 'The whole number', 'Zero', 'Zero', 'C', 1, '100% means complete or whole.', '100% का अर्थ पूरा या सम्पूर्ण होता है।'),
(17, 3, 'Math-Science', 'Profit & Loss', 'Easy', 'If CP = ₹100 and SP = ₹120, profit is:', 'यदि क्रय मूल्य ₹100 और विक्रय मूल्य ₹120 है, तो लाभ है:', '₹10', '₹10', '₹20', '₹20', '₹25', '₹25', '₹30', '₹30', 'B', 1, 'Profit = SP - CP = 20.', 'लाभ = विक्रय मूल्य - क्रय मूल्य = 20।'),
(18, 3, 'Math-Science', 'Profit & Loss', 'Easy', 'A shirt bought for ₹500 is sold for ₹450. There is:', '₹500 में खरीदी गई शर्ट ₹450 में बेची गई। इसमें है:', 'Profit of ₹50', 'Profit of ₹50', 'Loss of ₹50', 'Loss of ₹50', 'Profit of ₹450', 'Profit of ₹450', 'No loss', 'No loss', 'B', 1, 'Loss = 500 - 450 = 50.', 'हानि = 500 - 450 = 50।'),
(19, 3, 'Math-Science', 'Simple Interest', 'Easy', 'Simple interest on ₹1000 at 10% for 1 year is:', '₹1000 पर 10% की दर से 1 वर्ष का साधारण ब्याज है:', '₹10', '₹10', '₹50', '₹50', '₹100', '₹100', '₹110', '₹110', 'C', 1, 'SI = PRT/100 = 100.', 'SI = PRT/100 = 100।'),
(20, 3, 'Math-Science', 'Time & Distance', 'Easy', 'If a car travels 60 km in 2 hours, its speed is:', 'यदि एक कार 2 घंटे में 60 किमी चलती है, तो उसकी चाल है:', '20 km/h', '20 km/h', '30 km/h', '30 km/h', '40 km/h', '40 km/h', '60 km/h', '60 km/h', 'B', 1, 'Speed = distance/time = 60/2 = 30 km/h.', 'चाल = दूरी/समय = 60/2 = 30 किमी/घंटा।'),
(21, 3, 'Math-Science', 'Time & Work', 'Easy', 'If one worker finishes a job in 10 days, work done in 1 day is:', 'यदि एक मजदूर 10 दिन में काम पूरा करता है, तो 1 दिन में किया गया काम है:', '1/5', '1/5', '1/10', '1/10', '10', '10', '100', '100', 'B', 1, 'One-day work is reciprocal of total days.', 'एक दिन का काम कुल दिनों का व्युत्क्रम होता है।'),
(22, 3, 'Math-Science', 'Algebra', 'Easy', 'x + 5 = 12, then x =', 'यदि x + 5 = 12, तो x =', '5', '5', '6', '6', '7', '7', '17', '17', 'C', 1, 'x = 12 - 5 = 7.', 'x = 12 - 5 = 7।'),
(23, 3, 'Math-Science', 'Algebra', 'Easy', 'Value of 2a when a = 4 is:', 'जब a = 4, तब 2a का मान है:', '4', '4', '6', '6', '8', '8', '12', '12', 'C', 1, '2×4 = 8.', '2×4 = 8।'),
(24, 3, 'Math-Science', 'Algebraic Expressions', 'Easy', 'Like terms are:', 'समान पद हैं:', '2x and 2y', '2x and 2y', '3a and 5a', '3a and 5a', '4b and 4', '4b and 4', 'm and n', 'm and n', 'B', 1, 'Like terms have same variable and same power.', 'समान पदों में चर और उसकी घात समान होती है।'),
(25, 3, 'Math-Science', 'Geometry', 'Easy', 'A triangle has ____ sides.', 'त्रिभुज की ____ भुजाएँ होती हैं।', '2', '2', '3', '3', '4', '4', '5', '5', 'B', 1, 'A triangle has 3 sides.', 'त्रिभुज की 3 भुजाएँ होती हैं।'),
(26, 3, 'Math-Science', 'Geometry', 'Easy', 'Sum of angles of a triangle is:', 'त्रिभुज के कोणों का योग है:', '90°', '90°', '180°', '180°', '270°', '270°', '360°', '360°', 'B', 1, 'Interior angles of a triangle add to 180°.', 'त्रिभुज के आंतरिक कोणों का योग 180° होता है।'),
(27, 3, 'Math-Science', 'Geometry', 'Easy', 'A right angle measures:', 'समकोण का मान होता है:', '45°', '45°', '60°', '60°', '90°', '90°', '180°', '180°', 'C', 1, 'A right angle is exactly 90°.', 'समकोण ठीक 90° का होता है।'),
(28, 3, 'Math-Science', 'Geometry', 'Easy', 'A circle has ____ sides.', 'वृत्त की ____ भुजाएँ होती हैं।', '0', '0', '1', '1', '2', '2', 'Infinite', 'Infinite', 'A', 1, 'In elementary geometry, a circle has no straight side.', 'प्राथमिक ज्यामिति में वृत्त की कोई सीधी भुजा नहीं होती।'),
(29, 3, 'Math-Science', 'Symmetry', 'Easy', 'A square has ____ lines of symmetry.', 'वर्ग की ____ सममिति रेखाएँ होती हैं।', '2', '2', '3', '3', '4', '4', '5', '5', 'C', 1, 'A square has 4 symmetry lines.', 'वर्ग में 4 सममिति रेखाएँ होती हैं।'),
(30, 3, 'Math-Science', '2D & 3D Shapes', 'Easy', 'A cube is a ____ shape.', 'घन एक ____ आकृति है।', '2D', '2D', '3D', '3D', 'line', 'line', 'angle', 'angle', 'B', 1, 'A cube has length, breadth and height.', 'घन में लंबाई, चौड़ाई और ऊँचाई होती है।'),
(31, 3, 'Math-Science', 'Mensuration', 'Easy', 'Area of a rectangle is:', 'आयत का क्षेत्रफल है:', 'l + b', 'l + b', '2(l+b)', '2(l+b)', 'l × b', 'l × b', 'l ÷ b', 'l ÷ b', 'C', 1, 'Area = length × breadth.', 'क्षेत्रफल = लंबाई × चौड़ाई।'),
(32, 3, 'Math-Science', 'Mensuration', 'Easy', 'Perimeter of a square of side a is:', 'भुजा a वाले वर्ग का परिमाप है:', 'a²', 'a²', '2a', '2a', '3a', '3a', '4a', '4a', 'D', 1, 'Perimeter is sum of 4 equal sides.', 'परिमाप 4 समान भुजाओं का योग है।'),
(33, 3, 'Math-Science', 'Mensuration', 'Easy', 'Area of a square of side 5 cm is:', '5 सेमी भुजा वाले वर्ग का क्षेत्रफल है:', '10 cm²', '10 cm²', '20 cm²', '20 cm²', '25 cm²', '25 cm²', '30 cm²', '30 cm²', 'C', 1, 'Area = side² = 25 cm².', 'क्षेत्रफल = भुजा² = 25 सेमी²।'),
(34, 3, 'Math-Science', 'Mensuration', 'Easy', 'Volume of a cube of side 3 cm is:', '3 सेमी भुजा वाले घन का आयतन है:', '9 cm³', '9 cm³', '18 cm³', '18 cm³', '27 cm³', '27 cm³', '36 cm³', '36 cm³', 'C', 1, 'Volume = side³ = 27 cm³.', 'आयतन = भुजा³ = 27 सेमी³।'),
(35, 3, 'Math-Science', 'Data Handling', 'Easy', 'Collecting information is called:', 'जानकारी एकत्र करने को कहते हैं:', 'classification', 'classification', 'data collection', 'data collection', 'measurement', 'measurement', 'estimation', 'estimation', 'B', 1, 'Gathering facts is data collection.', 'तथ्य एकत्र करना डेटा संग्रह कहलाता है।'),
(36, 3, 'Math-Science', 'Data Handling', 'Easy', 'A bar graph uses:', 'दण्ड आरेख में उपयोग होता है:', 'circles', 'circles', 'bars', 'bars', 'triangles', 'triangles', 'cubes', 'cubes', 'B', 1, 'Bar graphs use rectangular bars.', 'दण्ड आरेख में आयताकार पट्टियाँ होती हैं।'),
(37, 3, 'Math-Science', 'Graphs', 'Easy', 'A pie chart shows:', 'पाई चार्ट क्या दिखाता है?', 'Parts of a whole', 'Parts of a whole', 'Length only', 'Length only', 'Time only', 'Time only', 'Volume only', 'Volume only', 'A', 1, 'Pie chart represents proportion of parts in a whole.', 'पाई चार्ट सम्पूर्ण में भागों का अनुपात दिखाता है।'),
(38, 3, 'Math-Science', 'Number System', 'Easy', 'Which number is prime?', 'कौन-सी संख्या अभाज्य है?', '4', '4', '6', '6', '9', '9', '11', '11', 'D', 1, '11 has exactly two factors: 1 and 11.', '11 के केवल दो गुणनखंड हैं: 1 और 11।'),
(39, 3, 'Math-Science', 'Number System', 'Easy', 'Which of the following is a whole number?', 'निम्नलिखित में से कौन-सी पूर्ण संख्या है?', '-1', '-1', '0', '0', '1/2', '1/2', '√3', '√3', 'B', 1, 'Whole numbers include 0,1,2,...', 'पूर्ण संख्याओं में 0,1,2,... शामिल हैं।'),
(40, 3, 'Math-Science', 'Fractions', 'Easy', '1/4 + 1/4 =', '1/4 + 1/4 =', '1/2', '1/2', '1/4', '1/4', '2/8', '2/8', '3/4', '3/4', 'A', 1, 'Same denominators: add numerators.', 'हर समान होने पर अंश जोड़ते हैं।'),
(41, 3, 'Math-Science', 'Integers', 'Easy', '(-3) × (-2) =', '(-3) × (-2) =', '-6', '-6', '0', '0', '6', '6', '5', '5', 'C', 1, 'Product of two negatives is positive.', 'दो ऋणात्मक संख्याओं का गुणनफल धनात्मक होता है।'),
(42, 3, 'Math-Science', 'Exponents', 'Easy', '10² =', '10² =', '20', '20', '100', '100', '1000', '1000', '10', '10', 'B', 1, '10×10 = 100.', '10×10 = 100।'),
(43, 3, 'Math-Science', 'Percentage', 'Easy', '50% of 80 is:', '80 का 50% है:', '20', '20', '30', '30', '40', '40', '50', '50', 'C', 1, 'Half of 80 is 40.', '80 का आधा 40 है।'),
(44, 3, 'Math-Science', 'Profit & Loss', 'Easy', 'Loss =', 'हानि =', 'CP - SP', 'CP - SP', 'SP - CP', 'SP - CP', 'CP + SP', 'CP + SP', 'SP ÷ CP', 'SP ÷ CP', 'A', 1, 'Loss occurs when CP > SP.', 'जब क्रय मूल्य विक्रय मूल्य से अधिक हो तो हानि होती है।'),
(45, 3, 'Math-Science', 'Geometry', 'Easy', 'How many vertices does a rectangle have?', 'आयत के कितने शीर्ष होते हैं?', '2', '2', '3', '3', '4', '4', '5', '5', 'C', 1, 'A rectangle has 4 corners.', 'आयत के 4 कोने होते हैं।'),
(46, 3, 'Math-Science', 'Symmetry', 'Easy', 'A regular triangle has ____ lines of symmetry.', 'समभुज त्रिभुज में ____ सममिति रेखाएँ होती हैं।', '1', '1', '2', '2', '3', '3', '4', '4', 'C', 1, 'An equilateral triangle has 3 lines of symmetry.', 'समभुज त्रिभुज में 3 सममिति रेखाएँ होती हैं।'),
(47, 3, 'Math-Science', '2D & 3D Shapes', 'Easy', 'A sphere is like a:', 'गोला किसके समान होता है?', 'box', 'box', 'ball', 'ball', 'book', 'book', 'plate', 'plate', 'B', 1, 'A sphere resembles a ball.', 'गोला गेंद जैसा होता है।'),
(48, 3, 'Math-Science', 'Mensuration', 'Easy', 'Perimeter of a rectangle =', 'आयत का परिमाप =', 'l+b', 'l+b', '2l+b', '2l+b', '2(l+b)', '2(l+b)', 'l×b', 'l×b', 'C', 1, 'Perimeter is twice the sum of length and breadth.', 'परिमाप = 2(लंबाई + चौड़ाई)।'),
(49, 3, 'Math-Science', 'Data Handling', 'Easy', 'Data arranged in order is called:', 'क्रम में व्यवस्थित आँकड़े कहलाते हैं:', 'raw data', 'raw data', 'ordered data', 'ordered data', 'noise', 'noise', 'guess', 'guess', 'B', 1, 'When data is arranged, it becomes ordered data.', 'जब आँकड़ों को क्रम में सजाया जाता है तो वे व्यवस्थित आँकड़े कहलाते हैं।'),
(50, 3, 'Math-Science', 'Graphs', 'Easy', 'Which graph is best for comparing categories?', 'श्रेणियों की तुलना के लिए कौन-सा ग्राफ सर्वोत्तम है?', 'Pie chart', 'Pie chart', 'Bar graph', 'Bar graph', 'Line segment', 'Line segment', 'Cube', 'Cube', 'B', 1, 'Bar graph compares sizes of categories clearly.', 'दण्ड आरेख श्रेणियों की तुलना स्पष्ट रूप से करता है।'),
(51, 3, 'Math-Science', 'Tables & Multiplication', 'Easy', 'What is 6 × 3?', '6 × 3 कितना है?', '12', '12', '18', '18', '24', '24', '9', '9', 'B', 1, '6 multiplied by 3 equals 18.', '6 को 3 से गुणा करने पर 18 मिलता है।'),
(52, 3, 'Math-Science', 'Tables & Multiplication', 'Easy', 'What is 7 × 3?', '7 × 3 कितना है?', '14', '14', '21', '21', '28', '28', '10', '10', 'B', 1, '7 multiplied by 3 equals 21.', '7 को 3 से गुणा करने पर 21 मिलता है।'),
(53, 3, 'Math-Science', 'Tables & Multiplication', 'Easy', 'What is 8 × 3?', '8 × 3 कितना है?', '16', '16', '24', '24', '32', '32', '11', '11', 'B', 1, '8 multiplied by 3 equals 24.', '8 को 3 से गुणा करने पर 24 मिलता है।'),
(54, 3, 'Math-Science', 'Tables & Multiplication', 'Easy', 'What is 9 × 3?', '9 × 3 कितना है?', '18', '18', '27', '27', '36', '36', '12', '12', 'B', 1, '9 multiplied by 3 equals 27.', '9 को 3 से गुणा करने पर 27 मिलता है।'),
(55, 3, 'Math-Science', 'Tables & Multiplication', 'Easy', 'What is 10 × 3?', '10 × 3 कितना है?', '20', '20', '30', '30', '40', '40', '13', '13', 'B', 1, '10 multiplied by 3 equals 30.', '10 को 3 से गुणा करने पर 30 मिलता है।'),
(56, 3, 'Math-Science', 'Tables & Multiplication', 'Easy', 'What is 11 × 3?', '11 × 3 कितना है?', '22', '22', '33', '33', '44', '44', '14', '14', 'B', 1, '11 multiplied by 3 equals 33.', '11 को 3 से गुणा करने पर 33 मिलता है।'),
(57, 3, 'Math-Science', 'Tables & Multiplication', 'Easy', 'What is 12 × 3?', '12 × 3 कितना है?', '24', '24', '36', '36', '48', '48', '15', '15', 'B', 1, '12 multiplied by 3 equals 36.', '12 को 3 से गुणा करने पर 36 मिलता है।'),
(58, 3, 'Math-Science', 'Tables & Multiplication', 'Easy', 'What is 13 × 3?', '13 × 3 कितना है?', '26', '26', '39', '39', '52', '52', '16', '16', 'B', 1, '13 multiplied by 3 equals 39.', '13 को 3 से गुणा करने पर 39 मिलता है।'),
(59, 3, 'Math-Science', 'Tables & Multiplication', 'Easy', 'What is 14 × 3?', '14 × 3 कितना है?', '28', '28', '42', '42', '56', '56', '17', '17', 'B', 1, '14 multiplied by 3 equals 42.', '14 को 3 से गुणा करने पर 42 मिलता है।'),
(60, 3, 'Math-Science', 'Tables & Multiplication', 'Easy', 'What is 15 × 3?', '15 × 3 कितना है?', '30', '30', '45', '45', '60', '60', '18', '18', 'B', 1, '15 multiplied by 3 equals 45.', '15 को 3 से गुणा करने पर 45 मिलता है।'),
(61, 3, 'Math-Science', 'Division', 'Easy', 'What is 44 ÷ 4?', '44 ÷ 4 कितना है?', '10', '10', '11', '11', '12', '12', '13', '13', 'B', 1, '44 divided by 4 equals 11.', '44 को 4 से भाग देने पर 11 मिलता है।'),
(62, 3, 'Math-Science', 'Division', 'Easy', 'What is 48 ÷ 4?', '48 ÷ 4 कितना है?', '11', '11', '12', '12', '13', '13', '14', '14', 'B', 1, '48 divided by 4 equals 12.', '48 को 4 से भाग देने पर 12 मिलता है।'),
(63, 3, 'Math-Science', 'Division', 'Easy', 'What is 52 ÷ 4?', '52 ÷ 4 कितना है?', '12', '12', '13', '13', '14', '14', '15', '15', 'B', 1, '52 divided by 4 equals 13.', '52 को 4 से भाग देने पर 13 मिलता है।'),
(64, 3, 'Math-Science', 'Division', 'Easy', 'What is 56 ÷ 4?', '56 ÷ 4 कितना है?', '13', '13', '14', '14', '15', '15', '16', '16', 'B', 1, '56 divided by 4 equals 14.', '56 को 4 से भाग देने पर 14 मिलता है।'),
(65, 3, 'Math-Science', 'Division', 'Easy', 'What is 60 ÷ 4?', '60 ÷ 4 कितना है?', '14', '14', '15', '15', '16', '16', '17', '17', 'B', 1, '60 divided by 4 equals 15.', '60 को 4 से भाग देने पर 15 मिलता है।'),
(66, 3, 'Math-Science', 'Division', 'Easy', 'What is 64 ÷ 4?', '64 ÷ 4 कितना है?', '15', '15', '16', '16', '17', '17', '18', '18', 'B', 1, '64 divided by 4 equals 16.', '64 को 4 से भाग देने पर 16 मिलता है।'),
(67, 3, 'Math-Science', 'Division', 'Easy', 'What is 68 ÷ 4?', '68 ÷ 4 कितना है?', '16', '16', '17', '17', '18', '18', '19', '19', 'B', 1, '68 divided by 4 equals 17.', '68 को 4 से भाग देने पर 17 मिलता है।'),
(68, 3, 'Math-Science', 'Division', 'Easy', 'What is 72 ÷ 4?', '72 ÷ 4 कितना है?', '17', '17', '18', '18', '19', '19', '20', '20', 'B', 1, '72 divided by 4 equals 18.', '72 को 4 से भाग देने पर 18 मिलता है।'),
(69, 3, 'Math-Science', 'Division', 'Easy', 'What is 76 ÷ 4?', '76 ÷ 4 कितना है?', '18', '18', '19', '19', '20', '20', '21', '21', 'B', 1, '76 divided by 4 equals 19.', '76 को 4 से भाग देने पर 19 मिलता है।'),
(70, 3, 'Math-Science', 'Division', 'Easy', 'What is 80 ÷ 4?', '80 ÷ 4 कितना है?', '19', '19', '20', '20', '21', '21', '22', '22', 'B', 1, '80 divided by 4 equals 20.', '80 को 4 से भाग देने पर 20 मिलता है।'),
(71, 3, 'Math-Science', 'Algebra', 'Easy', 'If x = 1, what is x + 1?', 'यदि x = 1, तो x + 1 कितना होगा?', '1', '1', '2', '2', '2', '2', '3', '3', 'B', 1, 'Substitute x=1; result is 2.', 'x=1 रखने पर मान 2 होगा।'),
(72, 3, 'Math-Science', 'Algebra', 'Easy', 'If x = 2, what is x + 2?', 'यदि x = 2, तो x + 2 कितना होगा?', '2', '2', '4', '4', '3', '3', '6', '6', 'B', 1, 'Substitute x=2; result is 4.', 'x=2 रखने पर मान 4 होगा।'),
(73, 3, 'Math-Science', 'Algebra', 'Easy', 'If x = 3, what is x + 3?', 'यदि x = 3, तो x + 3 कितना होगा?', '3', '3', '6', '6', '4', '4', '9', '9', 'B', 1, 'Substitute x=3; result is 6.', 'x=3 रखने पर मान 6 होगा।'),
(74, 3, 'Math-Science', 'Algebra', 'Easy', 'If x = 4, what is x + 4?', 'यदि x = 4, तो x + 4 कितना होगा?', '4', '4', '8', '8', '5', '5', '12', '12', 'B', 1, 'Substitute x=4; result is 8.', 'x=4 रखने पर मान 8 होगा।'),
(75, 3, 'Math-Science', 'Algebra', 'Easy', 'If x = 5, what is x + 5?', 'यदि x = 5, तो x + 5 कितना होगा?', '5', '5', '10', '10', '6', '6', '15', '15', 'B', 1, 'Substitute x=5; result is 10.', 'x=5 रखने पर मान 10 होगा।'),
(76, 3, 'Math-Science', 'Algebra', 'Easy', 'If x = 6, what is x + 6?', 'यदि x = 6, तो x + 6 कितना होगा?', '6', '6', '12', '12', '7', '7', '18', '18', 'B', 1, 'Substitute x=6; result is 12.', 'x=6 रखने पर मान 12 होगा।'),
(77, 3, 'Math-Science', 'Algebra', 'Easy', 'If x = 7, what is x + 7?', 'यदि x = 7, तो x + 7 कितना होगा?', '7', '7', '14', '14', '8', '8', '21', '21', 'B', 1, 'Substitute x=7; result is 14.', 'x=7 रखने पर मान 14 होगा।'),
(78, 3, 'Math-Science', 'Algebra', 'Easy', 'If x = 8, what is x + 8?', 'यदि x = 8, तो x + 8 कितना होगा?', '8', '8', '16', '16', '9', '9', '24', '24', 'B', 1, 'Substitute x=8; result is 16.', 'x=8 रखने पर मान 16 होगा।'),
(79, 3, 'Math-Science', 'Algebra', 'Easy', 'If x = 9, what is x + 9?', 'यदि x = 9, तो x + 9 कितना होगा?', '9', '9', '18', '18', '10', '10', '27', '27', 'B', 1, 'Substitute x=9; result is 18.', 'x=9 रखने पर मान 18 होगा।'),
(80, 3, 'Math-Science', 'Algebra', 'Easy', 'If x = 10, what is x + 10?', 'यदि x = 10, तो x + 10 कितना होगा?', '10', '10', '20', '20', '11', '11', '30', '30', 'B', 1, 'Substitute x=10; result is 20.', 'x=10 रखने पर मान 20 होगा।'),
(81, 3, 'Math-Science', 'Mensuration', 'Easy', 'Area of a square of side 2 cm is:', 'भुजा 2 सेमी वाले वर्ग का क्षेत्रफल है:', '4 cm²', '4 cm²', '4 cm²', '4 cm²', '8 cm²', '8 cm²', '4 cm²', '4 cm²', 'B', 1, 'Area = side × side = 4 cm².', 'क्षेत्रफल = भुजा × भुजा = 4 सेमी²।'),
(82, 3, 'Math-Science', 'Mensuration', 'Easy', 'Area of a square of side 3 cm is:', 'भुजा 3 सेमी वाले वर्ग का क्षेत्रफल है:', '6 cm²', '6 cm²', '9 cm²', '9 cm²', '27 cm²', '27 cm²', '5 cm²', '5 cm²', 'B', 1, 'Area = side × side = 9 cm².', 'क्षेत्रफल = भुजा × भुजा = 9 सेमी²।'),
(83, 3, 'Math-Science', 'Mensuration', 'Easy', 'Area of a square of side 4 cm is:', 'भुजा 4 सेमी वाले वर्ग का क्षेत्रफल है:', '8 cm²', '8 cm²', '16 cm²', '16 cm²', '64 cm²', '64 cm²', '6 cm²', '6 cm²', 'B', 1, 'Area = side × side = 16 cm².', 'क्षेत्रफल = भुजा × भुजा = 16 सेमी²।'),
(84, 3, 'Math-Science', 'Mensuration', 'Easy', 'Area of a square of side 5 cm is:', 'भुजा 5 सेमी वाले वर्ग का क्षेत्रफल है:', '10 cm²', '10 cm²', '25 cm²', '25 cm²', '125 cm²', '125 cm²', '7 cm²', '7 cm²', 'B', 1, 'Area = side × side = 25 cm².', 'क्षेत्रफल = भुजा × भुजा = 25 सेमी²।'),
(85, 3, 'Math-Science', 'Mensuration', 'Easy', 'Area of a square of side 6 cm is:', 'भुजा 6 सेमी वाले वर्ग का क्षेत्रफल है:', '12 cm²', '12 cm²', '36 cm²', '36 cm²', '216 cm²', '216 cm²', '8 cm²', '8 cm²', 'B', 1, 'Area = side × side = 36 cm².', 'क्षेत्रफल = भुजा × भुजा = 36 सेमी²।'),
(86, 3, 'Math-Science', 'Mensuration', 'Easy', 'Area of a square of side 7 cm is:', 'भुजा 7 सेमी वाले वर्ग का क्षेत्रफल है:', '14 cm²', '14 cm²', '49 cm²', '49 cm²', '343 cm²', '343 cm²', '9 cm²', '9 cm²', 'B', 1, 'Area = side × side = 49 cm².', 'क्षेत्रफल = भुजा × भुजा = 49 सेमी²।'),
(87, 3, 'Math-Science', 'Mensuration', 'Easy', 'Area of a square of side 8 cm is:', 'भुजा 8 सेमी वाले वर्ग का क्षेत्रफल है:', '16 cm²', '16 cm²', '64 cm²', '64 cm²', '512 cm²', '512 cm²', '10 cm²', '10 cm²', 'B', 1, 'Area = side × side = 64 cm².', 'क्षेत्रफल = भुजा × भुजा = 64 सेमी²।'),
(88, 3, 'Math-Science', 'Mensuration', 'Easy', 'Area of a square of side 9 cm is:', 'भुजा 9 सेमी वाले वर्ग का क्षेत्रफल है:', '18 cm²', '18 cm²', '81 cm²', '81 cm²', '729 cm²', '729 cm²', '11 cm²', '11 cm²', 'B', 1, 'Area = side × side = 81 cm².', 'क्षेत्रफल = भुजा × भुजा = 81 सेमी²।'),
(89, 3, 'Math-Science', 'Mensuration', 'Easy', 'Area of a square of side 10 cm is:', 'भुजा 10 सेमी वाले वर्ग का क्षेत्रफल है:', '20 cm²', '20 cm²', '100 cm²', '100 cm²', '1000 cm²', '1000 cm²', '12 cm²', '12 cm²', 'B', 1, 'Area = side × side = 100 cm².', 'क्षेत्रफल = भुजा × भुजा = 100 सेमी²।'),
(90, 3, 'Math-Science', 'Mensuration', 'Easy', 'Area of a square of side 11 cm is:', 'भुजा 11 सेमी वाले वर्ग का क्षेत्रफल है:', '22 cm²', '22 cm²', '121 cm²', '121 cm²', '1331 cm²', '1331 cm²', '13 cm²', '13 cm²', 'B', 1, 'Area = side × side = 121 cm².', 'क्षेत्रफल = भुजा × भुजा = 121 सेमी²।'),
(91, 3, 'Math-Science', 'Nutrition in Plants', 'Easy', 'Green plants prepare food by:', 'हरे पौधे भोजन बनाते हैं:', 'Respiration', 'Respiration', 'Photosynthesis', 'Photosynthesis', 'Transpiration', 'Transpiration', 'Digestion', 'Digestion', 'B', 1, 'Plants use sunlight to make food.', 'पौधे सूर्य के प्रकाश से भोजन बनाते हैं।'),
(92, 3, 'Math-Science', 'Components of Food', 'Easy', 'Vitamin C helps in:', 'विटामिन C मदद करता है:', 'Night blindness', 'Night blindness', 'Scurvy prevention', 'Scurvy prevention', 'Bone fracture', 'Bone fracture', 'Hearing', 'Hearing', 'B', 1, 'Vitamin C deficiency causes scurvy.', 'विटामिन C की कमी से स्कर्वी होता है।'),
(93, 3, 'Math-Science', 'Health & Hygiene', 'Easy', 'We should wash hands before eating to:', 'खाने से पहले हाथ धोना चाहिए ताकि:', 'save water', 'save water', 'prevent disease', 'prevent disease', 'increase height', 'increase height', 'sleep better', 'sleep better', 'B', 1, 'Handwashing prevents germs from entering the body.', 'हाथ धोने से रोगाणु शरीर में प्रवेश नहीं करते।'),
(94, 3, 'Math-Science', 'Crop Production', 'Easy', 'Seeds should be sown at proper:', 'बीजों को उचित ____ पर बोना चाहिए:', 'temperature only', 'temperature only', 'depth and distance', 'depth and distance', 'color', 'color', 'shape', 'shape', 'B', 1, 'Proper depth and spacing help germination.', 'उचित गहराई और दूरी अंकुरण में मदद करती है।'),
(95, 3, 'Math-Science', 'Separation of Substances', 'Easy', 'Which method is used to separate husk from grains?', 'अनाज से भूसी अलग करने की कौन-सी विधि है?', 'Sedimentation', 'Sedimentation', 'Winnowing', 'Winnowing', 'Evaporation', 'Evaporation', 'Filtration', 'Filtration', 'B', 1, 'Winnowing separates lighter husk from heavier grains.', 'फटकाई से हल्की भूसी भारी दानों से अलग होती है।'),
(96, 3, 'Math-Science', 'Acids Bases and Salts', 'Easy', 'Turmeric turns red in:', 'हल्दी किसमें लाल हो जाती है?', 'acid', 'acid', 'base', 'base', 'salt', 'salt', 'water', 'water', 'B', 1, 'Turmeric is a natural indicator for bases.', 'हल्दी क्षार के साथ लाल हो जाती है।'),
(97, 3, 'Math-Science', 'Living Organisms', 'Easy', 'The place where an organism lives is called its:', 'जिस स्थान पर जीव रहता है उसे उसका ____ कहते हैं:', 'food', 'food', 'habit', 'habit', 'habitat', 'habitat', 'family', 'family', 'C', 1, 'Habitat means natural home.', 'वासस्थान का अर्थ प्राकृतिक निवास है।'),
(98, 3, 'Math-Science', 'Plant Structure', 'Easy', 'Roots absorb:', 'जड़ें अवशोषित करती हैं:', 'oxygen only', 'oxygen only', 'water and minerals', 'water and minerals', 'food from air', 'food from air', 'sunlight', 'sunlight', 'B', 1, 'Roots absorb water and minerals from soil.', 'जड़ें मिट्टी से जल और खनिज लेती हैं।'),
(99, 3, 'Math-Science', 'Animal Structure', 'Easy', 'The organ used for breathing in humans is:', 'मनुष्यों में श्वसन के लिए प्रयुक्त अंग है:', 'heart', 'heart', 'stomach', 'stomach', 'lungs', 'lungs', 'kidney', 'kidney', 'C', 1, 'Lungs help in breathing.', 'फेफड़े श्वसन में सहायक हैं।'),
(100, 3, 'Math-Science', 'Respiration', 'Easy', 'During breathing, we inhale:', 'श्वास लेते समय हम अंदर लेते हैं:', 'carbon dioxide', 'carbon dioxide', 'oxygen-rich air', 'oxygen-rich air', 'only nitrogen', 'only nitrogen', 'only water vapor', 'only water vapor', 'B', 1, 'Inhaled air is rich in oxygen.', 'अंदर ली गई वायु में ऑक्सीजन अधिक होती है।'),
(101, 3, 'Math-Science', 'Digestion', 'Easy', 'Digestion of food begins in the:', 'भोजन का पाचन शुरू होता है:', 'stomach', 'stomach', 'mouth', 'mouth', 'intestine', 'intestine', 'liver', 'liver', 'B', 1, 'Saliva starts digestion in the mouth.', 'मुख में लार पाचन शुरू करती है।'),
(102, 3, 'Math-Science', 'Excretion', 'Easy', 'Kidneys help in:', 'गुर्दे मदद करते हैं:', 'breathing', 'breathing', 'blood circulation', 'blood circulation', 'removing wastes', 'removing wastes', 'seeing', 'seeing', 'C', 1, 'Kidneys filter wastes from blood.', 'गुर्दे रक्त से अपशिष्ट पदार्थ छानते हैं।'),
(103, 3, 'Math-Science', 'Measurement', 'Easy', 'The SI unit of length is:', 'लंबाई की SI इकाई है:', 'meter', 'meter', 'gram', 'gram', 'litre', 'litre', 'second', 'second', 'A', 1, 'Meter is the SI unit of length.', 'मीटर लंबाई की SI इकाई है।'),
(104, 3, 'Math-Science', 'Motion and Force', 'Easy', 'A push or pull is called:', 'धक्का या खींच को कहते हैं:', 'motion', 'motion', 'force', 'force', 'mass', 'mass', 'work', 'work', 'B', 1, 'Push or pull is force.', 'धक्का या खींच बल कहलाता है।'),
(105, 3, 'Math-Science', 'Friction', 'Easy', 'Friction acts:', 'घर्षण कार्य करता है:', 'with motion', 'with motion', 'against motion', 'against motion', 'upward only', 'upward only', 'downward only', 'downward only', 'B', 1, 'Friction opposes motion.', 'घर्षण गति का विरोध करता है।'),
(106, 3, 'Math-Science', 'Sound', 'Easy', 'Sound is produced by:', 'ध्वनि उत्पन्न होती है:', 'sleeping objects', 'sleeping objects', 'vibrating objects', 'vibrating objects', 'cold objects', 'cold objects', 'liquids only', 'liquids only', 'B', 1, 'Vibrations produce sound.', 'कंपन से ध्वनि उत्पन्न होती है।'),
(107, 3, 'Math-Science', 'Electric Current', 'Easy', 'The device used to make or break a circuit is:', 'परिपथ को जोड़ने या तोड़ने वाला यंत्र है:', 'bulb', 'bulb', 'switch', 'switch', 'cell', 'cell', 'wire', 'wire', 'B', 1, 'A switch controls the circuit.', 'स्विच परिपथ को नियंत्रित करता है।'),
(108, 3, 'Math-Science', 'Electric Circuit', 'Easy', 'An electric cell converts:', 'विद्युत सेल परिवर्तित करता है:', 'electrical to chemical', 'electrical to chemical', 'chemical to electrical', 'chemical to electrical', 'light to sound', 'light to sound', 'heat to matter', 'heat to matter', 'B', 1, 'Cell converts chemical energy into electrical energy.', 'सेल रासायनिक ऊर्जा को विद्युत ऊर्जा में बदलता है।'),
(109, 3, 'Math-Science', 'Magnets', 'Easy', 'Like poles of magnets:', 'चुंबक के समान ध्रुव:', 'attract', 'attract', 'repel', 'repel', 'melt', 'melt', 'disappear', 'disappear', 'B', 1, 'Like poles repel each other.', 'समान ध्रुव एक-दूसरे को प्रतिकर्षित करते हैं।'),
(110, 3, 'Math-Science', 'Light', 'Easy', 'A mirror reflects:', 'दर्पण परावर्तित करता है:', 'sound', 'sound', 'light', 'light', 'heat only', 'heat only', 'air', 'air', 'B', 1, 'Mirrors reflect light.', 'दर्पण प्रकाश परावर्तित करता है।'),
(111, 3, 'Math-Science', 'Heat and Temperature', 'Easy', 'The instrument used to measure temperature is:', 'तापमान मापने का यंत्र है:', 'barometer', 'barometer', 'thermometer', 'thermometer', 'ammeter', 'ammeter', 'speedometer', 'speedometer', 'B', 1, 'A thermometer measures temperature.', 'थर्मामीटर तापमान मापता है।'),
(112, 3, 'Math-Science', 'Natural Phenomena', 'Easy', 'Lightning occurs due to:', 'बिजली चमकना होता है:', 'flow of river', 'flow of river', 'electric charges in clouds', 'electric charges in clouds', 'moonlight', 'moonlight', 'plant growth', 'plant growth', 'B', 1, 'Lightning is caused by electric discharge in clouds.', 'बादलों में विद्युत आवेश के कारण बिजली चमकती है।'),
(113, 3, 'Math-Science', 'Alternative Energy', 'Easy', 'Solar energy comes from:', 'सौर ऊर्जा किससे मिलती है?', 'moon', 'moon', 'sun', 'sun', 'coal', 'coal', 'wind', 'wind', 'B', 1, 'Solar means from the sun.', 'सौर का अर्थ सूर्य से है।'),
(114, 3, 'Math-Science', 'Environment', 'Easy', 'The greenhouse gas among these is:', 'इनमें से हरितगृह गैस है:', 'oxygen', 'oxygen', 'nitrogen', 'nitrogen', 'carbon dioxide', 'carbon dioxide', 'helium', 'helium', 'C', 1, 'Carbon dioxide is a greenhouse gas.', 'कार्बन डाइऑक्साइड एक हरितगृह गैस है।'),
(115, 3, 'Math-Science', 'Environment', 'Easy', 'The ozone layer protects us from:', 'ओजोन परत हमें किससे बचाती है?', 'dust', 'dust', 'UV rays', 'UV rays', 'wind', 'wind', 'rain', 'rain', 'B', 1, 'Ozone layer blocks harmful ultraviolet rays.', 'ओजोन परत हानिकारक पराबैंगनी किरणों को रोकती है।'),
(116, 3, 'Math-Science', 'Pollution', 'Easy', 'Smoke from vehicles mainly causes:', 'वाहनों के धुएँ से मुख्यतः होता है:', 'water pollution', 'water pollution', 'air pollution', 'air pollution', 'soil formation', 'soil formation', 'forest growth', 'forest growth', 'B', 1, 'Vehicle smoke pollutes air.', 'वाहनों का धुआँ वायु को प्रदूषित करता है।'),
(117, 3, 'Math-Science', 'Waste Management', 'Easy', 'Biodegradable waste can be:', 'जैव-अवक्रमणीय कचरा हो सकता है:', 'plastic bottle', 'plastic bottle', 'glass', 'glass', 'vegetable peels', 'vegetable peels', 'iron nail', 'iron nail', 'C', 1, 'Vegetable peels decompose naturally.', 'सब्जियों के छिलके प्राकृतिक रूप से विघटित हो जाते हैं।'),
(118, 3, 'Math-Science', 'Human Body', 'Easy', 'Humans have how many sense organs commonly taught at school?', 'स्कूल स्तर पर मनुष्यों के कितने इंद्रिय अंग बताए जाते हैं?', '3', '3', '4', '4', '5', '5', '6', '6', 'C', 1, 'Commonly, five sense organs are taught.', 'सामान्यतः पाँच इंद्रिय अंग पढ़ाए जाते हैं।'),
(119, 3, 'Math-Science', 'Human Body', 'Easy', 'Humans have how many sense organs commonly taught at school?', 'स्कूल स्तर पर मनुष्यों के कितने इंद्रिय अंग बताए जाते हैं?', '3', '3', '4', '4', '5', '5', '6', '6', 'C', 1, 'Commonly, five sense organs are taught.', 'सामान्यतः पाँच इंद्रिय अंग पढ़ाए जाते हैं।'),
(120, 3, 'Math-Science', 'Human Body', 'Easy', 'Humans have how many sense organs commonly taught at school?', 'स्कूल स्तर पर मनुष्यों के कितने इंद्रिय अंग बताए जाते हैं?', '3', '3', '4', '4', '5', '5', '6', '6', 'C', 1, 'Commonly, five sense organs are taught.', 'सामान्यतः पाँच इंद्रिय अंग पढ़ाए जाते हैं।'),
(121, 3, 'Math-Science', 'Human Body', 'Easy', 'Humans have how many sense organs commonly taught at school?', 'स्कूल स्तर पर मनुष्यों के कितने इंद्रिय अंग बताए जाते हैं?', '3', '3', '4', '4', '5', '5', '6', '6', 'C', 1, 'Commonly, five sense organs are taught.', 'सामान्यतः पाँच इंद्रिय अंग पढ़ाए जाते हैं।'),
(122, 3, 'Math-Science', 'Human Body', 'Easy', 'Humans have how many sense organs commonly taught at school?', 'स्कूल स्तर पर मनुष्यों के कितने इंद्रिय अंग बताए जाते हैं?', '3', '3', '4', '4', '5', '5', '6', '6', 'C', 1, 'Commonly, five sense organs are taught.', 'सामान्यतः पाँच इंद्रिय अंग पढ़ाए जाते हैं।'),
(123, 3, 'Math-Science', 'Human Body', 'Easy', 'Humans have how many sense organs commonly taught at school?', 'स्कूल स्तर पर मनुष्यों के कितने इंद्रिय अंग बताए जाते हैं?', '3', '3', '4', '4', '5', '5', '6', '6', 'C', 1, 'Commonly, five sense organs are taught.', 'सामान्यतः पाँच इंद्रिय अंग पढ़ाए जाते हैं।'),
(124, 3, 'Math-Science', 'Human Body', 'Easy', 'Humans have how many sense organs commonly taught at school?', 'स्कूल स्तर पर मनुष्यों के कितने इंद्रिय अंग बताए जाते हैं?', '3', '3', '4', '4', '5', '5', '6', '6', 'C', 1, 'Commonly, five sense organs are taught.', 'सामान्यतः पाँच इंद्रिय अंग पढ़ाए जाते हैं।'),
(125, 3, 'Math-Science', 'Human Body', 'Easy', 'Humans have how many sense organs commonly taught at school?', 'स्कूल स्तर पर मनुष्यों के कितने इंद्रिय अंग बताए जाते हैं?', '3', '3', '4', '4', '5', '5', '6', '6', 'C', 1, 'Commonly, five sense organs are taught.', 'सामान्यतः पाँच इंद्रिय अंग पढ़ाए जाते हैं।'),
(126, 3, 'Math-Science', 'Human Body', 'Easy', 'Humans have how many sense organs commonly taught at school?', 'स्कूल स्तर पर मनुष्यों के कितने इंद्रिय अंग बताए जाते हैं?', '3', '3', '4', '4', '5', '5', '6', '6', 'C', 1, 'Commonly, five sense organs are taught.', 'सामान्यतः पाँच इंद्रिय अंग पढ़ाए जाते हैं।'),
(127, 3, 'Math-Science', 'Human Body', 'Easy', 'Humans have how many sense organs commonly taught at school?', 'स्कूल स्तर पर मनुष्यों के कितने इंद्रिय अंग बताए जाते हैं?', '3', '3', '4', '4', '5', '5', '6', '6', 'C', 1, 'Commonly, five sense organs are taught.', 'सामान्यतः पाँच इंद्रिय अंग पढ़ाए जाते हैं।'),
(128, 3, 'Math-Science', 'Human Body', 'Easy', 'Humans have how many sense organs commonly taught at school?', 'स्कूल स्तर पर मनुष्यों के कितने इंद्रिय अंग बताए जाते हैं?', '3', '3', '4', '4', '5', '5', '6', '6', 'C', 1, 'Commonly, five sense organs are taught.', 'सामान्यतः पाँच इंद्रिय अंग पढ़ाए जाते हैं।'),
(129, 3, 'Math-Science', 'Human Body', 'Easy', 'Humans have how many sense organs commonly taught at school?', 'स्कूल स्तर पर मनुष्यों के कितने इंद्रिय अंग बताए जाते हैं?', '3', '3', '4', '4', '5', '5', '6', '6', 'C', 1, 'Commonly, five sense organs are taught.', 'सामान्यतः पाँच इंद्रिय अंग पढ़ाए जाते हैं।'),
(130, 3, 'Math-Science', 'Human Body', 'Easy', 'Humans have how many sense organs commonly taught at school?', 'स्कूल स्तर पर मनुष्यों के कितने इंद्रिय अंग बताए जाते हैं?', '3', '3', '4', '4', '5', '5', '6', '6', 'C', 1, 'Commonly, five sense organs are taught.', 'सामान्यतः पाँच इंद्रिय अंग पढ़ाए जाते हैं।'),
(131, 3, 'Math-Science', 'Human Body', 'Easy', 'Humans have how many sense organs commonly taught at school?', 'स्कूल स्तर पर मनुष्यों के कितने इंद्रिय अंग बताए जाते हैं?', '3', '3', '4', '4', '5', '5', '6', '6', 'C', 1, 'Commonly, five sense organs are taught.', 'सामान्यतः पाँच इंद्रिय अंग पढ़ाए जाते हैं।'),
(132, 3, 'Math-Science', 'Human Body', 'Easy', 'Humans have how many sense organs commonly taught at school?', 'स्कूल स्तर पर मनुष्यों के कितने इंद्रिय अंग बताए जाते हैं?', '3', '3', '4', '4', '5', '5', '6', '6', 'C', 1, 'Commonly, five sense organs are taught.', 'सामान्यतः पाँच इंद्रिय अंग पढ़ाए जाते हैं।'),
(133, 3, 'Math-Science', 'Plants', 'Easy', 'Which gas do plants release during photosynthesis?', 'प्रकाश संश्लेषण के दौरान पौधे कौन-सी गैस छोड़ते हैं?', 'Oxygen', 'Oxygen', 'Carbon dioxide', 'Carbon dioxide', 'Nitrogen', 'Nitrogen', 'Hydrogen', 'Hydrogen', 'A', 1, 'Plants release oxygen during photosynthesis.', 'प्रकाश संश्लेषण में पौधे ऑक्सीजन छोड़ते हैं।'),
(134, 3, 'Math-Science', 'Vitamins', 'Easy', 'Which vitamin is formed in the body with sunlight?', 'सूर्य के प्रकाश से शरीर में कौन-सा विटामिन बनता है?', 'Vitamin A', 'Vitamin A', 'Vitamin B', 'Vitamin B', 'Vitamin C', 'Vitamin C', 'Vitamin D', 'Vitamin D', 'D', 1, 'Sunlight helps the body make Vitamin D.', 'सूर्य के प्रकाश से शरीर विटामिन D बनाता है।'),
(135, 3, 'Math-Science', 'Plants', 'Easy', 'Which part of the plant develops into a fruit?', 'पौधे का कौन-सा भाग फल में विकसित होता है?', 'Root', 'Root', 'Leaf', 'Leaf', 'Flower', 'Flower', 'Stem', 'Stem', 'C', 1, 'After fertilization, flower parts develop into fruit.', 'निषेचन के बाद फूल का भाग फल बनता है।'),
(136, 3, 'Math-Science', 'Blood', 'Easy', 'Which blood cells fight infection?', 'कौन-सी रक्त कोशिकाएँ संक्रमण से लड़ती हैं?', 'Red blood cells', 'Red blood cells', 'White blood cells', 'White blood cells', 'Platelets', 'Platelets', 'Plasma', 'Plasma', 'B', 1, 'WBCs defend the body against infection.', 'श्वेत रक्त कण संक्रमण से रक्षा करते हैं।'),
(137, 3, 'Math-Science', 'Circulatory System', 'Easy', 'Which organ pumps blood in the body?', 'शरीर में रक्त पंप करने वाला अंग है:', 'Liver', 'Liver', 'Heart', 'Heart', 'Lungs', 'Lungs', 'Kidney', 'Kidney', 'B', 1, 'Heart pumps blood throughout the body.', 'हृदय पूरे शरीर में रक्त पंप करता है।'),
(138, 3, 'Math-Science', 'Food', 'Easy', 'Which nutrient helps body-building?', 'शरीर निर्माण में कौन-सा पोषक तत्व सहायक है?', 'Protein', 'Protein', 'Carbohydrate', 'Carbohydrate', 'Fat', 'Fat', 'Vitamin C', 'Vitamin C', 'A', 1, 'Proteins are body-building nutrients.', 'प्रोटीन शरीर निर्माण करने वाले पोषक तत्व हैं।'),
(139, 3, 'Math-Science', 'Temperature', 'Easy', 'Which metal was traditionally used in thermometers?', 'पारंपरिक थर्मामीटर में कौन-सी धातु प्रयुक्त होती थी?', 'Iron', 'Iron', 'Copper', 'Copper', 'Mercury', 'Mercury', 'Aluminium', 'Aluminium', 'C', 1, 'Mercury expands uniformly with heat.', 'पारा ताप के साथ समान रूप से फैलता है।'),
(140, 3, 'Math-Science', 'Space', 'Easy', 'Which planet is called the Red Planet?', 'कौन-सा ग्रह लाल ग्रह कहलाता है?', 'Earth', 'Earth', 'Mars', 'Mars', 'Jupiter', 'Jupiter', 'Venus', 'Venus', 'B', 1, 'Mars appears red due to iron oxide.', 'मंगल ग्रह लौह ऑक्साइड के कारण लाल दिखता है।'),
(141, 3, 'Math-Science', 'Heat', 'Easy', 'Boiling point of water is:', 'जल का क्वथनांक है:', '0°C', '0°C', '50°C', '50°C', '100°C', '100°C', '150°C', '150°C', 'C', 1, 'Water boils at 100°C under normal pressure.', 'सामान्य दाब पर जल 100°C पर उबलता है।'),
(142, 3, 'Math-Science', 'Heat', 'Easy', 'Freezing point of water is:', 'जल का हिमांक है:', '0°C', '0°C', '10°C', '10°C', '32°C', '32°C', '100°C', '100°C', 'A', 1, 'Water freezes at 0°C.', 'जल 0°C पर जमता है।'),
(143, 3, 'Social-Science', 'History', 'Easy', 'The Mauryan emperor known for Dhamma was:', 'धम्म के लिए प्रसिद्ध मौर्य सम्राट थे:', 'Akbar', 'Akbar', 'Ashoka', 'Ashoka', 'Harsha', 'Harsha', 'Babur', 'Babur', 'B', 1, 'Ashoka promoted Dhamma after Kalinga war.', 'कलिंग युद्ध के बाद अशोक ने धम्म का प्रचार किया।'),
(144, 3, 'Social-Science', 'History', 'Easy', 'The Revolt of 1857 is also known as:', '1857 के विद्रोह को यह भी कहा जाता है:', 'Green Revolution', 'Green Revolution', 'First War of Independence', 'First War of Independence', 'Quit India Movement', 'Quit India Movement', 'Non-Cooperation', 'Non-Cooperation', 'B', 1, 'It is popularly called the First War of Independence.', 'इसे प्रायः प्रथम स्वतंत्रता संग्राम कहा जाता है।'),
(145, 3, 'Social-Science', 'History', 'Easy', 'The Mughal emperor who built the Taj Mahal was:', 'ताजमहल बनवाने वाले मुगल सम्राट थे:', 'Akbar', 'Akbar', 'Babur', 'Babur', 'Shah Jahan', 'Shah Jahan', 'Aurangzeb', 'Aurangzeb', 'C', 1, 'Shah Jahan built the Taj Mahal.', 'शाहजहाँ ने ताजमहल बनवाया।'),
(146, 3, 'Social-Science', 'Geography', 'Easy', 'The planet on which we live is:', 'हम जिस ग्रह पर रहते हैं वह है:', 'Mars', 'Mars', 'Venus', 'Venus', 'Earth', 'Earth', 'Saturn', 'Saturn', 'C', 1, 'Earth is our home planet.', 'पृथ्वी हमारा निवास ग्रह है।'),
(147, 3, 'Social-Science', 'Geography', 'Easy', 'The layer of air around Earth is called:', 'पृथ्वी के चारों ओर वायु की परत कहलाती है:', 'Hydrosphere', 'Hydrosphere', 'Atmosphere', 'Atmosphere', 'Lithosphere', 'Lithosphere', 'Biosphere', 'Biosphere', 'B', 1, 'Atmosphere is the envelope of air.', 'वायुमंडल वायु की परत है।'),
(148, 3, 'Social-Science', 'Geography', 'Easy', 'A resource that can be renewed is:', 'पुनर्नवीकरणीय संसाधन है:', 'Coal', 'Coal', 'Petroleum', 'Petroleum', 'Sunlight', 'Sunlight', 'Natural gas', 'Natural gas', 'C', 1, 'Sunlight is renewable.', 'सूर्यप्रकाश पुनर्नवीकरणीय है।'),
(149, 3, 'Social-Science', 'Civics', 'Easy', 'The supreme law of India is the:', 'भारत का सर्वोच्च कानून है:', 'Parliament', 'Parliament', 'Constitution', 'Constitution', 'Court', 'Court', 'Cabinet', 'Cabinet', 'B', 1, 'The Constitution is the supreme law.', 'संविधान सर्वोच्च कानून है।'),
(150, 3, 'Social-Science', 'Civics', 'Easy', 'Right to Equality is a:', 'समानता का अधिकार एक है:', 'legal notice', 'legal notice', 'fundamental right', 'fundamental right', 'directive principle', 'directive principle', 'duty', 'duty', 'B', 1, 'It is one of the Fundamental Rights.', 'यह मौलिक अधिकारों में से एक है।'),
(151, 3, 'Social-Science', 'Civics', 'Easy', 'Government at village level is called:', 'गाँव स्तर की सरकार कहलाती है:', 'Municipality', 'Municipality', 'Parliament', 'Parliament', 'Panchayat', 'Panchayat', 'Assembly', 'Assembly', 'C', 1, 'Panchayat is local self-government in villages.', 'पंचायत गाँवों की स्थानीय स्वशासन इकाई है।'),
(152, 3, 'Social-Science', 'Economics', 'Easy', 'Money is used as a medium of:', 'मुद्रा का उपयोग किसके माध्यम के रूप में होता है?', 'exchange', 'exchange', 'rainfall', 'rainfall', 'transport', 'transport', 'farming', 'farming', 'A', 1, 'Money facilitates exchange of goods and services.', 'मुद्रा वस्तुओं और सेवाओं के विनिमय में सहायक है।'),
(153, 3, 'Social-Science', 'Economics', 'Easy', 'Public Distribution System is related to:', 'सार्वजनिक वितरण प्रणाली संबंधित है:', 'movies', 'movies', 'food grains', 'food grains', 'sports', 'sports', 'roads', 'roads', 'B', 1, 'PDS distributes essential food items.', 'PDS आवश्यक खाद्यान्न वितरित करती है।'),
(154, 3, 'Social-Science', 'Economics', 'Easy', 'Buying and selling take place in a:', 'खरीद-बिक्री कहाँ होती है?', 'hospital', 'hospital', 'market', 'market', 'school', 'school', 'court', 'court', 'B', 1, 'Market is a place of exchange.', 'बाजार विनिमय का स्थान है।'),
(155, 3, 'Social-Science', 'History', 'Easy', 'Ashoka belonged to which dynasty?', 'अशोक किस वंश से संबंधित थे?', 'Maurya', 'Maurya', 'Gupta', 'Gupta', 'Lodi', 'Lodi', 'Chola', 'Chola', 'A', 1, '', ''),
(156, 3, 'Social-Science', 'History', 'Easy', 'Who came to India for trade and later ruled?', 'भारत में व्यापार के लिए आए और बाद में शासन करने लगे?', 'Portuguese only', 'Portuguese only', 'East India Company', 'East India Company', 'Mughals', 'Mughals', 'Marathas', 'Marathas', 'B', 1, '', ''),
(157, 3, 'Social-Science', 'History', 'Easy', 'The national movement was against:', 'राष्ट्रीय आंदोलन किसके विरुद्ध था?', 'local markets', 'local markets', 'British rule', 'British rule', 'farming', 'farming', 'villages', 'villages', 'B', 1, '', ''),
(158, 3, 'Social-Science', 'Geography', 'Easy', 'The movement of Earth around the Sun is called:', 'पृथ्वी की सूर्य के चारों ओर गति कहलाती है:', 'rotation', 'rotation', 'revolution', 'revolution', 'vibration', 'vibration', 'tilting', 'tilting', 'B', 1, '', ''),
(159, 3, 'Social-Science', 'Geography', 'Easy', 'The top layer of the Earth is called:', 'पृथ्वी की ऊपरी परत कहलाती है:', 'core', 'core', 'crust', 'crust', 'mantle', 'mantle', 'atmosphere', 'atmosphere', 'B', 1, '', ''),
(160, 3, 'Social-Science', 'Geography', 'Easy', 'Soil is important for:', 'मिट्टी महत्वपूर्ण है:', 'space travel', 'space travel', 'growing plants', 'growing plants', 'making clouds', 'making clouds', 'light only', 'light only', 'B', 1, '', ''),
(161, 3, 'Social-Science', 'Geography', 'Easy', 'Desert areas receive:', 'रेगिस्तानी क्षेत्रों में होती है:', 'heavy rainfall', 'heavy rainfall', 'moderate rainfall', 'moderate rainfall', 'very little rainfall', 'very little rainfall', 'snow all year', 'snow all year', 'C', 1, '', ''),
(162, 3, 'Social-Science', 'Civics', 'Easy', 'The Parliament of India has ____ houses.', 'भारत की संसद के ____ सदन हैं।', '1', '1', '2', '2', '3', '3', '4', '4', 'B', 1, '', ''),
(163, 3, 'Social-Science', 'Civics', 'Easy', 'Voting age in India is:', 'भारत में मतदान की आयु है:', '16', '16', '17', '17', '18', '18', '21', '21', 'C', 1, '', ''),
(164, 3, 'Social-Science', 'Civics', 'Easy', 'Rules that citizens must follow are based on the:', 'नागरिकों द्वारा पालन किए जाने वाले नियम किस पर आधारित हैं?', 'Constitution', 'Constitution', 'weather', 'weather', 'crop', 'crop', 'festival', 'festival', 'A', 1, '', ''),
(165, 3, 'Social-Science', 'Civics', 'Easy', 'A duty of a citizen is to:', 'नागरिक का एक कर्तव्य है:', 'damage public property', 'damage public property', 'respect national symbols', 'respect national symbols', 'ignore law', 'ignore law', 'avoid school', 'avoid school', 'B', 1, '', ''),
(166, 3, 'Social-Science', 'Economics', 'Easy', 'People earn livelihood through:', 'लोग जीविका कमाते हैं:', 'work', 'work', 'sleep', 'sleep', 'silence', 'silence', 'rain', 'rain', 'A', 1, '', ''),
(167, 3, 'Social-Science', 'Economics', 'Easy', 'Barter means exchange of:', 'वस्तु-विनिमय का अर्थ है:', 'money only', 'money only', 'goods for goods', 'goods for goods', 'paper for water', 'paper for water', 'tax for trade', 'tax for trade', 'B', 1, '', ''),
(168, 3, 'Social-Science', 'Economics', 'Easy', 'Financial literacy means knowledge about:', 'वित्तीय साक्षरता का अर्थ है जानकारी:', 'games', 'games', 'money matters', 'money matters', 'clouds', 'clouds', 'plants', 'plants', 'B', 1, '', ''),
(169, 3, 'Social-Science', 'Economics', 'Easy', 'A cooperative is formed to:', 'सहकारिता बनाई जाती है:', 'help members together', 'help members together', 'stop farming', 'stop farming', 'close market', 'close market', 'avoid work', 'avoid work', 'A', 1, '', ''),
(170, 3, 'Computer', 'Computer Basics', 'Easy', 'CPU stands for:', 'CPU का पूर्ण रूप है:', 'Central Process Unit', 'Central Process Unit', 'Central Processing Unit', 'Central Processing Unit', 'Computer Processing Unit', 'Computer Processing Unit', 'Central Print Unit', 'Central Print Unit', 'B', 1, 'CPU means Central Processing Unit.', 'CPU का अर्थ Central Processing Unit है।'),
(171, 3, 'Computer', 'Computer Basics', 'Easy', 'Computer generations are based mainly on:', 'कंप्यूटर की पीढ़ियाँ मुख्यतः किस पर आधारित हैं?', 'color', 'color', 'technology used', 'technology used', 'size of room', 'size of room', 'keyboard type', 'keyboard type', 'B', 1, 'Generations reflect major technological changes.', 'पीढ़ियाँ प्रमुख तकनीकी परिवर्तनों को दर्शाती हैं।'),
(172, 3, 'Computer', 'Keyboard', 'Easy', 'Which key is used to remove the character on the left side?', 'बाएँ ओर के अक्षर को मिटाने के लिए कौन-सी कुंजी प्रयुक्त होती है?', 'Delete', 'Delete', 'Enter', 'Enter', 'Backspace', 'Backspace', 'Shift', 'Shift', 'C', 1, 'Backspace removes character to the left.', 'Backspace बाईं ओर का अक्षर हटाती है।'),
(173, 3, 'Computer', 'Keyboard', 'Easy', 'The longest key on the keyboard is:', 'कीबोर्ड की सबसे लंबी कुंजी है:', 'Enter', 'Enter', 'Shift', 'Shift', 'Spacebar', 'Spacebar', 'Ctrl', 'Ctrl', 'C', 1, 'Spacebar is the longest key.', 'Spacebar सबसे लंबी कुंजी है।'),
(174, 3, 'Computer', 'Mouse', 'Easy', 'Double click means pressing the mouse button:', 'डबल क्लिक का अर्थ है माउस बटन दबाना:', 'once', 'once', 'twice quickly', 'twice quickly', 'three times', 'three times', 'continuously', 'continuously', 'B', 1, 'Double click means two quick clicks.', 'डबल क्लिक दो बार जल्दी दबाना है।'),
(175, 3, 'Computer', 'Desktop', 'Easy', 'Deleted files are temporarily stored in:', 'हटाई गई फाइलें अस्थायी रूप से कहाँ रहती हैं?', 'My Computer', 'My Computer', 'Recycle Bin', 'Recycle Bin', 'Taskbar', 'Taskbar', 'Paint', 'Paint', 'B', 1, 'Deleted files go to Recycle Bin first.', 'हटाई गई फाइलें पहले Recycle Bin में जाती हैं।'),
(176, 3, 'Computer', 'MS Word', 'Easy', 'MS Word is mainly used for:', 'MS Word मुख्यतः किसके लिए उपयोग होता है?', 'drawing', 'drawing', 'word processing', 'word processing', 'gaming', 'gaming', 'music', 'music', 'B', 1, 'MS Word is a word processor.', 'MS Word एक वर्ड प्रोसेसर है।'),
(177, 3, 'Computer', 'MS Excel', 'Easy', 'MS Excel is mainly used for:', 'MS Excel मुख्यतः किसके लिए उपयोग होता है?', 'spreadsheets', 'spreadsheets', 'painting', 'painting', 'video editing', 'video editing', 'typing only', 'typing only', 'A', 1, 'Excel is spreadsheet software.', 'Excel स्प्रेडशीट सॉफ्टवेयर है।'),
(178, 3, 'Computer', 'PowerPoint', 'Easy', 'MS PowerPoint is used to create:', 'MS PowerPoint का उपयोग किसे बनाने में होता है?', 'letters', 'letters', 'presentations', 'presentations', 'folders', 'folders', 'virus', 'virus', 'B', 1, 'PowerPoint is presentation software.', 'PowerPoint प्रस्तुति बनाने का सॉफ्टवेयर है।'),
(179, 3, 'Computer', 'Internet', 'Easy', 'A software used to open websites is called:', 'वेबसाइट खोलने के लिए प्रयुक्त सॉफ्टवेयर कहलाता है:', 'browser', 'browser', 'printer', 'printer', 'speaker', 'speaker', 'scanner', 'scanner', 'A', 1, 'A browser opens web pages.', 'ब्राउज़र वेब पेज खोलता है।'),
(180, 3, 'Computer', 'Internet', 'Easy', 'Email is used for:', 'ईमेल का उपयोग किया जाता है:', 'washing clothes', 'washing clothes', 'sending messages', 'sending messages', 'cooking', 'cooking', 'driving', 'driving', 'B', 1, 'Email sends digital messages.', 'ईमेल डिजिटल संदेश भेजने में उपयोग होती है।'),
(181, 3, 'Computer', 'Files & Folders', 'Easy', 'A folder is used to:', 'फ़ोल्डर का उपयोग किया जाता है:', 'type letters', 'type letters', 'organize files', 'organize files', 'print pages', 'print pages', 'shut down', 'shut down', 'B', 1, 'Folders organize files.', 'फ़ोल्डर फाइलों को व्यवस्थित करते हैं।'),
(182, 3, 'Computer', 'Cyber Safety', 'Easy', 'A strong password should be:', 'मजबूत पासवर्ड कैसा होना चाहिए?', 'simple and short', 'simple and short', 'name only', 'name only', 'hard to guess', 'hard to guess', 'same for all', 'same for all', 'C', 1, 'Strong passwords are difficult to guess.', 'मजबूत पासवर्ड का अनुमान लगाना कठिन होता है।');
INSERT INTO `questions` (`id`, `exam_id`, `section_type`, `topic`, `difficulty`, `question_en`, `question_hi`, `opt_a_en`, `opt_a_hi`, `opt_b_en`, `opt_b_hi`, `opt_c_en`, `opt_c_hi`, `opt_d_en`, `opt_d_hi`, `correct_option`, `marks`, `explanation_en`, `explanation_hi`) VALUES
(183, 3, 'Computer', 'ICT & AI', 'Easy', 'ICT stands for:', 'ICT का पूर्ण रूप है:', 'Information and Communication Technology', 'Information and Communication Technology', 'Indian Computer Tool', 'Indian Computer Tool', 'Internal Coding Type', 'Internal Coding Type', 'Internet Control Task', 'Internet Control Task', 'A', 1, 'ICT = Information and Communication Technology.', 'ICT = Information and Communication Technology।'),
(184, 3, 'Computer', 'ICT & AI', 'Easy', 'AI stands for:', 'AI का पूर्ण रूप है:', 'Automatic Internet', 'Automatic Internet', 'Artificial Intelligence', 'Artificial Intelligence', 'Applied Input', 'Applied Input', 'Advanced Icon', 'Advanced Icon', 'B', 1, 'AI means Artificial Intelligence.', 'AI का अर्थ Artificial Intelligence है।'),
(185, 3, 'CDP', 'Development', 'Easy', 'Development is related to:', 'विकास संबंधित है:', 'only physical growth', 'only physical growth', 'overall changes in child', 'overall changes in child', 'only weight', 'only weight', 'only age', 'only age', 'B', 1, 'Development includes physical, mental, social and emotional changes.', 'विकास में शारीरिक, मानसिक, सामाजिक और भावनात्मक परिवर्तन शामिल हैं।'),
(186, 3, 'CDP', 'Development', 'Easy', 'Learning and development are:', 'अधिगम और विकास हैं:', 'unrelated', 'unrelated', 'closely related', 'closely related', 'opposite', 'opposite', 'same as marks', 'same as marks', 'B', 1, 'Learning influences development and vice versa.', 'अधिगम और विकास एक-दूसरे को प्रभावित करते हैं।'),
(187, 3, 'CDP', 'NEP 2020', 'Easy', 'NEP 2020 refers to:', 'NEP 2020 का अर्थ है:', 'New Exam Plan', 'New Exam Plan', 'National Education Policy 2020', 'National Education Policy 2020', 'National Exercise Program', 'National Exercise Program', 'New Education Paper', 'New Education Paper', 'B', 1, 'NEP stands for National Education Policy.', 'NEP का अर्थ National Education Policy है।'),
(188, 3, 'CDP', 'Child-Centered Education', 'Easy', 'In child-centered education, the teacher acts mainly as a:', 'बाल-केंद्रित शिक्षा में शिक्षक मुख्यतः होता है:', 'dictator', 'dictator', 'facilitator', 'facilitator', 'judge only', 'judge only', 'silent observer', 'silent observer', 'B', 1, 'Teacher guides and facilitates learning.', 'शिक्षक मार्गदर्शक और सहायक की भूमिका निभाता है।'),
(189, 3, 'CDP', 'Individual Differences', 'Easy', 'Students in a class differ in:', 'एक कक्षा के विद्यार्थियों में भिन्नता होती है:', 'ability only', 'ability only', 'interest only', 'interest only', 'pace of learning', 'pace of learning', 'all of these', 'all of these', 'D', 1, 'Children differ in many ways.', 'बच्चे अनेक प्रकार से भिन्न होते हैं।'),
(190, 3, 'CDP', 'Assessment', 'Easy', 'Assessment during teaching is called:', 'शिक्षण के दौरान किया गया आकलन कहलाता है:', 'summative', 'summative', 'formative', 'formative', 'final only', 'final only', 'external', 'external', 'B', 1, 'Formative assessment happens during learning.', 'निर्माणात्मक आकलन अधिगम के दौरान होता है।'),
(191, 3, 'CDP', 'Bloom\'s Taxonomy', 'Easy', 'Remembering, understanding and applying are levels of:', 'Remembering, understanding और applying किसके स्तर हैं?', 'diet chart', 'diet chart', 'Bloom\'s taxonomy', 'Bloom\'s taxonomy', 'weather report', 'weather report', 'attendance', 'attendance', 'B', 1, 'These are levels of Bloom\'s taxonomy.', 'ये ब्लूम टैक्सोनॉमी के स्तर हैं।'),
(192, 3, 'CDP', 'Inclusive Education', 'Easy', 'Inclusive education means:', 'समावेशी शिक्षा का अर्थ है:', 'separate schools for all', 'separate schools for all', 'education for all learners together', 'education for all learners together', 'only online classes', 'only online classes', 'only gifted children', 'only gifted children', 'B', 1, 'Inclusive education includes all children in learning.', 'समावेशी शिक्षा में सभी बच्चों को साथ लेकर शिक्षा दी जाती है।'),
(193, 3, 'CDP', 'Learning', 'Easy', 'Children learn best when:', 'बच्चे सबसे अच्छा सीखते हैं जब:', 'they are afraid', 'they are afraid', 'learning is meaningful and active', 'learning is meaningful and active', 'they are punished', 'they are punished', 'they memorize only', 'they memorize only', 'B', 1, 'Active and meaningful learning improves understanding.', 'सार्थक और सक्रिय अधिगम समझ को बढ़ाता है।'),
(194, 3, 'CDP', 'Cognitive Development', 'Easy', 'Thinking, reasoning and problem solving belong to:', 'सोचना, तर्क करना और समस्या समाधान किससे संबंधित है?', 'physical development', 'physical development', 'cognitive development', 'cognitive development', 'moral development', 'moral development', 'language noise', 'language noise', 'B', 1, 'These are cognitive abilities.', 'ये संज्ञानात्मक क्षमताएँ हैं।'),
(195, 3, 'CDP', 'Affective Development', 'Easy', 'Feelings and emotions relate to:', 'भावनाएँ और संवेदनाएँ संबंधित हैं:', 'affective development', 'affective development', 'motor development', 'motor development', 'numerical skill', 'numerical skill', 'spelling', 'spelling', 'A', 1, 'Affective domain includes feelings and attitudes.', 'भावात्मक क्षेत्र में भावनाएँ और दृष्टिकोण आते हैं।'),
(196, 3, 'CDP', 'Moral Development', 'Easy', 'Moral development is related to:', 'नैतिक विकास संबंधित है:', 'right and wrong', 'right and wrong', 'height and weight', 'height and weight', 'drawing', 'drawing', 'running', 'running', 'A', 1, 'It concerns values and right-wrong decisions.', 'यह मूल्यों और सही-गलत के निर्णय से जुड़ा है।'),
(197, 3, 'CDP', 'ICT in Education', 'Easy', 'ICT integration in classroom helps in:', 'कक्षा में ICT का समावेशन किसमें मदद करता है?', 'engaging learning', 'engaging learning', 'removing teachers', 'removing teachers', 'closing books', 'closing books', 'reducing understanding', 'reducing understanding', 'A', 1, 'ICT can make learning interactive.', 'ICT अधिगम को रोचक और सहभागितापूर्ण बनाता है।'),
(198, 3, 'Computer', 'Keyboard', 'Easy', 'Which key is used to move to a new line in a document?', 'दस्तावेज़ में नई पंक्ति पर जाने के लिए कौन-सी कुंजी प्रयुक्त होती है?', 'Ctrl', 'Ctrl', 'Enter', 'Enter', 'Shift', 'Shift', 'Alt', 'Alt', 'B', 1, 'Enter key starts a new line.', 'Enter कुंजी नई पंक्ति शुरू करती है।'),
(199, 3, 'Computer', 'Keyboard', 'Easy', 'Which key is used to move to a new line in a document?', 'दस्तावेज़ में नई पंक्ति पर जाने के लिए कौन-सी कुंजी प्रयुक्त होती है?', 'Ctrl', 'Ctrl', 'Enter', 'Enter', 'Shift', 'Shift', 'Alt', 'Alt', 'B', 1, 'Enter key starts a new line.', 'Enter कुंजी नई पंक्ति शुरू करती है।'),
(200, 3, 'Computer', 'Keyboard', 'Easy', 'Which key is used to move to a new line in a document?', 'दस्तावेज़ में नई पंक्ति पर जाने के लिए कौन-सी कुंजी प्रयुक्त होती है?', 'Ctrl', 'Ctrl', 'Enter', 'Enter', 'Shift', 'Shift', 'Alt', 'Alt', 'B', 1, 'Enter key starts a new line.', 'Enter कुंजी नई पंक्ति शुरू करती है।'),
(201, 3, 'Computer', 'Keyboard', 'Easy', 'Which key is used to move to a new line in a document?', 'दस्तावेज़ में नई पंक्ति पर जाने के लिए कौन-सी कुंजी प्रयुक्त होती है?', 'Ctrl', 'Ctrl', 'Enter', 'Enter', 'Shift', 'Shift', 'Alt', 'Alt', 'B', 1, 'Enter key starts a new line.', 'Enter कुंजी नई पंक्ति शुरू करती है।'),
(202, 3, 'Computer', 'Keyboard', 'Easy', 'Which key is used to move to a new line in a document?', 'दस्तावेज़ में नई पंक्ति पर जाने के लिए कौन-सी कुंजी प्रयुक्त होती है?', 'Ctrl', 'Ctrl', 'Enter', 'Enter', 'Shift', 'Shift', 'Alt', 'Alt', 'B', 1, 'Enter key starts a new line.', 'Enter कुंजी नई पंक्ति शुरू करती है।'),
(203, 3, 'Computer', 'Keyboard', 'Easy', 'Which key is used to move to a new line in a document?', 'दस्तावेज़ में नई पंक्ति पर जाने के लिए कौन-सी कुंजी प्रयुक्त होती है?', 'Ctrl', 'Ctrl', 'Enter', 'Enter', 'Shift', 'Shift', 'Alt', 'Alt', 'B', 1, 'Enter key starts a new line.', 'Enter कुंजी नई पंक्ति शुरू करती है।'),
(204, 3, 'Computer', 'Keyboard', 'Easy', 'Which key is used to move to a new line in a document?', 'दस्तावेज़ में नई पंक्ति पर जाने के लिए कौन-सी कुंजी प्रयुक्त होती है?', 'Ctrl', 'Ctrl', 'Enter', 'Enter', 'Shift', 'Shift', 'Alt', 'Alt', 'B', 1, 'Enter key starts a new line.', 'Enter कुंजी नई पंक्ति शुरू करती है।'),
(205, 3, 'Computer', 'Keyboard', 'Easy', 'Which key is used to move to a new line in a document?', 'दस्तावेज़ में नई पंक्ति पर जाने के लिए कौन-सी कुंजी प्रयुक्त होती है?', 'Ctrl', 'Ctrl', 'Enter', 'Enter', 'Shift', 'Shift', 'Alt', 'Alt', 'B', 1, 'Enter key starts a new line.', 'Enter कुंजी नई पंक्ति शुरू करती है।'),
(206, 3, 'Computer', 'Keyboard', 'Easy', 'Which key is used to move to a new line in a document?', 'दस्तावेज़ में नई पंक्ति पर जाने के लिए कौन-सी कुंजी प्रयुक्त होती है?', 'Ctrl', 'Ctrl', 'Enter', 'Enter', 'Shift', 'Shift', 'Alt', 'Alt', 'B', 1, 'Enter key starts a new line.', 'Enter कुंजी नई पंक्ति शुरू करती है।'),
(207, 3, 'Computer', 'Keyboard', 'Easy', 'Which key is used to move to a new line in a document?', 'दस्तावेज़ में नई पंक्ति पर जाने के लिए कौन-सी कुंजी प्रयुक्त होती है?', 'Ctrl', 'Ctrl', 'Enter', 'Enter', 'Shift', 'Shift', 'Alt', 'Alt', 'B', 1, 'Enter key starts a new line.', 'Enter कुंजी नई पंक्ति शुरू करती है।'),
(208, 3, 'CDP', 'Teaching-Learning Process', 'Easy', 'Effective teaching-learning process should be:', 'प्रभावी शिक्षण-अधिगम प्रक्रिया कैसी होनी चाहिए?', 'rigid only', 'rigid only', 'interactive', 'interactive', 'fear-based', 'fear-based', 'one-way', 'one-way', 'B', 1, 'Interaction supports better learning.', 'परस्पर क्रिया बेहतर अधिगम में सहायक होती है।'),
(209, 3, 'CDP', 'Teaching-Learning Process', 'Easy', 'Effective teaching-learning process should be:', 'प्रभावी शिक्षण-अधिगम प्रक्रिया कैसी होनी चाहिए?', 'rigid only', 'rigid only', 'interactive', 'interactive', 'fear-based', 'fear-based', 'one-way', 'one-way', 'B', 1, 'Interaction supports better learning.', 'परस्पर क्रिया बेहतर अधिगम में सहायक होती है।'),
(210, 3, 'CDP', 'Teaching-Learning Process', 'Easy', 'Effective teaching-learning process should be:', 'प्रभावी शिक्षण-अधिगम प्रक्रिया कैसी होनी चाहिए?', 'rigid only', 'rigid only', 'interactive', 'interactive', 'fear-based', 'fear-based', 'one-way', 'one-way', 'B', 1, 'Interaction supports better learning.', 'परस्पर क्रिया बेहतर अधिगम में सहायक होती है।'),
(211, 3, 'CDP', 'Teaching-Learning Process', 'Easy', 'Effective teaching-learning process should be:', 'प्रभावी शिक्षण-अधिगम प्रक्रिया कैसी होनी चाहिए?', 'rigid only', 'rigid only', 'interactive', 'interactive', 'fear-based', 'fear-based', 'one-way', 'one-way', 'B', 1, 'Interaction supports better learning.', 'परस्पर क्रिया बेहतर अधिगम में सहायक होती है।'),
(212, 3, 'CDP', 'Teaching-Learning Process', 'Easy', 'Effective teaching-learning process should be:', 'प्रभावी शिक्षण-अधिगम प्रक्रिया कैसी होनी चाहिए?', 'rigid only', 'rigid only', 'interactive', 'interactive', 'fear-based', 'fear-based', 'one-way', 'one-way', 'B', 1, 'Interaction supports better learning.', 'परस्पर क्रिया बेहतर अधिगम में सहायक होती है।');

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `id` int(11) NOT NULL,
  `full_name` varchar(100) NOT NULL,
  `father_name` varchar(100) NOT NULL,
  `dob` date NOT NULL,
  `age` int(11) DEFAULT NULL,
  `gender` enum('Male','Female','Other') DEFAULT NULL,
  `stream` enum('Science','Arts') DEFAULT NULL,
  `level` varchar(50) DEFAULT NULL,
  `batch` enum('Online','Offline') DEFAULT NULL,
  `language_pref` varchar(50) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `district` varchar(50) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `pin_code` varchar(10) DEFAULT NULL,
  `mobile_no` varchar(15) DEFAULT NULL,
  `email_id` varchar(100) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `status` enum('Active','Inactive') DEFAULT 'Active',
  `reg_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`id`, `full_name`, `father_name`, `dob`, `age`, `gender`, `stream`, `level`, `batch`, `language_pref`, `address`, `district`, `city`, `pin_code`, `mobile_no`, `email_id`, `password`, `status`, `reg_date`) VALUES
(1, 'KUMARI SNEHA RANI', 'MOHAN MAHTO', '1996-04-10', 29, 'Female', 'Arts', 'Level-2', 'Online', 'English', 'BSNL OFFICE RAILWAY ACCOUNT COLONY\r\nPolice station No 02', 'Palamu', 'Daltonganj', '833102', '9693614390', '2016snehasingh@gmail.com', '$2y$10$DjNKmOrT68OSfvXeaWe4ROxNunrcQEPmnARZSA6SnWCTFb/iurXgO', 'Active', '2026-04-01 10:52:54');

-- --------------------------------------------------------

--
-- Stand-in structure for view `student_leaderboard`
-- (See below for the actual view)
--
CREATE TABLE `student_leaderboard` (
`exam_id` int(11)
,`exam_title` varchar(255)
,`student_id` int(11)
,`full_name` varchar(100)
,`district` varchar(50)
,`batch` enum('Online','Offline')
,`obtained_marks` int(11)
,`total_questions` int(11)
,`attempt_number` int(11)
,`submitted_at` timestamp
,`student_rank` bigint(21)
);

-- --------------------------------------------------------

--
-- Table structure for table `subjects`
--

CREATE TABLE `subjects` (
  `id` int(11) NOT NULL,
  `subject_name` varchar(100) NOT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure for view `student_leaderboard`
--
DROP TABLE IF EXISTS `student_leaderboard`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `student_leaderboard`  AS SELECT `ea`.`exam_id` AS `exam_id`, `e`.`exam_title` AS `exam_title`, `ea`.`student_id` AS `student_id`, `s`.`full_name` AS `full_name`, `s`.`district` AS `district`, `s`.`batch` AS `batch`, `ea`.`obtained_marks` AS `obtained_marks`, `ea`.`total_questions` AS `total_questions`, `ea`.`attempt_number` AS `attempt_number`, `ea`.`submitted_at` AS `submitted_at`, rank() over ( partition by `ea`.`exam_id` order by `ea`.`obtained_marks` desc,`ea`.`submitted_at`) AS `student_rank` FROM ((`exam_attempts` `ea` join `students` `s` on(`ea`.`student_id` = `s`.`id`)) join `exams` `e` on(`ea`.`exam_id` = `e`.`id`)) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `classes`
--
ALTER TABLE `classes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ebooks`
--
ALTER TABLE `ebooks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `subject_id` (`subject_id`);

--
-- Indexes for table `exams`
--
ALTER TABLE `exams`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `exam_attempts`
--
ALTER TABLE `exam_attempts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `student_id` (`student_id`),
  ADD KEY `exam_id` (`exam_id`);

--
-- Indexes for table `fee_ledgers`
--
ALTER TABLE `fee_ledgers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `student_id` (`student_id`);

--
-- Indexes for table `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `exam_id` (`exam_id`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mobile_no` (`mobile_no`),
  ADD UNIQUE KEY `email_id` (`email_id`);

--
-- Indexes for table `subjects`
--
ALTER TABLE `subjects`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `classes`
--
ALTER TABLE `classes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `ebooks`
--
ALTER TABLE `ebooks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `exams`
--
ALTER TABLE `exams`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `exam_attempts`
--
ALTER TABLE `exam_attempts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `fee_ledgers`
--
ALTER TABLE `fee_ledgers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `questions`
--
ALTER TABLE `questions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=213;

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `subjects`
--
ALTER TABLE `subjects`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `ebooks`
--
ALTER TABLE `ebooks`
  ADD CONSTRAINT `ebooks_ibfk_1` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `exam_attempts`
--
ALTER TABLE `exam_attempts`
  ADD CONSTRAINT `exam_attempts_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `exam_attempts_ibfk_2` FOREIGN KEY (`exam_id`) REFERENCES `exams` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `fee_ledgers`
--
ALTER TABLE `fee_ledgers`
  ADD CONSTRAINT `fee_ledgers_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `questions`
--
ALTER TABLE `questions`
  ADD CONSTRAINT `questions_ibfk_1` FOREIGN KEY (`exam_id`) REFERENCES `exams` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
