-- phpMyAdmin SQL Dump
-- version 3.3.10.4
-- http://www.phpmyadmin.net
--
-- Хост: localhost:3306
-- Время создания: Янв 31 2014 г., 00:18
-- Версия сервера: 5.6.13
-- Версия PHP: 5.4.24

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- База данных: `smart_core`
--

-- --------------------------------------------------------

--
-- Структура таблицы `aaa_engine_blocks`
--

DROP TABLE IF EXISTS `aaa_engine_blocks`;
CREATE TABLE IF NOT EXISTS `aaa_engine_blocks` (
  `block_id` smallint(6) NOT NULL AUTO_INCREMENT,
  `position` smallint(6) DEFAULT NULL,
  `name` varchar(50) NOT NULL,
  `descr` varchar(255) DEFAULT NULL,
  `create_by_user_id` int(11) NOT NULL,
  `create_datetime` datetime NOT NULL,
  PRIMARY KEY (`block_id`),
  UNIQUE KEY `name` (`name`),
  KEY `position` (`position`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Дамп данных таблицы `aaa_engine_blocks`
--

INSERT INTO `aaa_engine_blocks` (`block_id`, `position`, `name`, `descr`, `create_by_user_id`, `create_datetime`) VALUES
(1, 0, 'content', 'Рабочая область', 1, '2013-03-11 01:09:17'),
(2, 2, 'breadcrumbs', 'Хлебные крошки', 1, '2013-03-11 01:09:33'),
(3, 1, 'main_menu', 'Навигационное меню', 1, '2013-03-11 04:00:50'),
(4, 3, 'footer', 'Футер', 1, '2013-03-11 04:01:30'),
(5, 5, 'right_column', 'Правая колонка', 1, '2013-03-23 23:46:01'),
(6, 3, 'footer_right', 'Футер справа', 1, '2014-01-20 04:04:24');

-- --------------------------------------------------------

--
-- Структура таблицы `aaa_engine_blocks_inherit`
--

DROP TABLE IF EXISTS `aaa_engine_blocks_inherit`;
CREATE TABLE IF NOT EXISTS `aaa_engine_blocks_inherit` (
  `block_id` smallint(6) NOT NULL,
  `folder_id` int(11) NOT NULL,
  PRIMARY KEY (`block_id`,`folder_id`),
  KEY `IDX_4B3EA624E9ED820C` (`block_id`),
  KEY `IDX_4B3EA624162CB942` (`folder_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `aaa_engine_blocks_inherit`
--

INSERT INTO `aaa_engine_blocks_inherit` (`block_id`, `folder_id`) VALUES
(2, 1),
(3, 1),
(4, 1),
(6, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `aaa_engine_folders`
--

DROP TABLE IF EXISTS `aaa_engine_folders`;
CREATE TABLE IF NOT EXISTS `aaa_engine_folders` (
  `folder_id` int(11) NOT NULL AUTO_INCREMENT,
  `folder_pid` int(11) DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `is_file` tinyint(1) DEFAULT NULL,
  `position` smallint(6) DEFAULT NULL,
  `uri_part` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `is_deleted` tinyint(1) DEFAULT NULL,
  `descr` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta` longtext COLLATE utf8_unicode_ci COMMENT '(DC2Type:array)',
  `redirect_to` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `router_node_id` int(11) DEFAULT NULL,
  `has_inherit_nodes` tinyint(1) DEFAULT NULL,
  `permissions` longtext COLLATE utf8_unicode_ci COMMENT '(DC2Type:array)',
  `lockout_nodes` longtext COLLATE utf8_unicode_ci COMMENT '(DC2Type:array)',
  `template_inheritable` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `create_by_user_id` int(11) NOT NULL,
  `create_datetime` datetime NOT NULL,
  `template_self` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`folder_id`),
  UNIQUE KEY `folder_pid_uri_part` (`folder_pid`,`uri_part`),
  KEY `IDX_6B4611ABA640A07B` (`folder_pid`),
  KEY `is_active` (`is_active`),
  KEY `is_deleted` (`is_deleted`),
  KEY `position` (`position`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=13 ;

--
-- Дамп данных таблицы `aaa_engine_folders`
--

INSERT INTO `aaa_engine_folders` (`folder_id`, `folder_pid`, `title`, `is_file`, `position`, `uri_part`, `is_active`, `is_deleted`, `descr`, `meta`, `redirect_to`, `router_node_id`, `has_inherit_nodes`, `permissions`, `lockout_nodes`, `template_inheritable`, `create_by_user_id`, `create_datetime`, `template_self`) VALUES
(1, NULL, 'Главная', 0, 0, NULL, 1, 0, ':)', 'a:5:{s:8:"keywords";s:14:"123 ффыв 3";s:11:"description";s:0:"";s:6:"robots";s:3:"all";s:8:"language";s:5:"ru-RU";s:6:"author";s:10:"Артём";}', NULL, NULL, 1, NULL, NULL, 'main', 1, '2013-03-19 00:44:38', NULL),
(2, 1, 'О компании', 0, 10, 'about', 1, 0, NULL, 'N;', NULL, NULL, 0, NULL, NULL, 'inner', 1, '2013-03-11 16:42:33', NULL),
(3, 1, 'Аккаунт пользователя', 0, 999, 'user', 1, 0, NULL, 'N;', NULL, 7, 0, 'N;', 'N;', NULL, 1, '2013-03-18 01:15:06', NULL),
(4, 3, 'Регистрация', 0, 0, 'register_REMOVE', 0, 0, NULL, 'N;', NULL, 8, 0, 'N;', 'N;', NULL, 1, '2013-03-18 01:15:27', NULL),
(5, 1, 'Так просто ;)', 0, 3, 'simple', 1, 0, NULL, 'N;', NULL, NULL, 0, 'N;', 'N;', 'main', 1, '2013-03-19 04:43:50', NULL),
(6, 2, 'Вложенная папка', 0, 0, 'inner', 1, 0, NULL, 'N;', NULL, NULL, 0, 'N;', 'N;', NULL, 1, '2013-03-19 04:47:22', NULL),
(7, 1, '22222222222222', 0, 10, '22222222', 0, 0, '22', 'N;', NULL, NULL, 0, 'N;', 'N;', NULL, 1, '2013-08-10 11:14:06', NULL),
(8, 1, 'Новости', 0, 0, 'news', 1, 0, NULL, 'N;', NULL, 12, 0, 'N;', 'N;', NULL, 1, '2013-12-22 21:45:42', NULL),
(9, 1, 'Обратная связь', 0, 0, 'feedback', 1, 0, NULL, 'N;', NULL, NULL, 0, 'N;', 'N;', NULL, 1, '2014-01-21 13:35:11', NULL),
(11, 6, 'Еще одна вложенная', 0, 0, 'in2', 1, 0, NULL, 'N;', NULL, NULL, 0, 'N;', 'N;', NULL, 1, '2014-01-29 10:30:42', NULL),
(12, 1, 'Слайдер', 0, 0, 'slider', 1, 0, NULL, 'N;', NULL, NULL, 0, 'N;', 'N;', NULL, 1, '2014-01-30 20:38:12', NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `aaa_engine_nodes`
--

DROP TABLE IF EXISTS `aaa_engine_nodes`;
CREATE TABLE IF NOT EXISTS `aaa_engine_nodes` (
  `node_id` int(11) NOT NULL AUTO_INCREMENT,
  `folder_id` int(11) DEFAULT NULL,
  `block_id` smallint(6) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `module` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `params` longtext COLLATE utf8_unicode_ci NOT NULL COMMENT '(DC2Type:array)',
  `position` smallint(6) DEFAULT NULL,
  `priority` smallint(6) NOT NULL,
  `descr` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `create_by_user_id` int(11) NOT NULL,
  `create_datetime` datetime NOT NULL,
  `is_cached` tinyint(1) DEFAULT NULL,
  `template` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`node_id`),
  KEY `IDX_F4FF528B162CB942` (`folder_id`),
  KEY `IDX_F4FF528BE9ED820C` (`block_id`),
  KEY `is_active` (`is_active`),
  KEY `position` (`position`),
  KEY `module` (`module`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=22 ;

--
-- Дамп данных таблицы `aaa_engine_nodes`
--

INSERT INTO `aaa_engine_nodes` (`node_id`, `folder_id`, `block_id`, `is_active`, `module`, `params`, `position`, `priority`, `descr`, `create_by_user_id`, `create_datetime`, `is_cached`, `template`) VALUES
(1, 1, 4, 1, 'Texter', 'a:2:{s:12:"text_item_id";i:1;s:6:"editor";b:1;}', 20, 0, 'Футер', 1, '2013-03-20 05:46:40', 0, NULL),
(2, 2, 5, 1, 'Texter', 'a:2:{s:12:"text_item_id";i:4;s:6:"editor";b:1;}', 0, 0, 'Правая колонка', 1, '2013-03-20 09:07:33', 0, NULL),
(3, 2, 1, 1, 'Texter', 'a:2:{s:12:"text_item_id";i:3;s:6:"editor";b:1;}', 0, 0, 'Хедер', 1, '2013-03-21 06:03:37', 0, NULL),
(4, 1, 1, 1, 'Texter', 'a:2:{s:12:"text_item_id";i:2;s:6:"editor";b:1;}', 0, 0, 'Главная', 1, '2013-03-11 16:42:33', 0, NULL),
(5, 1, 3, 1, 'Menu', 'a:4:{s:5:"depth";N;s:8:"group_id";i:1;s:9:"css_class";s:9:"main_menu";s:20:"selected_inheritance";b:0;}', 1, 0, NULL, 1, '2013-03-11 16:42:33', 1, NULL),
(6, 1, 2, 1, 'Breadcrumbs', 'a:2:{s:9:"delimiter";s:2:"»";s:17:"hide_if_only_home";b:1;}', 0, -255, NULL, 1, '2013-03-11 16:42:33', 0, NULL),
(7, 3, 1, 1, 'User', 'a:2:{s:18:"allow_registration";b:1;s:24:"allow_password_resetting";b:1;}', 0, 255, NULL, 1, '2013-03-11 16:42:33', 0, NULL),
(9, 3, 3, 1, 'Texter', 'a:2:{s:12:"text_item_id";i:6;s:6:"editor";b:1;}', 1, 0, 'Текст под меню', 1, '2013-03-25 21:53:12', 0, NULL),
(10, 7, 1, 1, 'Texter', 'a:2:{s:12:"text_item_id";i:7;s:6:"editor";b:1;}', 0, 0, NULL, 1, '2013-08-10 11:14:55', 0, NULL),
(11, 5, 1, 1, 'Texter', 'a:2:{s:12:"text_item_id";i:8;s:6:"editor";b:1;}', 0, 0, NULL, 1, '2013-12-20 20:11:41', 0, NULL),
(12, 8, 1, 1, 'News', 'a:1:{s:14:"items_per_page";i:3;}', 1, 0, NULL, 1, '2013-12-22 21:58:57', 0, NULL),
(13, 1, 6, 1, 'Texter', 'a:2:{s:12:"text_item_id";i:9;s:6:"editor";b:1;}', 0, 0, NULL, 1, '2014-01-20 03:47:18', 0, NULL),
(14, 9, 1, 1, 'Feedback', 'a:0:{}', 0, 0, NULL, 1, '2014-01-21 19:32:26', 0, NULL),
(15, 8, 1, 1, 'Texter', 'a:2:{s:12:"text_item_id";i:10;s:6:"editor";b:1;}', 0, 0, NULL, 1, '2014-01-22 19:02:27', 0, NULL),
(16, 6, 1, 1, 'Texter', 'a:2:{s:12:"text_item_id";i:11;s:6:"editor";b:1;}', 0, 0, NULL, 1, '2014-01-29 10:01:55', 0, NULL),
(17, 1, 3, 1, 'Widget', 'a:3:{s:7:"node_id";s:2:"12";s:10:"controller";s:15:"NewsWidget:last";s:6:"params";s:8:"count: 3";}', 10, 0, NULL, 1, '2014-01-29 18:27:59', 0, NULL),
(18, 1, 3, 1, 'Texter', 'a:2:{s:12:"text_item_id";i:12;s:6:"editor";b:1;}', 9, 0, 'Последние новости', 1, '2014-01-29 19:43:16', 0, NULL),
(19, 1, 3, 0, 'Texter', 'a:2:{s:12:"text_item_id";i:13;s:6:"editor";b:1;}', 0, 0, 'Надпись над меню', 1, '2014-01-29 19:45:52', 0, NULL),
(20, 11, 1, 1, 'Texter', 'a:2:{s:12:"text_item_id";i:14;s:6:"editor";b:1;}', 0, 0, NULL, 1, '2014-01-29 20:16:33', 0, NULL),
(21, 12, 1, 1, 'Slider', 'a:0:{}', 0, 0, NULL, 1, '2014-01-30 20:38:27', 0, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `aaa_engine_roles`
--

DROP TABLE IF EXISTS `aaa_engine_roles`;
CREATE TABLE IF NOT EXISTS `aaa_engine_roles` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `position` smallint(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_5FFC79B05E237E06` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

--
-- Дамп данных таблицы `aaa_engine_roles`
--

INSERT INTO `aaa_engine_roles` (`id`, `name`, `position`) VALUES
(1, 'ROLE_ADMIN', 0),
(2, 'ROLE_ROOT', 0),
(3, 'ROLE_NEWSMAKER', 0);

-- --------------------------------------------------------

--
-- Структура таблицы `aaa_feedbacks`
--

DROP TABLE IF EXISTS `aaa_feedbacks`;
CREATE TABLE IF NOT EXISTS `aaa_feedbacks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `text` longtext COLLATE utf8_unicode_ci NOT NULL,
  `created` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Дамп данных таблицы `aaa_feedbacks`
--


-- --------------------------------------------------------

--
-- Структура таблицы `aaa_front_end_libraries`
--

DROP TABLE IF EXISTS `aaa_front_end_libraries`;
CREATE TABLE IF NOT EXISTS `aaa_front_end_libraries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `related_by` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `proirity` smallint(6) NOT NULL,
  `current_version` varchar(16) COLLATE utf8_unicode_ci NOT NULL,
  `files` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_23D980CD5E237E06` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5 ;

--
-- Дамп данных таблицы `aaa_front_end_libraries`
--

INSERT INTO `aaa_front_end_libraries` (`id`, `name`, `related_by`, `proirity`, `current_version`, `files`) VALUES
(1, 'jquery', NULL, 1000, '1.9.1', 'jquery.min.js'),
(2, 'bootstrap', 'jquery', 0, '2.3.2', 'css/bootstrap.min.css,css/bootstrap-responsive.min.css,js/bootstrap.min.js'),
(3, 'jquery-cookie', 'jquery', 0, '1.3.1', 'jquery.cookie.js'),
(4, 'less', NULL, 0, '1.3.3', 'less.min.js');

-- --------------------------------------------------------

--
-- Структура таблицы `aaa_front_end_libraries_paths`
--

DROP TABLE IF EXISTS `aaa_front_end_libraries_paths`;
CREATE TABLE IF NOT EXISTS `aaa_front_end_libraries_paths` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lib_id` int(11) NOT NULL,
  `version` varchar(16) COLLATE utf8_unicode_ci NOT NULL,
  `path` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `version_lib` (`version`,`lib_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5 ;

--
-- Дамп данных таблицы `aaa_front_end_libraries_paths`
--

INSERT INTO `aaa_front_end_libraries_paths` (`id`, `lib_id`, `version`, `path`) VALUES
(1, 1, '1.9.1', 'jquery/1.9.1/'),
(2, 2, '2.3.2', 'bootstrap/2.3.2/'),
(3, 3, '1.3.1', 'jquery-cookie/1.3.1/'),
(4, 4, '1.3.3', 'less/1.3.3/');

-- --------------------------------------------------------

--
-- Структура таблицы `aaa_menu`
--

DROP TABLE IF EXISTS `aaa_menu`;
CREATE TABLE IF NOT EXISTS `aaa_menu` (
  `item_id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) DEFAULT NULL,
  `folder_id` int(11) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `position` smallint(6) DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `descr` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `create_by_user_id` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime DEFAULT NULL,
  `pid` int(11) DEFAULT NULL,
  `properties` longtext COLLATE utf8_unicode_ci COMMENT '(DC2Type:array)',
  PRIMARY KEY (`item_id`),
  KEY `IDX_D885BF9AFE54D947` (`group_id`),
  KEY `IDX_D885BF9A5550C4ED` (`pid`),
  KEY `IDX_D885BF9A162CB942` (`folder_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=12 ;

--
-- Дамп данных таблицы `aaa_menu`
--

INSERT INTO `aaa_menu` (`item_id`, `group_id`, `folder_id`, `is_active`, `position`, `title`, `descr`, `url`, `create_by_user_id`, `created`, `updated`, `pid`, `properties`) VALUES
(1, 1, 1, 1, 0, NULL, NULL, NULL, 1, '2013-05-06 05:25:48', '2013-05-06 11:13:53', NULL, NULL),
(2, 1, 2, 1, 3, NULL, '123 561', NULL, 1, '2013-05-06 05:48:06', '2014-01-21 15:53:20', NULL, NULL),
(3, 1, 3, 1, 999, NULL, NULL, NULL, 1, '2013-05-06 07:28:54', '2013-12-22 08:49:04', NULL, NULL),
(5, 1, 6, 1, 0, NULL, NULL, NULL, 1, '2013-05-06 08:45:04', NULL, 2, NULL),
(6, 1, 5, 1, 2, NULL, NULL, NULL, 1, '2013-05-06 09:38:51', '2014-01-21 15:52:24', NULL, NULL),
(7, 1, 7, 0, 2, NULL, NULL, NULL, 1, '2013-08-10 11:14:29', '2014-01-20 06:36:00', NULL, NULL),
(8, 1, 8, 1, 1, NULL, NULL, NULL, 1, '2013-12-22 21:45:59', '2014-01-21 15:52:18', NULL, NULL),
(9, 1, 9, 1, 4, NULL, NULL, NULL, 1, '2014-01-21 15:51:46', '2014-01-21 15:53:27', NULL, NULL),
(10, 1, 11, 1, 0, NULL, NULL, NULL, 1, '2014-01-29 10:31:12', '2014-01-29 10:34:31', 5, 'N;'),
(11, 1, 12, 1, 2, NULL, NULL, NULL, 1, '2014-01-30 20:42:06', NULL, NULL, 'N;');

-- --------------------------------------------------------

--
-- Структура таблицы `aaa_menu_groups`
--

DROP TABLE IF EXISTS `aaa_menu_groups`;
CREATE TABLE IF NOT EXISTS `aaa_menu_groups` (
  `group_id` int(11) NOT NULL AUTO_INCREMENT,
  `position` smallint(6) DEFAULT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `descr` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `create_by_user_id` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `properties` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`group_id`),
  UNIQUE KEY `UNIQ_E8E3E5515E237E06` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Дамп данных таблицы `aaa_menu_groups`
--

INSERT INTO `aaa_menu_groups` (`group_id`, `position`, `name`, `descr`, `create_by_user_id`, `created`, `properties`) VALUES
(1, 0, 'Главное меню', NULL, 1, '2013-05-06 03:54:13', NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `aaa_news`
--

DROP TABLE IF EXISTS `aaa_news`;
CREATE TABLE IF NOT EXISTS `aaa_news` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `annotation` longtext COLLATE utf8_unicode_ci,
  `text` longtext COLLATE utf8_unicode_ci,
  `created` datetime NOT NULL,
  `updated` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_33961BA3989D9B62` (`slug`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=8 ;

--
-- Дамп данных таблицы `aaa_news`
--

INSERT INTO `aaa_news` (`id`, `title`, `slug`, `annotation`, `text`, `created`, `updated`) VALUES
(1, 'Первая', 'first', 'Анонс первой новости.', 'Тема: &laquo;Сублимированный рейтинг в XXI веке&raquo; Взаимодействие корпорации и клиента амбивалентно. Агентская комиссия специфицирует мониторинг активности, используя опыт предыдущих кампаний. Ассортиментная политика предприятия развивает стратегический маркетинг, используя опыт предыдущих кампаний. Более того, взаимодействие корпорации и клиента искажает бренд, расширяя долю рынка.', '2013-12-22 22:17:46', NULL),
(2, 'Вторая', 'second', 'Анонс второй новости.', 'Опросная анкета упорядочивает из ряда вон выходящий портрет потребителя, учитывая результат предыдущих медиа-кампаний. Спонсорство, в рамках сегодняшних воззрений, однородно стабилизирует принцип восприятия, используя опыт предыдущих кампаний. Узнавание бренда осмысленно переворачивает повторный контакт, признавая определенные рыночные тенденции. Стимулирование сбыта амбивалентно.', '2013-12-16 22:18:21', NULL),
(3, 'PHP: Hypertext Preprocessor', 'php', 'Server-side HTML embedded scripting language. It provides web developers with a full suite of tools for building dynamic websites: native APIs to Apache and ...', '<div class="blurb">\r\n<p>PHP is a popular general-purpose scripting language that is especially suited to web development.</p>\r\n<p>Fast, flexible and pragmatic, PHP powers everything from your blog to the most popular websites in the world.<br /><br /><acronym title="PHP: Hypertext Preprocessor">PHP</acronym> (рекурсивный акроним словосочетания <em>PHP: Hypertext Preprocessor</em>) - это распространенный язык программирования общего назначения с открытым исходным кодом. PHP сконструирован специально для ведения Web-разработок и его код может внедряться непосредственно в HTML.</p>\r\n</div>', '2014-01-20 02:33:25', NULL),
(4, 'Symfony 2 for PHP developers – Part 1', 'symfony-2-for-php-developers-part-1', 'So, you heard a lot about this web framework called Symfony 2 and everyone is banging on about how fantastic it is, but you don’t understand what the big deal is and now you’re reading this..', '<p>To be honest, my introduction to Symfony 2 wasn&rsquo;t entirely voluntarily, it was forced upon me but I decided to take it and run with it. However, it wasn&rsquo;t that easy. It took me quite a bit of time to start &ldquo;thinking in Symfony&rdquo; and to be honest, after a period of denial, I now &ldquo;get it&rdquo;. I now understand what the fuss is about and now I&rsquo;m writing this in the hope that it might help some other developer out there to get up and running with Symfony 2.</p>\r\n<p>This article is not going to run you through a tutorial. Instead we&rsquo;re going to talk about philosophy and most importantly about architecture. To &ldquo;get&rdquo; Symfony you need to &ldquo;think in Symfony&rdquo;. It&rsquo;s here where most newcomers to the framework start to get into trouble. Usually when you come from another framework to Symfony you&rsquo;re simply not in the right frame of mind, there are certain things you need to learn and more importantly, things you need to unlearn. I hope that these articles are going to help you gab the bridge between having experience with some other framework and getting started with Symfony 2. My aim for this article, and the articles that follow, is that it will be the glue you need between the future and the past.</p>\r\n<p>When I started with Symfony 2 I actually wasn&rsquo;t really interested in working with it. I had plenty of experience writing all sorts of things with PHP and other languages such as Java and C++ and I had used other PHP web frameworks in the past such as CodeIgniter and Kohana and plenty of WordPress to through in. MVC here. MVC there. MVC everywhere. An age old design pattern milked dry and over hyped. I got it. How can this Symfony thing be any different, right?</p>\r\n<p>So, I started to read about Symfony, working my way through the documentation and cookbook and what&rsquo;s not. Dependency Injection this. Dependency Injection that. Bla bla.. I used what I could and ignored the rest. I had to get stuff done and didn&rsquo;t have time for all this theoretical mumbo jumbo. So I build stuff and it worked. Actually, to be honest, it didn&rsquo;t work very well. The problem was obviously that this Symfony thing that was standing in my way, obstructing my goals. The truth is, Symfony was standing in the way. It was standing in the way because I wasn&rsquo;t using it the way it was supposed to be used. But I ploughed on&hellip;</p>\r\n<p>Coincidentally I was looking into the <a href="http://spring.io" target="_blank">Spring Framework</a>. I love Java, always have. I love the Java ecosystem, the JVM and everything that runs on it. The Spring Framework is very similar to Symfony in the way that at its core it&rsquo;s all about Dependency Injection. The funny thing was, I &ldquo;was&rdquo; interested in learning Spring Framework so it was very easy for me to digest everything about it. It&rsquo;s only after I worked with Spring Framework and got my head around that, that I had my eureka moment in regards to Symfony.</p>\r\n<p>It&rsquo;s important to understand that Symfony is more than just a web framework. Yes, it&rsquo;s also a set of components but with Symfony also comes a workflow and if you come from another PHP web framework then it&rsquo;s this workflow that is going to make the real difference for you. If you haven&rsquo;t worked with <a href="https://getcomposer.org" target="_blank">Composer</a> yet, then well, that&rsquo;s going to change the way you think about building your projects. To work with Symfony you don&rsquo;t &ldquo;have&rdquo; to use Composer but you&rsquo;d be a fool if you didn&rsquo;t.</p>\r\n<p>Composer allows you to manage your dependencies in a way that hasn&rsquo;t been available to PHP developers until now. OK, PECL and PEAR are cool but Composer is so much better. For one thing, the problem with PEAR libraries is that they are tied to your operating system, not your project. So e.g, if your production server has version 1 of a PEAR library but your development system has version 2 which isn&rsquo;t compatible then somehow you need to manage all this, manually. With Composer your dependencies become part of your project, not your operating system. But the best thing about Composer is that anyone who clones your project only has to run a &ldquo;composer install&rdquo; command to get all the dependencies they need to run the project. Try doing that with PEAR.</p>\r\n<p>So, here we are. Starting with Symfony 2. In the next article I&rsquo;m going delve into to the philosophy of Dependency Injection and how this works within the context of Symfony.</p>\r\n<p>&nbsp;</p>', '2014-01-27 12:05:22', NULL),
(5, 'Symfony 2 for PHP developers – Part 2', 'symfony-2-for-php-developers-part-2', 'Dependency Injection is at the heart of Symfony 2. To understand Symfony 2 you need to understand Dependency Injection.', '<div class="entry-content">\r\n<p>Dependency Injection is at the heart of Symfony 2. To understand Symfony 2 you need to understand Dependency Injection.</p>\r\n<p>Fortunately for us, the principle of Dependency Injection is very simple. Rather than hard coding instantiations of objects into our classes we&rsquo;ll pass &lsquo;m in, something like this:</p>\r\n<div class="wp_syntax">\r\n<table>\r\n<tbody>\r\n<tr>\r\n<td class="line_numbers">\r\n<pre>1\r\n2\r\n3\r\n4\r\n5\r\n6\r\n7\r\n8\r\n9\r\n10\r\n11\r\n12\r\n13\r\n14\r\n15\r\n16\r\n17\r\n18\r\n19\r\n20\r\n21\r\n22\r\n23\r\n24\r\n25\r\n26\r\n27\r\n28\r\n29\r\n30\r\n31\r\n32\r\n33\r\n34\r\n35\r\n36\r\n</pre>\r\n</td>\r\n<td class="code">\r\n<pre class="php" style="font-family: monospace;"><span style="color: #000000; font-weight: bold;">class</span> Logger <span style="color: #009900;">{</span>\r\n   <span style="color: #000000; font-weight: bold;">public</span> <span style="color: #000000; font-weight: bold;">function</span> write<span style="color: #009900;">(</span> <span style="color: #000088;">$message</span> <span style="color: #009900;">)</span> <span style="color: #009900;">{</span>\r\n      <span style="color: #b1b100;">echo</span> <span style="color: #000088;">$message</span><span style="color: #339933;">;</span>\r\n   <span style="color: #009900;">}</span>\r\n<span style="color: #009900;">}</span>\r\n&nbsp;\r\n<span style="color: #000000; font-weight: bold;">class</span> SmtpDriver <span style="color: #009900;">{</span>\r\n   <span style="color: #000000; font-weight: bold;">protected</span> <span style="color: #000088;">$logger</span><span style="color: #339933;">;</span>\r\n&nbsp;\r\n   <span style="color: #000000; font-weight: bold;">public</span> <span style="color: #000000; font-weight: bold;">function</span> setLogger<span style="color: #009900;">(</span> <span style="color: #000088;">$logger</span> <span style="color: #009900;">)</span> <span style="color: #009900;">{</span>\r\n      <span style="color: #000088;">$this</span><span style="color: #339933;">-&gt;</span><span style="color: #004000;">logger</span> <span style="color: #339933;">=</span> <span style="color: #000088;">$logger</span><span style="color: #339933;">;</span>\r\n   <span style="color: #009900;">}</span>\r\n&nbsp;\r\n   <span style="color: #000000; font-weight: bold;">public</span> send<span style="color: #009900;">(</span> <span style="color: #000088;">$to</span><span style="color: #339933;">,</span> <span style="color: #000088;">$from</span><span style="color: #339933;">,</span> <span style="color: #000088;">$subject</span><span style="color: #339933;">,</span> <span style="color: #000088;">$message</span> <span style="color: #009900;">)</span> <span style="color: #009900;">{</span>\r\n      <span style="color: #000088;">$this</span><span style="color: #339933;">-&gt;</span><span style="color: #004000;">logger</span><span style="color: #339933;">-&gt;</span><span style="color: #004000;">write</span><span style="color: #009900;">(</span><span style="color: #0000ff;">"Sending SMTP email to <span style="color: #006699; font-weight: bold;">{$to}</span>..."</span><span style="color: #009900;">)</span><span style="color: #339933;">;</span>\r\n&nbsp;\r\n      <span style="color: #666666; font-style: italic;">// Sending email through SMTP...</span>\r\n   <span style="color: #009900;">}</span>\r\n<span style="color: #009900;">}</span>\r\n&nbsp;\r\n<span style="color: #000000; font-weight: bold;">class</span> Mailer <span style="color: #009900;">{</span>\r\n   <span style="color: #000000; font-weight: bold;">protected</span> <span style="color: #000088;">$logger</span><span style="color: #339933;">;</span>\r\n   <span style="color: #000000; font-weight: bold;">protected</span> <span style="color: #000088;">$driver</span><span style="color: #339933;">;</span>\r\n&nbsp;\r\n   <span style="color: #000000; font-weight: bold;">public</span> <span style="color: #000000; font-weight: bold;">function</span> setLogger<span style="color: #009900;">(</span> <span style="color: #000088;">$logger</span> <span style="color: #009900;">)</span> <span style="color: #009900;">{</span>\r\n      <span style="color: #000088;">$this</span><span style="color: #339933;">-&gt;</span><span style="color: #004000;">logger</span> <span style="color: #339933;">=</span> <span style="color: #000088;">$logger</span><span style="color: #339933;">;</span>\r\n   <span style="color: #009900;">}</span>\r\n&nbsp;\r\n   <span style="color: #000000; font-weight: bold;">public</span> <span style="color: #000000; font-weight: bold;">function</span> setDriver<span style="color: #009900;">(</span> <span style="color: #000088;">$driver</span> <span style="color: #009900;">)</span> <span style="color: #009900;">{</span>\r\n      <span style="color: #000088;">$this</span><span style="color: #339933;">-&gt;</span><span style="color: #004000;">driver</span> <span style="color: #339933;">=</span> <span style="color: #000088;">$driver</span><span style="color: #339933;">;</span>\r\n   <span style="color: #009900;">}</span>\r\n&nbsp;\r\n   <span style="color: #000000; font-weight: bold;">public</span> <span style="color: #000000; font-weight: bold;">function</span> send<span style="color: #009900;">(</span> <span style="color: #000088;">$to</span><span style="color: #339933;">,</span> <span style="color: #000088;">$from</span><span style="color: #339933;">,</span> <span style="color: #000088;">$subject</span><span style="color: #339933;">,</span> <span style="color: #000088;">$message</span> <span style="color: #009900;">)</span> <span style="color: #009900;">{</span>\r\n      <span style="color: #000088;">$this</span><span style="color: #339933;">-&gt;</span><span style="color: #004000;">driver</span><span style="color: #339933;">-&gt;</span><span style="color: #004000;">send</span><span style="color: #009900;">(</span> <span style="color: #000088;">$to</span><span style="color: #339933;">,</span> <span style="color: #000088;">$from</span><span style="color: #339933;">,</span> <span style="color: #000088;">$subject</span><span style="color: #339933;">,</span> <span style="color: #000088;">$message</span> <span style="color: #009900;">)</span><span style="color: #339933;">;</span>\r\n   <span style="color: #009900;">}</span>\r\n<span style="color: #009900;">}</span></pre>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n</div>\r\n<p>The above example demonstrates the principle of Dependency Injection. To use the above defined classes and make them into a program we do the following:</p>\r\n<div class="wp_syntax">\r\n<table>\r\n<tbody>\r\n<tr>\r\n<td class="line_numbers">\r\n<pre>1\r\n2\r\n3\r\n4\r\n5\r\n6\r\n7\r\n8\r\n9\r\n</pre>\r\n</td>\r\n<td class="code">\r\n<pre class="php" style="font-family: monospace;"><span style="color: #000088;">$logger</span> <span style="color: #339933;">=</span> <span style="color: #000000; font-weight: bold;">new</span> Logger<span style="color: #009900;">(</span><span style="color: #009900;">)</span><span style="color: #339933;">;</span>\r\n&nbsp;\r\n<span style="color: #000088;">$driver</span> <span style="color: #339933;">=</span> <span style="color: #000000; font-weight: bold;">new</span> SmtpDriver<span style="color: #009900;">(</span><span style="color: #009900;">)</span><span style="color: #339933;">;</span>\r\n<span style="color: #000088;">$driver</span><span style="color: #339933;">-&gt;</span><span style="color: #004000;">setLogger</span><span style="color: #009900;">(</span> <span style="color: #000088;">$logger</span> <span style="color: #009900;">)</span><span style="color: #339933;">;</span>\r\n&nbsp;\r\n<span style="color: #000088;">$mailer</span> <span style="color: #339933;">=</span> <span style="color: #000000; font-weight: bold;">new</span> Mailer<span style="color: #009900;">(</span><span style="color: #009900;">)</span><span style="color: #339933;">;</span>\r\n<span style="color: #000088;">$mailer</span><span style="color: #339933;">-&gt;</span><span style="color: #004000;">setLogger</span><span style="color: #009900;">(</span> <span style="color: #000088;">$logger</span> <span style="color: #009900;">)</span><span style="color: #339933;">;</span>\r\n<span style="color: #000088;">$mailer</span><span style="color: #339933;">-&gt;</span><span style="color: #004000;">setDriver</span><span style="color: #009900;">(</span> <span style="color: #000088;">$driver</span> <span style="color: #009900;">)</span><span style="color: #339933;">;</span>\r\n<span style="color: #000088;">$mailer</span><span style="color: #339933;">-&gt;</span><span style="color: #004000;">send</span><span style="color: #009900;">(</span><span style="color: #0000ff;">"john@example.com"</span><span style="color: #339933;">,</span> <span style="color: #0000ff;">"luke@example.com"</span><span style="color: #339933;">,</span> <span style="color: #0000ff;">"Dependency Injection Test"</span><span style="color: #339933;">,</span> <span style="color: #0000ff;">"A message..."</span><span style="color: #009900;">)</span><span style="color: #339933;">;</span></pre>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n</div>\r\n<p>If you&rsquo;re new to Dependency Injection then you might have to look at the above a few times but you will realize that the above example demonstrates a few very important principles.</p>\r\n<p>The first is that the Mailer class doesn&rsquo;t send the email but it uses a &ldquo;driver&rdquo; instead. In our case we have an SmtpDriver class which we &ldquo;inject&rdquo; into the Mailer class by calling the setDriver method on the $mailer instance. Now, this is very important because it means that the Mailer class doesn&rsquo;t have a &ldquo;dependency&rdquo; on the StmpDriver class, it does have a dependency on a driver of some sort but as we&rsquo;ll see soon, not the SmtpDriver class in particular. In fact, we could create a new class and call it MockDriver and pass that into the $mailer instance. This would be really handy during testing where we don&rsquo;t want to actually send out real emails every time we run our tests but maybe just want to log a message.</p>\r\n<p>Let&rsquo;s look at an example of this:</p>\r\n<div class="wp_syntax">\r\n<table>\r\n<tbody>\r\n<tr>\r\n<td class="line_numbers">\r\n<pre>1\r\n2\r\n3\r\n4\r\n5\r\n6\r\n7\r\n8\r\n9\r\n10\r\n11\r\n</pre>\r\n</td>\r\n<td class="code">\r\n<pre class="php" style="font-family: monospace;"><span style="color: #000000; font-weight: bold;">class</span> MockDriver <span style="color: #009900;">{</span>\r\n   <span style="color: #000000; font-weight: bold;">protected</span> <span style="color: #000088;">$logger</span><span style="color: #339933;">;</span>\r\n&nbsp;\r\n   <span style="color: #000000; font-weight: bold;">public</span> <span style="color: #000000; font-weight: bold;">function</span> setLogger<span style="color: #009900;">(</span> <span style="color: #000088;">$logger</span> <span style="color: #009900;">)</span> <span style="color: #009900;">{</span>\r\n      <span style="color: #000088;">$this</span><span style="color: #339933;">-&gt;</span><span style="color: #004000;">logger</span> <span style="color: #339933;">=</span> <span style="color: #000088;">$logger</span><span style="color: #339933;">;</span>\r\n   <span style="color: #009900;">}</span>\r\n&nbsp;\r\n   <span style="color: #000000; font-weight: bold;">public</span> send<span style="color: #009900;">(</span> <span style="color: #000088;">$to</span><span style="color: #339933;">,</span> <span style="color: #000088;">$from</span><span style="color: #339933;">,</span> <span style="color: #000088;">$subject</span><span style="color: #339933;">,</span> <span style="color: #000088;">$message</span> <span style="color: #009900;">)</span> <span style="color: #009900;">{</span>\r\n      <span style="color: #000088;">$this</span><span style="color: #339933;">-&gt;</span><span style="color: #004000;">logger</span><span style="color: #339933;">-&gt;</span><span style="color: #004000;">write</span><span style="color: #009900;">(</span><span style="color: #0000ff;">"Sending mock email to <span style="color: #006699; font-weight: bold;">{$to}</span>..."</span><span style="color: #009900;">)</span><span style="color: #339933;">;</span>\r\n   <span style="color: #009900;">}</span>\r\n<span style="color: #009900;">}</span></pre>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n</div>\r\n<p>As you can see, the MockDriver is very similar to the SmtpDriver but there is one big difference and that is the &ldquo;send&rdquo; method only calls the logger and doesn&rsquo;t actually send the email.</p>\r\n<p>To use the MockDriver, our program would look like this:</p>\r\n<div class="wp_syntax">\r\n<table>\r\n<tbody>\r\n<tr>\r\n<td class="line_numbers">\r\n<pre>1\r\n2\r\n3\r\n4\r\n5\r\n6\r\n7\r\n8\r\n9\r\n</pre>\r\n</td>\r\n<td class="code">\r\n<pre class="php" style="font-family: monospace;"><span style="color: #000088;">$logger</span> <span style="color: #339933;">=</span> <span style="color: #000000; font-weight: bold;">new</span> Logger<span style="color: #009900;">(</span><span style="color: #009900;">)</span><span style="color: #339933;">;</span>\r\n&nbsp;\r\n<span style="color: #000088;">$driver</span> <span style="color: #339933;">=</span> <span style="color: #000000; font-weight: bold;">new</span> MockDriver<span style="color: #009900;">(</span><span style="color: #009900;">)</span><span style="color: #339933;">;</span>\r\n<span style="color: #000088;">$driver</span><span style="color: #339933;">-&gt;</span><span style="color: #004000;">setLogger</span><span style="color: #009900;">(</span> <span style="color: #000088;">$logger</span> <span style="color: #009900;">)</span><span style="color: #339933;">;</span>\r\n&nbsp;\r\n<span style="color: #000088;">$mailer</span> <span style="color: #339933;">=</span> <span style="color: #000000; font-weight: bold;">new</span> Mailer<span style="color: #009900;">(</span><span style="color: #009900;">)</span><span style="color: #339933;">;</span>\r\n<span style="color: #000088;">$mailer</span><span style="color: #339933;">-&gt;</span><span style="color: #004000;">setLogger</span><span style="color: #009900;">(</span> <span style="color: #000088;">$logger</span> <span style="color: #009900;">)</span><span style="color: #339933;">;</span>\r\n<span style="color: #000088;">$mailer</span><span style="color: #339933;">-&gt;</span><span style="color: #004000;">setDriver</span><span style="color: #009900;">(</span> <span style="color: #000088;">$driver</span> <span style="color: #009900;">)</span><span style="color: #339933;">;</span>\r\n<span style="color: #000088;">$mailer</span><span style="color: #339933;">-&gt;</span><span style="color: #004000;">send</span><span style="color: #009900;">(</span><span style="color: #0000ff;">"john@example.com"</span><span style="color: #339933;">,</span> <span style="color: #0000ff;">"luke@example.com"</span><span style="color: #339933;">,</span> <span style="color: #0000ff;">"Dependency Injection Test"</span><span style="color: #339933;">,</span> <span style="color: #0000ff;">"A message..."</span><span style="color: #009900;">)</span><span style="color: #339933;">;</span></pre>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n</div>\r\n<p>As you can see, the only difference in our program is the line:</p>\r\n<div class="wp_syntax">\r\n<table>\r\n<tbody>\r\n<tr>\r\n<td class="code">\r\n<pre class="php" style="font-family: monospace;"><span style="color: #000088;">$driver</span> <span style="color: #339933;">=</span> <span style="color: #000000; font-weight: bold;">new</span> MockDriver<span style="color: #009900;">(</span><span style="color: #009900;">)</span><span style="color: #339933;">;</span></pre>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n</div>\r\n<p>Instead of:</p>\r\n<div class="wp_syntax">\r\n<table>\r\n<tbody>\r\n<tr>\r\n<td class="code">\r\n<pre class="php" style="font-family: monospace;"><span style="color: #000088;">$driver</span> <span style="color: #339933;">=</span> <span style="color: #000000; font-weight: bold;">new</span> SmtpDriver<span style="color: #009900;">(</span><span style="color: #009900;">)</span><span style="color: #339933;">;</span></pre>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n</div>\r\n<p>this bring us to the second important principle; All the above means is that we&rsquo;re controlling the functionality of our program from the &ldquo;outside&rdquo; at the highest level rather than on the inside at the lowest level. In other words, we&rsquo;re using Inversion of Control.</p>\r\n<p>If your brain just exploded, don&rsquo;t worry. All will be fine.</p>\r\n<p>One thing the careful observer might have noticed in the above example is that all our classes are POPO&rsquo;s, i.e. Plain Old PHP Objects. There&rsquo;s no Symfony in any of the above and this is exactly what we want. In the first code snippet where we defined the Logger, the SmtpDriver and the Mailer classes, we did just that, we defined classes. We could say we defined the &ldquo;architecture&rdquo; of our program but not the actual program itself, i.e, on their own the classes don&rsquo;t do anything but when you &ldquo;wire them up&rdquo; it&rsquo;s where you create your program. It&rsquo;s this &ldquo;wiring&rdquo; that Symfony helps us with but we&rsquo;ll get to that later.</p>\r\n<p>There is one major problem with the code we have so far and that is that it&rsquo;s fragile. By this I mean, the driver classes need to have a &ldquo;send&rdquo; method so we like to enforce this. Another problem is the duplication of injecting the logger functionality. So let&rsquo;s revise these issues:</p>\r\n<div class="wp_syntax">\r\n<table>\r\n<tbody>\r\n<tr>\r\n<td class="line_numbers">\r\n<pre>1\r\n2\r\n3\r\n4\r\n5\r\n6\r\n7\r\n8\r\n9\r\n10\r\n11\r\n12\r\n13\r\n14\r\n15\r\n16\r\n17\r\n18\r\n19\r\n20\r\n21\r\n22\r\n23\r\n24\r\n25\r\n26\r\n27\r\n28\r\n29\r\n30\r\n31\r\n32\r\n33\r\n34\r\n35\r\n36\r\n37\r\n38\r\n39\r\n40\r\n41\r\n42\r\n43\r\n</pre>\r\n</td>\r\n<td class="code">\r\n<pre class="php" style="font-family: monospace;"><span style="color: #000000; font-weight: bold;">class</span> Logger <span style="color: #009900;">{</span>\r\n   <span style="color: #000000; font-weight: bold;">public</span> <span style="color: #000000; font-weight: bold;">function</span> write<span style="color: #009900;">(</span> <span style="color: #000088;">$message</span> <span style="color: #009900;">)</span> <span style="color: #009900;">{</span>\r\n      <span style="color: #b1b100;">echo</span> <span style="color: #000088;">$message</span><span style="color: #339933;">;</span>\r\n   <span style="color: #009900;">}</span>\r\n<span style="color: #009900;">}</span>\r\n&nbsp;\r\n<span style="color: #000000; font-weight: bold;">abstract</span> <span style="color: #000000; font-weight: bold;">class</span> AbstractBase <span style="color: #009900;">{</span>\r\n   <span style="color: #000000; font-weight: bold;">protected</span> <span style="color: #000088;">$logger</span><span style="color: #339933;">;</span>\r\n&nbsp;\r\n   <span style="color: #000000; font-weight: bold;">public</span> <span style="color: #000000; font-weight: bold;">function</span> setLogger<span style="color: #009900;">(</span> <span style="color: #000088;">$logger</span> <span style="color: #009900;">)</span> <span style="color: #009900;">{</span>\r\n      <span style="color: #000088;">$this</span><span style="color: #339933;">-&gt;</span><span style="color: #004000;">logger</span> <span style="color: #339933;">=</span> <span style="color: #000088;">$logger</span><span style="color: #339933;">;</span>\r\n   <span style="color: #009900;">}</span>\r\n<span style="color: #009900;">}</span>\r\n&nbsp;\r\n<span style="color: #000000; font-weight: bold;">interface</span> MailerDriverInterface <span style="color: #009900;">{</span>\r\n   <span style="color: #000000; font-weight: bold;">public</span> <span style="color: #000000; font-weight: bold;">function</span> send<span style="color: #009900;">(</span> <span style="color: #000088;">$to</span><span style="color: #339933;">,</span> <span style="color: #000088;">$from</span><span style="color: #339933;">,</span> <span style="color: #000088;">$subject</span><span style="color: #339933;">,</span> <span style="color: #000088;">$message</span> <span style="color: #009900;">)</span><span style="color: #339933;">;</span>\r\n<span style="color: #009900;">}</span>\r\n&nbsp;\r\n<span style="color: #000000; font-weight: bold;">class</span> SmtpDriver <span style="color: #000000; font-weight: bold;">extends</span> AbstractBase implements MailerDriverInterface <span style="color: #009900;">{</span>\r\n   <span style="color: #000000; font-weight: bold;">public</span> send<span style="color: #009900;">(</span> <span style="color: #000088;">$to</span><span style="color: #339933;">,</span> <span style="color: #000088;">$from</span><span style="color: #339933;">,</span> <span style="color: #000088;">$subject</span><span style="color: #339933;">,</span> <span style="color: #000088;">$message</span> <span style="color: #009900;">)</span> <span style="color: #009900;">{</span>\r\n      <span style="color: #000088;">$this</span><span style="color: #339933;">-&gt;</span><span style="color: #004000;">logger</span><span style="color: #339933;">-&gt;</span><span style="color: #004000;">write</span><span style="color: #009900;">(</span><span style="color: #0000ff;">"Sending SMTP email to <span style="color: #006699; font-weight: bold;">{$to}</span>..."</span><span style="color: #009900;">)</span><span style="color: #339933;">;</span>\r\n&nbsp;\r\n      <span style="color: #666666; font-style: italic;">// Sending email through SMTP...</span>\r\n   <span style="color: #009900;">}</span>\r\n<span style="color: #009900;">}</span>\r\n&nbsp;\r\n<span style="color: #000000; font-weight: bold;">class</span> MockDriver <span style="color: #000000; font-weight: bold;">extends</span> AbstractBase implements MailerDriverInterface <span style="color: #009900;">{</span>\r\n   <span style="color: #000000; font-weight: bold;">public</span> send<span style="color: #009900;">(</span> <span style="color: #000088;">$to</span><span style="color: #339933;">,</span> <span style="color: #000088;">$from</span><span style="color: #339933;">,</span> <span style="color: #000088;">$subject</span><span style="color: #339933;">,</span> <span style="color: #000088;">$message</span> <span style="color: #009900;">)</span> <span style="color: #009900;">{</span>\r\n      <span style="color: #000088;">$this</span><span style="color: #339933;">-&gt;</span><span style="color: #004000;">logger</span><span style="color: #339933;">-&gt;</span><span style="color: #004000;">write</span><span style="color: #009900;">(</span><span style="color: #0000ff;">"Sending mock email to <span style="color: #006699; font-weight: bold;">{$to}</span>..."</span><span style="color: #009900;">)</span><span style="color: #339933;">;</span>\r\n   <span style="color: #009900;">}</span>\r\n<span style="color: #009900;">}</span>\r\n&nbsp;\r\n<span style="color: #000000; font-weight: bold;">class</span> Mailer <span style="color: #000000; font-weight: bold;">extends</span> AbstractBase <span style="color: #009900;">{</span>\r\n   <span style="color: #000000; font-weight: bold;">protected</span> <span style="color: #000088;">$driver</span><span style="color: #339933;">;</span>\r\n&nbsp;\r\n   <span style="color: #000000; font-weight: bold;">public</span> <span style="color: #000000; font-weight: bold;">function</span> setDriver<span style="color: #009900;">(</span> MailerDriverInterface <span style="color: #000088;">$driver</span> <span style="color: #009900;">)</span> <span style="color: #009900;">{</span>\r\n      <span style="color: #000088;">$this</span><span style="color: #339933;">-&gt;</span><span style="color: #004000;">driver</span> <span style="color: #339933;">=</span> <span style="color: #000088;">$driver</span><span style="color: #339933;">;</span>\r\n   <span style="color: #009900;">}</span>\r\n&nbsp;\r\n   <span style="color: #000000; font-weight: bold;">public</span> <span style="color: #000000; font-weight: bold;">function</span> send<span style="color: #009900;">(</span> <span style="color: #000088;">$to</span><span style="color: #339933;">,</span> <span style="color: #000088;">$from</span><span style="color: #339933;">,</span> <span style="color: #000088;">$subject</span><span style="color: #339933;">,</span> <span style="color: #000088;">$message</span> <span style="color: #009900;">)</span> <span style="color: #009900;">{</span>\r\n      <span style="color: #000088;">$this</span><span style="color: #339933;">-&gt;</span><span style="color: #004000;">driver</span><span style="color: #339933;">-&gt;</span><span style="color: #004000;">send</span><span style="color: #009900;">(</span> <span style="color: #000088;">$to</span><span style="color: #339933;">,</span> <span style="color: #000088;">$from</span><span style="color: #339933;">,</span> <span style="color: #000088;">$subject</span><span style="color: #339933;">,</span> <span style="color: #000088;">$message</span> <span style="color: #009900;">)</span><span style="color: #339933;">;</span>\r\n   <span style="color: #009900;">}</span>\r\n<span style="color: #009900;">}</span></pre>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n</div>\r\n<p>Our program is exactly the same as it was before. The only thing we&rsquo;ve changed is that we&rsquo;ve moved the functionality that was shared by all classes (the logger) to an abstract base class. The reason we&rsquo;re making this class abstract is because we don&rsquo;t want to allow for instances to be created of this class. As you might have noticed, we named our abstract base class AbstractBase. By doing this we communicate the &ldquo;intent&rdquo; of the class itself by saying it&rsquo;s a &ldquo;base&rdquo; class and that it&rsquo;s &ldquo;abstract&rdquo;.</p>\r\n<p>The second thing we did was to create an interface for the drivers that can be used on the Mailer class. In our case, the interface does nothing more than defining the &ldquo;send&rdquo; method but you can imagine that when your classes are more complex that an interface will force you to implement all the required functionality. An interface is therefore like a contract and it will create stability within your architecture. To illustrate this, the setDriver method of the Mailer class now has a typed parameter. I.e. the parameter passed to the setDriver method needs to implement the MailerDriverInterface.</p>\r\n<p>However, still no sign of Symfony. We&rsquo;re soon going to change that in the next article&hellip;</p>\r\n</div>', '2014-01-27 12:12:31', NULL),
(6, 'Unifying PHP', 'unifying-php', 'Over the last few weeks, there has been lots of talk about PHP community, packages, and tribalism. So, I thought I would offer a few thoughts on the topic. Currently, Laravel is the most eclectic full-stack PHP framework in existence. In other words, Laravel is the only full-stack PHP framework that actively eschews tribalism.', '<p>Over the last few weeks, there has been lots of talk about PHP community, packages, and tribalism. So, I thought I would offer a few thoughts on the topic.&nbsp;Currently, Laravel is the most eclectic full-stack PHP framework in existence. In other words, Laravel is the <strong>only</strong> full-stack PHP framework that <strong>actively</strong> eschews tribalism.</p>\r\n<p>Laravel, in additions to using its own custom packages like Eloquent and Blade, utilizes a whopping 23 packages from the wider PHP community. Using the &ldquo;best of the best&rdquo; PHP packages allows for greater interaction between Laravel and the wider PHP community. But, perhaps more importantly to you, it helps you write amazing applications at breakneck speed.</p>\r\n<p>We don&rsquo;t want to just speak about community, we want to participate! It&rsquo;s been a blast to coordinate and talk with developers of so many awesome packages, and I&rsquo;m very thankful that Laravel has been made better by their efforts.</p>\r\n<p>So, in this post, I want to highlight just a few of the wonderful packages that make Laravel awesome.</p>\r\n<h2>A few highlights:</h2>\r\n<p><strong>Carbon:</strong> An expressive date library by Brian Nesbitt. This library is used to power Eloquent&rsquo;s date mutators. It makes working with dates in PHP easy and enjoyable.</p>\r\n<p><strong>Predis:</strong> A robust Redis client authored by Daniele Alessandri. Predis powers all of the Redis interaction Laravel offers, including the Redis cache, session, and queue drivers.</p>\r\n<p><strong>Phenstalk:</strong> Full-featured PHP client for the Beanstalkd queue. Powers the Laravel Beanstalkd queue driver.</p>\r\n<p><strong>SuperClosure:</strong> Written by Jeremy Lindblom, this powerful library allows you to serialize and unserialize PHP Closures. It is used each time you push an anonymous function onto a queue.</p>\r\n<p><strong>Whoops:</strong> Displays the pretty error pages and stack traces while Laravel is in development mode.</p>\r\n<p><strong>Monolog:</strong> The de-facto standard of PHP logging libraries. Used for all logging. Primarily written by Jordi Boggiano.</p>\r\n<p><strong>Boris:</strong> Really slick PHP REPL which powers the amazing &ldquo;tinker&rdquo; console command.</p>\r\n<p><strong>PasswordCompat:</strong> Powers the secure Bcrypt hashing that is used by default by Laravel. Forward compatible with PHP 5.5. Written by Anthony Ferrara.</p>\r\n<p><strong>Symfony HttpFoundation:</strong> Extremely robust HTTP abstraction. Well tested and proven in many large, real-world applications. One of the most important community packages we use.</p>\r\n<p><strong>Symfony Routing:</strong> This package powers the compilation of Laravel routes to regular expressions, a trickier task than you might think! This library handles a lot of edge cases very well!</p>\r\n<p><strong>Symfony HttpKernel:</strong> The HttpKernel provides HTTP exceptions, which are used to indicate 404 responses in Laravel. Also, and perhaps more importantly, this package contains the HttpKernelInterface which is used as the bottom-level abstraction for a Laravel application.</p>\r\n<p><strong>Symfony BrowserKit:</strong> All that slick functional testing that Laravel offers? Powered by Symfony BrowserKit!</p>\r\n<strong>StackPHP:</strong> This project outlines a structure for building reusable, framework agnostic middlewares at the HTTP layer. Utilized in Laravel 4.1+ for all cookie encryption, sessions, and more. Developed by two of my favorite and most respected PHP developers: Igor Wiedler and Beau Simensen', '2014-01-27 12:34:21', NULL);
INSERT INTO `aaa_news` (`id`, `title`, `slug`, `annotation`, `text`, `created`, `updated`) VALUES
(7, 'Почему мы предпочли Symfony 2 вместо Yii', 'pochemu-my-predpochitaem-symfony-2-vmesto-yii', 'Перевод статьи <a href="http://weavora.com/blog/2013/03/26/why-we-prefer-symfony-2-over-yii-framework/" target="_blank">Why We Prefer Symfony 2 Over Yii Framework</a>.', '<div class="post-bodycopy cf">\r\n<p>Перевод статьи <a href="http://weavora.com/blog/2013/03/26/why-we-prefer-symfony-2-over-yii-framework/" target="_blank">Why We Prefer Symfony 2 Over Yii Framework</a>.</p>\r\n<p>В этой статье я собираюсь рассказать вам историю, которая объясняет причину по которой наша команда предпочла Symfony 2 вместо Yii, который мы использовали продолжительное время и делали на нём наши лучшие приложения. Как это случилось и по каким причинам мы приняли наше решение о смене фреймворка?</p>\r\n<p>Вы, возможно, подумали, что у нас было большое совещание на котором мы решили, что нашим следующим фреймворком станет Symfony потому что бла бла бла. Я боюсь разочаровать вас. Реальная история гораздо более проще и очевидней.</p>\r\n<p>Изначально мы были вынуждены использовать Symfony 2, как одно из важных технические требований в проекте, который мы собирались делать. Мы бегло прошлись по документации Symfony 2, новым фичам и т.д. И нам казалось всё выглядит очень похожим. Тот же MVC концепт, только другой шаблонизатор, ORM и пр. Да, Symfony 2 имеет Dependency Injection Container, но это не меняет положения вещей в значительно мере. Более того, у нас есть несколько членов команды с превосходным опытом разработки проектов на Symfony 1.</p>\r\n<p>Мы знали, что миграция будет не простой и что мы будем вынуждены потратить много человеко-часов для поддержания нашей нормальной скорости разработки.&nbsp;Мы были открыты для нового опыта и нового вызова.</p>\r\n<p>У нашего проекта был совершенно сумасшедший дедлайн. В добавок к этому, мы использовали Symfony тем же старым путем, как мы делали это с Yii. Мы пытались сохранить те-же принципы, стиль, подход, которые прекрасно работали с Yii. И это была действительно плохая идея. Но этого не было столь плохо на первое время.</p>\r\n<p>Следующий проект был также на Symfony. В нём мы пытались исправить все недоразумения и тщательно следовать философии Symfony. В основном, мы начали делать вещи на основе symfony философии и это исправило большинство архитектурных проблем. Там мы впервые встретились с composer, PSR-2 и другими клёвыми инструментами. В итоге мы стали ближе к сообществу Symfony.</p>\r\n<p>Я думаю, только в процессе создания нашего 3D проекта мы почувствовали успех и удовлетворение от нашей новой &ldquo;авантюры&rdquo;. С тех пор мы перестали рассматривать Yii.</p>\r\n<p>Сейчас я попытаюсь объяснить более детально почему мы решили остановиться на Symfony? Что нам особо&nbsp;понравилось?</p>\r\n<p>Немного забегая вперед, я бы хотел поделиться результатами нашего внутреннего голосования. Мы приняли решение опросить каждого члена команды по порядку, чтобы быть уверенным, что мы на верном пути и хочет ли кто-то вернуться обратно на Yii. Я был очень удивлен, что никто не проголосовал за Yii. C самого начала некоторые члены команды были очень скептично настроены, часто критиковали, говоря, что symfony &mdash; корпоративный фреймворк, Yii &mdash; проще в разработке. Но, в итоге, они позволили проникнуть концепции Symfony в их душу и теперь нет пути обратно. Они сделали несколько попыток в личных небольших проектах, но затем окончательно сдались.</p>\r\n<p><strong>Итак, почему мы перешли на Symfony 2?</strong></p>\r\n<p>В действительности &mdash; это всё об управлении и сопровождении кода. Выполнять код быстро с самого начала &mdash; это реально просто. Мы никогда не имели проблем с этим и, я уверен, вы тоже. Реальные проблемы появились позднее, когда проект рос и становился долгосрочным. Почти все наши проекты долгосрочные (от 2-3 месяцев до года и более).</p>\r\n<p>Это причина по которой&nbsp;для нас было критично использовать подходы и техники для эффективного управления кодом на долгий срок. Мы имели длительные проекты на Yii и было сложно сохранять их в хорошем состоянии после 3-ёх месяцев разработки. У нас всегда были небольшие проблемы, мы были вынуждены применять мелкие хаки, хуки и т.д. Конечно это работало, но было неприятно это поддерживать.</p>\r\n<p>Мы хотели сохранить наш код хорошо-организованным и следовать некоторым понятным принципам, которые будут беспокоиться о коде и сохранять его от повреждений. Это был наш основной концепт. И не важно, как долго длился проект, один месяц или один год. Мы хотели быть счастливы с нашим кодом в любое время и сохранять интерес к разработке. В коде не должно быть хаков. Честно, хаки убивают команду проекта. Кому нравится грязное белье? Это обычно начинается с этого: итак, сегодня я сделал&nbsp;по-быстрому небольшой хак и завтра я найду и заменю это более лучшим решением. Запомните &mdash; это путь в пропасть.</p>\r\n<p>Какая проверка кода была у нас в Yii?</p>\r\n<p><strong>TDD (разработка через тестирование)</strong></p>\r\n<p>Первый вопрос &mdash; тестирование кода. Тесты должны писаться легко. Никто не будет следовать TDD если один простой тест требует mock для половины приложения. Это большая головная боль. И Yii не&nbsp;достаточно помогал в этом вопросе.</p>\r\n<p>Глобальный объект Yii::app() только убивал попытки написать тесты. Вы начинали с одного теста, затем понимали что вам нужно создать mock для этого сервиса и ещё другого и оба они зависят от третьего&hellip; бах! Большинство сервисов в Yii пересекаются друг с другом. Это хреново.</p>\r\n<p>У нас была тесная связь между компонентами. Было сложно раскладывать проект на составляющие. В идеале нам не следует делать этого вовсе, они изначально должны быть отделены друг от друга.</p>\r\n<p>Реально сложно следовать TDD в Yii. Да, он имеет CWebTestCase, fixtures, базовую интеграцию с phpUnit. Но это простые вещи. Гораздо более важно &mdash; тестировать сервисы/модели без моков других сервисов, без моков других классов фреймворка.</p>\r\n<p><strong>ORM/ActiveRecord</strong></p>\r\n<p>Иметь ActiveRecords как часть ядра фреймворка &mdash; это круто. Это реально удобно для новичнов. Но AR в Yii очень упрощен и, опять же, очень сильно связан. Я знаю, что когда мы говорим об AR, мы будем, скорее всего, иметь тесную связь, потому что сущности должны быть соединены по порядку для сохранения чего-либо без прямой передачи этого. Но это не причина, чтобы распространять эту идею везде.</p>\r\n<p>Более серьезный вопрос: почему AR в Yii не покрывает наши потребности &mdash; это из-за отсутствия разделения между сущностью и запросом. В Yii мы вынуждены использовать статические методы для запросов и нестатические методы для логики моделей. В Yii ActiveRecord и ActiveFinder представлены одним экземпляром. Это не круто, когда запросы перемешиваются с сущностью (getter/setter).</p>\r\n<p>Другой момент относится к статическим методам для запросов. Статические методы не могут иметь другого состояния, кроме статического. И если вы хотите перемешать несколько условий вы вынуждены объединить критерии. В Propel мне нравится делать такое: $query-&gt;filterByThis(1)-&gt;filterByThat(2)-&gt;find() и сохранять мои фильтры/критерии отдельно. В Yii вы вынуждены определить их массивами (вы не можете создавать условия динамически) и затем объединить массив или критерии. Довольно скучная работа. Также у меня не может быть несколько классов для запросов, расширяющих базовый, где я буду разделять фильтры/условия базирующиеся на бизнес логике.</p>\r\n<p>Нам нужны более серьезные вещи. В Symfony 2 у нас есть Doctrine 2. Достаточно серьезная ORM. И это было достаточно важно для нас. Но в итоге мы прилипли к Propel ORM.<br /> Я знаю, там есть также некоторые проблемы и сгенерированный код далёк от лучших стандартов кодирования. Но это работает для нас лучшим образом и мы точно можем разделить сущности и запросы. Главные вещи которые мы любим в propel &mdash; реальный getter/setter (мы можем посмотреть как они реализуются и переопределить их в случае необходимости), схемы базы данных и генерация миграция, поведений, &nbsp;интеграция в некоторые компоненты Symfony, такие как формы и валидаторы.</p>\r\n<p><strong>Стиль кодирования</strong></p>\r\n<p>Я знаю, команда Yii следует их личному стилю написания кода и это нормально. Но внутренне мы разные и в этом заключалась проблема.</p>\r\n<p>На самом деле, ранее у нас не было документации об основных принципах кодирования. Мы сделали несколько попыток написать их, но это было очень скучно. Имена классов, отступы и прочее. Это требовало много времени. У нас в тайне были некоторые общие стандарты, но это не было задокументировано.</p>\r\n<p>Проблема была в том, что наш стиль написания кода несколько отличался от того, который использует команда Yii. Мы сделали вклад в развитие Yii сообщества, разработав несколько дополнений и, конечно, мы хотели сохранить наши расширения похожими на родной Yii код. В итоге, мы&nbsp;были вынуждены переключаться между разными стилями кодирования всё время. Для расширений Yii мы использовали принципы кодирования Yii команды, для реальных проектов мы использовали свой собственный. Не круто.</p>\r\n<p>Мы хотели использовать что-то глобальное. В нашем коде, в компонентах, в фреймворке.</p>\r\n<p>Теперь мы следуем PSR-2. Мы были близки к этому и миграция была супер легкой. Symfony 2 следует PSR-2. Большинство компонентов следует этому также. Это работает для нас и мы, на самом деле, ценим php-fig. Безусловно есть много полемики о PSR, но большинство из неё о PSR-3. PSR-2 достаточно хорош. По крайней мере для нас.</p>\r\n<p>Ещё одна вещь &mdash; пространства имен (namespaces). Как вы знаете, Yii не использует пространства имен. И это не помогает в построении приложения. Пространства имен помогают укоротить имена классов, помогают с автозагрузкой классов и т.д. В общем, мы ощущаем себя более комфортно с namespaces, чем без них.</p>\r\n<p><strong>Расширения</strong></p>\r\n<p>Давайте посмотрим как мы получали расширение в Yii. Первое, нам необходимо найти его на сайте Yii, скачать, скопировать вручную в директорию проекта, прикрепить в конфиге. Затем нам необходимо наблюдать за сайтом Yii для поиска обновления. Это хорошо, но не в 2013 году.</p>\r\n<p>Прямо сейчас мы используем composer. Это великолепно, когда вы можете просто объявить зависимость в проекте и запустить &laquo;update&raquo;. Он скачает расширение/библиотеку/компонент/бандл или всё что вы хотите, установит и добавить в автозагрузку и вы может использовать это. Также composer будет беспокоиться обо всех зависимостях компонентов и скачивать их, если это необходимо. Одной командой вы можете обновить все компоненты до наиболее актуальной версии. Вы можете указать специфичную версию. Возможно, вы хотите скачать test или dev версии. Это тоже просто.</p>\r\n<p>Это чрезвычайно легко опубликовать ваш пакет и сделать его доступным отовсюду. Проще определять версии, проще сделать fork расширения, легче посылать запросы на внесение изменений и так далее.</p>\r\n<p>Composer является чрезвычайно полезным инструментом. Это именно то, что необходимо php сообществу.</p>\r\n<p>Мы используем composer для управления нашими зависимостями. Мы не держим внешних зависимостей в нашем репозитории вовсе. Всё что нам нужно &mdash; только лишь сохранять composer.json в актуальном состоянии.</p>\r\n<p><strong>Архитектура</strong></p>\r\n<p>Давайте вернемся к обслуживанию кода.Чаще всего, когда люди хотят сказать, что код должен быть чище, они говорят, что нуждаются в правильной архитектуре. Что это значит?</p>\r\n<p>Во-первых, это означает, что программное обеспечение должно быть основано на некоторых принципах и следовать хорошим практикам. Так что да, мы хотим, чтобы наше программное обеспечение было принципиальным. И Symfony помогает нам в этом. Архитектура Symfony 2 основана на тех же принципах.</p>\r\n<p><strong>Заключительные мысли &nbsp;</strong></p>\r\n<p>Я хочу, чтобы вы поняли меня правильно. Мы по-прежнему испытываем теплые чувства к Yii, продолжаем выражать уважение Yii команде, они сделали и делают большую работу. Это превосходно, и мы потратили несколько человеко-лет, создавая код с этим фреймворком, способствовали созданию ряда расширений и консультировали многих новичков на различных форумах. &nbsp;Но на данный момент, это просто не соответствует нашем потребностям. Мы, по-прежнему, следим за обновлениями в отношении Yii2, и ждалиYii2 так долго&hellip; Но мы должны двигаться. И следующая точка нашего путешествия &mdash; <strong>Symfony 2</strong>.</p>\r\n</div>', '2014-01-27 12:42:25', NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `aaa_session`
--

DROP TABLE IF EXISTS `aaa_session`;
CREATE TABLE IF NOT EXISTS `aaa_session` (
  `id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `data` longtext COLLATE utf8_unicode_ci NOT NULL,
  `time` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `time` (`time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `aaa_session`
--


-- --------------------------------------------------------

--
-- Структура таблицы `aaa_sitemap_urls`
--

DROP TABLE IF EXISTS `aaa_sitemap_urls`;
CREATE TABLE IF NOT EXISTS `aaa_sitemap_urls` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `is_visited` tinyint(1) NOT NULL,
  `loc` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `title_hash` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `title` longtext COLLATE utf8_unicode_ci,
  `title_dublicates` int(11) NOT NULL,
  `lastmod` datetime DEFAULT NULL,
  `changefreq` varchar(8) COLLATE utf8_unicode_ci DEFAULT NULL,
  `priority` double DEFAULT NULL,
  `status` smallint(6) NOT NULL,
  `referer` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_F2FA10BE8852ACDC` (`loc`),
  KEY `title_hash` (`title_hash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Дамп данных таблицы `aaa_sitemap_urls`
--


-- --------------------------------------------------------

--
-- Структура таблицы `aaa_sliders`
--

DROP TABLE IF EXISTS `aaa_sliders`;
CREATE TABLE IF NOT EXISTS `aaa_sliders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `width` smallint(6) DEFAULT NULL,
  `height` smallint(6) DEFAULT NULL,
  `mode` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `library` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `slide_properties` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Дамп данных таблицы `aaa_sliders`
--

INSERT INTO `aaa_sliders` (`id`, `title`, `width`, `height`, `mode`, `library`, `slide_properties`) VALUES
(1, 'На главной', 600, 400, 'INSET', 'jcarousel', NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `aaa_slides`
--

DROP TABLE IF EXISTS `aaa_slides`;
CREATE TABLE IF NOT EXISTS `aaa_slides` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `enabled` tinyint(1) DEFAULT NULL,
  `file_name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `original_file_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `position` smallint(6) NOT NULL,
  `created_at` datetime NOT NULL,
  `user_id` int(11) NOT NULL,
  `properties` longtext COLLATE utf8_unicode_ci COMMENT '(DC2Type:array)',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_56692A96D7DF1668` (`file_name`),
  KEY `position` (`position`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

--
-- Дамп данных таблицы `aaa_slides`
--

INSERT INTO `aaa_slides` (`id`, `enabled`, `file_name`, `original_file_name`, `title`, `position`, `created_at`, `user_id`, `properties`) VALUES
(2, 1, 'd38efae3c66fc0f775281e89e00496ef.jpeg', 'Code Complete.jpg', 'Книга', 0, '2014-01-30 23:33:52', 1, 'a:0:{}'),
(3, 1, '19975be1a6f8a5829f0333ad0fb983c5.png', 'oum logo.png', 'Логотип', 0, '2014-01-31 00:00:16', 1, 'a:0:{}');

-- --------------------------------------------------------

--
-- Структура таблицы `aaa_texter`
--

DROP TABLE IF EXISTS `aaa_texter`;
CREATE TABLE IF NOT EXISTS `aaa_texter` (
  `item_id` int(11) NOT NULL AUTO_INCREMENT,
  `locale` varchar(8) DEFAULT NULL,
  `text` longtext,
  `meta` longtext NOT NULL COMMENT '(DC2Type:array)',
  `created` datetime NOT NULL,
  `user_id` int(11) NOT NULL,
  `editor` smallint(6) NOT NULL,
  PRIMARY KEY (`item_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=15 ;

--
-- Дамп данных таблицы `aaa_texter`
--

INSERT INTO `aaa_texter` (`item_id`, `locale`, `text`, `meta`, `created`, `user_id`, `editor`) VALUES
(1, 'ru', 'Футер\r', 'a:0:{}', '2012-08-27 03:16:57', 1, 1),
(2, 'ru', '<h1>Главная страница!</h1>\r\n<p>С точки зрения банальной эрудиции каждый индивидуум, критически мотивирующий абстракцию, не может игнорировать критерии утопического субъективизма, концептуально интерпретируя общепринятые дефанизирующие поляризаторы, поэтому консенсус, достигнутый диалектической материальной классификацией всеобщих мотиваций в парадогматических связях предикатов, решает проблему усовершенствования формирующих геотрансплантационных квазипузлистатов всех кинетически коррелирующих аспектов. Исходя из этого, мы пришли к выводу, что каждый произвольно выбранный предикативно абсорбирующий объект.</p>\r\n<img src="/uploads/Advanced%20C%20Asana.jpg" alt="" width="891" height="666" />', 'a:1:{s:8:"keywords";s:3:"123";}', '2012-08-27 03:17:27', 1, 1),
(3, 'ru', '<h2>Пример страницы с 2-мя колонками</h2>\r\n<p>Опросная анкета упорядочивает из ряда вон выходящий портрет потребителя, учитывая результат предыдущих медиа-кампаний. Спонсорство, в рамках сегодняшних воззрений, однородно стабилизирует принцип восприятия, используя опыт предыдущих кампаний. Узнавание бренда осмысленно переворачивает повторный контакт, признавая определенные рыночные тенденции. Стимулирование сбыта амбивалентно.</p>\r\n<p>Опросная анкета упорядочивает из ряда вон выходящий портрет потребителя, учитывая результат предыдущих медиа-кампаний. Спонсорство, в рамках сегодняшних воззрений, однородно стабилизирует принцип восприятия, используя опыт предыдущих кампаний. Узнавание бренда осмысленно переворачивает повторный контакт, признавая определенные рыночные тенденции. Стимулирование сбыта амбивалентно.</p>', 'a:1:{s:8:"keywords";s:3:"sdf";}', '2012-08-27 03:51:05', 1, 1),
(4, 'ru', '<p><img src="/uploads/images/bscap0001.jpg" alt="" width="300" height="124" /><br />Сервисная стратегия деятельно искажает продвигаемый медиаплан, опираясь на опыт западных коллег. Внутрифирменная реклама, согласно Ф.Котлеру, откровенно цинична. Торговая марка исключительно уравновешивает презентационный материал, полагаясь на инсайдерскую информацию. Наряду с этим, узнавание бренда вполне выполнимо. Организация слубы маркетинга, согласно Ф.Котлеру, усиливает фактор коммуникации, осознавая социальную ответственность бизнеса. Экспертиза выполненного проекта восстанавливает потребительский презентационный материал, полагаясь на инсайдерскую информацию.</p>', 'a:0:{}', '2012-08-27 03:51:27', 1, 1),
(5, 'ru', 'Текстер №5', 'a:0:{}', '2013-03-21 06:03:37', 1, 0),
(6, 'ru', 'Text under menu in <strong>User</strong> folder.\r', 'a:0:{}', '2013-03-25 21:53:12', 1, 1),
(7, 'ru', 'sdf gsdfg dsf gsdf gdsfg sdf g', 'a:0:{}', '2013-08-10 11:14:55', 1, 1),
(8, 'ru', '<p>Нельзя так просто взять и написать цмс-ку ;)<br /><br /><img src="/uploads/images/bscap0001_big.jpg" alt="" width="1680" height="693" /></p>', 'a:0:{}', '2013-12-20 20:11:42', 1, 1),
(9, 'ru', 'Powered by <a href="http://symfony.com" target="_blank">Symfony2</a>', 'a:0:{}', '2014-01-20 03:47:18', 1, 1),
(10, 'ru', 'Очень интересные новости ;)', 'a:0:{}', '2014-01-22 19:02:28', 1, 1),
(11, 'ru', 'Для жаждущих с Сущностью Вечной слиянья<br />\r\nЕсть йога познанья и йога деянья,<br />\r\n<br />\r\nВ бездействии мы не обрящем блаженства;<br />\r\nКто дела не начал, тот чужд совершенства.<br />\r\n<br />\r\nОднако без действий никто не пребудет:<br />\r\nТы хочешь того иль не хочешь — принудит<br />\r\n<br />\r\nПрирода тебя: нет иного удела,<br />\r\nИ, ей повинуясь, ты делаешь дело.<br />\r\n<br />\r\nКто, чувства поправ, все же помнит впечали<br />\r\nПредметы, что чувства его услаждали,—<br />\r\n<br />\r\nТот, связанный, следует ложной дорогой;<br />\r\nА тот, о сын Кунти, кто, волею строгой<br />\r\n<br />\r\nВсе чувства поправ, йогу действия начал,—<br />\r\nНа правой дороге себя обозначил.<br />\r\n<br />\r\nПоэтому действуй; бездействию дело<br />\r\nВсегда предпочти; отравления тела —<br />\r\n<br />\r\nИ то без усилий свершить невозможно:<br />\r\nДеянье — надежно, бездействие — ложно. &nbsp;\r', 'a:0:{}', '2014-01-29 10:01:55', 1, 1),
(12, 'ru', '<hr />\r\n<h4>\r\n  Последние новости\r\n</h4>\r', 'a:0:{}', '2014-01-29 19:43:16', 1, 1),
(13, 'ru', '<h4>\r\n  Меню\r\n</h4>\r\n<hr />\r', 'a:0:{}', '2014-01-29 19:45:52', 1, 1),
(14, 'ru', 'Где чувства господствуют – там вожделенье,<br />\r\nА где вожделенье – там гнев, ослепленье,<br />\r\n<br />\r\nА где ослепленье – ума угасанье,<br />\r\nГде ум угасает – там гибнет познанье,<br />\r\n<br />\r\nГде гибнет познанье, – да ведает всякий, –<br />\r\nТам гибнет дитя человечье во мраке.<br />\r\n<br />\r\nА тот, кто добился над чувствами власти,<br />\r\nПопрал отвращенье, не знает пристрастий,<br />\r\n<br />\r\nКто их навсегда подчинил своей воле, –<br />\r\nДостиг просветленья, избавясь от боли,<br />\r\n<br />\r\nИ сердце с тех пор у него беспорочно,<br />\r\nИ разум его утверждается прочно.<br />\r\n<br />\r\nВне йоги к разумным себя не причисли:<br />\r\nВ неясности нет созидающей мысли;<br />\r\n<br />\r\nВне творческой мысли нет мира, покоя,<br />\r\nА где вне покоя и счастье людское?&nbsp;\r', 'a:0:{}', '2014-01-29 20:16:33', 1, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `aaa_texter_history`
--

DROP TABLE IF EXISTS `aaa_texter_history`;
CREATE TABLE IF NOT EXISTS `aaa_texter_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `is_deleted` tinyint(1) NOT NULL,
  `item_id` int(11) NOT NULL,
  `locale` varchar(8) COLLATE utf8_unicode_ci NOT NULL,
  `editor` smallint(6) NOT NULL,
  `text` longtext COLLATE utf8_unicode_ci NOT NULL,
  `meta` longtext COLLATE utf8_unicode_ci NOT NULL COMMENT '(DC2Type:array)',
  `created` datetime NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `item_id` (`item_id`),
  KEY `is_deleted` (`is_deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Дамп данных таблицы `aaa_texter_history`
--


-- --------------------------------------------------------

--
-- Структура таблицы `aaa_users`
--

DROP TABLE IF EXISTS `aaa_users`;
CREATE TABLE IF NOT EXISTS `aaa_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `username_canonical` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_canonical` varchar(255) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `salt` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `locked` tinyint(1) NOT NULL,
  `expired` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  `confirmation_token` varchar(255) DEFAULT NULL,
  `password_requested_at` datetime DEFAULT NULL,
  `roles` longtext NOT NULL COMMENT '(DC2Type:array)',
  `credentials_expired` tinyint(1) NOT NULL,
  `credentials_expire_at` datetime DEFAULT NULL,
  `firstname` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  `facebook_id` varchar(255) NOT NULL,
  `created` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_957A647992FC23A8` (`username_canonical`),
  UNIQUE KEY `UNIQ_957A6479A0D96FBF` (`email_canonical`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Дамп данных таблицы `aaa_users`
--

INSERT INTO `aaa_users` (`id`, `username`, `username_canonical`, `email`, `email_canonical`, `enabled`, `salt`, `password`, `last_login`, `locked`, `expired`, `expires_at`, `confirmation_token`, `password_requested_at`, `roles`, `credentials_expired`, `credentials_expire_at`, `firstname`, `lastname`, `facebook_id`, `created`) VALUES
(1, 'root', 'root', 'artem@mail.ru', 'artem@mail.ru', 1, 'rvmppg4hla80gw0c88wwkogkc8cg88c', 'pSRvk1iSFWol6tPyvrt8ULb6A03pa3jT8LNsVv9eYC9DSQMFLL91dzHBNvPFUFuICMMvFqzYBnyDVaW+Eg3eRg==', '2014-01-30 19:58:57', 0, 0, NULL, NULL, NULL, 'a:1:{i:0;s:9:"ROLE_ROOT";}', 0, NULL, '', '', '', '2014-01-20 00:00:00'),
(2, 'demo', 'demo', 'demo@mail.com', 'demo@mail.com', 1, '15lr4t5s1pdwowoc8k88goc88k00w8', 'MdaZxuZKbcCL1IePGhILE6v+iUUKrINsdpdMMmsc1+LZ7ZBERkb8s+Q6hlp9n4lhU9QKUwnhFpGi8vvjHOPORw==', '2014-01-19 18:56:18', 0, 0, NULL, NULL, NULL, 'a:1:{i:0;s:14:"ROLE_NEWSMAKER";}', 0, NULL, '', '', '', '2014-01-20 00:00:00'),
(3, 'aaa', 'aaa', 'aaa@aaa.ru', 'aaa@aaa.ru', 1, 'teyhcartb3ks0kw4sw0co0k8ko0gk48', '+Qtvl5uc9knUH6z2ZB/7qqZLueaGSfs1yS7TVt4h6CQtNY/a/wG4gdDV+hxR/eSnotc4PGGrRvqnHfdzOmyJNA==', '2014-01-19 18:41:30', 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL, '', '', '', '2014-01-20 00:00:00');

-- --------------------------------------------------------

--
-- Структура таблицы `engine_permissions`
--

DROP TABLE IF EXISTS `engine_permissions`;
CREATE TABLE IF NOT EXISTS `engine_permissions` (
  `group_id` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `default_access` tinyint(1) NOT NULL,
  `title` varchar(255) NOT NULL,
  `descr` text COMMENT 'Описание',
  PRIMARY KEY (`group_id`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Права доступа';

--
-- Дамп данных таблицы `engine_permissions`
--

INSERT INTO `engine_permissions` (`group_id`, `name`, `default_access`, `title`, `descr`) VALUES
('engine', 'folder.read', 1, 'Чтение папок', NULL),
('engine', 'folder.view', 1, 'Отображение', NULL),
('engine', 'folder.write', 0, 'Создание в папке других папок и нод.', NULL),
('engine', 'node.read', 1, 'Чтение ноды', 'Отображается нода или нет, соответственно обрабатывает её движок или нет.'),
('engine', 'node.write', 0, 'Запись ноды', 'Возможность передачи ноде POST данных. '),
('module.smartcore.news', 'create', 0, 'Создание новости', NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `engine_permissions_defaults`
--

DROP TABLE IF EXISTS `engine_permissions_defaults`;
CREATE TABLE IF NOT EXISTS `engine_permissions_defaults` (
  `permission` varchar(100) NOT NULL,
  `role_id` varchar(50) NOT NULL,
  `access` tinyint(1) NOT NULL DEFAULT '0',
  `descr` text NOT NULL,
  PRIMARY KEY (`role_id`),
  KEY `access` (`access`),
  KEY `permission` (`permission`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Переопределения прав по умолчанию для различных ролей';

--
-- Дамп данных таблицы `engine_permissions_defaults`
--

INSERT INTO `engine_permissions_defaults` (`permission`, `role_id`, `access`, `descr`) VALUES
('engine:folder.write', 'ROLE_ADMIN', 1, 'Для администраторов разрешена запись в папки.'),
('engine:folder.write', 'ROLE_USER', 0, 'Юзеры не могут создавать папки.');

-- --------------------------------------------------------

--
-- Структура таблицы `engine_permissions_groups`
--

DROP TABLE IF EXISTS `engine_permissions_groups`;
CREATE TABLE IF NOT EXISTS `engine_permissions_groups` (
  `group_id` varchar(50) NOT NULL,
  `descr` text COMMENT 'Описание',
  PRIMARY KEY (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Группы прав доступа';

--
-- Дамп данных таблицы `engine_permissions_groups`
--

INSERT INTO `engine_permissions_groups` (`group_id`, `descr`) VALUES
('engine', 'Ядро'),
('module.smartcore.news', 'Модуль Новости'),
('module.smartcore.texter', 'Модуль Текстер');

-- --------------------------------------------------------

--
-- Структура таблицы `engine_roles`
--

DROP TABLE IF EXISTS `engine_roles`;
CREATE TABLE IF NOT EXISTS `engine_roles` (
  `role_id` varchar(50) NOT NULL,
  `pos` smallint(5) unsigned NOT NULL DEFAULT '0',
  `descr` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Роли пользователей';

--
-- Дамп данных таблицы `engine_roles`
--

INSERT INTO `engine_roles` (`role_id`, `pos`, `descr`) VALUES
('ROLE_ADMIN', 0, '-'),
('ROLE_GUEST', 0, 'Анонимный посетитель'),
('ROLE_NEWSMAKER', 0, 'Новостеписатель'),
('ROLE_ROOT', 0, 'Супер админ'),
('ROLE_USER', 0, 'Зарегистрированный пользователь');

-- --------------------------------------------------------

--
-- Структура таблицы `engine_roles_hierarchy`
--

DROP TABLE IF EXISTS `engine_roles_hierarchy`;
CREATE TABLE IF NOT EXISTS `engine_roles_hierarchy` (
  `role_id` varchar(50) NOT NULL,
  `parent_role_id` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Иерархия ролей';

--
-- Дамп данных таблицы `engine_roles_hierarchy`
--

INSERT INTO `engine_roles_hierarchy` (`role_id`, `parent_role_id`) VALUES
('ROLE_NEWSMAKER', 'ROLE_USER');

-- --------------------------------------------------------

--
-- Структура таблицы `engine_roles_users_relation`
--

DROP TABLE IF EXISTS `engine_roles_users_relation`;
CREATE TABLE IF NOT EXISTS `engine_roles_users_relation` (
  `role_id` varchar(50) NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`role_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Связи полей и юзеров.';

--
-- Дамп данных таблицы `engine_roles_users_relation`
--

INSERT INTO `engine_roles_users_relation` (`role_id`, `user_id`) VALUES
('ROLE_ROOT', 1);

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `aaa_engine_blocks_inherit`
--
ALTER TABLE `aaa_engine_blocks_inherit`
  ADD CONSTRAINT `FK_4B3EA624162CB942` FOREIGN KEY (`folder_id`) REFERENCES `aaa_engine_folders` (`folder_id`),
  ADD CONSTRAINT `FK_4B3EA624E9ED820C` FOREIGN KEY (`block_id`) REFERENCES `aaa_engine_blocks` (`block_id`);

--
-- Ограничения внешнего ключа таблицы `aaa_engine_folders`
--
ALTER TABLE `aaa_engine_folders`
  ADD CONSTRAINT `FK_6B4611ABA640A07B` FOREIGN KEY (`folder_pid`) REFERENCES `aaa_engine_folders` (`folder_id`);

--
-- Ограничения внешнего ключа таблицы `aaa_engine_nodes`
--
ALTER TABLE `aaa_engine_nodes`
  ADD CONSTRAINT `FK_F4FF528B162CB942` FOREIGN KEY (`folder_id`) REFERENCES `aaa_engine_folders` (`folder_id`),
  ADD CONSTRAINT `FK_F4FF528BE9ED820C` FOREIGN KEY (`block_id`) REFERENCES `aaa_engine_blocks` (`block_id`);

--
-- Ограничения внешнего ключа таблицы `aaa_menu`
--
ALTER TABLE `aaa_menu`
  ADD CONSTRAINT `FK_D885BF9A162CB942` FOREIGN KEY (`folder_id`) REFERENCES `aaa_engine_folders` (`folder_id`),
  ADD CONSTRAINT `FK_D885BF9A5550C4ED` FOREIGN KEY (`pid`) REFERENCES `aaa_menu` (`item_id`),
  ADD CONSTRAINT `FK_D885BF9AFE54D947` FOREIGN KEY (`group_id`) REFERENCES `aaa_menu_groups` (`group_id`);
