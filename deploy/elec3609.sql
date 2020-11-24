-- phpMyAdmin SQL Dump
-- version 4.4.15.10
-- https://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Nov 24, 2020 at 09:44 AM
-- Server version: 5.7.31-log
-- PHP Version: 5.6.40

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `elec3609`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE IF NOT EXISTS `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE IF NOT EXISTS `auth_group_permissions` (
  `id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE IF NOT EXISTS `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8;

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
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add upload_comment_meta', 7, 'add_upload_comment_meta'),
(26, 'Can change upload_comment_meta', 7, 'change_upload_comment_meta'),
(27, 'Can delete upload_comment_meta', 7, 'delete_upload_comment_meta'),
(28, 'Can view upload_comment_meta', 7, 'view_upload_comment_meta'),
(29, 'Can add user', 8, 'add_user'),
(30, 'Can change user', 8, 'change_user'),
(31, 'Can delete user', 8, 'delete_user'),
(32, 'Can view user', 8, 'view_user'),
(33, 'Can add user_follow', 9, 'add_user_follow'),
(34, 'Can change user_follow', 9, 'change_user_follow'),
(35, 'Can delete user_follow', 9, 'delete_user_follow'),
(36, 'Can view user_follow', 9, 'view_user_follow'),
(37, 'Can add calendar', 10, 'add_calendar'),
(38, 'Can change calendar', 10, 'change_calendar'),
(39, 'Can delete calendar', 10, 'delete_calendar'),
(40, 'Can view calendar', 10, 'view_calendar'),
(41, 'Can add category', 11, 'add_category'),
(42, 'Can change category', 11, 'change_category'),
(43, 'Can delete category', 11, 'delete_category'),
(44, 'Can view category', 11, 'view_category'),
(45, 'Can add recipe', 12, 'add_recipe'),
(46, 'Can change recipe', 12, 'change_recipe'),
(47, 'Can delete recipe', 12, 'delete_recipe'),
(48, 'Can view recipe', 12, 'view_recipe'),
(49, 'Can add recipe_mark', 13, 'add_recipe_mark'),
(50, 'Can change recipe_mark', 13, 'change_recipe_mark'),
(51, 'Can delete recipe_mark', 13, 'delete_recipe_mark'),
(52, 'Can view recipe_mark', 13, 'view_recipe_mark'),
(53, 'Can add recipe_category', 14, 'add_recipe_category'),
(54, 'Can change recipe_category', 14, 'change_recipe_category'),
(55, 'Can delete recipe_category', 14, 'delete_recipe_category'),
(56, 'Can view recipe_category', 14, 'view_recipe_category'),
(57, 'Can add comment', 15, 'add_comment'),
(58, 'Can change comment', 15, 'change_comment'),
(59, 'Can delete comment', 15, 'delete_comment'),
(60, 'Can view comment', 15, 'view_comment'),
(61, 'Can add step', 16, 'add_step'),
(62, 'Can change step', 16, 'change_step'),
(63, 'Can delete step', 16, 'delete_step'),
(64, 'Can view step', 16, 'view_step'),
(65, 'Can add ingredient', 17, 'add_ingredient'),
(66, 'Can change ingredient', 17, 'change_ingredient'),
(67, 'Can delete ingredient', 17, 'delete_ingredient'),
(68, 'Can view ingredient', 17, 'view_ingredient'),
(69, 'Can add recipe_favourite', 18, 'add_recipe_favourite'),
(70, 'Can change recipe_favourite', 18, 'change_recipe_favourite'),
(71, 'Can delete recipe_favourite', 18, 'delete_recipe_favourite'),
(72, 'Can view recipe_favourite', 18, 'view_recipe_favourite');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE IF NOT EXISTS `auth_user` (
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE IF NOT EXISTS `auth_user_groups` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE IF NOT EXISTS `auth_user_user_permissions` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `calendar`
--

CREATE TABLE IF NOT EXISTS `calendar` (
  `id` int(11) NOT NULL,
  `date` date NOT NULL,
  `meal_type` varchar(30) NOT NULL,
  `recipe_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `calendar`
--

INSERT INTO `calendar` (`id`, `date`, `meal_type`, `recipe_id`, `user_id`) VALUES
(1, '2020-11-18', 'breakfirst', 2, 1),
(2, '2020-11-18', 'lunch', 3, 1),
(3, '2020-11-18', 'dinner', 4, 1),
(4, '2020-11-15', 'breakfirst', 69, 6),
(5, '2020-11-18', 'breakfirst', 58, 6),
(6, '2020-11-17', 'dinner', 57, 6),
(7, '2020-11-19', 'breakfirst', 2, 1),
(8, '2020-11-24', 'breakfirst', 4, 41),
(9, '2020-11-17', 'breakfirst', 3, 42),
(10, '2020-11-18', 'breakfirst', 38, 42),
(11, '2020-11-18', 'breakfirst', 38, 43),
(12, '2020-11-19', 'breakfirst', 5, 43),
(13, '2020-11-19', 'lunch', 38, 43),
(14, '2020-11-18', 'lunch', 13, 43),
(15, '2020-11-20', 'breakfirst', 1, 1),
(16, '2020-11-17', 'breakfirst', 1, 1),
(17, '2020-11-21', 'breakfirst', 5, 1),
(18, '2020-11-19', 'lunch', 1, 1),
(19, '2020-11-20', 'lunch', 1, 1),
(20, '2020-11-17', 'lunch', 5, 1),
(21, '2020-11-18', 'breakfirst', 7, 45),
(22, '2020-11-17', 'breakfirst', 38, 46),
(23, '2020-11-26', 'breakfirst', 1, 1),
(24, '2020-11-27', 'breakfirst', 5, 1);

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE IF NOT EXISTS `category` (
  `id` int(11) NOT NULL,
  `category` varchar(200) NOT NULL,
  `total_recipe` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `category`, `total_recipe`) VALUES
(1, 'Breakfast', 23),
(2, 'Lunch', 19),
(3, 'Dinner', 29),
(4, 'Meatlovers', 27),
(5, 'Vegetarian', 17),
(6, 'Asian', 21),
(7, 'Italian', 18),
(8, 'Dessert', 20),
(9, 'Seafood', 22);

-- --------------------------------------------------------

--
-- Table structure for table `comment`
--

CREATE TABLE IF NOT EXISTS `comment` (
  `id` int(11) NOT NULL,
  `comment_content` varchar(500) NOT NULL,
  `comment_publish_date` datetime(6) NOT NULL,
  `comment_recipe_id` int(11) NOT NULL,
  `comment_user_id` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `comment`
--

INSERT INTO `comment` (`id`, `comment_content`, `comment_publish_date`, `comment_recipe_id`, `comment_user_id`) VALUES
(1, 'hihi', '2020-11-19 10:45:28.591574', 3, 1),
(2, 'hi\n', '2020-11-19 10:46:46.381627', 3, 1),
(3, 'nj', '2020-11-19 10:49:48.753715', 3, 1),
(4, 'ss', '2020-11-19 11:13:01.073720', 4, 1),
(5, 'hihi', '2020-11-19 11:31:22.754142', 6, 1),
(6, '', '2020-11-19 11:31:26.168574', 2, 1),
(7, 'hihi', '2020-11-19 11:31:30.706330', 2, 1),
(8, '111', '2020-11-19 12:53:52.368326', 13, 1),
(9, '', '2020-11-19 14:08:15.062704', 2, 1),
(10, 'Looks nice!', '2020-11-20 01:49:05.642608', 7, 6),
(11, 'Looks good!', '2020-11-20 04:25:15.626735', 38, 6),
(12, '', '2020-11-20 04:26:22.926134', 1, 1),
(13, 'xz', '2020-11-20 04:32:11.943049', 1, 1),
(14, 'ddmnsncm,dsnfd,msnd', '2020-11-20 04:33:31.088481', 1, 1),
(15, '1', '2020-11-20 04:35:00.993762', 37, 1),
(16, '', '2020-11-20 04:35:04.394021', 37, 1),
(17, '', '2020-11-20 04:35:13.427775', 37, 1),
(18, ' ', '2020-11-20 04:35:34.118858', 37, 1),
(19, '', '2020-11-20 04:35:39.505399', 37, 1),
(20, 'po', '2020-11-20 04:40:06.983402', 37, 1),
(21, '', '2020-11-20 04:42:04.351784', 37, 1),
(22, '', '2020-11-20 04:44:13.577354', 37, 1),
(23, 'koko', '2020-11-20 04:51:07.115282', 3, 1),
(24, '', '2020-11-20 04:56:22.070217', 3, 1),
(25, 'mnm,n', '2020-11-20 04:59:52.427264', 3, 1),
(26, 'good taste', '2020-11-20 06:01:32.997310', 12, 1),
(27, 'good', '2020-11-20 09:01:19.828673', 77, 2),
(28, 'Good!\n', '2020-11-20 10:17:47.892011', 64, 2),
(29, '666', '2020-11-20 12:38:50.726633', 2, 1),
(30, 'Good', '2020-11-20 14:09:15.098255', 38, 41),
(31, 'nice', '2020-11-20 14:23:50.971694', 38, 42),
(32, 'very good', '2020-11-20 14:39:19.731615', 38, 43),
(33, 'Really good', '2020-11-20 16:30:50.020120', 38, 46),
(34, '222', '2020-11-23 15:27:08.571540', 1, 1),
(35, '111', '2020-11-23 16:57:18.351280', 38, 1),
(36, '222', '2020-11-23 16:58:46.578486', 38, 1),
(37, '333', '2020-11-23 18:00:47.545610', 38, 1),
(38, 'Not good', '2020-11-23 18:16:13.194959', 6, 6);

-- --------------------------------------------------------

--
-- Table structure for table `comment_meta`
--

CREATE TABLE IF NOT EXISTS `comment_meta` (
  `id` int(11) NOT NULL,
  `comment_image` varchar(100) DEFAULT NULL,
  `comment_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE IF NOT EXISTS `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE IF NOT EXISTS `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(10, 'calendars', 'calendar'),
(11, 'category', 'category'),
(15, 'comments', 'comment'),
(5, 'contenttypes', 'contenttype'),
(17, 'ingredient', 'ingredient'),
(12, 'recipe', 'recipe'),
(14, 'recipe', 'recipe_category'),
(18, 'recipe', 'recipe_favourite'),
(13, 'recipe', 'recipe_mark'),
(6, 'sessions', 'session'),
(16, 'step', 'step'),
(7, 'upload', 'upload_comment_meta'),
(8, 'user', 'user'),
(9, 'user', 'user_follow');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE IF NOT EXISTS `django_migrations` (
  `id` int(11) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2020-11-19 10:11:47.822741'),
(2, 'auth', '0001_initial', '2020-11-19 10:11:47.993533'),
(3, 'admin', '0001_initial', '2020-11-19 10:11:48.488759'),
(4, 'admin', '0002_logentry_remove_auto_add', '2020-11-19 10:11:48.603464'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2020-11-19 10:11:48.623377'),
(6, 'contenttypes', '0002_remove_content_type_name', '2020-11-19 10:11:48.754184'),
(7, 'auth', '0002_alter_permission_name_max_length', '2020-11-19 10:11:48.809848'),
(8, 'auth', '0003_alter_user_email_max_length', '2020-11-19 10:11:48.865130'),
(9, 'auth', '0004_alter_user_username_opts', '2020-11-19 10:11:48.880061'),
(10, 'auth', '0005_alter_user_last_login_null', '2020-11-19 10:11:48.926198'),
(11, 'auth', '0006_require_contenttypes_0002', '2020-11-19 10:11:48.931532'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2020-11-19 10:11:48.943530'),
(13, 'auth', '0008_alter_user_username_max_length', '2020-11-19 10:11:48.995174'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2020-11-19 10:11:49.048398'),
(15, 'auth', '0010_alter_group_name_max_length', '2020-11-19 10:11:49.101046'),
(16, 'auth', '0011_update_proxy_permissions', '2020-11-19 10:11:49.114294'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2020-11-19 10:11:49.168602'),
(18, 'user', '0001_initial', '2020-11-19 10:11:49.231336'),
(19, 'category', '0001_initial', '2020-11-19 10:11:49.346076'),
(20, 'recipe', '0001_initial', '2020-11-19 10:11:49.432610'),
(21, 'calendars', '0001_initial', '2020-11-19 10:11:49.637634'),
(22, 'comments', '0001_initial', '2020-11-19 10:11:49.866008'),
(23, 'ingredient', '0001_initial', '2020-11-19 10:11:49.989376'),
(24, 'sessions', '0001_initial', '2020-11-19 10:11:50.059803'),
(25, 'step', '0001_initial', '2020-11-19 10:11:50.123042'),
(26, 'upload', '0001_initial', '2020-11-19 10:11:50.200541'),
(27, 'recipe', '0002_recipe_favourite', '2020-11-19 14:04:54.492119');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE IF NOT EXISTS `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ingredient`
--

CREATE TABLE IF NOT EXISTS `ingredient` (
  `id` int(11) NOT NULL,
  `ingredient_name` varchar(100) NOT NULL,
  `ingredient_link` varchar(1000) NOT NULL,
  `ingredient_related_recipe_id` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=531 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ingredient`
--

INSERT INTO `ingredient` (`id`, `ingredient_name`, `ingredient_link`, `ingredient_related_recipe_id`) VALUES
(1, '1 cup soy milk', 'https://shop.coles.com.au/a/national/product/sanitarium-so-good-milk-long-life-soy-regular-403029p?adId=display_DtLwZdDP-tNJSUJSu6HyfyLtNI80MDMwMjlQ', 1),
(2, '½ cup rolled oats', 'https://shop.coles.com.au/a/national/product/uncle-tobys-blueberry-grains-seeds?adId=display_P_Hnf5brfQKh3oMyj4Mc-xRtupozNTg0NzM1UA%3D%3D', 1),
(3, '1 banana, broken into chunks', 'https://shop.coles.com.au/a/national/product/coles-fresh-kids-pack-bananas', 1),
(4, '14 frozen strawberries', 'https://shop.coles.com.au/a/national/product/creativegourmet-frozen-sliced-strawberries', 1),
(5, '½ teaspoon vanilla extract', 'https://shop.coles.com.au/a/national/product/queen-essence-natural-vanilla-extract', 1),
(6, '1 ½ teaspoons white sugar', 'https://shop.coles.com.au/a/national/product/csr-white-sugar', 1),
(7, '1 cup quinoa', 'https://shop.coles.com.au/a/national/product/coles-quinoa-microwave-brown-rice', 2),
(8, '2 cups water', 'https://shop.coles.com.au/a/national/product/monini-delicato-italian-evoo-3526648p?adId=display_VnTpYMqdPo9SF5JC2mT6660gdGQzNTI2NjQ4UA%3D%3D', 2),
(9, '¼ cup extra-virgin olive oil', 'https://shop.coles.com.au/a/national/product/monini-delicato-italian-evoo-3526648p?adId=display_VnTpYMqdPo9SF5JC2mT6660gdGQzNTI2NjQ4UA%3D%3D', 2),
(10, '2 limes, juiced', 'https://shop.coles.com.au/a/national/product/limes-loose', 2),
(11, '2 teaspoons ground cumin', 'https://shop.coles.com.au/a/national/product/masterfoods-cumin-seed-ground?adId=display_ZJGaUgCltzkq8ND2J3M89La5rtszMTYzMzJQ', 2),
(12, '1 teaspoon salt', 'https://shop.coles.com.au/a/national/product/masterfoods-cumin-seed-ground?adId=display_ZJGaUgCltzkq8ND2J3M89La5rtszMTYzMzJQ', 2),
(13, '½ teaspoon red pepper flakes', 'https://shop.coles.com.au/a/national/product/coles-chilli-flakes-hot', 2),
(14, '1 ½ cups halved cherry tomatoes', 'https://shop.coles.com.au/a/national/product/coles-grinder-sea-salt', 2),
(15, '1 (15 ounce) can black beans', 'https://shop.coles.com.au/a/national/product/edgell-black-beans', 2),
(16, '5 green onions, finely chopped', 'https://shop.coles.com.au/a/national/product/onions-spring', 2),
(17, '脑子1个', 'hhh', 3),
(18, '啊啊啊', 'aaa', 3),
(19, '1 cup soy milk', 'https://shop.coles.com.au/a/national/product/sanitarium-so-good-milk-long-life-soy-regular-403029p?adId=display_DtLwZdDP-tNJSUJSu6HyfyLtNI80MDMwMjlQ', 4),
(20, '½ cup rolled oats', 'https://shop.coles.com.au/a/national/product/uncle-tobys-blueberry-grains-seeds?adId=display_P_Hnf5brfQKh3oMyj4Mc-xRtupozNTg0NzM1UA%3D%3D', 4),
(21, '1 banana, broken into chunks', 'https://shop.coles.com.au/a/national/product/coles-fresh-kids-pack-bananas', 4),
(22, '14 frozen strawberries', 'https://shop.coles.com.au/a/national/product/creativegourmet-frozen-sliced-strawberries', 4),
(23, '½ teaspoon vanilla extract', 'https://shop.coles.com.au/a/national/product/queen-essence-natural-vanilla-extract', 4),
(24, '1 ½ teaspoons white sugar', 'https://shop.coles.com.au/a/national/product/csr-white-sugar', 4),
(25, 'ascas', 'ascasc', 5),
(26, 'ascacs', 'ascacsasc', 5),
(27, 'ascas', 'ascasc', 6),
(29, '1 (7 ounce) can white tuna', 'https://shop.coles.com.au/a/national/product/john-west-tuna-slices-in-olive-oil?adId=display_EX4KRPuadjnu0cs9TlUro4q2scw1MjE3NzM1UA%3D%3D', 7),
(30, '6 tablespoons mayonnaise', 'https://shop.coles.com.au/a/national/product/thomy-mayonnaise-delikatess?adId=display_xHJ9S_GDaD4SoYHSPzbnSN2jnTc1MDMyMTE3UA%3D%3D', 7),
(31, '3 tablespoons sweet pickle relish', 'https://shop.coles.com.au/a/national/product/crosse-blackwell-pickles-branston?adId=display_EdFbwVFoQyO2RzjjQT8Gk49U49MyODAxNTVQ', 7),
(32, '1 tablespoon Parmesan cheese', 'https://shop.coles.com.au/a/national/product/kraft-cheese-parmesan-grated-cannister?adId=display_FletvPhaHy2tD5Rrmr1m2xPHPRgxNDQ4MjdQ', 7),
(33, '⅛ teaspoon dried minced onion flakes', 'https://shop.coles.com.au/a/national/product/hoyts-onion-flakes-dried', 7),
(34, '1 tablespoon dried parsley', 'https://shop.coles.com.au/a/national/product/coles-brand-parsley-flakes', 7),
(35, '1 teaspoon dried dill weed', 'https://shop.coles.com.au/a/national/product/coles-dill-leaf-tips', 7),
(36, '¼ teaspoon curry powder', 'https://shop.coles.com.au/a/national/product/hoyts-curry-powder-mild', 7),
(37, '1 pinch garlic powder', 'https://shop.coles.com.au/a/national/product/mingle-seasoning-garlic-herb-3796562p?adId=display_B0i9K0lgc6YRHRl-X4uDw1LA9jszNzk2NTYyUA%3D%3D', 7),
(38, 'asdasda', 'asda', 8),
(39, 'asdasd', 'adsaad', 8),
(40, 'dvsdvs', 'sdvsdv', 9),
(41, 'sdvs', 'sdvsdv', 9),
(42, '1 cup soy milk', 'https://shop.coles.com.au/a/national/product/sanitarium-so-good-milk-long-life-soy-regular-403029p?adId=display_DtLwZdDP-tNJSUJSu6HyfyLtNI80MDMwMjlQ', 10),
(43, '½ cup rolled oats', 'https://shop.coles.com.au/a/national/product/uncle-tobys-blueberry-grains-seeds?adId=display_P_Hnf5brfQKh3oMyj4Mc-xRtupozNTg0NzM1UA%3D%3D', 10),
(44, '1 banana, broken into chunks', 'https://shop.coles.com.au/a/national/product/coles-fresh-kids-pack-bananas', 10),
(45, '14 frozen strawberries', 'https://shop.coles.com.au/a/national/product/creativegourmet-frozen-sliced-strawberries', 10),
(46, '½ teaspoon vanilla extract', 'https://shop.coles.com.au/a/national/product/queen-essence-natural-vanilla-extract', 10),
(47, '1 ½ teaspoons white sugar', 'https://shop.coles.com.au/a/national/product/csr-white-sugar', 10),
(48, '3 pound beef briskets', 'https://www.freerangebutcher.com.au/beef-brisket/', 11),
(49, '2 bay leaves', 'https://thesourcebulkfoods.com.au/shop/cooking/bay-leaves/', 11),
(50, '2 (12 fluid ounce) bottles beer', 'https://www.danmurphys.com.au/beer', 11),
(51, '¼ cup peppercorns', 'https://peppercorns.com.au/', 11),
(52, '1 bulb garlic cloves, separated and peeled', 'https://www.woolworths.com.au/shop/productdetails/810795/woolworths-garlic-clove', 11),
(53, '12 slices day-old bread, cut into 1-inch cubes', 'https://shop.coles.com.au/a/national/product/philadelphia-light-cream-cheese-snacktub?adId=display_KlSywbv6xfDF2Ev9-gzUBaiXB04yNzgyMTY1UA%3D%3D', 12),
(54, '8 ounce cream cheese', 'https://shop.coles.com.au/a/national/product/philadelphia-light-cream-cheese-snacktub?adId=display_KlSywbv6xfDF2Ev9-gzUBaiXB04yNzgyMTY1UA%3D%3D', 12),
(55, '1 cup fresh blueberries', 'https://shop.coles.com.au/a/national/product/blueberries-prepacked', 12),
(56, '12 eggs, beaten', 'https://shop.coles.com.au/a/national/product/myrtle-creek-cage-free-x-large-eggs-12pk', 12),
(57, '2 cups milk', 'https://shop.coles.com.au/a/national/product/dairy-farmers-milk-full-cream-5519494p?adId=display_VNrH7O2Eu-dCZuYuihK9iIbsh741NTE5NDk0UA%3D%3D', 12),
(58, '1 teaspoon vanilla extract', 'https://shop.coles.com.au/a/national/product/queen-natural-vanilla-concentrated-extract', 12),
(59, '⅓ cup maple syrup', 'https://shop.coles.com.au/a/national/product/greens-maple-flavoured-syrup-squeezable', 12),
(60, '1 cup white sugar', 'https://shop.coles.com.au/a/national/product/csr-white-sugar', 12),
(61, '2 tablespoons cornstarch', 'https://shop.coles.com.au/a/national/product/coles-cornflour', 12),
(62, '1 tablespoon butter', 'https://shop.coles.com.au/a/national/product/flora-spread-margarine-original-tub?adId=display_BLhhCoo5jeZrgbcoY6WCB2ITi2wyMjIzNjNQ', 12),
(63, '12 slices day-old bread, cut into 1-inch cubes', 'https://shop.coles.com.au/a/national/product/philadelphia-light-cream-cheese-snacktub?adId=display_KlSywbv6xfDF2Ev9-gzUBaiXB04yNzgyMTY1UA%3D%3D', 13),
(64, '8 ounce cream cheese', 'https://shop.coles.com.au/a/national/product/philadelphia-light-cream-cheese-snacktub?adId=display_KlSywbv6xfDF2Ev9-gzUBaiXB04yNzgyMTY1UA%3D%3D', 13),
(65, '1 cup fresh blueberries', 'https://shop.coles.com.au/a/national/product/blueberries-prepacked', 13),
(66, '12 eggs, beaten', 'https://shop.coles.com.au/a/national/product/myrtle-creek-cage-free-x-large-eggs-12pk', 13),
(67, '2 cups milk', 'https://shop.coles.com.au/a/national/product/dairy-farmers-milk-full-cream-5519494p?adId=display_VNrH7O2Eu-dCZuYuihK9iIbsh741NTE5NDk0UA%3D%3D', 13),
(68, '1 teaspoon vanilla extract', 'https://shop.coles.com.au/a/national/product/queen-natural-vanilla-concentrated-extract', 13),
(69, '⅓ cup maple syrup', 'https://shop.coles.com.au/a/national/product/greens-maple-flavoured-syrup-squeezable', 13),
(70, '1 cup white sugar', 'https://shop.coles.com.au/a/national/product/csr-white-sugar', 13),
(71, '2 tablespoons cornstarch', 'https://shop.coles.com.au/a/national/product/coles-cornflour', 13),
(72, '1 tablespoon butter', 'https://shop.coles.com.au/a/national/product/flora-spread-margarine-original-tub?adId=display_BLhhCoo5jeZrgbcoY6WCB2ITi2wyMjIzNjNQ', 13),
(73, '12 slices day-old bread', 'https://shop.coles.com.au/a/national/product/philadelphia-light-cream-cheese-snacktub?adId=display_KlSywbv6xfDF2Ev9-gzUBaiXB04yNzgyMTY1UA%3D%3D', 14),
(74, '2 (8 ounce) packages cream cheese', 'https://shop.coles.com.au/a/national/product/philadelphia-light-cream-cheese-snacktub?adId=display_KlSywbv6xfDF2Ev9-gzUBaiXB04yNzgyMTY1UA%3D%3D', 14),
(75, '1 cup fresh blueberries', 'https://shop.coles.com.au/a/national/product/blueberries-prepacked', 14),
(76, '12 eggs, beaten', 'https://shop.coles.com.au/a/national/product/myrtle-creek-cage-free-x-large-eggs-12pk', 14),
(77, '2 cups milk', 'https://shop.coles.com.au/a/national/product/dairy-farmers-milk-full-cream-5519494p?adId=display_VNrH7O2Eu-dCZuYuihK9iIbsh741NTE5NDk0UA%3D%3D', 14),
(78, '1 teaspoon vanilla extract', 'https://shop.coles.com.au/a/national/product/queen-natural-vanilla-concentrated-extract', 14),
(79, '⅓ cup maple syrup', 'https://shop.coles.com.au/a/national/product/greens-maple-flavoured-syrup-squeezable', 14),
(80, '1 cup white sugar', 'https://shop.coles.com.au/a/national/product/csr-white-sugar', 14),
(81, '2 tablespoons cornstarch', 'https://shop.coles.com.au/a/national/product/coles-cornflour', 14),
(82, '1 tablespoon butter', 'https://shop.coles.com.au/a/national/product/flora-spread-margarine-original-tub?adId=display_BLhhCoo5jeZrgbcoY6WCB2ITi2wyMjIzNjNQ', 14),
(83, '12 slices day-old bread', 'https://shop.coles.com.au/a/national/product/philadelphia-light-cream-cheese-snacktub?adId=display_KlSywbv6xfDF2Ev9-gzUBaiXB04yNzgyMTY1UA%3D%3D', 15),
(84, '2 (8 ounce) packages cream cheese', 'https://shop.coles.com.au/a/national/product/philadelphia-light-cream-cheese-snacktub?adId=display_KlSywbv6xfDF2Ev9-gzUBaiXB04yNzgyMTY1UA%3D%3D', 15),
(85, '1 cup fresh blueberries', 'https://shop.coles.com.au/a/national/product/blueberries-prepacked', 15),
(86, '12 eggs, beaten', 'https://shop.coles.com.au/a/national/product/myrtle-creek-cage-free-x-large-eggs-12pk', 15),
(87, '2 cups milk', 'https://shop.coles.com.au/a/national/product/dairy-farmers-milk-full-cream-5519494p?adId=display_VNrH7O2Eu-dCZuYuihK9iIbsh741NTE5NDk0UA%3D%3D', 15),
(88, '1 teaspoon vanilla extract', 'https://shop.coles.com.au/a/national/product/queen-natural-vanilla-concentrated-extract', 15),
(89, '⅓ cup maple syrup', 'https://shop.coles.com.au/a/national/product/greens-maple-flavoured-syrup-squeezable', 15),
(90, '1 cup white sugar', 'https://shop.coles.com.au/a/national/product/csr-white-sugar', 15),
(91, '2 tablespoons cornstarch', 'https://shop.coles.com.au/a/national/product/coles-cornflour', 15),
(92, '1 tablespoon butter', 'https://shop.coles.com.au/a/national/product/flora-spread-margarine-original-tub?adId=display_BLhhCoo5jeZrgbcoY6WCB2ITi2wyMjIzNjNQ', 15),
(93, '12 slices day-old bread', 'https://shop.coles.com.au/a/national/product/philadelphia-light-cream-cheese-snacktub?adId=display_KlSywbv6xfDF2Ev9-gzUBaiXB04yNzgyMTY1UA%3D%3D', 16),
(94, '2 (8 ounce) packages cream cheese', 'https://shop.coles.com.au/a/national/product/philadelphia-light-cream-cheese-snacktub?adId=display_KlSywbv6xfDF2Ev9-gzUBaiXB04yNzgyMTY1UA%3D%3D', 16),
(95, '1 cup fresh blueberries', 'https://shop.coles.com.au/a/national/product/blueberries-prepacked', 16),
(96, '12 eggs, beaten', 'https://shop.coles.com.au/a/national/product/myrtle-creek-cage-free-x-large-eggs-12pk', 16),
(97, '2 cups milk', 'https://shop.coles.com.au/a/national/product/dairy-farmers-milk-full-cream-5519494p?adId=display_VNrH7O2Eu-dCZuYuihK9iIbsh741NTE5NDk0UA%3D%3D', 16),
(98, '1 teaspoon vanilla extract', 'https://shop.coles.com.au/a/national/product/queen-natural-vanilla-concentrated-extract', 16),
(99, '⅓ cup maple syrup', 'https://shop.coles.com.au/a/national/product/greens-maple-flavoured-syrup-squeezable', 16),
(100, '1 cup white sugar', 'https://shop.coles.com.au/a/national/product/csr-white-sugar', 16),
(101, '2 tablespoons cornstarch', 'https://shop.coles.com.au/a/national/product/coles-cornflour', 16),
(102, '1 tablespoon butter', 'https://shop.coles.com.au/a/national/product/flora-spread-margarine-original-tub?adId=display_BLhhCoo5jeZrgbcoY6WCB2ITi2wyMjIzNjNQ', 16),
(103, '12 slices day-old bread', 'https://shop.coles.com.au/a/national/product/philadelphia-light-cream-cheese-snacktub?adId=display_KlSywbv6xfDF2Ev9-gzUBaiXB04yNzgyMTY1UA%3D%3D', 17),
(104, '2 (8 ounce) packages cream cheese', 'https://shop.coles.com.au/a/national/product/philadelphia-light-cream-cheese-snacktub?adId=display_KlSywbv6xfDF2Ev9-gzUBaiXB04yNzgyMTY1UA%3D%3D', 17),
(105, '1 cup fresh blueberries', 'https://shop.coles.com.au/a/national/product/blueberries-prepacked', 17),
(106, '12 eggs, beaten', 'https://shop.coles.com.au/a/national/product/myrtle-creek-cage-free-x-large-eggs-12pk', 17),
(107, '2 cups milk', 'https://shop.coles.com.au/a/national/product/dairy-farmers-milk-full-cream-5519494p?adId=display_VNrH7O2Eu-dCZuYuihK9iIbsh741NTE5NDk0UA%3D%3D', 17),
(108, '1 teaspoon vanilla extract', 'https://shop.coles.com.au/a/national/product/queen-natural-vanilla-concentrated-extract', 17),
(109, '⅓ cup maple syrup', 'https://shop.coles.com.au/a/national/product/greens-maple-flavoured-syrup-squeezable', 17),
(110, '1 cup white sugar', 'https://shop.coles.com.au/a/national/product/csr-white-sugar', 17),
(111, '2 tablespoons cornstarch', 'https://shop.coles.com.au/a/national/product/coles-cornflour', 17),
(112, '1 tablespoon butter', 'https://shop.coles.com.au/a/national/product/flora-spread-margarine-original-tub?adId=display_BLhhCoo5jeZrgbcoY6WCB2ITi2wyMjIzNjNQ', 17),
(113, '12 slices day-old bread', 'https://shop.coles.com.au/a/national/product/philadelphia-light-cream-cheese-snacktub?adId=display_KlSywbv6xfDF2Ev9-gzUBaiXB04yNzgyMTY1UA%3D%3D', 18),
(114, '2 (8 ounce) packages cream cheese', 'https://shop.coles.com.au/a/national/product/philadelphia-light-cream-cheese-snacktub?adId=display_KlSywbv6xfDF2Ev9-gzUBaiXB04yNzgyMTY1UA%3D%3D', 18),
(115, '1 cup fresh blueberries', 'https://shop.coles.com.au/a/national/product/blueberries-prepacked', 18),
(116, '12 eggs, beaten', 'https://shop.coles.com.au/a/national/product/myrtle-creek-cage-free-x-large-eggs-12pk', 18),
(117, '2 cups milk', 'https://shop.coles.com.au/a/national/product/dairy-farmers-milk-full-cream-5519494p?adId=display_VNrH7O2Eu-dCZuYuihK9iIbsh741NTE5NDk0UA%3D%3D', 18),
(118, '1 teaspoon vanilla extract', 'https://shop.coles.com.au/a/national/product/queen-natural-vanilla-concentrated-extract', 18),
(119, '⅓ cup maple syrup', 'https://shop.coles.com.au/a/national/product/greens-maple-flavoured-syrup-squeezable', 18),
(120, '1 cup white sugar', 'https://shop.coles.com.au/a/national/product/csr-white-sugar', 18),
(121, '2 tablespoons cornstarch', 'https://shop.coles.com.au/a/national/product/coles-cornflour', 18),
(122, '1 tablespoon butter', 'https://shop.coles.com.au/a/national/product/flora-spread-margarine-original-tub?adId=display_BLhhCoo5jeZrgbcoY6WCB2ITi2wyMjIzNjNQ', 18),
(123, '12 slices day-old bread', 'https://shop.coles.com.au/a/national/product/philadelphia-light-cream-cheese-snacktub?adId=display_KlSywbv6xfDF2Ev9-gzUBaiXB04yNzgyMTY1UA%3D%3D', 19),
(124, '2 (8 ounce) packages cream cheese', 'https://shop.coles.com.au/a/national/product/philadelphia-light-cream-cheese-snacktub?adId=display_KlSywbv6xfDF2Ev9-gzUBaiXB04yNzgyMTY1UA%3D%3D', 19),
(125, '1 cup fresh blueberries', 'https://shop.coles.com.au/a/national/product/blueberries-prepacked', 19),
(126, '12 eggs, beaten', 'https://shop.coles.com.au/a/national/product/myrtle-creek-cage-free-x-large-eggs-12pk', 19),
(127, '2 cups milk', 'https://shop.coles.com.au/a/national/product/dairy-farmers-milk-full-cream-5519494p?adId=display_VNrH7O2Eu-dCZuYuihK9iIbsh741NTE5NDk0UA%3D%3D', 19),
(128, '1 teaspoon vanilla extract', 'https://shop.coles.com.au/a/national/product/queen-natural-vanilla-concentrated-extract', 19),
(129, '⅓ cup maple syrup', 'https://shop.coles.com.au/a/national/product/greens-maple-flavoured-syrup-squeezable', 19),
(130, '1 cup white sugar', 'https://shop.coles.com.au/a/national/product/csr-white-sugar', 19),
(131, '2 tablespoons cornstarch', 'https://shop.coles.com.au/a/national/product/coles-cornflour', 19),
(132, '1 tablespoon butter', 'https://shop.coles.com.au/a/national/product/flora-spread-margarine-original-tub?adId=display_BLhhCoo5jeZrgbcoY6WCB2ITi2wyMjIzNjNQ', 19),
(133, '12 slices day-old bread', 'https://shop.coles.com.au/a/national/product/philadelphia-light-cream-cheese-snacktub?adId=display_KlSywbv6xfDF2Ev9-gzUBaiXB04yNzgyMTY1UA%3D%3D', 20),
(134, '2 (8 ounce) packages cream cheese', 'https://shop.coles.com.au/a/national/product/philadelphia-light-cream-cheese-snacktub?adId=display_KlSywbv6xfDF2Ev9-gzUBaiXB04yNzgyMTY1UA%3D%3D', 20),
(135, '1 cup fresh blueberries', 'https://shop.coles.com.au/a/national/product/blueberries-prepacked', 20),
(136, '12 eggs, beaten', 'https://shop.coles.com.au/a/national/product/myrtle-creek-cage-free-x-large-eggs-12pk', 20),
(137, '2 cups milk', 'https://shop.coles.com.au/a/national/product/dairy-farmers-milk-full-cream-5519494p?adId=display_VNrH7O2Eu-dCZuYuihK9iIbsh741NTE5NDk0UA%3D%3D', 20),
(138, '1 teaspoon vanilla extract', 'https://shop.coles.com.au/a/national/product/queen-natural-vanilla-concentrated-extract', 20),
(139, '⅓ cup maple syrup', 'https://shop.coles.com.au/a/national/product/greens-maple-flavoured-syrup-squeezable', 20),
(140, '1 cup white sugar', 'https://shop.coles.com.au/a/national/product/csr-white-sugar', 20),
(141, '2 tablespoons cornstarch', 'https://shop.coles.com.au/a/national/product/coles-cornflour', 20),
(142, '1 tablespoon butter', 'https://shop.coles.com.au/a/national/product/flora-spread-margarine-original-tub?adId=display_BLhhCoo5jeZrgbcoY6WCB2ITi2wyMjIzNjNQ', 20),
(143, '12 slices day-old bread, cut into 1-inch cubes', 'https://shop.coles.com.au/a/national/product/philadelphia-light-cream-cheese-snacktub?adId=display_KlSywbv6xfDF2Ev9-gzUBaiXB04yNzgyMTY1UA%3D%3D', 21),
(144, '2 (8 ounce) packages cream cheese', 'https://shop.coles.com.au/a/national/product/philadelphia-light-cream-cheese-snacktub?adId=display_KlSywbv6xfDF2Ev9-gzUBaiXB04yNzgyMTY1UA%3D%3D', 21),
(145, '1 cup fresh blueberries', 'https://shop.coles.com.au/a/national/product/blueberries-prepacked', 21),
(146, '12 eggs, beaten', 'https://shop.coles.com.au/a/national/product/myrtle-creek-cage-free-x-large-eggs-12pk', 21),
(147, '2 cups milk', 'https://shop.coles.com.au/a/national/product/dairy-farmers-milk-full-cream-5519494p?adId=display_VNrH7O2Eu-dCZuYuihK9iIbsh741NTE5NDk0UA%3D%3D', 21),
(148, '1 teaspoon vanilla extract', 'https://shop.coles.com.au/a/national/product/queen-natural-vanilla-concentrated-extract', 21),
(149, '⅓ cup maple syrup', 'https://shop.coles.com.au/a/national/product/greens-maple-flavoured-syrup-squeezable', 21),
(150, '1 cup white sugar', 'https://shop.coles.com.au/a/national/product/csr-white-sugar', 21),
(151, '2 tablespoons cornstarch', 'https://shop.coles.com.au/a/national/product/coles-cornflour', 21),
(152, '1 tablespoon butter', 'https://shop.coles.com.au/a/national/product/flora-spread-margarine-original-tub?adId=display_BLhhCoo5jeZrgbcoY6WCB2ITi2wyMjIzNjNQ', 21),
(153, '12 slices day-old bread', 'https://shop.coles.com.au/a/national/product/philadelphia-light-cream-cheese-snacktub?adId=display_KlSywbv6xfDF2Ev9-gzUBaiXB04yNzgyMTY1UA%3D%3D', 22),
(154, '2 (8 ounce) packages cream cheese', 'https://shop.coles.com.au/a/national/product/philadelphia-light-cream-cheese-snacktub?adId=display_KlSywbv6xfDF2Ev9-gzUBaiXB04yNzgyMTY1UA%3D%3D', 22),
(155, '1 cup fresh blueberries', 'https://shop.coles.com.au/a/national/product/blueberries-prepacked', 22),
(156, '12 eggs, beaten', 'https://shop.coles.com.au/a/national/product/myrtle-creek-cage-free-x-large-eggs-12pk', 22),
(157, '2 cups milk', 'https://shop.coles.com.au/a/national/product/dairy-farmers-milk-full-cream-5519494p?adId=display_VNrH7O2Eu-dCZuYuihK9iIbsh741NTE5NDk0UA%3D%3D', 22),
(158, '1 teaspoon vanilla extract', 'https://shop.coles.com.au/a/national/product/queen-natural-vanilla-concentrated-extract', 22),
(159, '⅓ cup maple syrup', 'https://shop.coles.com.au/a/national/product/greens-maple-flavoured-syrup-squeezable', 22),
(160, '1 cup white sugar', 'https://shop.coles.com.au/a/national/product/csr-white-sugar', 22),
(161, '2 tablespoons cornstarch', 'https://shop.coles.com.au/a/national/product/coles-cornflour', 22),
(162, '1 tablespoon butter', 'https://shop.coles.com.au/a/national/product/flora-spread-margarine-original-tub?adId=display_BLhhCoo5jeZrgbcoY6WCB2ITi2wyMjIzNjNQ', 22),
(163, '12 slices day-old bread', 'https://shop.coles.com.au/a/national/product/philadelphia-light-cream-cheese-snacktub?adId=display_KlSywbv6xfDF2Ev9-gzUBaiXB04yNzgyMTY1UA%3D%3D', 23),
(164, '2 (8 ounce) packages cream cheese', 'https://shop.coles.com.au/a/national/product/philadelphia-light-cream-cheese-snacktub?adId=display_KlSywbv6xfDF2Ev9-gzUBaiXB04yNzgyMTY1UA%3D%3D', 23),
(165, '1 cup fresh blueberries', 'https://shop.coles.com.au/a/national/product/blueberries-prepacked', 23),
(166, '12 eggs, beaten', 'https://shop.coles.com.au/a/national/product/myrtle-creek-cage-free-x-large-eggs-12pk', 23),
(167, '2 cups milk', 'https://shop.coles.com.au/a/national/product/dairy-farmers-milk-full-cream-5519494p?adId=display_VNrH7O2Eu-dCZuYuihK9iIbsh741NTE5NDk0UA%3D%3D', 23),
(168, '1 teaspoon vanilla extract', 'https://shop.coles.com.au/a/national/product/queen-natural-vanilla-concentrated-extract', 23),
(169, '⅓ cup maple syrup', 'https://shop.coles.com.au/a/national/product/greens-maple-flavoured-syrup-squeezable', 23),
(170, '1 cup white sugar', 'https://shop.coles.com.au/a/national/product/csr-white-sugar', 23),
(171, '2 tablespoons cornstarch', 'https://shop.coles.com.au/a/national/product/coles-cornflour', 23),
(172, '1 tablespoon butter', 'https://shop.coles.com.au/a/national/product/flora-spread-margarine-original-tub?adId=display_BLhhCoo5jeZrgbcoY6WCB2ITi2wyMjIzNjNQ', 23),
(173, '12 slices day-old bread', 'https://shop.coles.com.au/a/national/product/philadelphia-light-cream-cheese-snacktub?adId=display_KlSywbv6xfDF2Ev9-gzUBaiXB04yNzgyMTY1UA%3D%3D', 24),
(174, '2 (8 ounce) packages cream cheese', 'https://shop.coles.com.au/a/national/product/philadelphia-light-cream-cheese-snacktub?adId=display_KlSywbv6xfDF2Ev9-gzUBaiXB04yNzgyMTY1UA%3D%3D', 24),
(175, '1 cup fresh blueberries', 'https://shop.coles.com.au/a/national/product/blueberries-prepacked', 24),
(176, '12 eggs, beaten', 'https://shop.coles.com.au/a/national/product/myrtle-creek-cage-free-x-large-eggs-12pk', 24),
(177, '2 cups milk', 'https://shop.coles.com.au/a/national/product/dairy-farmers-milk-full-cream-5519494p?adId=display_VNrH7O2Eu-dCZuYuihK9iIbsh741NTE5NDk0UA%3D%3D', 24),
(178, '1 teaspoon vanilla extract', 'https://shop.coles.com.au/a/national/product/queen-natural-vanilla-concentrated-extract', 24),
(179, '⅓ cup maple syrup', 'https://shop.coles.com.au/a/national/product/greens-maple-flavoured-syrup-squeezable', 24),
(180, '1 cup white sugar', 'https://shop.coles.com.au/a/national/product/csr-white-sugar', 24),
(181, '2 tablespoons cornstarch', 'https://shop.coles.com.au/a/national/product/coles-cornflour', 24),
(182, '1 tablespoon butter', 'https://shop.coles.com.au/a/national/product/flora-spread-margarine-original-tub?adId=display_BLhhCoo5jeZrgbcoY6WCB2ITi2wyMjIzNjNQ', 24),
(183, '1 cup all-purpose flour', 'https://shop.coles.com.au/a/national/product/orgran-flour-plain-gluten-wheat-free', 25),
(184, '1 tablespoon white sugar', 'https://shop.coles.com.au/a/national/product/csr-white-sugar', 25),
(185, '2 teaspoons baking powder', 'https://shop.coles.com.au/a/national/product/wards-baking-powder', 25),
(186, '¼ teaspoon salt', 'https://shop.coles.com.au/a/national/product/coles-grinder-sea-salt', 25),
(187, '1 egg, beaten', 'https://shop.coles.com.au/a/national/product/myrtle-creek-cage-free-x-large-eggs-12pk', 25),
(188, '1 cup milk', 'https://shop.coles.com.au/a/national/product/dairy-farmers-milk-full-cream-5519494p?adId=display_VNrH7O2Eu-dCZuYuihK9iIbsh741NTE5NDk0UA%3D%3D', 25),
(189, '2 tablespoons vegetable oil', 'https://shop.coles.com.au/a/national/product/monini-classico-italian-evoo?adId=display_svL6q-kRXkpRUpy64i2HrEZg3k8zNTI2NjA0UA%3D%3D', 25),
(190, '⅓ cup maple syrup', 'https://shop.coles.com.au/a/national/product/greens-maple-flavoured-syrup-squeezable', 25),
(191, '2 ripe bananas, mashed', 'https://shop.coles.com.au/a/national/product/coles-fresh-kids-pack-bananas', 25),
(192, '1 cup all-purpose flour', 'https://shop.coles.com.au/a/national/product/orgran-flour-plain-gluten-wheat-free', 26),
(193, '1 tablespoon white sugar', 'https://shop.coles.com.au/a/national/product/csr-white-sugar', 26),
(194, '2 teaspoons baking powder', 'https://shop.coles.com.au/a/national/product/wards-baking-powder', 26),
(195, '¼ teaspoon salt', 'https://shop.coles.com.au/a/national/product/coles-grinder-sea-salt', 26),
(196, '1 egg, beaten', 'https://shop.coles.com.au/a/national/product/myrtle-creek-cage-free-x-large-eggs-12pk', 26),
(197, '1 cup milk', 'https://shop.coles.com.au/a/national/product/dairy-farmers-milk-full-cream-5519494p?adId=display_VNrH7O2Eu-dCZuYuihK9iIbsh741NTE5NDk0UA%3D%3D', 26),
(198, '2 tablespoons vegetable oil', 'https://shop.coles.com.au/a/national/product/monini-classico-italian-evoo?adId=display_svL6q-kRXkpRUpy64i2HrEZg3k8zNTI2NjA0UA%3D%3D', 26),
(199, '⅓ cup maple syrup', 'https://shop.coles.com.au/a/national/product/greens-maple-flavoured-syrup-squeezable', 26),
(200, '2 ripe bananas, mashed', 'https://shop.coles.com.au/a/national/product/coles-fresh-kids-pack-bananas', 26),
(201, '1 cup all-purpose flour', 'https://shop.coles.com.au/a/national/product/orgran-flour-plain-gluten-wheat-free', 27),
(202, '1 tablespoon white sugar', 'https://shop.coles.com.au/a/national/product/csr-white-sugar', 27),
(203, '2 teaspoons baking powder', 'https://shop.coles.com.au/a/national/product/wards-baking-powder', 27),
(204, '¼ teaspoon salt', 'https://shop.coles.com.au/a/national/product/coles-grinder-sea-salt', 27),
(205, '1 egg, beaten', 'https://shop.coles.com.au/a/national/product/myrtle-creek-cage-free-x-large-eggs-12pk', 27),
(206, '1 cup milk', 'https://shop.coles.com.au/a/national/product/dairy-farmers-milk-full-cream-5519494p?adId=display_VNrH7O2Eu-dCZuYuihK9iIbsh741NTE5NDk0UA%3D%3D', 27),
(207, '2 tablespoons vegetable oil', 'https://shop.coles.com.au/a/national/product/monini-classico-italian-evoo?adId=display_svL6q-kRXkpRUpy64i2HrEZg3k8zNTI2NjA0UA%3D%3D', 27),
(208, '⅓ cup maple syrup', 'https://shop.coles.com.au/a/national/product/greens-maple-flavoured-syrup-squeezable', 27),
(209, '2 ripe bananas, mashed', 'https://shop.coles.com.au/a/national/product/coles-fresh-kids-pack-bananas', 27),
(210, '1 cup soy milk', 'https://shop.coles.com.au/a/national/product/sanitarium-so-good-milk-long-life-soy-regular-403029p?adId=display_DtLwZdDP-tNJSUJSu6HyfyLtNI80MDMwMjlQ', 28),
(211, '½ cup rolled oats', 'https://shop.coles.com.au/a/national/product/uncle-tobys-blueberry-grains-seeds?adId=display_P_Hnf5brfQKh3oMyj4Mc-xRtupozNTg0NzM1UA%3D%3D', 28),
(212, '1 banana, broken into chunks', 'https://shop.coles.com.au/a/national/product/coles-fresh-kids-pack-bananas', 28),
(213, '14 frozen strawberries', 'https://shop.coles.com.au/a/national/product/creativegourmet-frozen-sliced-strawberries', 28),
(214, '½ teaspoon vanilla extract', 'https://shop.coles.com.au/a/national/product/queen-essence-natural-vanilla-extract', 28),
(215, '1 ½ teaspoons white sugar', 'https://shop.coles.com.au/a/national/product/csr-white-sugar', 28),
(216, '1 cup all-purpose flour', 'https://shop.coles.com.au/a/national/product/orgran-flour-plain-gluten-wheat-free', 29),
(217, '1 tablespoon white sugar', 'https://shop.coles.com.au/a/national/product/csr-white-sugar', 29),
(218, '2 teaspoons baking powder', 'https://shop.coles.com.au/a/national/product/wards-baking-powder', 29),
(219, '¼ teaspoon salt', 'https://shop.coles.com.au/a/national/product/coles-grinder-sea-salt', 29),
(220, '1 egg, beaten', 'https://shop.coles.com.au/a/national/product/myrtle-creek-cage-free-x-large-eggs-12pk', 29),
(221, '1 cup milk', 'https://shop.coles.com.au/a/national/product/dairy-farmers-milk-full-cream-5519494p?adId=display_VNrH7O2Eu-dCZuYuihK9iIbsh741NTE5NDk0UA%3D%3D', 29),
(222, '2 tablespoons vegetable oil', 'https://shop.coles.com.au/a/national/product/monini-classico-italian-evoo?adId=display_svL6q-kRXkpRUpy64i2HrEZg3k8zNTI2NjA0UA%3D%3D', 29),
(223, '⅓ cup maple syrup', 'https://shop.coles.com.au/a/national/product/greens-maple-flavoured-syrup-squeezable', 29),
(224, '2 ripe bananas, mashed', 'https://shop.coles.com.au/a/national/product/coles-fresh-kids-pack-bananas', 29),
(225, '12 slices day-old bread', 'https://shop.coles.com.au/a/national/product/philadelphia-light-cream-cheese-snacktub?adId=display_KlSywbv6xfDF2Ev9-gzUBaiXB04yNzgyMTY1UA%3D%3D', 30),
(226, '2 (8 ounce) packages cream cheese', 'https://shop.coles.com.au/a/national/product/philadelphia-light-cream-cheese-snacktub?adId=display_KlSywbv6xfDF2Ev9-gzUBaiXB04yNzgyMTY1UA%3D%3D', 30),
(227, '1 cup fresh blueberries', 'https://shop.coles.com.au/a/national/product/blueberries-prepacked', 30),
(228, '12 eggs, beaten', 'https://shop.coles.com.au/a/national/product/myrtle-creek-cage-free-x-large-eggs-12pk', 30),
(229, '2 cups milk', 'https://shop.coles.com.au/a/national/product/dairy-farmers-milk-full-cream-5519494p?adId=display_VNrH7O2Eu-dCZuYuihK9iIbsh741NTE5NDk0UA%3D%3D', 30),
(230, '1 teaspoon vanilla extract', 'https://shop.coles.com.au/a/national/product/queen-natural-vanilla-concentrated-extract', 30),
(231, '1/3 cup maple syrup', 'https://shop.coles.com.au/a/national/product/greens-maple-flavoured-syrup-squeezable', 30),
(232, '1 cup white sugar', 'https://shop.coles.com.au/a/national/product/csr-white-sugar', 30),
(233, '2 tablespoons cornstarch', 'https://shop.coles.com.au/a/national/product/coles-cornflour', 30),
(234, '1 tablespoon butter', 'https://shop.coles.com.au/a/national/product/flora-spread-margarine-original-tub?adId=display_BLhhCoo5jeZrgbcoY6WCB2ITi2wyMjIzNjNQ', 30),
(235, '12 slices day-old bread', 'https://shop.coles.com.au/a/national/product/philadelphia-light-cream-cheese-snacktub?adId=display_KlSywbv6xfDF2Ev9-gzUBaiXB04yNzgyMTY1UA%3D%3D', 31),
(236, '2 (8 ounce) packages cream cheese', 'https://shop.coles.com.au/a/national/product/philadelphia-light-cream-cheese-snacktub?adId=display_KlSywbv6xfDF2Ev9-gzUBaiXB04yNzgyMTY1UA%3D%3D', 31),
(237, '1 cup fresh blueberries', 'https://shop.coles.com.au/a/national/product/blueberries-prepacked', 31),
(238, '12 eggs, beaten', 'https://shop.coles.com.au/a/national/product/myrtle-creek-cage-free-x-large-eggs-12pk', 31),
(239, '2 cups milk', 'https://shop.coles.com.au/a/national/product/dairy-farmers-milk-full-cream-5519494p?adId=display_VNrH7O2Eu-dCZuYuihK9iIbsh741NTE5NDk0UA%3D%3D', 31),
(240, '1 teaspoon vanilla extract', 'https://shop.coles.com.au/a/national/product/queen-natural-vanilla-concentrated-extract', 31),
(241, '⅓ cup maple syrup', 'https://shop.coles.com.au/a/national/product/greens-maple-flavoured-syrup-squeezable', 31),
(242, '1 cup white sugar', 'https://shop.coles.com.au/a/national/product/csr-white-sugar', 31),
(243, '2 tablespoons cornstarch', 'https://shop.coles.com.au/a/national/product/coles-cornflour', 31),
(244, '1 tablespoon butter', 'https://shop.coles.com.au/a/national/product/flora-spread-margarine-original-tub?adId=display_BLhhCoo5jeZrgbcoY6WCB2ITi2wyMjIzNjNQ', 31),
(245, '1 cup all-purpose flour', 'https://shop.coles.com.au/a/national/product/orgran-flour-plain-gluten-wheat-free', 32),
(246, '1 tablespoon white sugar', 'https://shop.coles.com.au/a/national/product/csr-white-sugar', 32),
(247, '2 teaspoons baking powder', 'https://shop.coles.com.au/a/national/product/wards-baking-powder', 32),
(248, '1/4 teaspoon salt', 'https://shop.coles.com.au/a/national/product/coles-grinder-sea-salt', 32),
(249, '1 egg, beaten', 'https://shop.coles.com.au/a/national/product/myrtle-creek-cage-free-x-large-eggs-12pk', 32),
(250, '1 cup milk', 'https://shop.coles.com.au/a/national/product/dairy-farmers-milk-full-cream-5519494p?adId=display_VNrH7O2Eu-dCZuYuihK9iIbsh741NTE5NDk0UA%3D%3D', 32),
(251, '2 tablespoons vegetable oil', 'https://shop.coles.com.au/a/national/product/monini-classico-italian-evoo?adId=display_svL6q-kRXkpRUpy64i2HrEZg3k8zNTI2NjA0UA%3D%3D', 32),
(252, '⅓ cup maple syrup', 'https://shop.coles.com.au/a/national/product/greens-maple-flavoured-syrup-squeezable', 32),
(253, '2 ripe bananas, mashed', 'https://shop.coles.com.au/a/national/product/coles-fresh-kids-pack-bananas', 32),
(254, '3 cups white sugar', 'https://shop.coles.com.au/a/national/product/coles-sugar-white-5422541p', 33),
(255, '¾ cup butter', 'https://shop.coles.com.au/a/national/product/flora-plant-spread-buttery?adId=display_37D0jNmBOrUKWC3V6Sce3u66alczNzg1NTg4UA%3D%3D', 33),
(256, '⅔ cup evaporated milk', 'https://shop.coles.com.au/a/national/promo/made-by-cow?pid=BR_MADEBYCOW_SingleTile_1134_3', 33),
(257, '2 cups white chocolate chips', 'https://shop.coles.com.au/a/national/product/cadbury-real-chocolate-white-chocolate-baking-chips', 33),
(258, '1 (7 ounce) jar marshmallow creme', 'https://shop.coles.com.au/a/national/product/marshmallow-fluff', 33),
(259, '1 teaspoon vanilla extract', 'https://shop.coles.com.au/a/national/everything/search/vanilla%20extract', 33),
(260, '½ cup crumbled chocolate sandwich cookies (such as Oreo®)', 'https://www.woolworths.com.au/shop/productdetails/250554/woolworths-select-sandwich-chocolate-biscuit', 33),
(261, '1 cup crushed chocolate sandwich cookies (such as Oreo®)', 'https://www.woolworths.com.au/shop/productdetails/250554/woolworths-select-sandwich-chocolate-biscuit', 33),
(262, '222', '222', 34),
(263, '12312', '1231', 35),
(264, '1231', '1231231', 35),
(265, '13', 'qwdqw', 36),
(266, 'dqwdq', 'qwdq', 37),
(267, '1 tbsp olive oil', 'https://shop.coles.com.au/a/national/product/wards-baking-powder', 38),
(268, '1 large onion, finely sliced', 'https://shop.coles.com.au/a/national/product/wards-baking-powder', 38),
(269, '1kg large floury potatoes', 'https://shop.coles.com.au/a/national/product/coles-grinder-sea-salt', 38),
(270, '250ml whole milk', 'https://shop.coles.com.au/a/national/product/dairy-farmers-milk-full-cream-5519494p?adId=display_VNrH7O2Eu-dCZuYuihK9iIbsh741NTE5NDk0UA%3D%3D', 38),
(271, '250ml double cream', 'https://shop.coles.com.au/a/national/product/uncle-tobys-blueberry-grains-seeds?adId=display_P_Hnf5brfQKh3oMyj4Mc-xRtupozNTg0NzM1UA%3D%3D', 38),
(272, '2 garlic cloves, peeled and lightly crushed', 'https://shop.coles.com.au/a/national/product/coles-fresh-kids-pack-bananas', 38),
(273, '1 bay leaf', 'https://www.woolworths.com.au/shop/productdetails/828996/pascall-marshmallows-vanilla-raspberry', 38),
(274, '¼ tsp ground nutmeg', 'https://www.woolworths.com.au/shop/productdetails/72136/oreo-cookie-original', 38),
(275, '70g pecorino, finely grated', 'https://www.woolworths.com.au/shop/productdetails/72136/oreo-cookie-original', 38),
(276, '2 cups milk', 'https://www.woolworths.com.au/shop/productdetails/807384/woolworths-drought-relief-full-cream-milk', 39),
(277, '4 eggs', 'https://www.woolworths.com.au/shop/productdetails/893974/just-4-you-12-extra-large-caged-eggs', 39),
(278, '¾ cup biscuit baking mix', 'https://www.woolworths.com.au/shop/productdetails/36022/arnott-s-assorted-cream-biscuits', 39),
(279, '¼ cup butter, softened', 'https://www.woolworths.com.au/shop/productdetails/48004/copha-oil-solid-cooking-block', 39),
(280, '1 cup grated Parmesan cheese', 'https://www.woolworths.com.au/shop/productdetails/360904/perfect-italiano-shaved-parmesan', 39),
(281, '1 (10 ounce) package chopped frozen broccoli, thawed and drained', 'https://www.woolworths.com.au/shop/productdetails/134681/fresh-broccoli', 39),
(282, '1 cup cubed cooked ham', 'https://www.woolworths.com.au/shop/productdetails/647382/woolworths-canned-ham', 39),
(283, '8 ounces shredded Cheddar cheese', 'https://www.woolworths.com.au/shop/search/products?searchTerm=Cheddar', 39),
(284, '1 package linguine pasta', 'https://www.woolworths.com.au/shop/productdetails/82282/san-remo-linguine-pasta-no-1', 40),
(285, '2 tablespoons butter', 'https://www.woolworths.com.au/shop/productdetails/69756/western-star-original-spreadable', 40),
(286, '2 tablespoons olive oil', 'https://www.woolworths.com.au/shop/search?searchTerm=olive%20oil', 40),
(287, '2 shallots, finely diced', 'https://www.woolworths.com.au/shop/productdetails/147603/spring-onion-eschallot', 40),
(288, '2 cloves garlic, minced', 'https://www.woolworths.com.au/shop/productdetails/713429/woolworths-garlic-head', 40),
(289, '1 pound shrimp', 'https://shop.coles.com.au/a/national/product/prawns-black-tiger-cooked-large-9672959p', 40),
(290, '1 pinch kosher salt', 'https://www.woolworths.com.au/shop/productdetails/57086/natural-pink-himalayan-rock-salt-grinder', 40),
(291, '½ cup dry white wine', 'https://www.woolworths.com.au/shop/productdetails/826673/riverside-landing-sauvignon-blanc', 40),
(292, '1 lemon, juiced', 'https://www.woolworths.com.au/shop/productdetails/720423/woolworths-lemon-juice', 40),
(293, '2 tablespoons extra-virgin olive oil', 'https://www.woolworths.com.au/shop/productdetails/698868/woolworths-extra-virgin-spanish-olive-oil', 40),
(294, '¼ cup finely chopped fresh parsley leaves', 'https://www.woolworths.com.au/shop/productdetails/144785/woolworths-parsley-continental-fresh-herb', 40),
(295, '33', '333', 41),
(296, '1kg potatoes', 'https://shop.coles.com.au/a/national/everything/browse/fruit-vegetables/vegetables/potatoes?pageNumber=1', 42),
(297, '300g frozen peas', 'https://shop.coles.com.au/a/national/everything/search/frozen%20peas?pageNumber=1', 42),
(298, '250g smoked mackerel fillets', 'https://shop.coles.com.au/a/national/everything/search/mackerel%20fillet?pageNumber=1', 42),
(299, '500g strong white bread flour', 'https://shop.coles.com.au/a/national/everything/search/bread%20flour?pageNumber=1', 43),
(300, '1 tsp salt', 'https://shop.coles.com.au/a/national/everything/search/salt?pageNumber=1', 43),
(301, '50g caster sugar', 'https://shop.coles.com.au/a/national/everything/search/sugar?pageNumber=1', 43),
(302, '7g sachet dried yeast', 'https://shop.coles.com.au/a/national/everything/search/sachet%20dried%20yeast?pageNumber=1', 43),
(303, '300ml semi-skimmed milk', 'https://shop.coles.com.au/a/national/everything/search/semi-skimmed%20milk?pageNumber=1', 43),
(304, '40g unsalted butter, cubed', 'https://shop.coles.com.au/a/national/everything/search/unsalted%20butter?pageNumber=1', 43),
(305, '1 large egg, lightly beaten', 'https://shop.coles.com.au/a/national/everything/search/large%20egg?pageNumber=1', 43),
(306, 'vegetable oil, for greasing', 'https://shop.coles.com.au/a/national/everything/search/vegetable%20oil?pageNumber=1', 43),
(307, '500g strong white bread flour', 'https://shop.coles.com.au/a/national/everything/search/bread%20flour?pageNumber=1', 44),
(308, '1 tsp salt', 'https://shop.coles.com.au/a/national/everything/search/salt?pageNumber=1', 44),
(309, '50g caster sugar', 'https://shop.coles.com.au/a/national/everything/search/sugar?pageNumber=1', 44),
(310, '7g sachet dried yeast', 'https://shop.coles.com.au/a/national/everything/search/sachet%20dried%20yeast?pageNumber=1', 44),
(311, '300ml semi-skimmed milk', 'https://shop.coles.com.au/a/national/everything/search/semi-skimmed%20milk?pageNumber=1', 44),
(312, '40g unsalted butter, cubed', 'https://shop.coles.com.au/a/national/everything/search/unsalted%20butter?pageNumber=1', 44),
(313, '1 large egg, lightly beaten', 'https://shop.coles.com.au/a/national/everything/search/large%20egg?pageNumber=1', 44),
(314, 'vegetable oil, for greasing', 'https://shop.coles.com.au/a/national/everything/search/vegetable%20oil?pageNumber=1', 44),
(315, '1 vanilla pod', 'https://shop.coles.com.au/a/national/everything/search/vanilla%20pod?pageNumber=1', 45),
(316, '1.25ltrs whole milk', 'https://shop.coles.com.au/a/national/everything/search/whole%20milk?pageNumber=1', 45),
(317, '75g caster sugar', 'https://shop.coles.com.au/a/national/everything/search/sugar?pageNumber=1', 45),
(318, '150g pudding rice', 'https://shop.coles.com.au/a/national/everything/search/pudding%20rice?pageNumber=1', 45),
(319, '½ tsp grated nutmeg strawberry ', 'https://shop.coles.com.au/a/national/everything/search/strawberry%20jam?pageNumber=1', 45),
(320, '3-4 red chillies', 'https://shop.coles.com.au/a/national/everything/search/red%20chillies?pageNumber=1', 46),
(321, '3 garlic cloves', 'https://shop.coles.com.au/a/national/everything/search/garlic%20cloves?pageNumber=1', 46),
(322, '1½tbsp red wine vinegar', 'https://shop.coles.com.au/a/national/everything/search/red%20wine%20vinegar?pageNumber=1', 46),
(323, '2 large lemons', 'https://shop.coles.com.au/a/national/everything/search/lemons?pageNumber=1', 46),
(324, '½tsp caster', 'https://shop.coles.com.au/a/national/everything/search/caster?pageNumber=1', 46),
(325, '1½ tsp smoked paprika', 'https://shop.coles.com.au/a/national/everything/search/paprika?pageNumber=1', 46),
(326, '1 tsp dried oregano', 'https://shop.coles.com.au/a/national/everything/search/oregano?pageNumber=1', 46),
(327, '1 tbsp olive oil', 'https://shop.coles.com.au/a/national/everything/search/olive%20oil?pageNumber=1', 46),
(328, '4 chicken legs', 'https://shop.coles.com.au/a/national/everything/search/chicken%20legs?pageNumber=1', 46),
(329, '40g granola', 'https://shop.coles.com.au/a/national/everything/search/granola?pageNumber=1', 47),
(330, '200g Greek-style yogurt', 'https://shop.coles.com.au/a/national/everything/search/Greek-style%20yogurt?pageNumber=1', 47),
(331, '150g fresh fruit of your choice', 'https://shop.coles.com.au/a/national/everything/search/fruit?pageNumber=1', 47),
(332, '1 cauliflower, ', 'https://www.woolworths.com.au/shop/productdetails/135552/fresh-whole-cauliflower', 48),
(333, '1 tsp ground cumin', 'https://www.woolworths.com.au/shop/productdetails/251007/woolworths-cumin-ground-ground', 48),
(334, '½ tsp ground coriander', 'https://www.woolworths.com.au/shop/productdetails/137091/woolworths-fresh-herb-coriander', 48),
(335, '½ tsp ground turmeric', 'https://www.woolworths.com.au/shop/productdetails/251230/woolworths-turmeric-ground-ground', 48),
(336, '1 tbsp olive oil', 'https://www.woolworths.com.au/shop/productdetails/698868/woolworths-extra-virgin-spanish-olive-oil', 48),
(337, '40g skin-on almonds,', 'https://www.woolworths.com.au/shop/productdetails/176411/woolworths-almonds-kernels', 48),
(338, '1 fennel', 'https://www.woolworths.com.au/shop/search/products?searchTerm=fennel', 48),
(339, '400g tin chickpeas, drained and rinsed', 'https://www.woolworths.com.au/shop/productdetails/259399/woolworths-chickpeas-no-added-salt', 48),
(340, '60g rocket', 'https://www.woolworths.com.au/shop/productdetails/54900/woolworths-rocket', 48),
(341, '40g sultanas', 'https://www.woolworths.com.au/shop/productdetails/95055/woolworths-sultanas', 48),
(342, '75g natural yogurt', 'https://www.woolworths.com.au/shop/productdetails/571483/woolworths-vanilla-yoghurt-98-fat-free', 48),
(343, '½ lemon, juiced', 'https://www.woolworths.com.au/shop/productdetails/122788/fresh-lemons', 48),
(344, '½ garlic clove, crushed', 'https://www.woolworths.com.au/shop/productdetails/713429/woolworths-garlic-head', 48),
(345, '6 large sweet potatoes', 'https://shop.coles.com.au/a/national/everything/search/sweet%20potatoes?pageNumber=1', 49),
(346, '600g boneless chicken thighs', 'https://shop.coles.com.au/a/national/everything/search/boneless%20chicken%20thighs?pageNumber=1', 49),
(347, '160g BBQ sauce', 'https://shop.coles.com.au/a/national/everything/search/BBQ%20sauce?pageNumber=1', 49),
(348, '800g frozen butternut squash chunks', 'https://shop.coles.com.au/a/national/everything/search/butternut%20squash%20chunks?pageNumber=1', 50),
(349, '2 x 365g tins taco mixed beans', 'https://shop.coles.com.au/a/national/everything/search/taco%20beans?pageNumber=1', 50),
(350, '375g sheet ready-rolled puff pastry', 'https://shop.coles.com.au/a/national/everything/search/puff%20pastry?pageNumber=1', 50),
(351, '180g shredded ham hock', 'https://shop.coles.com.au/a/national/everything/search/ham%20hock?pageNumber=1', 51),
(352, '4 large potatoes, peeled', 'https://shop.coles.com.au/a/national/everything/search/potatoes?pageNumber=1', 51),
(353, '600g Tesco Finest cream of mushroom soup', 'https://shop.coles.com.au/a/national/everything/search/mushroom%20soup?pageNumber=1', 51),
(354, '1 large broccoli', 'https://shop.coles.com.au/a/national/everything/search/broccoli?pageNumber=1', 52),
(355, '600g Tesco cheese sauce', 'https://shop.coles.com.au/a/national/everything/search/cheese%20sauce?pageNumber=1', 52),
(356, '225g Finest Wild Sage & Buttered Onion Stuffing', 'https://shop.coles.com.au/a/national/everything/search/Wild%20Sage?pageNumber=1', 52),
(357, '360g 12 pork & beef meatballs', 'https://shop.coles.com.au/a/national/everything/search/pork%20&%20beef%20meatballs?pageNumber=1', 53),
(358, '300g red cabbage & apple', 'https://shop.coles.com.au/a/national/everything/search/red%20cabbage?pageNumber=1', 53),
(359, '400g three bean salad', 'https://shop.coles.com.au/a/national/everything/search/bean%20salad?pageNumber=1', 53),
(360, '4 lamb chops', 'https://shop.coles.com.au/a/national/everything/search/lamb%20chops?pageNumber=1', 54),
(361, '2 tbsp harissa paste', 'https://shop.coles.com.au/a/national/everything/search/harissa%20paste?pageNumber=1', 54),
(362, '200g tzatziki', 'https://shop.coles.com.au/a/national/everything/search/tzatziki?pageNumber=1', 54),
(363, '23g Hartleys sugar free jelly ', 'https://shop.coles.com.au/a/national/everything/search/jelly?pageNumber=1', 55),
(364, '200ml boiling water', 'https://shop.coles.com.au/a/national/everything/search/water?pageNumber=1', 55),
(365, '80g chopped fresh fruit', 'https://shop.coles.com.au/a/national/everything/search/fruit?pageNumber=1', 55),
(366, '1 garlic clove crushed', 'https://shop.coles.com.au/a/national/everything/search/garlic%20clove?pageNumber=1', 56),
(367, 'pinch of chilli flakes', 'https://shop.coles.com.au/a/national/everything/search/chilli%20flakes?pageNumber=1', 56),
(368, '1 tbsp olive oil', 'https://shop.coles.com.au/a/national/everything/search/olive%20oil?pageNumber=1', 56),
(369, '500g passata', 'https://shop.coles.com.au/a/national/everything/search/passata?pageNumber=1', 56),
(370, 'pinch of finely chopped fresh oregano', 'https://shop.coles.com.au/a/national/everything/search/oregano?pageNumber=1', 56),
(371, '500g strong white flour', 'https://shop.coles.com.au/a/national/everything/search/white%20flour?pageNumber=1', 57),
(372, '1 tsp of salt', 'https://shop.coles.com.au/a/national/everything/search/salt?pageNumber=1', 57),
(373, '7g sachet of fast action yeast', 'https://shop.coles.com.au/a/national/everything/search/action%20yeast?pageNumber=1', 57),
(374, '325ml of lukewarm water', 'https://shop.coles.com.au/a/national/everything/search/water?pageNumber=1', 57),
(375, '1 tsp of golden caster sugar', 'https://shop.coles.com.au/a/national/everything/search/caster%20sugar?pageNumber=1', 57),
(376, '2 tbsp of olive oil', 'https://shop.coles.com.au/a/national/everything/search/olive%20oil?pageNumber=1', 57),
(377, '6 tbsp of pasta sauce', 'https://shop.coles.com.au/a/national/everything/search/pasta%20sauce?pageNumber=1', 57),
(378, '200g of grated mozzarella cheese', 'https://shop.coles.com.au/a/national/everything/search/mozzarella%20cheese?pageNumber=1', 57),
(379, '150g of sliced ham', 'https://shop.coles.com.au/a/national/everything/search/ham?pageNumber=1', 57),
(380, '150g halved cherry tomatoes', 'https://shop.coles.com.au/a/national/everything/search/cherry%20tomatoes?pageNumber=1', 57),
(381, '1 tsp of dried oregano', 'https://shop.coles.com.au/a/national/everything/search/oregano?pageNumber=1', 57),
(382, 'salt and pepper', 'https://shop.coles.com.au/a/national/everything/search/salt%20and%20pepper?pageNumber=1', 57),
(383, '10 fresh basil leaves', 'https://shop.coles.com.au/a/national/everything/search/basil%20leaves?pageNumber=1', 57),
(384, 'a little milk', 'https://shop.coles.com.au/a/national/everything/search/milk?pageNumber=1', 57),
(385, 'Désirée potatoes', 'https://shop.coles.com.au/a/national/everything/search/potatoes?pageNumber=1', 58),
(386, '4 large egg yolks', 'https://shop.coles.com.au/a/national/everything/search/egg?pageNumber=1', 58),
(387, '1/2 grated nutmeg', 'https://shop.coles.com.au/a/national/everything/search/nutmeg?pageNumber=1', 58),
(388, 'salt', 'https://shop.coles.com.au/a/national/everything/search/salt?pageNumber=1', 58),
(389, '100g plain flour', 'https://shop.coles.com.au/a/national/everything/search/plain%20flour?pageNumber=1', 58),
(390, '125g butter', 'butter', 58),
(391, '1 tbsp olive oil', 'https://shop.coles.com.au/a/national/everything/search/olive%20oil?pageNumber=1', 58),
(392, '25g sage', 'https://shop.coles.com.au/a/national/everything/search/sage?pageNumber=1', 58),
(393, '740g parmesan', 'https://shop.coles.com.au/a/national/everything/search/parmesan?pageNumber=1', 58),
(394, '175g plain flour', 'https://shop.coles.com.au/a/national/everything/search/plain%20flour?pageNumber=1', 59),
(395, '300g minced pork', 'https://shop.coles.com.au/a/national/everything/search/minced%20pork?pageNumber=1', 59),
(396, '75g finely chopped cabbage', 'https://shop.coles.com.au/a/national/everything/search/cabbage?pageNumber=1', 59),
(397, '1 tbsp grated ginger', 'https://shop.coles.com.au/a/national/everything/search/ginger?pageNumber=1', 59),
(398, '15g finely chopped chives', 'https://shop.coles.com.au/a/national/everything/search/chives?pageNumber=1', 59),
(399, '1 tbsp sesame oil', 'https://shop.coles.com.au/a/national/everything/search/sesame%20oil?pageNumber=1', 59),
(400, '1 tbsp soy sauce', 'https://shop.coles.com.au/a/national/everything/search/soy%20sauce?pageNumber=1', 59);
INSERT INTO `ingredient` (`id`, `ingredient_name`, `ingredient_link`, `ingredient_related_recipe_id`) VALUES
(401, '1/2 tsp ground white pepper', 'https://shop.coles.com.au/a/national/everything/search/white%20pepper?pageNumber=1', 59),
(402, '2 tbsp soy sauce', 'https://shop.coles.com.au/a/national/everything/search/soy%20sauce?pageNumber=1', 59),
(403, '1 tbsp rice vinegar', 'https://shop.coles.com.au/a/national/everything/search/rice%20vinegar?pageNumber=1', 59),
(404, '1 tsp chilli oil', 'https://shop.coles.com.au/a/national/everything/search/chilli%20oil?pageNumber=1', 59),
(405, '2 tbsp vegetable oil', 'https://shop.coles.com.au/a/national/everything/search/vegetable%20oil?pageNumber=1', 59),
(406, '1 x 1kg piece rolled pork belly', 'https://shop.coles.com.au/a/national/everything/search/pork%20belly?pageNumber=1', 60),
(407, '3 small white onions', 'https://shop.coles.com.au/a/national/everything/search/white%20onions?pageNumber=1', 60),
(408, '1/4 tsp chilli flakes', 'https://shop.coles.com.au/a/national/everything/search/chilli%20flakes?pageNumber=1', 60),
(409, '1/2 tsp fennel seeds', 'https://shop.coles.com.au/a/national/everything/search/fennel%20seeds?pageNumber=1', 60),
(410, '2 sliced garlic cloves', 'https://shop.coles.com.au/a/national/everything/search/garlic%20cloves?pageNumber=1', 60),
(411, '1 tbsp chopped rosemary leaves', 'https://shop.coles.com.au/a/national/everything/search/rosemary%20leaves?pageNumber=1', 60),
(412, '1 tbsp olive oil', 'https://shop.coles.com.au/a/national/everything/search/olive%20oil?pageNumber=1', 60),
(413, '2 tsp flaky sea salt', 'https://shop.coles.com.au/a/national/everything/search/sea%20salt?pageNumber=1', 60),
(414, '300ml white wine', 'https://shop.coles.com.au/a/national/everything/search/white%20wine?pageNumber=1', 60),
(415, '300g beef mince', 'https://shop.coles.com.au/a/national/everything/search/beef%20mince?pageNumber=1', 61),
(416, '300g pork mince', 'https://shop.coles.com.au/a/national/everything/search/pork%20mince?pageNumber=1', 61),
(417, '1 1/2 tsp dried oregano', 'https://shop.coles.com.au/a/national/everything/search/dried%20oregano?pageNumber=1', 61),
(418, '2 tbsp finely chopped parsley', 'https://shop.coles.com.au/a/national/everything/search/parsley?pageNumber=1', 61),
(419, '2 tbsp grated Parmesan', 'https://shop.coles.com.au/a/national/everything/search/Parmesan?pageNumber=1', 61),
(420, '1 egg', 'https://shop.coles.com.au/a/national/everything/search/egg?pageNumber=1', 61),
(421, '4 tbsp fresh breadcrumbs', 'https://shop.coles.com.au/a/national/everything/search/breadcrumbs?pageNumber=1', 61),
(422, '120g mozzarella', 'https://shop.coles.com.au/a/national/everything/search/mozzarella?pageNumber=1', 61),
(423, '2 tbsp olive oil', 'https://shop.coles.com.au/a/national/everything/search/olive%20oil?pageNumber=1', 61),
(424, '1 finely chopped onion', 'https://shop.coles.com.au/a/national/everything/search/onion?pageNumber=1', 61),
(425, '2 grated garlic cloves', 'https://shop.coles.com.au/a/national/everything/search/garlic%20cloves?pageNumber=1', 61),
(426, '680g passata', 'https://shop.coles.com.au/a/national/everything/search/passata?pageNumber=1', 61),
(427, '400g tin of chopped tomatoes', 'https://shop.coles.com.au/a/national/everything/search/tomatoes?pageNumber=1', 61),
(428, '1/4 tsp dried chilli flakes', 'https://shop.coles.com.au/a/national/everything/search/chilli%20flakes?pageNumber=1', 61),
(429, 'as', 'ss', 62),
(430, 'tt', 't', 63),
(431, '400g whole cooked lobster', 'https://shop.coles.com.au/a/national/everything/search/lobster?pageNumber=1', 64),
(432, '2 tbsp of mayonnaise', 'https://shop.coles.com.au/a/national/everything/search/mayonnaise?pageNumber=1', 64),
(433, '1 tbsp of tomato ketchup', 'https://shop.coles.com.au/a/national/everything/search/tomato%20ketchup?pageNumber=1', 64),
(434, 'a few drops of tabasco', 'https://shop.coles.com.au/a/national/everything/search/tabasco?pageNumber=1', 64),
(435, 'the juice of half a lemon', 'https://shop.coles.com.au/a/national/product/lemons-loose', 64),
(436, 'half a small red onion', 'https://shop.coles.com.au/a/national/everything/search/red%20onion?pageNumber=1', 64),
(437, '2 tbsp of finely diced celery', 'https://shop.coles.com.au/a/national/everything/search/celery?pageNumber=1', 64),
(438, '1 ½ tbsp finely diced cornichons', 'https://shop.coles.com.au/a/national/everything/search/cornichons?pageNumber=1', 64),
(439, '1 tbsp of dill', 'https://shop.coles.com.au/a/national/everything/search/dill?pageNumber=1', 64),
(440, '5 butter brioche rolls', 'https://shop.coles.com.au/a/national/everything/search/butter%20brioche%20rolls?pageNumber=1', 64),
(441, 'cayenne pepper', 'https://shop.coles.com.au/a/national/everything/search/cayenne%20pepper?pageNumber=1', 64),
(442, 'lemon wedges', 'https://shop.coles.com.au/a/national/everything/search/lemon?pageNumber=1', 64),
(443, '170g pecans', 'https://shop.coles.com.au/a/national/everything/search/pecans?pageNumber=1', 65),
(444, '150g dates, stones removed', 'https://shop.coles.com.au/a/national/everything/search/dates?pageNumber=1', 65),
(445, '2 tbsp maple syrup', 'https://shop.coles.com.au/a/national/everything/search/maple%20syrup?pageNumber=1', 65),
(446, '8 large eggs', 'https://shop.coles.com.au/a/national/everything/search/eggs?pageNumber=1', 66),
(447, '225g unsalted butter', 'https://shop.coles.com.au/a/national/everything/search/unsalted%20butter?pageNumber=1', 66),
(448, '450g dark chocolate', 'https://shop.coles.com.au/a/national/everything/search/dark%20chocolate?pageNumber=1', 66),
(449, '250g self-raising flour', 'https://shop.coles.com.au/a/national/everything/search/self-raising%20flour?pageNumber=1', 67),
(450, '2 tbsp sunflower oil', 'https://shop.coles.com.au/a/national/everything/search/sunflower%20oil?pageNumber=1', 67),
(451, '2 tsp dried spices', 'https://shop.coles.com.au/a/national/everything/search/dried%20spices?pageNumber=1', 67),
(452, '300g self-raising flour', 'https://shop.coles.com.au/a/national/everything/search/self-raising%20flour?pageNumber=1', 68),
(453, '200g mature Cheddar, grated', 'https://shop.coles.com.au/a/national/everything/search/mature%20Cheddar?pageNumber=1', 68),
(454, '250g low-fat natural yogurt', 'https://shop.coles.com.au/a/national/everything/search/low-fat%20natural%20yogurt?pageNumber=1', 68),
(455, '500g cleaned squid', 'https://shop.coles.com.au/a/national/everything/search/squid?pageNumber=1', 69),
(456, '400ml whole milk', 'https://shop.coles.com.au/a/national/everything/search/whole%20milk?pageNumber=1', 69),
(457, '70g cornflour', 'https://shop.coles.com.au/a/national/everything/search/cornflour?pageNumber=1', 69),
(458, '70g plain flour', 'https://shop.coles.com.au/a/national/everything/search/plain%20flour?pageNumber=1', 69),
(459, '2 lemons, 1 zested and 1 cut into wedges', 'https://shop.coles.com.au/a/national/everything/search/lemons?pageNumber=1', 69),
(460, '1 tbsp finely chopped parsley', 'https://shop.coles.com.au/a/national/everything/search/parsley?pageNumber=1', 69),
(461, '1/2 tsp smoked paprika', 'https://shop.coles.com.au/a/national/everything/search/paprika?pageNumber=1', 69),
(462, 'vegetable oil, for frying', 'https://shop.coles.com.au/a/national/everything/search/vegetable%20oil?pageNumber=1', 69),
(463, 'handful of sage leaves', 'https://shop.coles.com.au/a/national/everything/search/sage%20leaves?pageNumber=1', 69),
(464, '150g unsalted butter', 'https://shop.coles.com.au/a/national/everything/search/unsalted%20butter?pageNumber=1', 70),
(465, '1 tbsp olive oil', 'https://shop.coles.com.au/a/national/everything/search/olive%20oil?pageNumber=1', 70),
(466, '600g salmon fillet, skin-on', 'https://shop.coles.com.au/a/national/everything/search/salmon%20fillet?pageNumber=1', 70),
(467, '½ tsp freshly grated nutmeg', 'https://shop.coles.com.au/a/national/everything/search/nutmeg?pageNumber=1', 70),
(468, '¼ tsp cayenne pepper', 'https://shop.coles.com.au/a/national/everything/search/cayenne%20pepper?pageNumber=1', 70),
(469, '5 drops Worcestershire sauce', 'https://shop.coles.com.au/a/national/everything/search/Worcestershire%20sauce?pageNumber=1', 70),
(470, '1 lemon, sliced', 'https://shop.coles.com.au/a/national/everything/search/lemons?pageNumber=1', 71),
(471, 'Fresh herbs of your choice', 'https://shop.coles.com.au/a/national/everything/search/Fresh%20herbs?pageNumber=1', 71),
(472, 'Olive oil', 'https://shop.coles.com.au/a/national/everything/search/Olive%20oil?pageNumber=1', 71),
(473, '6 lemons, juiced', 'https://shop.coles.com.au/a/national/everything/search/lemons?pageNumber=1', 72),
(474, 'Olive oil', 'https://shop.coles.com.au/a/national/everything/search/Olive%20oil?pageNumber=1', 72),
(475, '1 garlic clove, crushed', 'https://shop.coles.com.au/a/national/everything/search/garlic%20clove?pageNumber=1', 72),
(476, 'A few sprigs of thyme or rosemary', 'https://shop.coles.com.au/a/national/everything/search/thyme?pageNumber=1', 72),
(477, '2 chicken breasts', 'https://shop.coles.com.au/a/national/everything/search/chicken%20breasts?pageNumber=1', 72),
(478, 'Fresh parsley, chopped', 'https://shop.coles.com.au/a/national/everything/search/parsley?pageNumber=1', 72),
(479, '1kg fresh mussels', 'https://shop.coles.com.au/a/national/everything/search/mussels?pageNumber=1', 73),
(480, '15g butter', 'https://shop.coles.com.au/a/national/everything/search/butter?pageNumber=1', 73),
(481, '1 onion, finely diced', 'https://shop.coles.com.au/a/national/everything/search/onion?pageNumber=1', 73),
(482, '2 spring onions, finely sliced', 'https://shop.coles.com.au/a/national/everything/search/spring%20onions?pageNumber=1', 73),
(483, '2 garlic cloves, crushed', 'https://shop.coles.com.au/a/national/everything/search/garlic%20cloves?pageNumber=1', 73),
(484, '15g fresh flat-leaf parsley', 'https://shop.coles.com.au/a/national/everything/search/parsley?pageNumber=1', 73),
(485, '100ml white wine', 'https://shop.coles.com.au/a/national/everything/search/white%20wine?pageNumber=1', 73),
(486, '100ml single cream', 'https://shop.coles.com.au/a/national/everything/search/cream?pageNumber=1', 73),
(487, '800g frozen French fries', 'https://shop.coles.com.au/a/national/everything/search/French%20fries?pageNumber=1', 73),
(488, 'medium bunch coriander (about 30g)', 'https://shop.coles.com.au/a/national/everything/search/coriander?pageNumber=1', 74),
(489, '12 hot green chillies', 'https://shop.coles.com.au/a/national/everything/search/hot%20green%20chillies?pageNumber=1', 74),
(490, '5cm piece of chopped ginger or galangal', 'https://shop.coles.com.au/a/national/everything/search/galangal?pageNumber=1', 74),
(491, '1 stalk of lemongrass', 'https://shop.coles.com.au/a/national/everything/search/lemongrass?pageNumber=1', 74),
(492, '3 peeled garlic cloves', 'https://shop.coles.com.au/a/national/everything/search/garlic%20cloves?pageNumber=1', 74),
(493, 'the zest and juice of a lime', 'https://shop.coles.com.au/a/national/everything/search/lime?pageNumber=1', 74),
(494, '2 peeled and roughly chopped shallots', 'https://shop.coles.com.au/a/national/everything/search/shallots?pageNumber=1', 74),
(495, '3 kaffir lime leaves', 'https://shop.coles.com.au/a/national/everything/search/lime%20leaves?pageNumber=1', 74),
(496, '1tbsp shrimp paste', 'https://shop.coles.com.au/a/national/everything/search/shrimp%20paste?pageNumber=1', 74),
(497, '80g butter, softened', 'https://shop.coles.com.au/a/national/everything/search/butter?pageNumber=1', 75),
(498, '2 tbsp chipotle chilli paste', 'https://shop.coles.com.au/a/national/everything/search/chipotle%20chilli%20paste?pageNumber=1', 75),
(499, '4 corn on the cob', 'https://shop.coles.com.au/a/national/everything/search/corn%20on%20the%20cob?pageNumber=1', 75),
(500, 'Lighter mascarpone', 'https://shop.coles.com.au/a/national/everything/search/mascarpone?pageNumber=1', 76),
(501, 'Ready made custard', 'https://shop.coles.com.au/a/national/everything/search/custard?pageNumber=1', 76),
(502, 'Nectarines or peaches', 'https://shop.coles.com.au/a/national/everything/search/peaches?pageNumber=1', 76),
(503, 'Sunflower oil', 'https://shop.coles.com.au/a/national/everything/search/Sunflower%20oil?pageNumber=1', 76),
(504, 'Madeira cake', 'https://shop.coles.com.au/a/national/everything/search/Madeira%20cake?pageNumber=1', 76),
(505, 'Fruit juice or sweet wine', 'https://shop.coles.com.au/a/national/everything/search/Fruit%20juice?pageNumber=1', 76),
(506, 'Toasted flaked almonds', 'https://shop.coles.com.au/a/national/everything/search/flaked%20almonds?pageNumber=1', 76),
(507, '1 pineapple', 'https://shop.coles.com.au/a/national/everything/search/pineapple?pageNumber=1', 77),
(508, '1 tbsp sunflower oil', 'https://shop.coles.com.au/a/national/everything/search/sunflower%20oil?pageNumber=1', 77),
(509, '1 tbsp Demerara sugar', 'https://shop.coles.com.au/a/national/everything/search/Demerara%20sugar?pageNumber=1', 77),
(510, '500g strong white flour', 'https://shop.coles.com.au/a/national/everything/search/white%20flour?pageNumber=1', 78),
(511, '7g sachet fast-action yeast', 'https://shop.coles.com.au/a/national/everything/search/yeast?pageNumber=1', 78),
(512, '1 tsp salt', 'https://shop.coles.com.au/a/national/everything/search/salt?pageNumber=1', 78),
(513, '4 tbsp olive oil', 'https://shop.coles.com.au/a/national/everything/search/olive%20oil?pageNumber=1', 78),
(514, '125g pack asparagus tips', 'https://shop.coles.com.au/a/national/everything/search/asparagus%20tips?pageNumber=1', 78),
(515, '1 small courgette (about 125g)', 'https://shop.coles.com.au/a/national/everything/search/courgette?pageNumber=1', 78),
(516, '100g pitted queen green olives', 'https://shop.coles.com.au/a/national/everything/search/green%20olives?pageNumber=1', 78),
(517, '50g vegetarian hard cheese', 'https://shop.coles.com.au/a/national/everything/search/cheese?pageNumber=1', 78),
(518, '1 egg, beaten', 'https://shop.coles.com.au/a/national/everything/search/egg?pageNumber=1', 78),
(519, '2 large, very ripe avocados', 'https://shop.coles.com.au/a/national/everything/search/avocados?pageNumber=1', 79),
(520, '1 tbsp lime juice', 'https://shop.coles.com.au/a/national/everything/search/lime%20juice?pageNumber=1', 79),
(521, '400g sweetened condensed milk', 'https://shop.coles.com.au/a/national/everything/search/sweetened%20condensed%20milk?pageNumber=1', 79),
(522, 'pinch of salt', 'https://shop.coles.com.au/a/national/everything/search/salt?pageNumber=1', 79),
(523, '600ml double cream', 'https://shop.coles.com.au/a/national/everything/search/double%20cream?pageNumber=1', 79),
(524, '500g strong white bread flour', 'https://shop.coles.com.au/a/national/everything/search/bread%20flour?pageNumber=1', 80),
(525, '1 ½ tsp fine salt', 'https://shop.coles.com.au/a/national/everything/search/fine%20salt?pageNumber=1', 80),
(526, '1 tsp golden caster sugar', 'https://shop.coles.com.au/a/national/everything/search/golden%20caster%20sugar?pageNumber=1', 80),
(527, '7g fast action yeast', 'https://shop.coles.com.au/a/national/everything/search/fast%20action%20yeast?pageNumber=1', 80),
(528, 'meat', 'https://shop.coles.com.au/a/national/product/wards-baking-powder', 81),
(529, 'meat', 'https://shop.coles.com.au/a/national/product/wards-baking-powder', 82),
(530, 'meat', 'https://shop.coles.com.au/a/national/product/wards-baking-powder', 83);

-- --------------------------------------------------------

--
-- Table structure for table `recipe`
--

CREATE TABLE IF NOT EXISTS `recipe` (
  `id` int(11) NOT NULL,
  `recipe_title` varchar(100) NOT NULL,
  `description` varchar(1000) NOT NULL,
  `update_date` date NOT NULL,
  `is_published` int(11) NOT NULL,
  `intro_image` varchar(100) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=84 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `recipe`
--

INSERT INTO `recipe` (`id`, `recipe_title`, `description`, `update_date`, `is_published`, `intro_image`, `user_id`) VALUES
(1, 'Strawberry Oatmeal Breakfast Smoothie', 'This is a fast vegan smoothie with a deep pink color and a rich, creamy texture. VERY filling, and perfect for people in a rush in the morning. You don''t have to give up a good breakfast when it''s this fast to make! I use vitamin fortified soy milk.', '2020-11-19', 1, 'intro_image/smt_tfqtXYU.png', 6),
(2, 'Zesty Quinoa Salad', 'This bright and colorful salad is a great summertime recipe (or anytime you want to feel like it''s summertime). Light and citrusy, it''s a whole new way to enjoy quinoa. Lime juice and cilantro give a refreshing kick, while quinoa and black beans provide tasty vegan protein. If you''re not vegan, add even more protein by adding chunks of chicken or turkey. Yum!', '2020-11-19', 1, 'intro_image/Picture_1_Dgnsry1.png', 2),
(3, 'naozi', 'haochi', '2020-11-19', 0, 'intro_image/2020-05-22-Scene_0iqQ2Lx.png', 1),
(4, 'Strawberry Oatmeal Breakfast Smoothie', 'This is a fast vegan smoothie with a deep pink color and a rich, creamy texture. VERY filling, and perfect for people in a rush in the morning. You don''t have to give up a good breakfast when it''s this fast to make! I use vitamin fortified soy milk.', '2020-11-19', 1, 'intro_image/smt_AyW2iwW.png', 6),
(5, '66666', 'scasc', '2020-11-19', 1, 'intro_image/default.png', 6),
(6, 'advsd', 'casca', '2020-11-19', 1, 'intro_image/ttt.jpg', 1),
(7, 'Barbie''s Tuna Salad', 'This is a really great tuna salad recipe I got from a friend who used it in her catering service business many years ago. The secret ingredients are the curry and Parmesan cheese! Odd combinations but this makes a terrific tuna sandwich! She used it for an appetizer with gourmet crackers and people always wanted her recipe. I have never tasted another tuna salad quite like this one, and it has been my favorite recipe for tuna salad for many, many years.', '2020-11-19', 1, 'intro_image/Picture_1_HkIfIgR.png', 2),
(8, 'Banana Pancakes', '231231ras', '2020-11-19', 1, 'intro_image/sm1.png', 6),
(9, 'dvsdv', 'sdvsdv', '2020-11-19', 1, 'intro_image/default.png', 6),
(10, 'Strawberry Oatmeal Breakfast Smoothie', 'This is a fast vegan smoothie with a deep pink color and a rich, creamy texture. VERY filling, and perfect for people in a rush in the morning. You don''t have to give up a good breakfast when it''s this fast to make! I use vitamin fortified soy milk.', '2020-11-19', 1, 'intro_image/default.png', 6),
(11, 'Slow Cooked Corned Beef for Sandwiches', 'This is an excellent recipe for party sandwiches. I always make 2 (and sometimes 3) briskets because it goes so fast. The meat should cook slowly for a minimum of 4 hours--cooking longer will just make it more tender. It sounds like a LOT of garlic, but no one has ever complained that it tasted too garlicky. Serve with brown mustard on rye or kaiser rolls. Can also add cole slaw to the sandwich for a uniquely delicious sandwich.', '2020-11-19', 1, 'intro_image/Picture_1_uJwpf5U.png', 2),
(12, 'Overnight Blueberry French Toast', 'This is a very unique breakfast dish. Good for any holiday breakfast or brunch, it''s filled with the fresh taste of blueberries, and covered with a rich blueberry sauce to make it a one of a kind.', '2020-11-19', 1, 'intro_image/default.png', 2),
(13, 'Overnight Blueberry French Toast', 'This is a very unique breakfast dish. Good for any holiday breakfast or brunch, it''s filled with the fresh taste of blueberries, and covered with a rich blueberry sauce to make it a one of a kind.', '2020-11-19', 1, 'intro_image/default.png', 2),
(14, 'Overnight Blueberry French Toast', 'This is a very unique breakfast dish. Good for any holiday breakfast or brunch, it''s filled with the fresh taste of blueberries, and covered with a rich blueberry sauce to make it a one of a kind.', '2020-11-19', 1, 'intro_image/default.png', 2),
(15, 'Overnight Blueberry French Toast', 'This is a very unique breakfast dish. Good for any holiday breakfast or brunch, it''s filled with the fresh taste of blueberries, and covered with a rich blueberry sauce to make it a one of a kind.', '2020-11-19', 1, 'intro_image/default.png', 2),
(16, 'Overnight Blueberry French Toast', 'This is a very unique breakfast dish. Good for any holiday breakfast or brunch, it''s filled with the fresh taste of blueberries, and covered with a rich blueberry sauce to make it a one of a kind.', '2020-11-19', 1, 'intro_image/default.png', 2),
(17, 'Overnight Blueberry French Toast', 'This is a very unique breakfast dish. Good for any holiday breakfast or brunch, it''s filled with the fresh taste of blueberries, and covered with a rich blueberry sauce to make it a one of a kind.', '2020-11-19', 1, 'intro_image/default.png', 2),
(18, 'Overnight Blueberry French Toast', 'This is a very unique breakfast dish. Good for any holiday breakfast or brunch, it''s filled with the fresh taste of blueberries, and covered with a rich blueberry sauce to make it a one of a kind.', '2020-11-19', 1, 'intro_image/default.png', 2),
(19, 'Overnight Blueberry French Toast', 'This is a very unique breakfast dish. Good for any holiday breakfast or brunch, it''s filled with the fresh taste of blueberries, and covered with a rich blueberry sauce to make it a one of a kind.', '2020-11-19', 1, 'intro_image/default.png', 2),
(20, 'Overnight Blueberry French Toast', 'This is a very unique breakfast dish. Good for any holiday breakfast or brunch, it''s filled with the fresh taste of blueberries, and covered with a rich blueberry sauce to make it a one of a kind.', '2020-11-19', 1, 'intro_image/default.png', 2),
(21, 'Overnight Blueberry French Toast', 'This is a very unique breakfast dish. Good for any holiday breakfast or brunch, it''s filled with the fresh taste of blueberries, and covered with a rich blueberry sauce to make it a one of a kind.', '2020-11-19', 1, 'intro_image/default.png', 2),
(22, 'Overnight Blueberry French Toast', 'This is a very unique breakfast dish. Good for any holiday breakfast or brunch, it''s filled with the fresh taste of blueberries, and covered with a rich blueberry sauce to make it a one of a kind.', '2020-11-19', 1, 'intro_image/default.png', 2),
(23, 'Overnight Blueberry French Toast', 'This is a very unique breakfast dish. Good for any holiday breakfast or brunch, it''s filled with the fresh taste of blueberries, and covered with a rich blueberry sauce to make it a one of a kind.', '2020-11-19', 1, 'intro_image/default.png', 2),
(24, 'Overnight Blueberry French Toast', 'This is a very unique breakfast dish. Good for any holiday breakfast or brunch, it''s filled with the fresh taste of blueberries, and covered with a rich blueberry sauce to make it a one of a kind.', '2020-11-19', 1, 'intro_image/default.png', 2),
(25, 'Banana Pancakes', 'Crowd pleasing banana pancakes made from scratch. A fun twist on ordinary pancakes.', '2020-11-19', 1, 'intro_image/default.png', 2),
(26, 'Banana Pancakes', 'Crowd pleasing banana pancakes made from scratch. A fun twist on ordinary pancakes.', '2020-11-19', 1, 'intro_image/default.png', 2),
(27, 'Banana Pancakes', 'Crowd pleasing banana pancakes made from scratch. A fun twist on ordinary pancakes.', '2020-11-19', 1, 'intro_image/default.png', 2),
(28, 'Strawberry Oatmeal Breakfast Smoothie', 'This is a fast vegan smoothie with a deep pink color and a rich, creamy texture. VERY filling, and perfect for people in a rush in the morning. You don''t have to give up a good breakfast when it''s this fast to make! I use vitamin fortified soy milk.', '2020-11-19', 1, 'intro_image/Picture_1_84bYC7y.png', 2),
(29, 'Banana Pancakes', 'Crowd pleasing banana pancakes made from scratch. A fun twist on ordinary pancakes.', '2020-11-19', 1, 'intro_image/default.png', 2),
(30, 'Overnight Blueberry French Toast', 'This is a very unique breakfast dish. Good for any holiday breakfast or brunch, it''s filled with the fresh taste of blueberries, and covered with a rich blueberry sauce to make it a one of a kind.', '2020-11-19', 1, 'intro_image/default.png', 2),
(31, 'Overnight Blueberry French Toast', 'This is a very unique breakfast dish. Good for any holiday breakfast or brunch, it''s filled with the fresh taste of blueberries, and covered with a rich blueberry sauce to make it a one of a kind.', '2020-11-19', 1, 'intro_image/Picture_1_n6bp4RM.png', 2),
(32, 'Banana Pancakes', 'Crowd pleasing banana pancakes made from scratch. A fun twist on ordinary pancakes.', '2020-11-19', 1, 'intro_image/Picture_1_rZxl6CG.png', 2),
(33, 'World''s Best Oreo® Fudge', 'This Oreo® Fudge is very sweet with loads of cookies. A pretty addition to any holiday dessert platter.', '2020-11-19', 1, 'intro_image/Picture_1_HZZalcZ.png', 2),
(34, 'Overnight Blueberry French Toast', 'This is a very unique breakfast dish. Good for any holiday breakfast or brunch, it''s filled with the fresh taste of blueberries, and covered with a rich blueberry sauce to make it a one of a kind.', '2020-11-19', 1, 'intro_image/test.jpeg', 1),
(35, '11', '221', '2020-11-19', 1, 'intro_image/default.png', 1),
(36, '131', 'qwfqf', '2020-11-19', 1, 'intro_image/test_Qtwpz3b.jpeg', 1),
(37, 'qwdqw', 'qwdq', '2020-11-19', 1, 'intro_image/ttt_lvuBhye.jpg', 1),
(38, ' Potato Dauphinoise', 'This crispy, creamy gratin is so indulgently good it might upstage your main. Try our step-by-step guide for an indulgent potato dauphinoise dish, the ideal side-dish treat - easy to make and delicious to eat – you’ll love this creamy, layered potato dish. Don''t forget to screenshot the ingredients list at the bottom of the page to take in store.', '2020-11-20', 1, 'intro_image/Xnip2020-11-20_01-00-32.jpg', 7),
(39, 'Easy Quiche', 'This is an easy mix-it-up-in-one-bowl-and-cook recipe. I make it for every brunch I attend. You may substitute chopped spinach for the broccoli if you wish.\n\n', '2020-11-20', 1, 'intro_image/dt.png', 6),
(40, 'Shrimp Scampi with Pasta', 'Well-rounded seafood and pasta dish. Good with any pasta; angel hair is less filling.', '2020-11-20', 1, 'intro_image/Xnip2020-11-20_01-52-19.jpg', 6),
(41, '111', '222', '2020-11-20', 1, 'intro_image/test_HArjKyH.jpeg', 1),
(42, 'Mackerel Fishcakes', 'Make a batch of these wallet-friendly smoked mackerel fishcakes for a simple family dinner using just 3-ingredients. Batch cook and freeze the rest for an easy last-minute meal another day – there’s a handy ingredients list at the bottom of the page for everything you need.', '2020-11-20', 1, 'intro_image/Xnip2020-11-20_01-29-08.jpg', 7),
(43, 'Iced Buns', 'Iced buns: a retro bake that’s just the right mix of sweet and savoury. With a little bit of help, older kids will love owning this baking project – just make sure they remember to share the finished product!', '2020-11-20', 1, 'intro_image/Xnip2020-11-20_01-35-28.jpg', 7),
(44, 'Iced Buns', 'Iced buns: a retro bake that’s just the right mix of sweet and savoury. With a little bit of help, older kids will love owning this baking project – just make sure they remember to share the finished product!', '2020-11-20', 1, 'intro_image/Xnip2020-11-20_01-35-28_dlbWv7T.jpg', 7),
(45, 'Rice Pudding', 'Rice pudding is a quintessential British dessert. Follow our easy step-by-step instructions below and you''ll be enjoying this thick and creamy classic in no time. Don''t forget to screenshot the ingredients list at the bottom for when you go shopping.', '2020-11-20', 1, 'intro_image/default.png', 7),
(46, 'Piri-Piri chicken', 'Try our step-by-step guide for an amazing piri-piri roast chicken, ideal for a weekend family dinner. Don''t forget to screenshot the ingredients list at the bottom of the page to take in store.', '2020-11-20', 1, 'intro_image/Xnip2020-11-20_01-52-19.jpg', 7),
(47, 'Frozen Yogurt Bzites', 'With crunchy cereal and colourful fruit topping, these super-simple frozen yogurt bites are the perfect refreshing snack for kids. As they’re so easy to make, they can even help assemble them in their ice cube trays as a fun summer activity. There’s a handy ingredients list at the bottom of the page for everything you need.', '2020-11-20', 1, 'intro_image/Xnip2020-11-20_02-00-22.jpg', 7),
(48, 'Roasted cauliflower and fennel salad', 'A seasonal salad that''s easy to make and packed full of flavour. Spice it up with rocket and curry-roasted cauliflower, then scatter with sultanas to serve', '2020-11-20', 1, 'intro_image/default.png', 6),
(49, 'BBQ Chicken Loaded Sweet Potatoes', 'Swap a plain jacket potato for these loaded BBQ chicken sweet potatoes, made with just 3 ingredients. Shredded chicken thighs and tangy BBQ sauce are loaded into roasted sweet potatoes for an easy, budget-friendly family dinner. Plus, you can make enough for 6 and freeze for another time. There’s a handy ingredients list at the bottom of the page for everything you need.', '2020-11-20', 1, 'intro_image/Xnip2020-11-20_02-04-54.jpg', 7),
(50, 'Chilli Bean and Squash Pot Pies', 'Take the hassle out of family dinners with these easy veggie pot pies that are made with just three ingredients. Full of spiced mixed beans and soft roasted squash, there''s hardly any prep and what''s more, you can freeze them ahead for another time. There’s a handy ingredients list at the bottom of the page for everything you need.', '2020-11-20', 1, 'intro_image/Xnip2020-11-20_02-10-12.jpg', 2),
(51, ' Creamy Ham and Potato Casserole', 'Winter comfort food just got easy with this 3-ingredient creamy ham and potato casserole. Perfect for feeding the family, make a big batch and freeze for future cold nights. There’s a handy ingredients list at the bottom of the page for everything you need, so remember to take a screenshot of the ingredients before heading to the shops.', '2020-11-20', 1, 'intro_image/Xnip2020-11-20_02-15-31.jpg', 2),
(52, 'Broccoli Stuffing Gratin', 'If you''re short on time, then this simple bake is a recipe the whole family can enjoy. There’s a handy ingredients list at the bottom of the page for everything you need, so remember to take a screenshot of the ingredients before heading to the shops.', '2020-11-20', 1, 'intro_image/Xnip2020-11-20_02-19-52.jpg', 2),
(53, 'Meatball and Red Cabbage Bake', 'Make mealtimes a breeze with this easy 3-ingredient meatball and red cabbage bake. What''s more, you can freeze any leftovers and reheat for another time. There’s a handy ingredients list at the bottom of the page for everything you need, so remember to take a screenshot of the ingredients before heading to the shops.', '2020-11-20', 1, 'intro_image/Xnip2020-11-20_02-26-16.jpg', 2),
(54, 'Harissa Lamb Chops', 'Bring some North African spice to your next barbecue with these quick and easy lamb chops. Simply marinate with harissa paste while you preheat the barbecue, then grill and serve on top of cool, creamy tzatziki. There’s a handy ingredients list at the bottom of the page for everything you need.', '2020-11-20', 1, 'intro_image/Xnip2020-11-20_02-30-23.jpg', 2),
(55, ' Jelly Cubes', 'If you''re looking for a fun snack for kids this summer, try these super easy 3-ingredient jelly cubes. Pick your favourite combinations of jelly and fruit for a fun, low-sugar sweet treat.', '2020-11-20', 1, 'intro_image/Xnip2020-11-20_02-34-20.jpg', 2),
(56, ' Arancini', 'Arancini are an Italian street food star made with sticky balls of risotto filled with gooey mozzarella and lightly fried until crisp and golden. Traditionally served with a rich tomato sauce, they make a satisfying snack any time. Whether you''re starting from scratch or using up leftover risotto, master this delicious dish in just six steps with our simple arancini recipe.', '2020-11-20', 1, 'intro_image/Xnip2020-11-20_02-41-59.jpg', 7),
(57, 'Stromboli', 'Stromboli is an impressive loaf made with pizza dough and filled with delicious ingredients. Oozing with melted mozzarella, strips of ham and plenty of herbs, this Italian recipe is perfect for adding a Mediterranean spin to your picnic spread. Just follow our simple steps and you’ll be on a roll.', '2020-11-20', 1, 'intro_image/Xnip2020-11-20_02-46-48.jpg', 7),
(58, 'Gnocchi', 'Soft, doughy gnocchi is a real Italian classic. Making your own is easier than you think – our simple gnocchi recipe shows you how to transform Desiree potatoes into moreish mini dumplings served in a gorgeous sage-infused butter.\n\n', '2020-11-20', 1, 'intro_image/Xnip2020-11-20_02-55-27.jpg', 7),
(59, 'Pork Dumplings', 'It may seem like a challenge, but making your own dumplings is really simple with our easy step-by-step recipe. Served with a homemade dipping sauce for an added kick, our easy pork dumpling recipe makes a flavoursome starter, sharing dish or canapé.', '2020-11-20', 1, 'intro_image/Xnip2020-11-20_03-03-35.jpg', 7),
(60, 'Mini Porchetta', 'A classic Italian recipe, porchetta is a succulent piece of pork stuffed with fresh herbs, rolled and then roasted until gorgeously golden and crisp. Our mini porchetta uses a smaller cut of meat but is packed with the same big flavours – make it in just six simple steps with our easy recipe.', '2020-11-20', 1, 'intro_image/Xnip2020-11-20_03-13-40.jpg', 7),
(61, 'Melt-in-the-middle Meatballs', 'Take your homemade meatballs to a whole new level by loading them up with a wonderfully gooey, melt-in-the-middle mozzarella centre. Master these delicious meatballs in just six simple steps, and enjoy with classic spaghetti or piled into an American-style sub.', '2020-11-20', 1, 'intro_image/Xnip2020-11-20_03-19-28.jpg', 7),
(62, 'hhh', 's', '2020-11-20', 1, 'intro_image/default.png', 1),
(63, 'mmmm', 't', '2020-11-20', 1, 'intro_image/Netflix_Logo_Final.png', 1),
(64, 'Mini Lobster Rolls', 'Add a little luxury to your festive celebrations with these deliciously indulgent mini lobster rolls. Perfect for a Christmas party, these treats feature meaty chunks of lobster in a spicy mayo dressing sandwiched between buttery brioche buns. Learn how to prepare the lobster and make this crowd-pleasing recipe with our simple step-by-step guide (and handy ingredients list at the bottom).', '2020-11-20', 1, 'intro_image/Xnip2020-11-20_03-58-17.jpg', 2),
(65, 'Maple Pecan Cookies', 'Follow our easy 3-ingredient maple pecan cookies recipe for a quick cookie fix. Dates, pecans and maple syrup make the easiest cookie dough ever – don''t forget to screenshot the shopping list at the bottom for the quantities before you go shopping!', '2020-11-20', 1, 'intro_image/Xnip2020-11-20_04-08-36.jpg', 7),
(66, 'Chocolate Cake', 'You won''t believe this rich, squidgy, indulgent chocolate cake only has three ingredients, and neither will your guests! Eggs, butter and chocolate are whisked together for a rich dessert that''s impressive yet completely hassle-free to make.', '2020-11-20', 1, 'intro_image/Xnip2020-11-20_04-11-39.jpg', 7),
(67, 'Spiced Flatbreads', 'These easy flatbreads use just three storecupboard ingredients and can be whipped up in under 10 minutes. They''re fried briefly until puffy and golden, and sprinkled with your favourite spices for a hit of flavour. Perfect for dunking in curries and tagines or scooping up creamy dips.', '2020-11-20', 1, 'intro_image/Xnip2020-11-20_04-15-47.jpg', 7),
(68, 'Cheese Scones', 'Rustle up a British classic in no time with this super-simple three-ingredient cheese scone recipe. These little savoury scones are perfect for a teatime treat, packing up in lunchboxes or for a picnic. There’s a handy ingredients list at the bottom of the page for everything you need.', '2020-11-20', 1, 'intro_image/Xnip2020-11-20_04-18-48.jpg', 7),
(69, 'Calamari', 'Crispy on the outside and gorgeously tender inside, squid recipes don''t get much more delicious than calamari. Traditionally enjoyed as street food in the Mediterranean, calamari tastes heavenly paired with zesty garlic aioli. Recreate this holiday snack at home with our easy-to-follow step-by-step guide.', '2020-11-20', 1, 'intro_image/Xnip2020-11-20_04-25-58.jpg', 7),
(70, 'Potted Salmon', 'Simple and delicious, classic potted salmon with some warm toast makes an ideal starter or lunch, plus it''s portable, so perfect for a picnic. Like a chunky salmon pâté, this version is flavoured with nutmeg, cayenne pepper and Worcestershire sauce, and sealed with homemade clarified butter. Master this easy picnic recipe, which is delicious spread on toast, in just six simple steps. Don''t forget to jot down (or screenshot) the ingredients list at the bottom for your next shopping trip.', '2020-11-20', 1, 'intro_image/Xnip2020-11-20_04-29-10.jpg', 7),
(71, 'Barbecue a Whole Fish', 'Mackerel, sea bass, sea bream, sardines and trout are all good cooked whole on the barbecue. Make sure the fish is scaled and gutted and the fins have been removed. Learn how to cook the delicious fruits of the sea with our easy guide.', '2020-11-20', 1, 'intro_image/Xnip2020-11-20_04-37-47.jpg', 7),
(72, 'Marinate Chicken Breasts', 'Maximise your marinating this summer and learn how to intensify the flavour of chicken breasts with our simple step-by-step guide.', '2020-11-20', 1, 'intro_image/Xnip2020-11-20_04-43-05.jpg', 7),
(73, 'Moules Frites', 'Moules frites is an absolute classic which really lets the flavour of fresh mussels shine and involves simply cooking in a buttery parsley and white wine sauce. This showstopping dish is surprisingly good value and a great introduction to cooking with mussels, so don''t be daunted and learn how to make moules frites with our easy recipe and expert tips. There’s a handy ingredients list at the bottom of the page with everything you need.\n\n', '2020-11-20', 1, 'intro_image/Xnip2020-11-20_04-48-55.jpg', 7),
(74, 'Thai Green Curry Paste', 'Nothing beats the aromatic smell of a freshly cooked Thai green curry. The fragrant herbs and fresh spices marry beautifully with the flavours of the coconut milk and lime juice. It’s so easy to make, and with our simple step-by-step guide, you’ll be making your own Thai green curry paste in no time. Don''t forget to screenshot the shopping list before you head out.', '2020-11-20', 1, 'intro_image/Xnip2020-11-20_04-55-45.jpg', 7),
(75, 'Chipotle Corn on the Cob', 'Add some extra smoky flavour to your barbecue spread with this easy chipotle corn on the cob. Smothered in spicy butter and wrapped in foil, the corn becomes buttery and tender as it cooks. There’s a handy ingredients list at the bottom of the page for everything you need.', '2020-11-20', 1, 'intro_image/Xnip2020-11-20_05-03-40.jpg', 7),
(76, ' Barbecue Trifle', 'Discover a fun new way to enjoy a delicious summer dessert with our step-by-step barbecue trifle.', '2020-11-20', 1, 'intro_image/Xnip2020-11-20_05-08-28.jpg', 7),
(77, 'Barbecue Pineapple  ', 'Get more out of your barbecue this summer by grilling your dessert too. Cooking a whole pineapple on the grill makes an easy and impressive summer pud and can easily be doubled to feed a crowd – serve the charred, caramelised slices on their own, with ice cream or as part of a larger dessert. Don’t forget to grab the handy shopping list of ingredients at the bottom.', '2020-11-20', 1, 'intro_image/Xnip2020-11-20_05-14-45.jpg', 7),
(78, ' Green Veggie Bread', 'The golden, olive-studded crust of this Mediterranean-style loaf hides a gorgeous green veggie filling, swirled into the dough before baking. Simply follow our step-by-step recipe to bake it yourself at home, just remember to check out the ingredients list at the bottom before you get started.', '2020-11-20', 1, 'intro_image/default.png', 7),
(79, 'Avocado Ice Cream', 'Avocados aren’t just for salads or spreading on toast. With this simple, no-churn ice cream recipe you can see how their rich, creamy texture makes them perfect for a refreshing summer ice cream that takes just 20 minutes to make. Don’t forget to screengrab the handy ingredients list at the bottom before you go shopping.', '2020-11-20', 1, 'intro_image/Xnip2020-11-20_05-31-01.jpg', 7),
(80, 'Loaf of Bread', 'Hone your baking skills and learn how to make bread with our simple step-by-step recipe for the most delicious homemade white loaf. Crunchy on the outside, soft and fluffy on the inside – this really is the ultimate bread recipe.', '2020-11-20', 1, 'intro_image/Xnip2020-11-20_05-38-20.jpg', 7),
(81, 'meat', 'good', '2020-11-20', 1, 'intro_image/ttt_Sl3Fqtn.jpg', 41),
(82, 'meat', 'good', '2020-11-20', 1, 'intro_image/test_ieirfXN.jpeg', 43),
(83, 'Meat', 'good', '2020-11-20', 1, 'intro_image/test_ddlhJzC.jpeg', 46);

-- --------------------------------------------------------

--
-- Table structure for table `recipe_category`
--

CREATE TABLE IF NOT EXISTS `recipe_category` (
  `id` int(11) NOT NULL,
  `category_of_recipe_id` int(11) NOT NULL,
  `recipe_of_category_id` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=224 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `recipe_category`
--

INSERT INTO `recipe_category` (`id`, `category_of_recipe_id`, `recipe_of_category_id`) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 5, 2),
(4, 1, 3),
(5, 2, 3),
(6, 4, 3),
(7, 1, 4),
(8, 8, 4),
(9, 3, 5),
(10, 4, 5),
(11, 6, 5),
(12, 2, 6),
(13, 3, 6),
(14, 6, 6),
(15, 2, 7),
(16, 4, 7),
(17, 9, 7),
(18, 2, 8),
(19, 4, 8),
(20, 5, 8),
(21, 4, 9),
(22, 6, 9),
(23, 1, 10),
(24, 8, 10),
(25, 2, 11),
(26, 4, 11),
(27, 1, 12),
(28, 7, 12),
(29, 8, 12),
(30, 1, 13),
(31, 7, 13),
(32, 8, 13),
(33, 1, 14),
(34, 7, 14),
(35, 8, 14),
(36, 1, 15),
(37, 7, 15),
(38, 8, 15),
(39, 1, 16),
(40, 7, 16),
(41, 8, 16),
(42, 1, 17),
(43, 7, 17),
(44, 8, 17),
(45, 1, 18),
(46, 7, 18),
(47, 8, 18),
(48, 1, 19),
(49, 7, 19),
(50, 8, 19),
(51, 1, 20),
(52, 7, 20),
(53, 8, 20),
(54, 1, 21),
(55, 7, 21),
(56, 8, 21),
(57, 1, 22),
(58, 7, 22),
(59, 8, 22),
(60, 1, 23),
(61, 7, 23),
(62, 8, 23),
(63, 1, 24),
(64, 7, 24),
(65, 8, 24),
(66, 1, 25),
(67, 8, 25),
(68, 1, 26),
(69, 8, 26),
(70, 1, 27),
(71, 8, 27),
(72, 1, 28),
(73, 5, 28),
(74, 8, 28),
(75, 1, 29),
(76, 8, 29),
(77, 1, 30),
(78, 7, 30),
(79, 8, 30),
(80, 1, 31),
(81, 7, 31),
(82, 8, 31),
(83, 1, 32),
(84, 8, 32),
(85, 1, 33),
(86, 8, 33),
(87, 2, 34),
(88, 3, 34),
(89, 5, 34),
(90, 2, 35),
(91, 7, 35),
(92, 5, 36),
(93, 7, 36),
(94, 2, 37),
(95, 6, 37),
(96, 1, 38),
(97, 2, 38),
(98, 3, 38),
(99, 5, 38),
(100, 1, 39),
(101, 2, 39),
(102, 3, 39),
(103, 7, 39),
(104, 2, 40),
(105, 3, 40),
(106, 7, 40),
(107, 9, 40),
(108, 3, 41),
(109, 6, 41),
(110, 1, 42),
(111, 2, 42),
(112, 3, 42),
(113, 9, 42),
(114, 1, 43),
(115, 2, 43),
(116, 3, 43),
(117, 8, 43),
(118, 1, 44),
(119, 2, 44),
(120, 3, 44),
(121, 8, 44),
(122, 1, 45),
(123, 3, 45),
(124, 8, 45),
(125, 3, 46),
(126, 4, 46),
(127, 1, 47),
(128, 3, 47),
(129, 8, 47),
(130, 2, 48),
(131, 3, 48),
(132, 5, 48),
(133, 7, 48),
(134, 2, 49),
(135, 3, 49),
(136, 4, 49),
(137, 1, 50),
(138, 2, 50),
(139, 3, 50),
(140, 5, 50),
(141, 1, 51),
(142, 3, 51),
(143, 1, 52),
(144, 5, 52),
(145, 1, 53),
(146, 3, 53),
(147, 4, 53),
(148, 5, 53),
(149, 2, 54),
(150, 3, 54),
(151, 4, 54),
(152, 8, 55),
(153, 1, 56),
(154, 2, 56),
(155, 3, 56),
(156, 7, 56),
(157, 1, 57),
(158, 3, 57),
(159, 7, 57),
(160, 8, 57),
(161, 1, 58),
(162, 2, 58),
(163, 3, 58),
(164, 7, 58),
(165, 2, 59),
(166, 3, 59),
(167, 4, 59),
(168, 6, 59),
(169, 2, 60),
(170, 3, 60),
(171, 4, 60),
(172, 7, 60),
(173, 2, 61),
(174, 3, 61),
(175, 4, 61),
(176, 7, 61),
(177, 2, 62),
(178, 5, 62),
(179, 2, 63),
(180, 5, 63),
(181, 7, 63),
(182, 3, 64),
(183, 4, 64),
(184, 9, 64),
(185, 8, 65),
(186, 8, 66),
(187, 1, 67),
(188, 8, 67),
(189, 1, 68),
(190, 8, 68),
(191, 3, 69),
(192, 9, 69),
(193, 9, 70),
(194, 2, 71),
(195, 3, 71),
(196, 9, 71),
(197, 2, 72),
(198, 3, 72),
(199, 4, 72),
(200, 2, 73),
(201, 4, 73),
(202, 1, 74),
(203, 5, 74),
(204, 6, 74),
(205, 1, 75),
(206, 5, 75),
(207, 8, 76),
(208, 5, 77),
(209, 8, 77),
(210, 1, 78),
(211, 5, 78),
(212, 8, 78),
(213, 8, 79),
(214, 1, 80),
(215, 8, 80),
(216, 2, 81),
(217, 5, 81),
(218, 1, 82),
(219, 3, 82),
(220, 5, 82),
(221, 2, 83),
(222, 4, 83),
(223, 5, 83);

-- --------------------------------------------------------

--
-- Table structure for table `recipe_favourite`
--

CREATE TABLE IF NOT EXISTS `recipe_favourite` (
  `id` int(11) NOT NULL,
  `recipe_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `recipe_favourite`
--

INSERT INTO `recipe_favourite` (`id`, `recipe_id`, `user_id`) VALUES
(1, 1, 1),
(2, 5, 1),
(3, 38, 6),
(4, 12, 1),
(5, 2, 2),
(6, 71, 2),
(7, 3, 1),
(8, 2, 39),
(9, 46, 39),
(10, 7, 39),
(11, 3, 39),
(12, 2, 1),
(13, 7, 1),
(14, 33, 40),
(15, 38, 41),
(16, 7, 41),
(17, 38, 42),
(18, 38, 43),
(19, 7, 45),
(20, 38, 46),
(21, 30, 1);

-- --------------------------------------------------------

--
-- Table structure for table `recipe_mark`
--

CREATE TABLE IF NOT EXISTS `recipe_mark` (
  `id` int(11) NOT NULL,
  `mark` varchar(100) NOT NULL,
  `recipe_id` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `recipe_mark`
--

INSERT INTO `recipe_mark` (`id`, `mark`, `recipe_id`) VALUES
(1, 'banner', 7),
(2, 'banner', 33),
(3, 'banner', 32),
(4, 'hottest', 6),
(5, 'hottest', 2),
(6, 'hottest', 38),
(7, 'hottest', 34),
(8, 'hottest', 1),
(9, 'hottest', 8),
(10, 'hottest', 37),
(11, 'hottest', 42),
(12, 'hottest', 32),
(13, 'hottest', 1),
(14, 'hottest', 33),
(15, 'hottest', 31),
(16, 'hottest', 43),
(18, 'hottest', 47),
(20, 'hottest', 51),
(21, 'hottest', 50),
(22, 'hottest', 49),
(23, 'hottest', 46),
(24, 'hottest', 48);

-- --------------------------------------------------------

--
-- Table structure for table `step`
--

CREATE TABLE IF NOT EXISTS `step` (
  `id` int(11) NOT NULL,
  `step_description` varchar(1000) NOT NULL,
  `step_image` varchar(100) DEFAULT NULL,
  `related_recipe_id` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=310 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `step`
--

INSERT INTO `step` (`id`, `step_description`, `step_image`, `related_recipe_id`) VALUES
(1, 'In a blender, combine soy milk, oats, banana and strawberries. ', '', 1),
(2, 'Add vanilla and sugar if desired.', '', 1),
(3, 'Blend until smooth. ', '', 1),
(4, 'Bring quinoa and water to a boil in a saucepan. Reduce heat to medium-low, cover, and simmer until quinoa is tender and water has been absorbed, 10 to 15 minutes. Set aside to cool.', 'step_image/Picture_1_MvAE84w.png', 2),
(5, 'Whisk olive oil, lime juice, cumin, 1 teaspoon salt, and red pepper flakes together in a bowl.', 'step_image/Picture_1_JcPd2mj.png', 2),
(6, '这样', 'step_image/2020-03-23-Scene_BPAFLIZ.png', 3),
(7, '那样', 'step_image/2020-03-02-Scene_BjWH4bW.png', 3),
(8, 'In a blender, combine soy milk, oats, banana and strawberries. ', '', 4),
(9, 'Add vanilla and sugar if desired.', '', 4),
(10, 'Blend until smooth. ', '', 4),
(11, 'ascasca', '', 5),
(12, 'ascasc', '', 5),
(13, 'scasc', '', 5),
(14, 'scasa', '', 5),
(15, 'asc', 'step_image/test.jpeg', 6),
(16, 'asca', 'step_image/ttt.jpg', 6),
(17, 'asca', 'step_image/下载_26.jpeg', 6),
(18, 'asc', 'step_image/下载_30.jpeg', 6),
(19, 'In a medium bowl, stir together the tuna, mayonnaise, relish, Parmesan cheese, and onion flakes. ', 'step_image/Picture_1_M0KCaUH.png', 7),
(20, 'Season with parsley, dill, curry powder, and garlic powder.', 'step_image/Picture_1_LqkhKld.png', 7),
(21, 'Mix well and serve with crackers or on a sandwich.', 'step_image/Picture_1_zjKxKBB.png', 7),
(22, 'sdvsdv', 'step_image/sm1_rhn2idV.png', 9),
(23, 'sdvsdv', 'step_image/sm2.png', 9),
(24, 'sdvsvd', '', 9),
(25, 'In a blender, combine soy milk, oats, banana and strawberries. ', '', 10),
(26, 'Add vanilla and sugar if desired.', '', 10),
(27, 'Blend until smooth. ', '', 10),
(28, 'Place the corned beef briskets into a large pot. Sprinkle in one of the spice packets, and discard the other one or save for other uses. Pour in the beer, and fill the pot with enough water to cover the briskets by 1 inch. Add the bay leaves, peppercorns and garlic cloves. Cover, and bring to a boil.', 'step_image/Picture_1_6asKEce.png', 11),
(29, 'Once the liquid comes to a boil, reduce the heat to medium-low, and simmer for 4 to 5 hours, checking hourly, and adding more water if necessary to keep the meat covered.', 'step_image/Picture_1_evhvoE4.png', 11),
(30, 'Carefully remove the meat from the pot, as it will be extremely tender. Set on a cutting board, and allow it to rest until it firms up a bit, about 10 minutes. Slice or shred to serve. I discard the cooking liquid, but it can be used to cook cabbage and other vegetables if desired.', 'step_image/Picture_1_xE2KADH.png', 11),
(31, 'Lightly grease a 9x13 inch baking dish. Arrange half the bread cubes in the dish, and top with cream cheese cubes. ', '', 12),
(32, 'Sprinkle 1 cup blueberries over the cream cheese, and top with remaining bread cubes.', '', 12),
(33, 'Lightly grease a 9x13 inch baking dish. Arrange half the bread cubes in the dish, and top with cream cheese cubes. ', '', 13),
(34, 'Sprinkle 1 cup blueberries over the cream cheese, and top with remaining bread cubes.', '', 13),
(35, 'Lightly grease a 9x13 inch baking dish. Arrange half the bread cubes in the dish, and top with cream cheese cubes. ', '', 14),
(36, 'Sprinkle 1 cup blueberries over the cream cheese, and top with remaining bread cubes.', '', 14),
(37, 'Lightly grease a 9x13 inch baking dish. Arrange half the bread cubes in the dish, and top with cream cheese cubes. ', '', 15),
(38, 'Sprinkle 1 cup blueberries over the cream cheese, and top with remaining bread cubes.', '', 15),
(39, 'Lightly grease a 9x13 inch baking dish. Arrange half the bread cubes in the dish, and top with cream cheese cubes. ', '', 16),
(40, 'Sprinkle 1 cup blueberries over the cream cheese, and top with remaining bread cubes.', '', 16),
(41, 'Lightly grease a 9x13 inch baking dish. Arrange half the bread cubes in the dish, and top with cream cheese cubes. ', '', 17),
(42, 'Sprinkle 1 cup blueberries over the cream cheese, and top with remaining bread cubes.', '', 17),
(43, 'Lightly grease a 9x13 inch baking dish. Arrange half the bread cubes in the dish, and top with cream cheese cubes. ', '', 18),
(44, 'Sprinkle 1 cup blueberries over the cream cheese, and top with remaining bread cubes.', '', 18),
(45, 'Lightly grease a 9x13 inch baking dish. Arrange half the bread cubes in the dish, and top with cream cheese cubes. ', '', 19),
(46, 'Sprinkle 1 cup blueberries over the cream cheese, and top with remaining bread cubes.', '', 19),
(47, 'Lightly grease a 9x13 inch baking dish. Arrange half the bread cubes in the dish, and top with cream cheese cubes. ', '', 20),
(48, 'Sprinkle 1 cup blueberries over the cream cheese, and top with remaining bread cubes.', '', 20),
(49, 'Lightly grease a 9x13 inch baking dish. Arrange half the bread cubes in the dish, and top with cream cheese cubes. ', '', 21),
(50, 'Sprinkle 1 cup blueberries over the cream cheese, and top with remaining bread cubes.', '', 21),
(51, 'Lightly grease a 9x13 inch baking dish. Arrange half the bread cubes in the dish, and top with cream cheese cubes. ', '', 22),
(52, 'Sprinkle 1 cup blueberries over the cream cheese, and top with remaining bread cubes.', '', 22),
(53, 'Lightly grease a 9x13 inch baking dish. Arrange half the bread cubes in the dish, and top with cream cheese cubes. ', '', 23),
(54, 'Sprinkle 1 cup blueberries over the cream cheese, and top with remaining bread cubes.', '', 23),
(55, 'Lightly grease a 9x13 inch baking dish. Arrange half the bread cubes in the dish, and top with cream cheese cubes. ', '', 24),
(56, 'Sprinkle 1 cup blueberries over the cream cheese, and top with remaining bread cubes.', '', 24),
(57, 'Combine flour, white sugar, baking powder and salt. ', '', 25),
(58, ' In a separate bowl, mix together egg, milk, vegetable oil and bananas.', '', 25),
(59, 'Combine flour, white sugar, baking powder and salt. ', '', 26),
(60, ' In a separate bowl, mix together egg, milk, vegetable oil and bananas.', '', 26),
(61, 'Combine flour, white sugar, baking powder and salt. ', '', 27),
(62, ' In a separate bowl, mix together egg, milk, vegetable oil and bananas.', '', 27),
(63, 'Stir flour mixture into banana mixture; batter will be slightly lumpy.', '', 27),
(64, 'Heat a lightly oiled griddle or frying pan over medium high heat. Pour or scoop the batter onto the griddle, using approximately 1/4 cup for each pancake.', '', 27),
(65, 'In a blender, combine soy milk, oats, banana and strawberries. ', 'step_image/Picture_1_qR5xcg1.png', 28),
(66, 'Add vanilla and sugar if desired.', 'step_image/Picture_1_1y6iMCW.png', 28),
(67, 'Blend until smooth. ', 'step_image/Picture_1_Tf7lgvB.png', 28),
(68, 'Combine flour, white sugar, baking powder and salt. ', '', 29),
(69, ' In a separate bowl, mix together egg, milk, vegetable oil and bananas.', '', 29),
(70, 'Stir flour mixture into banana mixture; batter will be slightly lumpy.', '', 29),
(71, 'Heat a lightly oiled griddle or frying pan over medium high heat. Pour or scoop the batter onto the griddle, using approximately 1/4 cup for each pancake.', '', 29),
(72, 'Lightly grease a 9x13 inch baking dish. Arrange half the bread cubes in the dish, and top with cream cheese cubes. ', '', 30),
(73, 'Sprinkle 1 cup blueberries over the cream cheese, and top with remaining bread cubes.', '', 30),
(74, 'Lightly grease a 9x13 inch baking dish. Arrange half the bread cubes in the dish, and top with cream cheese cubes. ', 'step_image/Picture_1_gBex8e8.png', 31),
(75, 'Sprinkle 1 cup blueberries over the cream cheese, and top with remaining bread cubes.', 'step_image/Picture_1_8tN9Qkn.png', 31),
(76, 'In a large bowl, mix the eggs, milk, vanilla extract, and syrup. Pour over the bread cubes. Cover, and refrigerate overnight.', 'step_image/Picture_1_1hI1rNV.png', 31),
(77, 'Remove the bread cube mixture from the refrigerator about 30 minutes before baking. Preheat the oven to 350 degrees F (175 degrees C). Cover, and bake 30 minutes. Uncover, and continue baking 25 to 30 minutes, until center is firm and surface is lightly browned.', 'step_image/Picture_1_9YXm56D.png', 31),
(78, 'In a medium saucepan, mix the sugar, cornstarch, and water. Bring to a boil. Stirring constantly, cook 3 to 4 minutes. Mix in the remaining 1 cup blueberries. Reduce heat, and simmer 10 minutes, until the blueberries burst. ', 'step_image/Picture_1_y9sdvCk.png', 31),
(79, 'Stir in the butter, and pour over the baked French toast', 'step_image/Picture_1_TsNeUhc.png', 31),
(80, 'Combine flour, white sugar, baking powder and salt. ', 'step_image/Picture_1_XuXgFpt.png', 32),
(81, 'In a separate bowl, mix together egg, milk, vegetable oil and bananas.', 'step_image/Picture_1_31n3zgi.png', 32),
(82, 'Stir flour mixture into banana mixture; batter will be slightly lumpy.', 'step_image/Picture_1_HjcFctN.png', 32),
(83, 'Heat a lightly oiled griddle or frying pan over medium high heat. Pour or scoop the batter onto the griddle, using approximately 1/4 cup for each pancake.', 'step_image/Picture_1_aRt10Io.png', 32),
(84, 'Cook until pancakes are golden brown on both sides; serve hot.', 'step_image/Picture_1_Qzx4pqi.png', 32),
(85, 'Top with  maple syrup', 'step_image/Picture_1_J0EPYrW.png', 32),
(86, 'Bring sugar, butter, and evaporated milk to a boil in a heavy-bottomed saucepan, stirring constantly', 'step_image/Picture_1_Dn1W72q.png', 33),
(87, 'Cook and stir at a boil until mixture is smooth, 3 to 5 minutes.', 'step_image/Picture_1_W0T8fJx.png', 33),
(88, 'Line a 13x9-inch baking pan with parchment paper.', 'step_image/Picture_1_6wNGKXx.png', 33),
(89, 'Remove saucepan from heat. Stir white chocolate chips and marshmallow creme into the sugar mixture until completely melted. Add vanilla extract; stir.', 'step_image/Picture_1_bxEDguf.png', 33),
(90, 'Gently fold 1/2 cup crumbled cookies into the white chocolate mixture until just incorporated; spread into the prepared pan. ', 'step_image/Picture_1_xisTT0T.png', 33),
(91, 'Sprinkle 1 cup crushed cookies evenly over the top. Press cookies lightly into the fudge. Cool at room temperature until set. Cut into small squares to serve.', '', 33),
(92, '333', 'step_image/ttt_BUyeJTR.jpg', 34),
(93, '222', 'step_image/test_dE5Qxbq.jpeg', 34),
(94, '123', 'step_image/test_AdXoWvW.jpeg', 35),
(95, '123', 'step_image/ttt_Eibo5RL.jpg', 35),
(96, 'qwdqw', 'step_image/下载_26_fFjfW8F.jpeg', 36),
(97, 'qwdq', 'step_image/test_KP24Gr3.jpeg', 36),
(98, 'qwdq', 'step_image/ttt_10BLMFm.jpg', 37),
(99, 'qwdq', 'step_image/test_5mNZ7R7.jpeg', 37),
(100, 'Heat the oil in a frying pan over a low heat. Add the onion, cover, and fry for 15 mins, stirring occasionally. Cooking the onions over a low heat keeps them moist and brings out their natural sweetness. You could swap in a finely sliced leek if you prefer. To give it an extra layer of flavour, add a little finely chopped rosemary or thyme for the final min of cooking.', 'step_image/Xnip2020-11-20_00-58-35.jpg', 38),
(101, 'Using a mandolin or sharp knife, carefully cut the potatoes into very fi ne 3mm slices. Preheat the oven to gas 5, 190°C, fan 170°C. Grease a baking dish with the butter. Cut the potatoes into as uniform slices as possible, so that they cook evenly. You want them to be as thin as possible too, so they don’t take a long time to cook through and so that you have lots of layers for the cream to coat and flavour', 'step_image/Xnip2020-11-20_00-58-59.jpg', 38),
(102, 'Pour the milk and cream into a large saucepan, add the garlic cloves and bay leaf. Bring to the boil, then remove from the heat and add the nutmeg and some seasoning. Remove the garlic and bay leaf. Infusing the milk helps flavour the whole dish, making it beautifully aromatic. Using half milk and half cream helps to balance the richness, but you can alter the ratio if you prefer.', 'step_image/Xnip2020-11-20_00-59-17.jpg', 38),
(103, 'Add the sliced potatoes and onion to the milk, stir to coat. Transfer to the dish with a slotted spoon, layering as you go. Use a fish slice or slotted spoon to transfer the potatoes and onion to the dish, leaving the infused milk and cream in the saucepan.', 'step_image/Xnip2020-11-20_00-59-34.jpg', 38),
(104, 'Pour over the infused milk and scatter over the cheese. The cream mixture should come to just below the potato. Swap the cheese if you like: Roquefort will add a punchy flavour, while mozzarella will add gooeyness.', 'step_image/Xnip2020-11-20_00-59-52.jpg', 38),
(105, 'Bake for 1-1 hr 15 mins, covering with foil once golden. It’s ready when the top is golden and bubbling and the potatoes are tender all the way through. Test if it’s ready by piercing the centre with a sharp knife, it should go through easily. If not, bake for 10 mins more, then check again. Leave to stand for at least 5 mins, then top with the thyme sprigs, if you like.', 'step_image/Xnip2020-11-20_01-00-12.jpg', 38),
(106, 'Preheat oven to 375 degrees F (190 degrees C). Lightly grease a 10-inch quiche dish.\n', 'step_image/d1.png', 39),
(107, 'In a large bowl, beat together milk, eggs, baking mix, butter and parmesan cheese. Batter will be lumpy.', '', 39),
(108, 'Stir in broccoli, ham and Cheddar cheese. Pour into prepared quiche dish.', '', 39),
(109, 'Bake in preheated oven for 50 minutes, until eggs are set and top is golden brown.\n', '', 39),
(110, 'Done!', '', 39),
(111, 'Bring a large pot of salted water to a boil; cook linguine in boiling water until nearly tender, 6 to 8 minutes. Drain.', 'step_image/p1.png', 40),
(112, 'Melt 2 tablespoons butter with 2 tablespoons olive oil in a large skillet over medium heat. Cook and stir shallots, garlic, and red pepper flakes in the hot butter and oil until shallots are translucent, 3 to 4 minutes. ', '', 40),
(113, 'Season shrimp with kosher salt and black pepper; add to the skillet and cook until pink, stirring occasionally, 2 to 3 minutes. Remove shrimp from skillet and keep warm.', '', 40),
(114, 'Pour white wine and lemon juice into skillet and bring to a boil while scraping the browned bits of food off of the bottom of the skillet with a wooden spoon. Melt 2 tablespoons butter in skillet, stir 2 tablespoons olive oil into butter mixture, and bring to a simmer. Toss linguine, shrimp, and parsley in the butter mixture until coated; season with salt and black pepper. Drizzle with 1 teaspoon olive oil to serve', '', 40),
(115, '111', 'step_image/ttt_KJDVWM6.jpg', 41),
(116, '222', 'step_image/ttt_W0umDJa.jpg', 41),
(117, '333', 'step_image/ttt_uBBuDy3.jpg', 41),
(118, 'Boil 1kg peeled and diced potatoes in a large pan of water for 10 mins or until tender. Transfer the potatoes to a large bowl and mash.', 'step_image/Xnip2020-11-20_01-31-19.jpg', 42),
(119, 'Boil 300g frozen peas for 2 mins. Drain, mix with the mash and flake in 250g smoked mackerel fillets, discarding the skin and any bones.', 'step_image/Xnip2020-11-20_01-31-33.jpg', 42),
(120, 'Shape the mixture into 12 patties and chill for 30 mins. Heat 1 tbsp olive oil in a large frying pan and fry the fish cakes for 5 mins each side or until piping hot.', 'step_image/Xnip2020-11-20_01-31-46.jpg', 42),
(121, 'Serve the fishcakes whilst still hot, with salad, lemon wedges and a dollop of mayo, if you like.', 'step_image/Xnip2020-11-20_01-29-08.jpg', 42),
(122, 'Mix together the flour, salt, sugar and yeast in a large bowl. Make a well in the centre and set aside. With adult supervision, put the milk and butter in a small pan and warm over a low heat until the butter has just melted and the milk is steaming. Pour into the well in the flour, then add the egg. Stir until a wet dough forms.', 'step_image/Xnip2020-11-20_01-37-34.jpg', 43),
(123, 'Dust a surface with flour and knead the dough for 10 mins. If it’s too sticky, add extra flour, a little at a time (adding up to 50g). When it’s ready, it should feel elastic, smooth and no longer sticky. Clean and lightly oil the bowl, then put the dough in. Cover with clingfilm and leave in a warm place to rise for about 1 hr or until doubled in volume. Knock the air out of the dough using your fist, then divide it into 15 pieces (each weighing about 60g). Dust the work surface with flour, roll each piece of dough into a ball, then into a fat sausage shape about 10cm long.', 'step_image/Xnip2020-11-20_01-37-57.jpg', 43),
(124, 'Oil a large baking tray and place the dough on it in rows, leaving a 2cm gap between each piece. Lightly oil a piece of clingfilm and lay it over the buns. Allow to rise in a warm place for 30-45 mins until puffed up and just touching. Preheat the oven to gas 6, 200°C, fan 180°C. Bake for 10 mins or until lightly golden (an adult should take things in and out of the oven). When cool enough to handle, move to a wire rack and allow to cool completely. Gently pull the buns apart.', 'step_image/Xnip2020-11-20_01-38-17.jpg', 43),
(125, 'Divide the icing sugar between 3 wide, lipped bowls, then add 1 tbsp water and a couple of drops of a different food colour gel to each and mix until smooth (a little gel goes a very long way, so just start with small amount). Dip 5 buns into each bowl to just cover the tops with icing, scraping any excess off on the side of the bowl. ', 'step_image/Xnip2020-11-20_01-38-32.jpg', 43),
(126, 'Return to the tray and scatter over the sprinkles. Allow to set for 15 mins or until the icing is just hard. Will keep in an airtight container for up to 2 days but are best eaten the day they are iced.\n\n', 'step_image/Xnip2020-11-20_01-39-04.jpg', 43),
(127, 'Mix together the flour, salt, sugar and yeast in a large bowl. Make a well in the centre and set aside. With adult supervision, put the milk and butter in a small pan and warm over a low heat until the butter has just melted and the milk is steaming. Pour into the well in the flour, then add the egg. Stir until a wet dough forms.', 'step_image/Xnip2020-11-20_01-37-34_GUnQngP.jpg', 44),
(128, 'Dust a surface with flour and knead the dough for 10 mins. If it’s too sticky, add extra flour, a little at a time (adding up to 50g). When it’s ready, it should feel elastic, smooth and no longer sticky. Clean and lightly oil the bowl, then put the dough in. Cover with clingfilm and leave in a warm place to rise for about 1 hr or until doubled in volume. Knock the air out of the dough using your fist, then divide it into 15 pieces (each weighing about 60g). Dust the work surface with flour, roll each piece of dough into a ball, then into a fat sausage shape about 10cm long.', 'step_image/Xnip2020-11-20_01-37-57_u96vzY6.jpg', 44),
(129, 'Oil a large baking tray and place the dough on it in rows, leaving a 2cm gap between each piece. Lightly oil a piece of clingfilm and lay it over the buns. Allow to rise in a warm place for 30-45 mins until puffed up and just touching. Preheat the oven to gas 6, 200°C, fan 180°C. Bake for 10 mins or until lightly golden (an adult should take things in and out of the oven). When cool enough to handle, move to a wire rack and allow to cool completely. Gently pull the buns apart.', 'step_image/Xnip2020-11-20_01-38-17_mMfNfXL.jpg', 44),
(130, 'Divide the icing sugar between 3 wide, lipped bowls, then add 1 tbsp water and a couple of drops of a different food colour gel to each and mix until smooth (a little gel goes a very long way, so just start with small amount). Dip 5 buns into each bowl to just cover the tops with icing, scraping any excess off on the side of the bowl. ', 'step_image/Xnip2020-11-20_01-38-32_MGiIajw.jpg', 44),
(131, 'Return to the tray and scatter over the sprinkles. Allow to set for 15 mins or until the icing is just hard. Will keep in an airtight container for up to 2 days but are best eaten the day they are iced.\n\n', 'step_image/Xnip2020-11-20_01-39-04_tTtgaLC.jpg', 44),
(132, 'Preheat the oven to gas 3, 170°C, fan 150°C. Grease a 2.5-3ltr ovenproof dish with a little butter. Use a small, sharp knife to halve the vanilla pod lengthways, then scrape out the seeds. \n\nScraping the seeds from the pod means that they can disperse into the pudding, giving maximum flavour. For a taste twist, try a cinnamon stick, or pared orange or lemon zest.', 'step_image/Xnip2020-11-20_01-44-56.jpg', 45),
(133, 'Put the seeds and halved pod (or paste or extract) in a large saucepan with the milk and sugar. Warm over a medium heat for 4-5 mins to scald the milk – it should be steaming, and just bubbling around the edge. Add the rice, reduce the heat to low and stir for 1 min.\n\nScalding the milk before baking cuts down the overall cooking time and allows the flavour to infuse quickly. Use semi-skimmed milk for a lighter, less creamy version – or for a vegan pudding, use milk and butter alternatives.', 'step_image/Xnip2020-11-20_01-45-15.jpg', 45),
(134, 'Pour the rice mixture into the baking dish. Dot with the butter, if using, then top with half the nutmeg. \n\nWe’ve kept our rice pudding classic, but you can add a flavour if you like. For a chocolatey twist, whisk 25g sugar and 30g cocoa into the milk before scalding, then bake.', 'step_image/Xnip2020-11-20_01-45-37.jpg', 45),
(135, 'Bake for 30 mins, then remove from the oven and stir well, adding the remaining nutmeg. Stirring the pudding halfway through distributes the flavours and helps the rice grains to cook evenly. But don’t stir more than once if you want a good skin to form on top.\n\nBake for a further 30 mins, then increase the heat to gas 4, 180°C, fan 160°C and bake for a final 20 mins to brown the top.', 'step_image/Xnip2020-11-20_01-46-01.jpg', 45),
(136, 'Remove from the oven; leave to stand for 20 mins. Leaving the pudding to stand after baking allows it to cool a little and thicken, resulting in a rich and creamy texture.\n\nDiscard the vanilla pod, then serve with a generous spoonful of jam, if you like.', 'step_image/Xnip2020-11-20_01-46-40.jpg', 45),
(137, 'Put the chillies, garlic, vinegar, lemon juice and sugar in a food processor with some seasoning; blitz to a purée. Transfer to a bowl and stir in the paprika, oregano and oil.', 'step_image/Xnip2020-11-20_01-54-12.jpg', 46),
(138, 'Use a small, sharp knife to poke 6-8 deep holes all over each chicken leg, piercing fairly deeply. Place in a dish.', 'step_image/Xnip2020-11-20_01-54-32.jpg', 46),
(139, 'Brush half the sauce over the chicken legs. Cover, then marinate in the fridge for at least 1 hr, or overnight if preparing ahead. Preheat the oven to gas 3, 170°C, fan 150°C. Transfer the chicken legs to a roasting tin, leaving space between each, then roast for 40 mins.', 'step_image/Xnip2020-11-20_01-54-49.jpg', 46),
(140, 'Increase the oven to gas 7, 220°C, fan 200°C. Brush the remaining sauce all over the chicken with a pastry brush, then return to the oven and roast for a further 15 mins or until the chicken is cooked through and beginning to char. Serve with the lemon wedges for squeezing over.', 'step_image/Xnip2020-11-20_01-55-00.jpg', 46),
(141, 'Divide 40g granola between the holes of an ice cube tray, this will fill about 20-24 holes so you may need 1-2 trays depending on size.', 'step_image/Xnip2020-11-20_02-01-22.jpg', 47),
(142, 'Spoon in 200g Greek-style yogurt to cover the cereal, then top each with a few pieces of fruit, chopped if large (you''ll need about 150g of fresh fruit such as raspberries, blueberries and mango).\n', 'step_image/Xnip2020-11-20_02-01-50.jpg', 47),
(143, 'Freeze the trays until solid (1-2 hrs) or until needed. The frozen bites will keep for up to 1 month in the trays or can be transferred to an airtight container.', 'step_image/Xnip2020-11-20_02-02-16.jpg', 47),
(144, 'Allow to soften for a few minutes at room temperature, then pop out of the trays to serve.\n\n', '', 47),
(145, 'Preheat the oven to gas 6, 220°C, fan 200°C. Put the cauliflower florets and leaves on a large baking tray and sprinkle over the cumin, coriander and turmeric, then drizzle with olive oil and season lightly. Roast for 25 mins, adding the almonds for the final 7 mins of cooking time.', 'step_image/Screen_Shot_2020-11-19_at_11.06.25_PM.png', 48),
(146, 'Meanwhile, put the fennel, chickpeas, rocket, sultanas and almonds in a large mixing bowl; set aside. Mix the yogurt, lemon juice and garlic in a small bowl and season lightly.', 'step_image/Screen_Shot_2020-11-19_at_11.06.34_PM.png', 48),
(147, 'Stir the roasted cauliflower into the fennel mix. Divide between 4 plates and drizzle with the yogurt dressing to serve.', 'step_image/Screen_Shot_2020-11-19_at_11.06.34_PM_cn1H38J.png', 48),
(148, 'Rub 6 large sweet potatoes with 1 tbsp olive oil and bake for 35-45 mins in a preheated oven at gas 7, 220°C, fan 200°C until tender.\n\n', 'step_image/Xnip2020-11-20_02-05-48.jpg', 49),
(149, 'Arrange 600g boneless chicken thighs in a baking dish, drizzle with 1 tsp oil and bake for 20 mins or until cooked through. Shred the meat and stir in 160g BBQ sauce.', 'step_image/Xnip2020-11-20_02-06-07.jpg', 49),
(150, 'Halve the baked potatoes, scoop out the flesh and mix with the chicken. Arrange the skins in a baking dish and pile the mixture back in.', 'step_image/Xnip2020-11-20_02-06-58_1Dl58Ul.jpg', 49),
(151, 'Drizzle each potato with 1 tsp BBQ sauce and bake for 5 mins, until piping hot. Serve immediately.', 'step_image/Xnip2020-11-20_02-07-23.jpg', 49),
(152, 'Put a baking tray in the oven and preheat to gas 7, 220°C, fan 200°C. Toss 800g frozen butternut squash chunks in 1 tbsp olive oil and arrange on the hot tray. Roast for 25-30 mins, tossing once, until tender.', 'step_image/Xnip2020-11-20_02-11-28.jpg', 50),
(153, 'Tip the cooked butternut squash into a large bowl. Add 2 x 365g tins taco mixed beans, season and stir to combine. Divide the filling between 6 x 16cm rectangular pie dishes.\n\n', 'step_image/Xnip2020-11-20_02-11-39.jpg', 50),
(154, 'Cut a 375g sheet ready-rolled puff pastry into 6 even pieces and use to top the pies - depending on the size of your pie tins, you may need to roll out the pastry slightly to fit. Crimp the edges with a fork, pressing the pastry against the edge of the pie dishes, and cut a few slits in the top to let steam escape.', 'step_image/Xnip2020-11-20_02-11-53.jpg', 50),
(155, 'Bake for 10-15 mins until golden and crisp on top. Serve the pies hot, or allow to cool and freeze for another time (see freezing guidelines, below).', 'step_image/Xnip2020-11-20_02-10-12.jpg', 50),
(156, 'Preheat the oven to gas 8, 230°C, fan 210°C. Peel 4 large potatoes. Chop 2 potatoes into small cubes, parboil in a pan of boiling water for 5 mins, then drain. Slice the remaining 2 potatoes as thinly as you can and set aside.', 'step_image/Xnip2020-11-20_02-17-30.jpg', 51),
(157, 'In a medium baking dish, mix 180g shredded ham hock, 600g Tesco Finest cream of mushroom soup and the cubed potatoes together to create the filling. Top with the thinly sliced potatoes and brush with a little olive oil.', 'step_image/Xnip2020-11-20_02-17-46.jpg', 51),
(158, 'Bake for 50-55 mins until piping hot with a crispy top.', 'step_image/Xnip2020-11-20_02-18-11.jpg', 51),
(159, 'Preheat the oven to gas 7, 220°C, fan 200°C. Cut one large broccoli into florets and slice the stalk. Boil for 3 mins, then drain.', 'step_image/Xnip2020-11-20_02-23-09.jpg', 52),
(160, 'Meanwhile, microwave 600g Tesco cheese sauce for 5 mins, stirring halfway.', 'step_image/Xnip2020-11-20_02-23-27.jpg', 52),
(161, 'Tip the broccoli florets into a large baking dish, pour over the warm cheese sauce and sprinkle with 225g Finest Wild Sage & Buttered Onion Stuffing.', 'step_image/Xnip2020-11-20_02-23-38.jpg', 52),
(162, 'Bake for 20 mins, then serve immediately.', 'step_image/Xnip2020-11-20_02-24-07.jpg', 52),
(163, 'Preheat oven to gas 6, 200°C, fan 180°C. Place 360g 12 pork & beef meatballs in a large baking dish and bake in the oven for 15 mins. They should be slightly golden and crispy on top.', 'step_image/Xnip2020-11-20_02-27-19.jpg', 53),
(164, 'Remove the baking dish from the oven and scatter a drained 400g tin 3 bean salad around the meatballs. Spoon over 300g frozen shredded red cababge and apple.', 'step_image/Xnip2020-11-20_02-27-39.jpg', 53),
(165, 'Use a spoon to mix the red cabbage with the salad beans.', 'step_image/Xnip2020-11-20_02-27-52.jpg', 53),
(166, 'Return to the oven for a further 10 mins until the beans and cabbage are piping hot. Serve immediately.', 'step_image/Xnip2020-11-20_02-28-13.jpg', 53),
(167, 'Put 4 lamb chops in a dish and rub all over with 2 tbsp harissa paste. Cover and set aside to marinate for 30 mins.', 'step_image/Xnip2020-11-20_02-31-38.jpg', 54),
(168, 'Grill the chops on a preheated barbecue for 3-4 mins each side for medium-rare, or 5-6 mins for medium-well. Set aside to rest for 1 min.', 'step_image/Xnip2020-11-20_02-31-59.jpg', 54),
(169, 'Spoon a 200g tub tzatziki onto a serving platter, spreading out to cover.\n\n', 'step_image/Xnip2020-11-20_02-32-17.jpg', 54),
(170, 'Arrange the chops on top of the tzatziki and drizzle over a little extra harissa or olive oil, if you like. Grab a napkin and scoop up the spicy chops with the cool dip.\n\n', 'step_image/Xnip2020-11-20_02-32-37.jpg', 54),
(171, 'In a jug, mix together your chosen flavour of jelly (we used orange) with the boiling water until all the crystals have dissolved. Set aside to cool until slightly thickened.', 'step_image/Xnip2020-11-20_02-35-12.jpg', 55),
(172, 'Divide the fruit between the holes of a silicone ice cube tray. This will fill about 14 holes depending on size.', 'step_image/Xnip2020-11-20_02-35-32.jpg', 55),
(173, 'Pour the jelly over the fruit and up to the top of each mould. Chill for 1 hour or until set.', 'step_image/Xnip2020-11-20_02-35-56.jpg', 55),
(174, 'Pop the jellies out of the tray to serve - you may need a palate knife to help ease them out.', 'step_image/Xnip2020-11-20_02-34-20.jpg', 55),
(175, 'Heat 15g butter and 1 tbsp olive oil in a large frying pan. Add 1 finely diced onion and 1 crushed garlic clove and gently cook for 5-10 minutes or until softened. Stir in 300g risotto rice. Turn up the heat to medium-high and pour in 150ml wine – it should sizzle and start to bubble instantly. Gradually add in 900ml stock a ladleful at a time, stirring continuously until the rice is tender, this should take about 15 minutes. Stir in 50g grated Parmesan or vegetarian hard cheese and season to taste. Spread the hot mixture over a large baking tray and set aside to cool completely.', 'step_image/Xnip2020-11-20_02-43-30.jpg', 56),
(176, 'Meanwhile, make the sauce by gently cooking 1 crushed garlic clove and a pinch of chilli flakes in 1 tbsp olive oil for 5 minutes. Add 500g passata and simmer gently for 10 minutes. Once cooked, add a generous pinch of finely chopped fresh oregano and plenty of salt and pepper. Keep warm.', 'step_image/Xnip2020-11-20_02-43-44.jpg', 56),
(177, 'Once the risotto has cooled completely, divide the mixture into 18 and flatten each piece in damp hands. Cup the mixture and fill the centre with a 1cm chunk of mozzarella. Shape into a ball by bringing the sides up and sealing at the top. Shaping is much easier with clean, damp hands, so make sure to wash them every 3-4 you shape. Repeat with the remaining mixture.\n\n', 'step_image/Xnip2020-11-20_02-44-09.jpg', 56),
(178, 'Put 100g plain flour, 2 beaten eggs and 200g breadcrumbs into three separate bowls. Add a little salt and pepper to the plain flour. Coat the balls in the seasoned flour then in the egg and finally the breadcrumbs. Space them out on a large baking tray. Repeat until all the arancini are coated.\n\n', 'step_image/Xnip2020-11-20_02-44-26.jpg', 56),
(179, 'Line a large baking tray with kitchen paper. Heat 375ml vegetable oil in a wide, heavy based pan to 170°C – if you don’t have a thermometer, test the temperature by dropping in a small cube of bread, if the oil is hot enough, the bread should brown in around 30 seconds. Fry the arancini in batches for 4 minutes at a time, making sure they are not crowded in the pan. Once done, drain on the kitchen paper and sprinkle with a little salt while still hot.', 'step_image/Xnip2020-11-20_02-44-43.jpg', 56),
(180, 'Pile the arancini onto a plate and serve with the marinara sauce on the side for dipping.', 'step_image/Xnip2020-11-20_02-41-59.jpg', 56),
(181, 'To make the dough, place 500g strong white flour and ½ tsp salt into a large mixing bowl. Add a 7g sachet fast action yeast to a jug filled with 325ml lukewarm water. Add 1 tsp golden caster sugar and 2 tbsp olive oil to the jug and mix well. Leave to stand for 5 minutes to allow the yeast to activate. Make a well in the flour and pour in the yeast mixture. Mix well with the handle of a wooden spoon until the mixture begins to come together.', 'step_image/Xnip2020-11-20_02-48-48.jpg', 57),
(182, 'Dust a clean work surface with some flour, remove the dough from the bowl and knead for 4-5 minutes, or until the dough is smooth and elastic.\n\n', 'step_image/Xnip2020-11-20_02-49-05.jpg', 57),
(183, 'Place in a floured bowl and cover with a warm cloth. Leave to rise in a warm place for around 20 minutes. Preheat the oven to gas 6, 180°C, fan 200°C.', 'step_image/Xnip2020-11-20_02-49-27.jpg', 57),
(184, 'Prepare a sheet of baking paper approximately 34 x 38cm. When the dough has doubled in size, punch it to allow the air to escape and transfer to the baking paper. Using a rolling pin, roll it out to approximately 30 x 34cm. Trim off any excess dough and discard. Prick the dough all over with a fork.\n\n', 'step_image/Xnip2020-11-20_02-49-47.jpg', 57),
(185, 'Spread 6 tbsp of pasta sauce over the dough, leave a 2.5cm gap at the far end and a 1cm gap on both the right and left side. Sprinkle 200g grated mozzarella cheese over the sauce. Top with 150g sliced ham and 150g halved cherry tomatoes. Sprinkle with 1 tsp dried oregano and a little salt and pepper. Roughly tear 10 fresh basil leaves and sprinkle over.', 'step_image/Xnip2020-11-20_02-50-12.jpg', 57),
(186, 'Time to roll it up! Tuck in each edge along the right and left sides. Then begin rolling from the front to create a log.', 'step_image/Xnip2020-11-20_02-50-31.jpg', 57),
(187, 'Transfer to a lined baking tray. Brush with a little milk, sprinkle with some grated Parmesan and dried oregano. Make little scores in the top of the dough using a sharp knife and place into a preheated oven for 25 minutes.', 'step_image/Xnip2020-11-20_02-50-49.jpg', 57),
(188, 'Remove from oven and allow to rest for 5 minutes before serving. When ready to serve, cut into thick slices using a bread knife.', 'step_image/Xnip2020-11-20_02-46-48.jpg', 57),
(189, 'Preheat the oven to gas 7, 220°C, fan 200°C. Prick 1kg of Desiree potatoes all over with a fork. Arrange in an oven tray and cook for 1 hour to 1 hour and 15 minutes or until cooked through. Remove from the oven, halve and scoop the flesh into a bowl.\n\n', 'step_image/Xnip2020-11-20_02-58-01.jpg', 58),
(190, 'Put the cooked potato though a ricer to mash it finely. If you don’t have a ricer, a sieve will do the trick – just make sure the mash is very smooth.', 'step_image/Xnip2020-11-20_02-58-22.jpg', 58),
(191, 'While the mash is still warm, stir in 4 large egg yolks, ½ grated nutmeg and a good pinch of salt. Add 100g plain flour and mix well to form a dough. Tip the dough onto a floured surface, slice a piece off and roll into a 2cm thick long log.', 'step_image/Xnip2020-11-20_02-58-38.jpg', 58),
(192, 'Cut the log into 2cm pieces and roll each piece over the back of a fork. Put the gnocchi onto a floured tray. Repeat with the remaining dough.', 'step_image/Xnip2020-11-20_02-59-04.jpg', 58),
(193, 'Bring a large pan of water to the boil. Meanwhile, in a separate pan, melt 125g butter along with 1 tbsp olive oil. Pick the leaves from 25g sage. When the butter is foaming, toss in the sage leaves and cook for 1-2 minutes or until the leaves crisp up. Using a slotted spoon, remove them from the butter and set aside. Keep the butter on a low heat.', 'step_image/Xnip2020-11-20_02-59-36.jpg', 58),
(194, 'Add a pinch of salt to the pan of water. Once boiling, carefully drop in half the gnocchi. When they begin to rise to the surface, scoop them up with a slotted spoon and add them to the melted butter. Don''t worry about introducing pasta water as this will help the butter sauce emulsify. Repeat with the remaining gnocchi.', 'step_image/Xnip2020-11-20_02-59-57.jpg', 58),
(195, 'When all the gnocchi is in the pan, increase the heat to medium and toss the gnocchi well to coat. Grate 40g of Parmesan. Add half to the pan, along with the sage leaves. If you need a little more sauce, simply add a small ladle of pasta water to loosen.', 'step_image/Xnip2020-11-20_03-00-16.jpg', 58),
(196, 'Sift 175g plain flour into a mixing bowl, then add 175ml boiling water. Stir with a wooden spoon until it comes together as a dough. Dust a work surface with flour and knead the dough for 2-3 minutes or until smooth. Return the dough to the bowl, cover with clingfilm and set aside to rest.\n\n', 'step_image/Xnip2020-11-20_03-05-03.jpg', 59),
(197, 'Meanwhile, make the pork and chive filling. Put 300g minced pork, 75g finely chopped cabbage, 1 tbsp grated ginger and 15g finely chopped chives into a bowl. Season with 1 tbsp sesame oil, 1 tbsp soy sauce and ½ tsp ground white pepper. Mix well, then cover and set aside in the fridge until needed.', 'step_image/Xnip2020-11-20_03-05-22.jpg', 59),
(198, 'Divide the dough into 2 equal portions. Roll each piece of dough into even-sized log shape, then cut each log into 12 equal pieces. Dust a work surface with flour, then roll each piece of dough into a thin circle. Use a 9cm round cutter to cut each circle to an even size.\n\n', 'step_image/Xnip2020-11-20_03-05-38.jpg', 59),
(199, 'Dip your finger into a little water and dot water around one half of the outside of the circle. Put 1 heaped tsp pork and chive filling in the middle of the circle. Lift up the dough around the filling and pinch together, then crimp the folded edge of the dough into four even pleats. Repeat with the remaining dumplings.', 'step_image/Xnip2020-11-20_03-05-57.jpg', 59),
(200, 'Make the dipping sauce by mixing together 2 tbsp soy sauce, 1 tbsp rice vinegar and 1 tsp chilli oil.', 'step_image/Xnip2020-11-20_03-06-21.jpg', 59),
(201, 'Cook the dumplings in two batches. Add 1 tbsp vegetable oil to a frying pan with a good fitting lid. When the oil is hot, add 12 dumplings, flat-side down and cook for 2-3 minutes or until golden brown. Add 100ml water to the pan, cover and cook for a further 3-4 minutes. Remove the lid and continue to cook until all the water has evaporated. Repeat with the remaining 12 dumplings.', 'step_image/Xnip2020-11-20_03-06-38.jpg', 59),
(202, 'Sprinkle the dumplings with some chopped chives to garnish and serve with the dipping sauce.', 'step_image/Xnip2020-11-20_03-03-35.jpg', 59),
(203, 'Preheat the oven to gas 7, 220°C, fan 200°C. Pat dry 1 x 1kg piece rolled pork belly with kitchen paper. Peel 3 small white onions, then cut each one in half through the root. Trim a little bit off the rounded side of each onion and lay flat-side-up in a roasting tin. This will act as a trivet for the pork, so it doesn''t burn.', 'step_image/Xnip2020-11-20_03-15-12.jpg', 60),
(204, 'Roll out the pork and score the skin side with a sharp knife. Then flip the meat over and score the inside flesh, too. If there is a thicker piece of meat, slice it open with a knife to butterfly it.', 'step_image/Xnip2020-11-20_03-15-32.jpg', 60),
(205, 'Make the filling by measuring ¼ tsp chilli flakes, ½ tsp fennel seeds, 2 sliced garlic cloves, 1 tbsp chopped rosemary leaves and 1 tbsp olive oil into a bowl. Add some salt and pepper and mix well. Rub this onto the flesh side of the pork, making sure to rub it into all the cuts in the meat.', 'step_image/Xnip2020-11-20_03-15-51.jpg', 60),
(206, 'Roll up the meat well. Secure with 2 pieces of butcher’s string. Season with 2 tsp flaky sea salt put the meat on top of the onion trivet. Add 150ml white wine and 150ml water to the roasting tin.', 'step_image/Xnip2020-11-20_03-16-07.jpg', 60),
(207, 'Cook at gas 7, 220°C, fan 200°C for 1 hour, then remove the pork from the oven and turn the heat down to gas 5, 190°C, fan 170°C. Add another 150ml wine and 150ml water to the tray and return to the oven for a further 30 minutes or until the pork is cooked through. Remove from the oven and rest for 10 minutes.', 'step_image/Xnip2020-11-20_03-16-29.jpg', 60),
(208, 'Remove the string from the pork and cut into 8 even-size slices. Serve with a spoonful or two of the pan juices and your favourite vegetables alongside.', 'step_image/Xnip2020-11-20_03-16-49.jpg', 60),
(209, 'Place 300g beef mince and 300g pork mince into a large mixing bowl and season with salt and pepper. Add 1 tsp of dried oregano, 2 tbsp finely chopped parsley and 2 tbsp grated Parmesan to the bowl. Crack in a large egg and add 4 tbsp fresh breadcrumbs. Using your hands, mix all the ingredients together for at least 2-3 minutes. This helps the meatballs stick together well. Divide the mixture into 16 equal pieces, which will be enough to serve 4.', 'step_image/Xnip2020-11-20_03-21-40.jpg', 61),
(210, 'Cut 120g mozzarella into 16 even-sized cubes. Take one piece of meatball mixture in the palm of your hand and flatten.', 'step_image/Xnip2020-11-20_03-21-59.jpg', 61),
(211, 'Place the mozzarella in the middle and pinch the meat mixture around the cheese, so that it encases it. Roll into a round shaped meatball. Repeat with the remaining meatballs.', 'step_image/Xnip2020-11-20_03-22-15.jpg', 61),
(212, 'Heat 2 tbsp olive oil in a non-stick sauté pan. Add half of the meatballs and cook gently until brown on all sides. Remove them from the pan and set aside on a plate. Repeat with the remaining meatballs.', 'step_image/Xnip2020-11-20_03-22-37.jpg', 61),
(213, 'Add one finely chopped onion to the pan and cook until softened. Make sure to scrape off any meaty bits that are stuck to the pan. Stir in 2 grated garlic cloves and cook for a further 2 minutes. Add 680g passata along with a 400g tin of chopped tomatoes. Season the sauce with salt and pepper. Add ½ tsp dried oregano and ¼ tsp dried chilli flakes, then simmer for 15 minutes. Add the meatballs and any juices back to the pan and simmer gently for a further 10 minutes.', 'step_image/Xnip2020-11-20_03-22-55.jpg', 61),
(214, 'Serve with spaghetti, a sprinkling of Parmesan and some fresh basil leaves.', 'step_image/Xnip2020-11-20_03-19-28.jpg', 61),
(215, 's', 'step_image/Untitled-2.png', 62),
(216, 't', 'step_image/Netflix_Logo_Final.png', 63),
(217, 'Defrost a 400g whole cooked lobster overnight in the fridge. Then twist off the claws, cover them with a tea towel and gently hit with a rolling pin. Remove the meat in large pieces and put in a bowl, discarding any shell.', 'step_image/Xnip2020-11-20_04-00-21.jpg', 64),
(218, 'Turn the lobster on its back and pull back the tail. Using a sharp knife, cut along the entire length and separate into two halves. ', 'step_image/Xnip2020-11-20_04-00-46.jpg', 64),
(219, 'Remove the tail meat from each half and add to the bowl (discard the stomach sac, gills, intestinal thread and shell). Dice the meat into small pieces. ', 'step_image/Xnip2020-11-20_04-01-06.jpg', 64),
(220, 'Mix 2 tbsp mayonnaise, 1 tbsp tomato ketchup, a few drops of Tabasco and the juice of half a lemon in a small bowl with seasoning. Finely dice half a small red onion, then rinse under cool running water to remove a little of its pungency. Pat dry, then add 3 tbsp to the bowl along with 2 tbsp finely diced celery and 1 1/2 tbsp finely diced cornichons. Add the lobster meat and 1 tbsp chopped dill to the bowl, and gently mix with the dressing.', 'step_image/Xnip2020-11-20_04-01-22.jpg', 64),
(221, 'Slice five butter brioche rolls in half, and then slice each half open horizontally, avoiding cutting all the way through. Open the rolls up and spoon the lobster mixture between them. ', 'step_image/Xnip2020-11-20_04-01-42.jpg', 64),
(222, 'Sprinkle each with a little cayenne pepper and top with a small sprig of dill. Serve with lemon wedges to squeeze over.\n\n', 'step_image/Xnip2020-11-20_04-02-02.jpg', 64),
(223, 'Preheat the oven to gas 6, 200˚C, fan 180˚C. Line a baking sheet with baking parchment. Set aside 8 pecans for decorating. In a food processor, blitz the remaining pecans and dates together until you have a coarse crumb.\n\n', 'step_image/Xnip2020-11-20_04-09-18.jpg', 65),
(224, 'Tip the mixture into a bowl and stir in the maple syrup, mixing everything together until a dough is formed.', 'step_image/Xnip2020-11-20_04-09-35.jpg', 65),
(225, 'Shape the mixture into 8 x 4cm balls and arrange on prepared baking tray. Top each cookie with a pecan.', 'step_image/Xnip2020-11-20_04-09-58.jpg', 65),
(226, 'Slightly flatten each cookie with your hand and bake for 15 mins.', 'step_image/Xnip2020-11-20_04-10-15.jpg', 65),
(227, 'Preheat the oven to gas 3, 160°C, fan 140°C. Grease and line a 20cm round cake tin. Beat 8 large eggs in a large mixing bowl until doubled in volume (this will take about 10 mins).', 'step_image/Xnip2020-11-20_04-12-29.jpg', 66),
(228, 'Put 225g unsalted butter and 450g chopped dark chocolate in a pan and gently melt over a low heat. Allow to cool slightly, then carefully fold into the eggs.', 'step_image/Xnip2020-11-20_04-12-52.jpg', 66),
(229, 'Pour the mixture into the prepared cake tin and wrap the outside of the tin in foil. Place in a large roasting tin one-third filled with boiling water. Bake for 1 hr or until a skewer inserted into the middle comes out clean.', 'step_image/Xnip2020-11-20_04-13-14.jpg', 66),
(230, 'Allow the cake to cool completely before removing from the tin. Serve with a dusting of icing sugar and a few fresh raspberries, if you like.', 'step_image/Xnip2020-11-20_04-11-39.jpg', 66),
(231, 'In a large bowl, mix together 250g self-raising flour, 2 tbsp sunflower oil and 150ml water to make a soft dough. Lightly dust the work surface with flour.', 'step_image/Xnip2020-11-20_04-16-46.jpg', 67),
(232, 'Divide the dough into 6 balls and leave to rest for 5 mins. Roll out each ball into a large circle (about 0.5cm thick).', 'step_image/Xnip2020-11-20_04-17-04.jpg', 67),
(233, 'Place a fying pan over a medium heat. Brush the tops of each circle with a little oil to coat, then sprinkle with your favourite dried spices to add flavour (try chilli flakes or a mix such as dukkah). Fry the breads in the hot pan for 1 min each side until puffed, golden and cooked through.', 'step_image/Xnip2020-11-20_04-17-24.jpg', 67),
(234, 'Allow to cool slightly before serving, drizzled with a little extra oil, if you like.\n\n', 'step_image/Xnip2020-11-20_04-15-47.jpg', 67),
(235, 'Mix 300g self-raising flour with 150g grated mature Cheddar in a large bowl. Stir in 250g low-fat natural yogurt until it comes together.', 'step_image/Xnip2020-11-20_04-19-41.jpg', 68),
(236, 'Tip the dough out onto a lightly floured work surface and knead gently a few times until smooth. Pat into a round then roll out with a lightly floured rolling pin to a thickness of 2cm. Stamp out 10 scones using a 6cm round cutter, re-rolling the trimmings as needed. Transfer to a baking tray lined with baking paper.', 'step_image/Xnip2020-11-20_04-20-01.jpg', 68),
(237, 'Sprinkle the tops of the scones with another 50g grated mature Cheddar, then bake at gas 6, 200°C, fan 180°C for 18 mins or until light golden and springy to the touch.', 'step_image/Xnip2020-11-20_04-20-21.jpg', 68),
(238, 'Transfer to a wire rack to cool slightly, serve still warm as they are, or split and spread with butter or fill as you like.', 'step_image/Xnip2020-11-20_04-18-48.jpg', 68),
(239, 'Slice 500g of cleaned squid into 1cm thick rings. Leave the tentacles whole or, if they are large, cut them in half. Place the squid into a bowl and cover with 400ml whole milk. Leave them for at least 30 minutes to tenderise, or ideally up to 8 hours. The longer you leave the squid, the more tender it will be.', 'step_image/Xnip2020-11-20_04-24-29.jpg', 69),
(240, 'Meanwhile, make a very quick aioli by grating 1 small garlic clove into 200g good quality mayonnaise. Season with salt and pepper and a good squeeze of lemon juice. Mix well and set aside until needed.', 'step_image/Xnip2020-11-20_04-24-53.jpg', 69),
(241, 'Place 70g cornflour and 70g plain flour into a shallow bowl. Season liberally with salt and pepper. Add the zest of a lemon, 1 tbsp finely chopped parsley and ½ tsp smoked paprika to the bowl. Mix well and set aside. Take small handfuls of the squid and allow any excess liquid to drain away. Toss well into the flour mix and shake off any excess. Set to one side on a plate, ready for cooking. ', 'step_image/Xnip2020-11-20_04-25-13.jpg', 69),
(242, 'Heat 2.5cm vegetable oil in a deep-sided sauté pan. Check the temperature by dropping a small pinch of flour into the oil. If the oil sizzles, it is ready. Once it is hot enough, gently place half the squid into the oil. Allow the calamari to cook for around 2-3 minutes, turning once. When they are brown, add a handful of sage leaves to the pan, cook for 1 minute and then remove the squid and sage with a slotted spoon. Drain on absorbent paper. Repeat with the remaining squid.', 'step_image/Xnip2020-11-20_04-25-31.jpg', 69),
(243, 'Sprinkle with salt and serve with lemon wedges and the garlic aioli.', 'step_image/Xnip2020-11-20_04-25-58.jpg', 69),
(244, 'Start by sterilising 6 x 200ml heatproof jars – Kilner jars or jam jars with a resealable lid work well. Wash them in the sink with hot, soapy water and rinse clean. Dry in the oven for 1 hr at gas 1, 140°C, fan 120°C. Set aside. Once cooled, grease each jar with butter.\n\n', 'step_image/Xnip2020-11-20_04-30-37.jpg', 70),
(245, 'Heat 1 tbsp olive oil in a large pan over a high heat. Add 600g salmon fillets, skin-side down to start with. Reduce the heat to medium and cook for 2 mins on each side. Cover the pan and cook for a further 1 min. Turn off the heat, but leave the fish in the pan for 5 mins (it will continue cooking in the residual heat).', 'step_image/Xnip2020-11-20_04-30-49.jpg', 70),
(246, 'Melt 150g unsalted butter in a small pan over a low heat. Once melted, continue heating for about 8 mins, until it turns slightly darker in colour and the white milk solids rise to the surface.\n\n', 'step_image/Xnip2020-11-20_04-31-17.jpg', 70);
INSERT INTO `step` (`id`, `step_description`, `step_image`, `related_recipe_id`) VALUES
(247, 'Meanwhile, peel off and discard the salmon skin. Scatter ½ tsp nutmeg, ¼ tsp cayenne pepper, 5 drops Worcestershire sauce and a little seasoning over the fish, then flake with a fork. Discard any stray bones.', 'step_image/Xnip2020-11-20_04-31-43.jpg', 70),
(248, 'Pour the butter into a jug through a muslin-lined sieve to catch the milk solids (these can be discarded) – this is called clarifying. Pour half the liquid butter over the flaked salmon and return to a low heat. Warm through for 5 mins, stirring occasionally.', 'step_image/Xnip2020-11-20_04-32-00.jpg', 70),
(249, 'Divide the fish between the jars, then pour over the remaining clarified butter to form a seal. Chill for at least 4 hrs, or for up to 3 days.', 'step_image/Xnip2020-11-20_04-32-23.jpg', 70),
(250, 'To serve, scatter each pot with a pinch of cayenne pepper and enjoy with sliced lemon and toast, if you like.', 'step_image/Xnip2020-11-20_04-29-10.jpg', 70),
(251, 'Using a sharp knife, make diagonal cuts in the flesh on each side, about  1.5cm (3/4in) deep.', 'step_image/Xnip2020-11-20_04-38-44.jpg', 71),
(252, 'Put a few slices of lemon (halved if necessary) and sprigs of herbs in the cavity of each fish – thyme, rosemary, dill and parsley all work well. \n\n', 'step_image/Xnip2020-11-20_04-39-01.jpg', 71),
(253, 'Rub the skin all over with oil.', 'step_image/Xnip2020-11-20_04-39-19.jpg', 71),
(254, 'Cooking times will vary depending on the size of the fish. Sardines will cook in about 5 minutes, fish weighing about 500g will take 15-20 minutes and fish weighing about 1kg will take 20-30 minutes. Cook the fish on indirect heat for half the cooking time until the skin crisps. Turn it over and cook for the rest of the time or until the fish flakes easily. ', 'step_image/Xnip2020-11-20_04-39-46.jpg', 71),
(255, 'Serve with more lemon slices for squeezing and some extra chopped herbs.', 'step_image/Xnip2020-11-20_04-37-47.jpg', 71),
(256, 'For a simple marinade that’s great with chicken (as well as fish), mix 6 tbsp lemon juice with 6 tbsp olive oil, 1 crushed garlic clove and a few sprigs of thyme or rosemary. Season.', 'step_image/Xnip2020-11-20_04-44-28.jpg', 72),
(257, 'Butterfly the chicken breasts to make them thinner and ensure that they cook all the way through. To do this, place the chicken breast on a board and lay one hand flat on top, then use a sharp knife to carefully cut horizontally through the middle almost all the way though. Open out and lay flat.', 'step_image/Xnip2020-11-20_04-44-50.jpg', 72),
(258, 'Put the chicken and the marinade in a large ziplock bag and seal it closed. Gently shake to ensure all the chicken is coated. Put the bag in a large dish in the fridge and leave for 2-3 hours, gently shaking the bag occasionally to ensure the meat marinates evenly.', 'step_image/Xnip2020-11-20_04-45-08.jpg', 72),
(259, 'About 20 minutes before cooking, remove the chicken from the fridge and drain off the marinade and discard. The meat needs to be at room temperature to cook evenly. Cook the butterflied breasts over direct heat on one side for 3 minutes, then flip over and cook for another 3 minutes. Then cook for another 3 minutes on each side. Check the chicken is cooked through by making a small cut into the thickest part of one – there should be no pink showing.', 'step_image/Xnip2020-11-20_04-45-29.jpg', 72),
(260, 'Scatter some fresh chopped parsley or thyme leaves over the cooked chicken and serve.', 'step_image/Xnip2020-11-20_04-43-05.jpg', 72),
(261, 'Rinse 1 kg fresh mussels under cold running water to remove any grit, then use a cutlery knife to scrape off any barnacles.\n\n', 'step_image/Xnip2020-11-20_04-50-42.jpg', 73),
(262, 'Discard any cracked mussels. Gently tap any open mussels on a chopping board. Discard any that don''t close, as they are dead.', 'step_image/Xnip2020-11-20_04-51-00.jpg', 73),
(263, 'While the ''beard'' isn''t harmful, it isn''t very nice to eat. To remove, grasp it between your thumb and fore finger and pull downwards towards the hinged end of the shell. Tug firmly until it comes out.', 'step_image/Xnip2020-11-20_04-51-22.jpg', 73),
(264, 'Place a large, heavy-based lidded saucepan over a low heat. Add 15g butter, 1 finely diced onion and 2 finely sliced spring onions; cook, covered, for 10-12 mins until the onions are soft. Don''t let them colour. You want the flavour to be sweet and delicate rather than caramelised. Add 2 crushed garlic cloves and ½ x 15g pack of roughly chopped flat-leaf parsley to the pan. Fry for 2 mins, covered, then add 100ml wine and 100ml water. Remove the lid, increase the heat to bring to a simmer. You could also give the sauce a delicate herby flavour by adding bay leaves or thyme before adding the liquid.', 'step_image/Xnip2020-11-20_04-51-44.jpg', 73),
(265, 'Tip the mussels into a colander set over a bowl to catch the liquid for the sauce. Discard any mussels that haven''t opened. Cover with a lid to keep warm while you make the sauce.', 'step_image/Xnip2020-11-20_04-52-16.jpg', 73),
(266, 'Pour the liquid into the pan and boil for 3-4 mins until reduced by half. Taste the reduced liquid before you add the cream. It should be intense (the cream will dilute it). If it''s not strong, reduce for a few mins more. Once the reduced liquid has reached the appropriate intensity, reduce the heat to low and stir in 100ml single cream.', 'step_image/Xnip2020-11-20_04-52-37.jpg', 73),
(267, 'Transfer the mussels to serving bowls, pour over the sauce, sprinkle over the remaining parsley and serve with the French fries.\n\n', 'step_image/Xnip2020-11-20_04-48-55.jpg', 73),
(268, 'Strip the leaves from a medium bunch of coriander and roughly chop the stalks, reserving the leaves to garnish. Put the stalks, 12 hot green chillies (deseeded if you prefer less heat), a 5cm piece of chopped ginger or galangal, a roughly chopped stalk of lemongrass, 3 peeled garlic cloves, the zest and juice of a lime, 2 peeled and roughly chopped shallots, 3 kaffir lime leaves and 1tbsp shrimp paste into a blender.', 'step_image/Xnip2020-11-20_04-57-25.jpg', 74),
(269, 'Blitz all the ingredients on high until you have a coarse paste. Scrape down the sides of the blender and blitz again for 1 minute. ', 'step_image/Xnip2020-11-20_04-57-40.jpg', 74),
(270, 'Remove the paste from the blender and place in a sealable container. Before you store it, you can test the flavour and seasoning by frying off 1 tbsp in a saucepan until fragrant, and then adding a splash of coconut milk. Taste and adjust as necessary.', 'step_image/Xnip2020-11-20_04-57-59.jpg', 74),
(271, 'You can keep the paste in the fridge for up to 2 weeks or freeze for 3 months. To use the paste, dry fry 1 tbsp of paste per person along with chicken or vegetables and finish with coconut milk. Serve with jasmine rice and coriander leaves. \n\n', 'step_image/Xnip2020-11-20_04-55-45_qMU4rAG.jpg', 74),
(272, 'Add 80g softened butter and 2 tbsp chipotle chilli paste to a small bowl, then mash and mix together until combined.', 'step_image/Xnip2020-11-20_05-04-49.jpg', 75),
(273, 'Cut 4 large squares of foil and place a corn on the cob in the centre of each. Brush or spread most of the chipotle butter over the corn (reserving some to serve), then wrap up each piece in the foil, twisting the ends (like a cracker) to secure.', 'step_image/Xnip2020-11-20_05-05-04.jpg', 75),
(274, 'Place the foil parcels on the grill of a preheated barbecue and cook for 35-40 mins, turning occasionally, until tender.', 'step_image/Xnip2020-11-20_05-05-19.jpg', 75),
(275, 'Carefully unwrap the foil parcels. Brush with the reserved butter and serve hot, with napkins for buttery fingers!', 'step_image/Xnip2020-11-20_05-05-46.jpg', 75),
(276, 'Mix together equal quantities of lighter mascarpone and ready-made custard and chill.', 'step_image/Xnip2020-11-20_05-09-46.jpg', 76),
(277, 'Halve and stone some nectarines or peaches. Very lightly brush with sunflower oil and barbecue for 4-8 minutes until nicely marked and heated through. Allow to cool a little then cut into bite-sized pieces.', 'step_image/Xnip2020-11-20_05-10-01.jpg', 76),
(278, 'Cut madeira cake into thick slices and barbecue for about 2 minutes until marked on each side. Allow to cool a little, and then cut into cubes.', 'step_image/Xnip2020-11-20_05-10-20.jpg', 76),
(279, 'Put the cubes of cake in the base of glasses. Sprinkle over a little fruit juice, orange liqueur or sweet wine – about 1 tbsp per glass. Top with the fruit, and then cover with the custard mixture.', 'step_image/Xnip2020-11-20_05-10-40.jpg', 76),
(280, 'Sprinkle with toasted flaked almonds and serve immediately.', 'step_image/Xnip2020-11-20_05-08-28.jpg', 76),
(281, 'Preheat your barbecue as required. Once your barbecue is ready (the coals should have turned white-grey and the flames died right down), carefully move the hot coals to one side so that there is an area of the grill away from the main heat. If using a gas barbecue, preheat as required to a medium-low heat setting.', 'step_image/Xnip2020-11-20_05-15-56.jpg', 77),
(282, 'Keeping the leaves attached at the top, stand the pineapple upright and, starting at the top just beneath the leaves, use a sharp knife to slice downwards to the base to remove the skin. If there are any hard ‘eyes’ (the tough dimples) remaining once all the skin has been removed, lay the pineapple flat and use the tip of a small sharp knife (or teaspoon) to cut (or scoop) them out. Finish by trimming the base.', '', 77),
(283, 'Rub or brush the pineapple all over with 1 tbsp flavourless oil (such as sunflower or vegetable oil), then sprinkle with 1 tbsp Demerara sugar, rubbing it in if needed so that it sticks to the flesh.', 'step_image/Xnip2020-11-20_05-16-31.jpg', 77),
(284, 'Using the attached stem and leaves as a handle, lay the pineapple flat on the grill, away from the coals, so that it can cook slowly over an indirect heat. If your barbecue has a lid, you can speed up the cooking time slightly by covering the grill as it cooks, but this is not essential.', 'step_image/Xnip2020-11-20_05-17-15.jpg', 77),
(285, 'Check the pineapple after 5 mins, lifting carefully with the leaves to see if the underside has coloured – it should be golden brown and caramelised. If it seems to be blackening too quickly, move slightly further away from the hot coals, or if not enough, move towards them. If cooking more than one pineapple, you may need to swap round positions during cooking.', 'step_image/Xnip2020-11-20_05-17-33.jpg', 77),
(286, 'Once one side is cooked, use the leaves to turn the pineapple so the next section is on the grill; leave for another 5 mins or until ready. Keep turning every 5 mins or so until lightly charred and golden-brown all over, the flesh should feel soft when a small sharp knife is pushed in all the way to the core. The total cooking time may vary depending on the heat of the barbecue and the size and ripeness of the pineapple – about 30-50 mins.', 'step_image/Xnip2020-11-20_05-17-58.jpg', 77),
(287, 'Lay the cooked pineapple flat on a board and use a large sharp knife to slice lengthways through the middle, then cut each half into 3 long wedges and remove the core. You can serve as long wedges or remove the leaves and halve or quarter into shorter pieces for a dessert if preferred.\n\n', 'step_image/Xnip2020-11-20_05-18-19.jpg', 77),
(288, 'Serve the pineapple warm, on its own or perhaps with a scoop of vanilla ice cream or dollop of yogurt.', 'step_image/Xnip2020-11-20_05-14-45.jpg', 77),
(289, 'Mix 500g strong white flour, a 7g sachet of fast-action yeast and 1 tsp salt in a large bowl. Make a well in the centre. Pour 300ml lukewarm water and 3 tbsp oil into the well and stir to combine.\n\nTip onto a lightly floured surface and knead for 10 mins or until you have a smooth dough. To knead, use the heel of your hand to stretch the dough away and fold it back on itself, turning 90° between stretches. Add a little flour if needed. It will hold together in a smooth ball when ready. Put in an oiled bowl and cover loosely with lightly oiled clingfilm. Leave to rise in a warm place for 1 hr or until doubled in size.', 'step_image/Xnip2020-11-20_05-22-57.jpg', 78),
(290, 'Heat 1 tbsp oil in a large frying pan over a medium-high heat, add 125g asparagus tips, roughly chopped, and stir-fry for 2 mins. Coarsely grate 1 small courgette (about 125g), add to the pan and stir-fry for 2-3 mins until both are tender and any liquid released has evaporated. Transfer to a bowl and set aside to cool completely, then stir through 100g pitted green olives, drained and halved lengthways, and 35g finely grated vegetarian hard cheese.\n\nKnock back the dough by pressing down firmly into the centre of the dough with your fist. Knocking back makes the dough easier to handle and helps to create a uniform texture.', 'step_image/Xnip2020-11-20_05-23-48.jpg', 78),
(291, 'Transfer to a lightly floured surface and roll out to a 40 x 30cm rectangle. Spread the vegetable mix over the dough, leaving a 2cm border. Make sure the filling is evenly distributed so the dough can be rolled as tightly as possible. The border means the filling can be be completely enclosed or it may fall out and scorch when baked.\n\n', 'step_image/Xnip2020-11-20_05-24-06.jpg', 78),
(292, 'Fold the border over the filling, pressing gently to seal them in place. Roll up from a short edge as tightly as you can to give the loaf a nice even shape and lovely layers inside once baked.', 'step_image/Xnip2020-11-20_05-24-35.jpg', 78),
(293, 'Enclose each end by gently stretching over the dough from the top, then pinch the seams together on the underside. Don’t worry if there are a few tiny holes or tears by the seam, these will close as the dough expands on the second prove. Place the loaf, seam-side down, on a baking tray lined with nonstick baking paper. Cover loosely with oiled clingfilm and leave to rise in a warm place for 1 hr or until doubled in size. Preheat the oven to gas 7, 220°C, fan 200°C.', 'step_image/Xnip2020-11-20_05-24-53.jpg', 78),
(294, 'Remove the clingfilm, gently brush the loaf with 1 beaten egg and top with an extra 25g grated vegetarian hard cheese and 25g olives, sliced into rounds. Bake for 35-40 mins until golden and the loaf sounds hollow when tapped underneath (loosely cover with foil after 25 mins if the loaf is browning too quickly).\n\nTransfer immediately to a wire rack and leave to cool – it’s crucial that you cool the loaf on a wire rack because, with so much filling, the crust will become damp and soggy in minutes if the bread is left on the baking tray. Carefully slice after around 30 mins if you want to eat it warm, or leave to cool completely. It’s best eaten on the day it’s made.\n\n', 'step_image/Xnip2020-11-20_05-25-25.jpg', 78),
(295, 'A drizzle of extra-virgin olive oil and balsamic vinegar will bring out the Mediterranean flavours in this loaf. Try serving it with slices of Brie or crumbly mature Cheddar for a delicious lunchtime treat or snack, or with scrambled egg for a hearty brunch.', 'step_image/Xnip2020-11-20_05-20-46.jpg', 78),
(296, 'Halve and stone 2 ripe avocados – if they are ripe enough, the stones should come out cleanly and you should be able to easily remove the flesh from the skin. Scoop the flesh into the bowl of a food processor and add 1 tbsp lime juice, 400g sweetened condensed milk and a pinch of salt.\n\n', 'step_image/Xnip2020-11-20_05-32-12.jpg', 79),
(297, 'Blend the mixture for 1-2 mins until completely smooth.', 'step_image/Xnip2020-11-20_05-32-35.jpg', 79),
(298, 'In a large bowl, whip 600ml double cream until just stiff, the cream should hold its shape when the whisk is lifted out but not feel too rigid.', 'step_image/Xnip2020-11-20_05-32-59.jpg', 79),
(299, 'Add the avocado mixture to the cream and fold in gently, without beating, until completely combined with no streaks of white remaining.X', 'step_image/Xnip2020-11-20_05-33-17.jpg', 79),
(300, 'Transfer the mixture to a freezer-proof container and smooth the top. If lidded, cover the surface with clingfilm before securing the lid, otherwise wrap the whole container well in 2 layers of clingfilm (this will protect the ice cream from freezer burn).', 'step_image/Xnip2020-11-20_05-33-34.jpg', 79),
(301, 'Freeze for at least 8 hrs or overnight. To serve, remove the ice cream from the freezer to allow it soften for 20-30 mins, then scoop into bowls or ice cream cones. The frozen ice cream will keep in the freezer for up to 3 months.', 'step_image/Xnip2020-11-20_05-31-01.jpg', 79),
(302, 'First, lightly oil a 1kg loaf tin and set aside. In a large bowl or mixer, combine 500g strong white bread flour, 1½ tsp fine salt and 1 tsp golden caster sugar and mix well. Add 7g fast action yeast and mix again. Gradually stir in 300ml warm water until you have a dough that is tacky, rather than sticky.', 'step_image/Xnip2020-11-20_05-39-16.jpg', 80),
(303, 'On a lightly floured surface, knead by hand for 15 minutes or 7-10 minutes in an electric mixer, until the dough is smooth and elastic. Kneading is crucial; it allows the gluten in the flour to get to work, becoming more elastic and helping the bread to rise. Form into a smooth ball. Lightly oil a clean bowl, put the dough into it, then cover with cling film or a tea towel and leave to rest in a warm place for 2 hours or until the dough has doubled in size. Proving allows tiny air bubbles to form, which strengthen the structure of the bread, making the dough extra light and much bigger. ', 'step_image/Xnip2020-11-20_05-39-34.jpg', 80),
(304, 'Once the dough is risen, tip out onto a lightly floured surface and, using your hands, knock back to release any air. Continue kneading for 2 minutes until the dough is smooth. Then, using a cupping motion, smooth the dough over the top and meet your hands underneath, forming a tight but smooth surface on top. Make sure the dough is just smaller than the tin. Turn the dough over and pinch together the seam that has formed. Smooth the top once more and place in the prepared tin. Cover lightly with a lightly oiled piece of cling film and allow to prove for one hour. \n\n', 'step_image/Xnip2020-11-20_05-39-54.jpg', 80),
(305, 'Turn the dough over and pinch together the seam that has formed, which ensures that ends of the bread won’t split open during baking. Smooth the top once more and place in the prepared tin. Cover lightly with a lightly oiled piece of cling film and allow to prove for one hour. This second prove allows the dough to grow even bigger and improves the texture of the dough, making sure that the final loaf is wonderfully crusty. Meanwhile, heat the oven to gas 7, 220C, fan 200C. When the proving time is up, sprinkle the top with a little flour and use a sharp knife to make a shallow slash in the top, around 1cm deep, from one end to the other. This will help the loaf to bake and give a nice shape.X', 'step_image/Xnip2020-11-20_05-40-15.jpg', 80),
(306, 'Place the loaf in the centre of the oven and bake for 20 minutes, then turn down the heat to gas 6, 200C, fan 180C, and cook for 15 minutes – this gives a really good crust without overcooking the middle of the loaf. Carefully, using a tea towel, turn the loaf upside down and remove from the tin. Tap the bottom of the bread and it should sound hollow. If it doesn''t or the bottom isn’t completely dry, return the loaf upside down to the tin, and bake for another 5 minutes. Allow to cool and serve.', 'step_image/Xnip2020-11-20_05-38-20.jpg', 80),
(307, 'easy', 'step_image/ttt_xgrUkBM.jpg', 81),
(308, 'easy', 'step_image/ttt_PQtZHt1.jpg', 82),
(309, 'easy', 'step_image/ttt_pSIx61b.jpg', 83);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL,
  `username` varchar(32) NOT NULL,
  `password` varchar(100) NOT NULL,
  `salt` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `introduction` varchar(1024) NOT NULL,
  `gender` varchar(30) NOT NULL,
  `date_of_birth` date NOT NULL,
  `register_date` datetime(6) NOT NULL,
  `total_follower` int(11) NOT NULL,
  `total_following` int(11) NOT NULL,
  `profile_image` varchar(100) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `salt`, `email`, `introduction`, `gender`, `date_of_birth`, `register_date`, `total_follower`, `total_following`, `profile_image`) VALUES
(1, 'root', 'e456ffd8bb1a7cd21638a70eb5963e5b', 'U3bviYQT', 'root', '', '', '2020-11-19', '2020-11-19 08:57:50.049000', 0, 0, 'avatar/default.png'),
(2, 'Sophie', '6187d8ac9380613b2ddde69b2e67c946', 'p3J6xjox', '1', '', '', '2020-11-19', '2020-11-19 09:04:18.803000', 0, 0, 'avatar/default.png'),
(3, 'test', 'b5e076f4fbf0a23b60f7955db7000e08', 'uQ7x6eeH', '2', '', '', '2020-11-19', '2020-11-19 09:06:00.401000', 0, 0, 'avatar/default.png'),
(6, 'Rachel', 'e01a59568d0f100efe6e983cb3d42260', 'YJR4dY5Z', 'qyan6939@gmail.com', 'I love cooking!', 'female', '2020-11-19', '2020-11-19 09:06:45.304000', 0, 0, 'avatar/default.png'),
(7, 'Purple', '23deffbc14deaa359bf39e3e454aeb46', 'VhbpMoPh', '3', '', '', '2020-11-20', '2020-11-20 00:54:16.722385', 5, 0, 'avatar/default.png'),
(15, 'root1', '7bd642e80518012c2388b3b870e0f5f9', 'hx2Sov3l', '4', '', '', '2020-11-20', '2020-11-20 03:52:44.418151', 0, 0, 'avatar/default.png'),
(16, 'root2', '8bd9ed147ae4786d4599ca7cf10fd2b7', 'P0tS0y1j', '5', '', '', '2020-11-20', '2020-11-20 03:53:18.368766', 0, 0, 'avatar/default.png'),
(17, 'root6', '5dfc9dc63acf95f875f1790363362a1f', 'wLE5UqgH', '6', '', '', '2020-11-20', '2020-11-20 03:54:52.833159', 0, 0, 'avatar/default.png'),
(21, 'root111', 'a9f71a5971c5266c3eafdae93a888911', '7rO1oKyk', '7', '', '', '2020-11-20', '2020-11-20 03:56:39.320487', 0, 0, 'avatar/default.png'),
(23, 'root7', '3a66e37e563a2c22aa407fd0d025d2bc', 'd7wss2mv', '8', '', '', '2020-11-20', '2020-11-20 04:00:06.274088', 0, 0, 'avatar/default.png'),
(24, 'root9', '1f98dd04cbd78ddfcc58083cd2ba7b19', 'PxRH3MEh', '9', '', '', '2020-11-20', '2020-11-20 04:00:29.180934', 0, 0, 'avatar/default.png'),
(26, 'root11111', '140c589a1099b6ddb6bb5e26ff365ec1', '6uUnMRdf', '44', '', '', '2020-11-20', '2020-11-20 04:34:03.999367', 0, 0, 'avatar/default.png'),
(27, 'Jackson', '45c9960111fd3118d799faf6b54820c0', 'SN1mehYa', '99', '', '', '2020-11-20', '2020-11-20 06:21:29.493441', 0, 0, 'avatar/default.png'),
(39, 'haha', 'ef5d3e4d25341ae8d46e5498cab05133', 'RDxUVwq1', '33', '', '', '2020-11-20', '2020-11-20 11:12:08.938232', 0, 3, 'avatar/default.png'),
(40, 'jack', '78046277afc224d28c9941e599b872a4', 'XlMIGHS5', '22', '', '', '2020-11-20', '2020-11-20 13:30:49.784232', 0, 1, 'avatar/ttt_eVcXSyL.jpg'),
(41, 'Tom', '6531afb815f1ffd3c655a584ff320006', 'MPYaPSJS', '23', '', '', '2020-11-20', '2020-11-20 14:06:29.653971', 0, 2, 'avatar/default.png'),
(42, 'Bob', 'bace55b003c3117fc3eff155772a4092', 'T3uwgyiS', '11111', '', '', '2020-11-20', '2020-11-20 14:21:52.059322', 0, 1, 'avatar/default.png'),
(43, 'Alice', '3c4b4e5b0f7b97888cbc96fdb9cd90c1', 'ihY9Olql', 'junyau@jeffscode.com', '', '', '2020-11-20', '2020-11-20 14:37:58.332097', 0, 1, 'avatar/test.jpeg'),
(44, 'Qiuli', 'b3d35274d502e03a2940d2fecc292bf4', 'Bbk1cfco', '12222', '', '', '2020-11-20', '2020-11-20 14:45:27.850662', 0, 0, 'avatar/default.png'),
(45, 'jacky', '758e33ebcfad723ab6112b78c4223f85', 'Czaoa14o', 'ngzhu@jeffscode.com', '', '', '2020-11-20', '2020-11-20 16:23:24.382900', 0, 1, 'avatar/default.png'),
(46, 'jeff', 'ced9a34d45be8a21569b202fd8db4c50', 'U3XV9qK3', 'junyangzhu@jeffscode.com', '', '', '2020-11-20', '2020-11-20 16:29:26.075488', 0, 1, 'avatar/ttt_iZuJmdU.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `user_follow`
--

CREATE TABLE IF NOT EXISTS `user_follow` (
  `id` int(11) NOT NULL,
  `from_user_id` int(11) NOT NULL,
  `to_user_id` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_follow`
--

INSERT INTO `user_follow` (`id`, `from_user_id`, `to_user_id`) VALUES
(1, 1, 2),
(2, 1, 6),
(3, 1, 1),
(4, 39, 2),
(5, 39, 7),
(6, 39, 1),
(7, 40, 2),
(8, 41, 7),
(9, 41, 2),
(10, 42, 7),
(11, 43, 7),
(12, 45, 2),
(13, 46, 7);

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
-- Indexes for table `calendar`
--
ALTER TABLE `calendar`
  ADD PRIMARY KEY (`id`),
  ADD KEY `calendar_recipe_id_cec66927_fk_recipe_id` (`recipe_id`),
  ADD KEY `calendar_user_id_df07bae8_fk_users_id` (`user_id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `comment_comment_recipe_id_15937720_fk_recipe_id` (`comment_recipe_id`),
  ADD KEY `comment_comment_user_id_c79216e0_fk_users_id` (`comment_user_id`);

--
-- Indexes for table `comment_meta`
--
ALTER TABLE `comment_meta`
  ADD PRIMARY KEY (`id`),
  ADD KEY `comment_meta_comment_id_4c181131_fk_comment_id` (`comment_id`);

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
-- Indexes for table `ingredient`
--
ALTER TABLE `ingredient`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ingredient_ingredient_related_recipe_id_aa190097_fk_recipe_id` (`ingredient_related_recipe_id`);

--
-- Indexes for table `recipe`
--
ALTER TABLE `recipe`
  ADD PRIMARY KEY (`id`),
  ADD KEY `recipe_user_id_aad0b06c_fk_users_id` (`user_id`);

--
-- Indexes for table `recipe_category`
--
ALTER TABLE `recipe_category`
  ADD PRIMARY KEY (`id`),
  ADD KEY `recipe_category_category_of_recipe_id_c999707b_fk_category_id` (`category_of_recipe_id`),
  ADD KEY `recipe_category_recipe_of_category_id_c531cb9b_fk_recipe_id` (`recipe_of_category_id`);

--
-- Indexes for table `recipe_favourite`
--
ALTER TABLE `recipe_favourite`
  ADD PRIMARY KEY (`id`),
  ADD KEY `recipe_favourite_recipe_id_b1a0b3ae_fk_recipe_id` (`recipe_id`),
  ADD KEY `recipe_favourite_user_id_48fcd1ed_fk_users_id` (`user_id`);

--
-- Indexes for table `recipe_mark`
--
ALTER TABLE `recipe_mark`
  ADD PRIMARY KEY (`id`),
  ADD KEY `recipe_mark_recipe_id_83f11f3a_fk_recipe_id` (`recipe_id`);

--
-- Indexes for table `step`
--
ALTER TABLE `step`
  ADD PRIMARY KEY (`id`),
  ADD KEY `step_related_recipe_id_9fec3a13_fk_recipe_id` (`related_recipe_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `user_follow`
--
ALTER TABLE `user_follow`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_follow_from_user_id_0ea421f1_fk_users_id` (`from_user_id`),
  ADD KEY `user_follow_to_user_id_a8d1ff34_fk_users_id` (`to_user_id`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=73;
--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `calendar`
--
ALTER TABLE `calendar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=25;
--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `comment`
--
ALTER TABLE `comment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=39;
--
-- AUTO_INCREMENT for table `comment_meta`
--
ALTER TABLE `comment_meta`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=28;
--
-- AUTO_INCREMENT for table `ingredient`
--
ALTER TABLE `ingredient`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=531;
--
-- AUTO_INCREMENT for table `recipe`
--
ALTER TABLE `recipe`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=84;
--
-- AUTO_INCREMENT for table `recipe_category`
--
ALTER TABLE `recipe_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=224;
--
-- AUTO_INCREMENT for table `recipe_favourite`
--
ALTER TABLE `recipe_favourite`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=22;
--
-- AUTO_INCREMENT for table `recipe_mark`
--
ALTER TABLE `recipe_mark`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=25;
--
-- AUTO_INCREMENT for table `step`
--
ALTER TABLE `step`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=310;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=47;
--
-- AUTO_INCREMENT for table `user_follow`
--
ALTER TABLE `user_follow`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=14;
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
-- Constraints for table `calendar`
--
ALTER TABLE `calendar`
  ADD CONSTRAINT `calendar_recipe_id_cec66927_fk_recipe_id` FOREIGN KEY (`recipe_id`) REFERENCES `recipe` (`id`),
  ADD CONSTRAINT `calendar_user_id_df07bae8_fk_users_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `comment`
--
ALTER TABLE `comment`
  ADD CONSTRAINT `comment_comment_recipe_id_15937720_fk_recipe_id` FOREIGN KEY (`comment_recipe_id`) REFERENCES `recipe` (`id`),
  ADD CONSTRAINT `comment_comment_user_id_c79216e0_fk_users_id` FOREIGN KEY (`comment_user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `comment_meta`
--
ALTER TABLE `comment_meta`
  ADD CONSTRAINT `comment_meta_comment_id_4c181131_fk_comment_id` FOREIGN KEY (`comment_id`) REFERENCES `comment` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `ingredient`
--
ALTER TABLE `ingredient`
  ADD CONSTRAINT `ingredient_ingredient_related_recipe_id_aa190097_fk_recipe_id` FOREIGN KEY (`ingredient_related_recipe_id`) REFERENCES `recipe` (`id`);

--
-- Constraints for table `recipe`
--
ALTER TABLE `recipe`
  ADD CONSTRAINT `recipe_user_id_aad0b06c_fk_users_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `recipe_category`
--
ALTER TABLE `recipe_category`
  ADD CONSTRAINT `recipe_category_category_of_recipe_id_c999707b_fk_category_id` FOREIGN KEY (`category_of_recipe_id`) REFERENCES `category` (`id`),
  ADD CONSTRAINT `recipe_category_recipe_of_category_id_c531cb9b_fk_recipe_id` FOREIGN KEY (`recipe_of_category_id`) REFERENCES `recipe` (`id`);

--
-- Constraints for table `recipe_favourite`
--
ALTER TABLE `recipe_favourite`
  ADD CONSTRAINT `recipe_favourite_recipe_id_b1a0b3ae_fk_recipe_id` FOREIGN KEY (`recipe_id`) REFERENCES `recipe` (`id`),
  ADD CONSTRAINT `recipe_favourite_user_id_48fcd1ed_fk_users_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `recipe_mark`
--
ALTER TABLE `recipe_mark`
  ADD CONSTRAINT `recipe_mark_recipe_id_83f11f3a_fk_recipe_id` FOREIGN KEY (`recipe_id`) REFERENCES `recipe` (`id`);

--
-- Constraints for table `step`
--
ALTER TABLE `step`
  ADD CONSTRAINT `step_related_recipe_id_9fec3a13_fk_recipe_id` FOREIGN KEY (`related_recipe_id`) REFERENCES `recipe` (`id`);

--
-- Constraints for table `user_follow`
--
ALTER TABLE `user_follow`
  ADD CONSTRAINT `user_follow_from_user_id_0ea421f1_fk_users_id` FOREIGN KEY (`from_user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `user_follow_to_user_id_a8d1ff34_fk_users_id` FOREIGN KEY (`to_user_id`) REFERENCES `users` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
