-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 10, 2023 at 04:56 PM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 8.0.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ecomdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `custid` int(11) NOT NULL,
  `pass` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`custid`, `pass`, `name`) VALUES
(1, 'basit', 'Basit'),
(456123, '123', 'Yajooj');

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2023-04-09 12:18:11.548653'),
(2, 'auth', '0001_initial', '2023-04-09 12:18:12.675115'),
(3, 'admin', '0001_initial', '2023-04-09 12:18:13.008269'),
(4, 'admin', '0002_logentry_remove_auto_add', '2023-04-09 12:18:13.028069'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2023-04-09 12:18:13.042931'),
(6, 'contenttypes', '0002_remove_content_type_name', '2023-04-09 12:18:13.154067'),
(7, 'auth', '0002_alter_permission_name_max_length', '2023-04-09 12:18:13.255611'),
(8, 'auth', '0003_alter_user_email_max_length', '2023-04-09 12:18:13.333563'),
(9, 'auth', '0004_alter_user_username_opts', '2023-04-09 12:18:13.374538'),
(10, 'auth', '0005_alter_user_last_login_null', '2023-04-09 12:18:13.481495'),
(11, 'auth', '0006_require_contenttypes_0002', '2023-04-09 12:18:13.488492'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2023-04-09 12:18:13.503483'),
(13, 'auth', '0008_alter_user_username_max_length', '2023-04-09 12:18:13.536318'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2023-04-09 12:18:13.571395'),
(15, 'auth', '0010_alter_group_name_max_length', '2023-04-09 12:18:13.607554'),
(16, 'auth', '0011_update_proxy_permissions', '2023-04-09 12:18:13.623625'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2023-04-09 12:18:13.653605'),
(18, 'sessions', '0001_initial', '2023-04-09 12:18:13.730867');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('rrb3g1cyiz8u7p6pcr9v3n8u6zdzsz2m', 'e30:1plaCu:ZKcydmlC4Gn_SL4YOjao6IL_wXbcoP_FWL6SxjcP_jA', '2023-04-23 18:56:08.341925');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `price` varchar(255) NOT NULL,
  `cost` varchar(255) NOT NULL,
  `stock` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `category` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `image`, `price`, `cost`, `stock`, `description`, `category`) VALUES
(3, 'Lenovo Flex 5 Laptop, 14.0', 'laptop1.jpg', '599.99', '599.99', '0', 'With the latest AMD Ryzen 5 U series processors and 16GB DDR4 RAM, enjoy excellent performance Create, play, stream, and work in any position, surface or incline with a 360° hinge that lets you watch shows, present and share in tent and stand modes and browse while in tablet mode', 'Laptop'),
(4, 'HP 2023 15\'\' HD IPS Laptop', 'laptop2.jpg', '279.99', '279.99', '0', 'This product will have a battery that exceeds 80% capacity relative to new. Accessories may not be original, but will be compatible and fully functional. Product may come in generic box.', 'Laptop'),
(5, 'LG gram (2022) 17Z90Q', 'laptop3.jpg', '2,299.99', '2,299.99', '0', 'Intel Platform Powered by 12th Gen Intel Core i7 Processor and NVIDIA Graphics. A powerful processor with NVIDIA graphics, built to carry you through work, studies, and surfing the web.32GB RAM. 32GB of memory to a substantial clock speed of 5200 Mhz, we’re making it simple to do work and play with minimal buffering.', 'Laptop'),
(6, 'Acer Chromebook 315 Laptop | Intel Celeron N5100 | 15.6', 'laptop4.jpg', '379.99', '379.99', '0', 'Get access to more than 2 million Android apps from Google Play to learn and do more.Chromebooks come with built-in storage for offline access to your most important files and an additional 100GB of Google Drive space to ensure that all of your files are backed up automatically.', 'Laptop'),
(7, '', 'laptop5.jpg', '1,399.99', '1,399.99', '0', 'Thin, light, elegant design in choice of two sizes: light, portable 13.5” or larger 15” that’s perfect for split-screen multitasking.Show your best side on video calls with sharp video and image quality, even in low light, thanks to a front-facing 720p HD camera', 'Laptop'),
(8, 'Amazfit Bip U Pro Smart Watch', 'watch1.jpg', '69.99', '69.99', '0', '【ALEXA & GPS BUILT-IN】You can talk to Amazon Alexa on your Amazfit Bip U Pro smartwatch, Ask questions, get translations, check the weather, control your smart home devices and more. And get precise tracking of your distance, daily step count thanks to integrated GPS..Water resistance depth:50 meters.Supported Application:Alarm,Breath', 'Watches'),
(9, 'Fitbit Sense2', 'watch2.jpg', '249.95', '249.95', '0', 'Manage stress and live healthier:  all-day stress detection with cEDA and daily Stress Management Score, ECG app for atrial fibrillation assessment(1), irregular heart rhythm notifications(2), SpO2(3), health metrics dashboard(4), mindfulness content', 'Watches'),
(10, 'Fitbit Charge5', 'watch3.jpg', '129.95', '129.95', '0', 'Get a daily Stress Management Score showing your body’s response to stress and take steps to improve your levels with an on-wrist EDA sensor mindfulness session. Band Size:Sm: Fits wrist 5.1 . Lrg: Fits wrist 6.7', 'Watches'),
(11, 'Withings ScanWatch', 'watch4.jpg', '299.99', '299.99', '0', 'SLEEP TRACKING — Sleep tracker delivers a Score based on light and deep sleep cycles, sleep duration & wake-ups. HEART RATE TRACKING — Track heart rate continuously during workouts to optimize training, and monitor daily and overnight heart rate to help improve health over time.', 'Watches'),
(12, 'SAMSUNG Galaxy Watch5', 'watch5.jpg', '449.00', '449.00', '0', 'ADVANCED SLEEP COACHING: Manage your overall sleep quality with an advanced sleep tracker that detects and analyzes sleep stages while you rest; Plus, Advanced Sleep Coaching helps you develop better sleep habits by analyzing your sleep patterns*.Supported Application:Fitness Tracker,Elevation Tracker,GPS,Multisport Tracker,Time Display. Connectivity technology:Bluetooth. Wireless comm standard:Bluetooth,802_11_AGNAC', 'Watches'),
(13, 'Light Blocking Reading Glasses', 'glasses1.jpg', '29.00', '29.00', '0', 'Non Polarized Ultra Violet, Protection Coating ,coating Lens width: 51 millimeter', 'Glasses'),
(14, 'Milano Aluminum Case', 'glasses2.jpg', ' 49.95', ' 49.95', '0', 'Bridge: 15 millimeters Comfort: ThinOptics reading glasses are feather-light. They grip with gentle pressure and can be moved up or down your nose for optimal fit and comfort.', 'Glasses'),
(15, 'FONHCOO ', 'glasses3.jpg', '15.95', '15.95', '0', '【NEW TRENDY GLASSES STYLE 】- The glasses for computer eye strain have TR90 soft materials and fashion round Flesh Pink transparent color frames lend these women\'s eyeglasses an edgy-meets-feminine touch. The blue light blocking glasses comes with durable flexible spring hinges, all the details ensuring you a durability and comfortable long-term wearing. Its lightweight material can reduce the burden on your bridge of the nose. You can be delicate and girly, while being edgy and bold.', 'Glasses'),
(16, 'SOJOS Classic Square', 'glasses4.jpg', '14.95', '14.95', '0', 'BLUE LIGHT BLOCKER & REPLACEABLE LENSES – Reduce symptoms of eyestrain during prolonged computer exposure. These glasses are best used for long hours of computer use to maintain natural sleep patterns and eye protection. The original lenses can be replaced with your prescription lenses at any store.', 'Glasses'),
(17, 'Cat-Eye', 'glasses5.jpg', '25.46', '25.46', '0', 'Anti-Reflective Coating coating Lens width: 56 millimetersBridge: 18 millimeters', 'Glasses'),
(18, 'TC5385 Ball Joint', 'Autopart1.jpg', '22.86', '22.86', '0', 'New, not remanufacturedDelphi ball joints manufactured with high quality forgings for increased strength and smooth operation', 'AutoParts'),
(19, 'Bushing Kit', 'Autopart2.jpg', '10.80', '10.80', '0', 'Package Dimensions: 14.224 H x 8.382 L x 10.668 W (centimeters)Package Weight: 1.179 kilogramsCountry of Origin : China', 'AutoParts'),
(20, '101-8435 Tie Rod End', 'Autopart3.jpg', '21.77', '21.77', '0', 'Ball joint is pre-greasedEasy access wrench flat allows for the use of a socket for easy installation and removalFull ball stud', 'AutoParts'),
(21, 'SBO0121 Starter Compatible', 'Autopart4.jpg', '68.17', '68.17', '0', '1-year warranty protects you after your purchase. We\'re confident that our products will work flawlessly once installed in your vehicle. But in a rare case that it does not, we\'ll replace it anytime within one year of your order. If you have a problem, we will take every step to assist you, contact us for a replacement.', 'AutoParts'),
(22, 'K6472 Rack ', 'Autopart5.jpg', '21.51', '21.51', '0', 'Engineered to provide long life and depend abilityConstruction and design validated by MOOG engineers Incorporates proven design and engineering features', 'AutoParts'),
(23, 'Wicker Papasan Chair', 'furniture1.jpg', '151.99', '151.99', '0', 'Enjoy the boho styling of our durable resin wicker wrapped over a metal frame and nest into the generously large Dacron-filled cushionComplete with a 360° swivel to twist and turn to your heart’s content', 'Furnitures'),
(24, 'Bed', 'furniture2.jpg', '114.23', '114.23', '0', 'Comes with metal side rails, center metal rail and additional metal legs for guaranteed stability, support and durability Includes wooden slats system that allows air circulation for your mattress as well as the right amount of support. Does not require foundation.', 'Furnitures'),
(25, 'Foam Mattress', 'furniture3.jpg', '240.73', '240.73', '0', 'General Note: Please allow 24 - 72 hours for your Mattress to regain its full shape. Any memory foam will expand faster in a warmer room. In cold temperature, at delivery, your mattress may take a bit longer to return to full sized from its compressed state.The expansion time of the mattress will vary as per the surrounding.', 'Furnitures'),
(26, 'Night Stands for Bedroom', 'furniture4.jpg', '79.93', '79.93', '0', 'Enviroment-friendly: The Nightstands are made with environment-friendly MDF Board and X structure metal legs. The wooden side table is strong enough to support table lamps, books, photo frames and other things on it..Assembly Required.Material:Wood', 'Furnitures'),
(27, 'Bookshelf', 'furniture5.jpg', '79.00', '79.00', '0', '【Sturdy & Stable Construction】: Vecelo 5 tier bookshelf is constructed by industrial metal frame and quality engineer wood, X shape guardrail prevent your items falling.Industrial bookshelf can be fixed on the wall in order to more stable.No shaking No wobbling.Each panel can hold up to 30 lbs', 'Furnitures'),
(28, 'Knife Sharpener ', 'accessiories1.jpg', '49.0', '49.0', '0', '3-Step Knife Sharpener: With our incredible 3-slot system, we’re revolutionizing the art of knife sharpening! The 1st diamond sharpening rod repairs and straightens damaged blades before the 2nd slot sharpens to restore its V-shape. Finally, the 3rd slot fine tunes for a clean polish.', 'Kitchen'),
(29, 'Dish Drying Rack', 'accessiories2.jpg', '20.99', '20.99', '0', 'MULTI-PURPOSE】: This folding sink dish drying rack not only can be used as a dish drainer for air-drying kitchenware, such as washed bowls, pans, glasses, cups, plates, cookware, glassware, cutlery, saucepan, mugs; but also as a vegetable colander for fruit and veggie wash; or as a non-slip trivet mat for hot pots or bakeware on countertop.', 'Kitchen'),
(30, 'Pressure Cooker', 'accessiories3.jpg', '129.95', '129.95', '0', 'THE MOST VERSITILE: The ONLY Multi-Cooker with a Premium Cookware Grade Inner Pot with Stay-Cool Silicone Handles. - Meaning you can take it from your Insta Pot to your stove top!CONVENIENT FAVORITES: 5 programmable settings for your own special recipes', 'Kitchen'),
(31, 'Vegetable Chopper', 'accessiories4.jpg', '34.99', '34.99', '0', 'Best functionality on the market - Everything you need are all in our all-in-one multipurpose cooking gadgets. 7 easy to change inserts including two different sized chopper blades and two spiralizer inserts give you the option of broad ribbons or thin spirals. Our vegetable choppers make nifty cooking gifts for women and men.', 'Kitchen'),
(32, 'Dinnerware Set', 'accessiories5.jpg', '40.94', '40.94', '0', 'CLASSIC DESIGN: a classic white square shape dinnerware set with everyday elegance. WHAT’S IN THE BOX: Service for 4 that includes 4 of each of the following: 9. 5” Dinner Plates, 7. 25” Dessert Plates, 7” Bowls, 12 OZ Mugs.', 'Kitchen'),
(33, 'Long-Sleeve Flannel Shirt', 'menshirt1.jpg', '39.99', '39.99', '0', 'Machine Wash ,Contrasting corduroy lined collar and cuffs ,Great look and lasting durability ,Left chest pocket with pencil slot and button closure ,Double pleat back for ease of movement', 'Men'),
(34, 'Jacket', 'menshirt2.jpg', '99.99', '99.99', '0', 'Polyester Blend lining  ,Snap closure  ,Machine Wash  ,Flannel lined and rugged cotton suede look  ,Features antique brass Legendary snaps', 'Men'),
(35, 'Long Sleeve T-Shirt ', 'menshirt3.jpg', '27.99', '27.99', '0', 'Machine Wash  ,Tagless Label, eliminates scratching  ,Double needle stitching  ,Screen printed sleeves and left chest design', 'Men'),
(36, 'Stretch Chino Pant', 'menpant1.jpg', '21.10', '21.10', '0', 'A flat-front dressy chino that offers classic style all week long. Made to be wrinkle-resistant and easy-care with a traditional relaxed, broken-in look and fit Generous classic fit that sits at waist. Roomy through seat and thigh with a straight leg. Zip fly with button closure, side pockets, and button pockets at the back', 'Men'),
(37, 'Fit Cargo Pants ', 'menpant2.jpg', '104.59', '104.59', '0', 'Modern cargo pant features a precise tapered fit and contrast pocket details  ,Straight Tapered Fit: Tapered fit, regular rise, straight through thigh and narrows from knee to hem  ,Articulated knees, deep thigh pockets and a zip pocket. Inside, soft cotton lines the waistband', 'Men'),
(38, 'Long Sleeve Western Shirt ', 'womenshirt1.jpg', '37.91', '37.91', '0', 'Machine Wash ,Long sleeves ,One point front and back yokes ,Riser label on left pocket flap', 'Women'),
(39, 'Sleeve Plaid Shirts ', 'womenshirt2.jpg', '29.00', '29.00', '0', 'Floral printed / Plaid shirts/ Striped Blouse for women fashion 2022 new design for coming of Spring Summer Seasons, these womens tops are well made for cool weather, adjustable zipper V neck with cute fake pocket flap fashion design, the pocket for decor only, please be well noted. Zipper up notch V-neck, Cuffed sleeve blouse for elegant lady work casual', 'Women'),
(40, 'Casual Long Sleeve Shirts  ', 'womenshirt3.jpg', '35.98', '35.98', '0', '95% Polyester, 5% Spandex  ,Pull On closure  ,Type: women long shirts with pocket, womens oversized t shirts, solid color oversized shirts for women, color block tunic with pockets, tunic tops to wear with leggings, thanksgiving shirts for women,christmas shirts for women', 'Women'),
(41, 'Twill Pants', 'womenpant1.jpg', '18.38', '18.38', '0', 'Machine Wash, BREATHABLE COTTON TWILL: Our super soft, relaxed fit cotton twill pants are easy on the eyes and the body; A great option for warmer months, our twill pants are made from a unique blend of cotton and spandex to ensure maximum comfort during all seasons.', 'Women'),
(42, 'Tapered Leg Pant', 'womenpant2.jpg', '77.31', '77.31', '0', 'Machine Wash ,PANT: This high waisted pant is the perfect addition to any closet. Fashioned with a stretchy blend, a tapered leg, a front zipper, and a sheer fabric detail. Machine washable. ,COMPOSITION: This high quality pant is true to size and is made from a stretchy blend designed for maximum comfort without compromising style.', 'Women');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
