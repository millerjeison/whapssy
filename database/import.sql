-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Aug 25, 2024 at 05:17 PM
-- Server version: 10.11.8-MariaDB-cll-lve
-- PHP Version: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `u687661449_wacrm1`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `email` varchar(999) DEFAULT NULL,
  `password` varchar(999) DEFAULT NULL,
  `uid` varchar(999) DEFAULT NULL,
  `role` varchar(999) NOT NULL DEFAULT 'admin',
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `email`, `password`, `uid`, `role`, `createdAt`) VALUES
(1, 'admin@admin.com', '$2b$10$OUmfMxfNYQOw4yGtYWzQV./vpMHKYDXzkn6q2FK58hO8uzYuqdFcq', 'XhbfYkIAC1bYGhUodfJppmRCEUyGQJCZ', 'admin', '2024-01-31 13:54:21');

-- --------------------------------------------------------

--
-- Table structure for table `agents`
--

CREATE TABLE `agents` (
  `id` int(11) NOT NULL,
  `owner_uid` varchar(999) DEFAULT NULL,
  `uid` varchar(999) DEFAULT NULL,
  `role` varchar(999) DEFAULT 'agent',
  `email` varchar(999) DEFAULT NULL,
  `password` varchar(999) DEFAULT NULL,
  `name` varchar(999) DEFAULT NULL,
  `mobile` varchar(999) DEFAULT NULL,
  `comments` longtext DEFAULT NULL,
  `is_active` int(1) DEFAULT 1,
  `createdAt` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `agents`
--

INSERT INTO `agents` (`id`, `owner_uid`, `uid`, `role`, `email`, `password`, `name`, `mobile`, `comments`, `is_active`, `createdAt`) VALUES
(3, 'lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'n9xrxIvwIajEo2JO2poQ0b3UyUnhUF3g', 'agent', 'john@agent.com', '$2b$10$/LRIrp/i6vE0bKArKaDj7OzN/KxO.QUCZLT5rjo02VK96ka0FWjdO', 'john', '7778888000', 'some comments', 1, '2024-04-06 06:45:15');

-- --------------------------------------------------------

--
-- Table structure for table `agent_chats`
--

CREATE TABLE `agent_chats` (
  `id` int(11) NOT NULL,
  `owner_uid` varchar(999) DEFAULT NULL,
  `uid` varchar(999) DEFAULT NULL,
  `chat_id` varchar(999) DEFAULT NULL,
  `createdAt` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `agent_task`
--

CREATE TABLE `agent_task` (
  `id` int(11) NOT NULL,
  `owner_uid` varchar(999) DEFAULT NULL,
  `uid` varchar(999) DEFAULT NULL,
  `title` varchar(999) DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `agent_comments` longtext DEFAULT NULL,
  `status` varchar(999) DEFAULT NULL,
  `createdAt` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `agent_task`
--

INSERT INTO `agent_task` (`id`, `owner_uid`, `uid`, `title`, `description`, `agent_comments`, `status`, `createdAt`) VALUES
(2, 'lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'n9xrxIvwIajEo2JO2poQ0b3UyUnhUF3g', 'holiday ', 'tell all customer that its holiday', 'this was done', 'COMPLETED', '2024-04-09 06:51:55');

-- --------------------------------------------------------

--
-- Table structure for table `broadcast`
--

CREATE TABLE `broadcast` (
  `id` int(11) NOT NULL,
  `broadcast_id` varchar(999) DEFAULT NULL,
  `uid` varchar(999) DEFAULT NULL,
  `title` varchar(999) DEFAULT NULL,
  `templet` longtext DEFAULT NULL,
  `phonebook` longtext DEFAULT NULL,
  `status` varchar(999) DEFAULT NULL,
  `schedule` datetime DEFAULT NULL,
  `timezone` varchar(999) DEFAULT 'Asia/Kolkata',
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `broadcast_log`
--

CREATE TABLE `broadcast_log` (
  `id` int(11) NOT NULL,
  `uid` varchar(999) DEFAULT NULL,
  `broadcast_id` varchar(999) DEFAULT NULL,
  `templet_name` varchar(999) DEFAULT NULL,
  `is_read` int(1) DEFAULT 0,
  `meta_msg_id` varchar(999) DEFAULT NULL,
  `sender_mobile` varchar(999) DEFAULT NULL,
  `send_to` varchar(999) DEFAULT NULL,
  `delivery_status` varchar(999) DEFAULT 'PENDING',
  `delivery_time` varchar(999) DEFAULT NULL,
  `err` longtext DEFAULT NULL,
  `example` longtext DEFAULT NULL,
  `contact` longtext DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `chatbot`
--

CREATE TABLE `chatbot` (
  `id` int(11) NOT NULL,
  `uid` varchar(999) DEFAULT NULL,
  `title` varchar(999) DEFAULT NULL,
  `for_all` int(1) DEFAULT 0,
  `chats` longtext DEFAULT NULL,
  `flow` longtext DEFAULT NULL,
  `flow_id` varchar(999) DEFAULT NULL,
  `active` int(1) DEFAULT 0,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `chats`
--

CREATE TABLE `chats` (
  `id` int(11) NOT NULL,
  `chat_id` varchar(999) DEFAULT NULL,
  `uid` varchar(999) DEFAULT NULL,
  `last_message_came` varchar(999) DEFAULT NULL,
  `chat_note` longtext DEFAULT NULL,
  `chat_tags` longtext DEFAULT NULL,
  `sender_name` varchar(999) DEFAULT NULL,
  `sender_mobile` varchar(999) DEFAULT NULL,
  `chat_status` varchar(999) DEFAULT 'open',
  `is_opened` int(1) DEFAULT 0,
  `last_message` longtext DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `chat_widget`
--

CREATE TABLE `chat_widget` (
  `id` int(11) NOT NULL,
  `unique_id` varchar(999) DEFAULT NULL,
  `uid` varchar(999) DEFAULT NULL,
  `title` varchar(999) DEFAULT NULL,
  `whatsapp_number` varchar(999) DEFAULT NULL,
  `logo` varchar(999) DEFAULT NULL,
  `place` varchar(999) DEFAULT NULL,
  `size` varchar(999) DEFAULT NULL,
  `createdAt` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `chat_widget`
--

INSERT INTO `chat_widget` (`id`, `unique_id`, `uid`, `title`, `whatsapp_number`, `logo`, `place`, `size`, `createdAt`) VALUES
(5, 'ydHVJqmfnL', 'lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'test', '918430088300', 'whatsapp-color-icon.png', 'BOTTOM_RIGHT', '65', '2024-04-10 14:09:49');

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

CREATE TABLE `contact` (
  `id` int(11) NOT NULL,
  `uid` varchar(999) DEFAULT NULL,
  `phonebook_id` varchar(999) DEFAULT NULL,
  `phonebook_name` varchar(999) DEFAULT NULL,
  `name` varchar(999) DEFAULT NULL,
  `mobile` varchar(999) DEFAULT NULL,
  `var1` varchar(999) DEFAULT NULL,
  `var2` varchar(999) DEFAULT NULL,
  `var3` varchar(999) DEFAULT NULL,
  `var4` varchar(999) DEFAULT NULL,
  `var5` varchar(999) DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `contact_form`
--

CREATE TABLE `contact_form` (
  `id` int(11) NOT NULL,
  `email` varchar(999) DEFAULT NULL,
  `name` varchar(999) DEFAULT NULL,
  `mobile` varchar(999) DEFAULT NULL,
  `content` longtext DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `contact_form`
--

INSERT INTO `contact_form` (`id`, `email`, `name`, `mobile`, `content`, `createdAt`) VALUES
(1, 'email@gmail.com', 'John do', '+91999999999', 'hello, what are the charges', '2024-02-28 07:57:12');

-- --------------------------------------------------------

--
-- Table structure for table `faq`
--

CREATE TABLE `faq` (
  `id` int(11) NOT NULL,
  `question` longtext DEFAULT NULL,
  `answer` longtext DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `faq`
--

INSERT INTO `faq` (`id`, `question`, `answer`, `createdAt`) VALUES
(4, 'Can I use my existing WhatsApp number?', 'Yes, you can use an existing WhatsApp number. However, before onboarding, you must first delete the WhatsApp account linked to that number. If you wish to back up your WhatsApp text messages so that you can restore to WhatsCRM, you can use our Chat backup plugin', '2024-02-27 11:20:45'),
(5, 'Can I use my existing WhatsApp number?', 'Yes, you can use an existing WhatsApp number. However, before onboarding, you must first delete the WhatsApp account linked to that number. If you wish to back up your WhatsApp text messages so that you can restore to WhatsCRM, you can use our Chat backup plugin', '2024-02-27 11:20:52'),
(6, 'Can I use my existing WhatsApp number?', 'Yes, you can use an existing WhatsApp number. However, before onboarding, you must first delete the WhatsApp account linked to that number. If you wish to back up your WhatsApp text messages so that you can restore to WhatsCRM, you can use our Chat backup plugin', '2024-02-27 11:20:57'),
(7, 'Can I use my existing WhatsApp number?', 'Yes, you can use an existing WhatsApp number. However, before onboarding, you must first delete the WhatsApp account linked to that number. If you wish to back up your WhatsApp text messages so that you can restore to WhatsCRM, you can use our Chat backup plugin', '2024-02-27 11:21:05');

-- --------------------------------------------------------

--
-- Table structure for table `flow`
--

CREATE TABLE `flow` (
  `id` int(11) NOT NULL,
  `uid` varchar(999) DEFAULT NULL,
  `flow_id` varchar(999) DEFAULT NULL,
  `title` varchar(999) DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `prevent_list` longtext DEFAULT NULL,
  `ai_list` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `gen_links`
--

CREATE TABLE `gen_links` (
  `id` int(11) NOT NULL,
  `wa_mobile` varchar(999) DEFAULT NULL,
  `email` varchar(999) DEFAULT NULL,
  `msg` varchar(999) DEFAULT NULL,
  `createdAt` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `gen_links`
--

INSERT INTO `gen_links` (`id`, `wa_mobile`, `email`, `msg`, `createdAt`) VALUES
(2, '918430088300', 'email@gmail.com', 'hey there i am using whatsapp', '2024-08-25 09:41:12'),
(3, '918430088300', 'email@gmail.com', 'hey i am living in my dreams.', '2024-08-25 10:02:05');

-- --------------------------------------------------------

--
-- Table structure for table `meta_api`
--

CREATE TABLE `meta_api` (
  `id` int(11) NOT NULL,
  `uid` varchar(999) DEFAULT NULL,
  `waba_id` varchar(999) DEFAULT NULL,
  `business_account_id` varchar(999) DEFAULT NULL,
  `access_token` varchar(999) DEFAULT NULL,
  `business_phone_number_id` varchar(999) DEFAULT NULL,
  `app_id` varchar(999) DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `meta_api`
--

INSERT INTO `meta_api` (`id`, `uid`, `waba_id`, `business_account_id`, `access_token`, `business_phone_number_id`, `app_id`, `createdAt`) VALUES
(1, 'lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'xxxxxxxxxxxx', 'xxxxxxxxxxxx', 'xxxxxxxxxxxx', 'xxxxxxxxxxxx', 'xxxxxxxxxxxx', '2024-02-21 16:04:31');

-- --------------------------------------------------------

--
-- Table structure for table `meta_templet_media`
--

CREATE TABLE `meta_templet_media` (
  `id` int(11) NOT NULL,
  `uid` varchar(999) DEFAULT NULL,
  `templet_name` varchar(999) DEFAULT NULL,
  `meta_hash` varchar(999) DEFAULT NULL,
  `file_name` varchar(999) DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `uid` varchar(999) DEFAULT NULL,
  `payment_mode` varchar(999) DEFAULT NULL,
  `amount` varchar(999) DEFAULT NULL,
  `data` longtext DEFAULT NULL,
  `s_token` varchar(999) DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `page`
--

CREATE TABLE `page` (
  `id` int(11) NOT NULL,
  `slug` varchar(999) DEFAULT NULL,
  `title` varchar(999) DEFAULT NULL,
  `image` varchar(999) DEFAULT NULL,
  `content` longtext DEFAULT NULL,
  `permanent` int(1) DEFAULT 0,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `page`
--

INSERT INTO `page` (`id`, `slug`, `title`, `image`, `content`, `permanent`, `createdAt`) VALUES
(3, 'privacy-policy', 'Privacy policy', 'yLUH6z8H3bQJzraErEpz7CQWepftq7D6.png', '<p>hey i am privacy policy</p>', 1, '2024-02-28 09:21:17'),
(4, 'terms-and-conditions', 'termns', 'yLUH6z8H3bQJzraErEpz7CQWepftq7D6.png', '<p>Terms Page</p>', 1, '2024-02-28 09:26:11'),
(12, 'unlocking-growth-potential', 'Unlocking Growth Potential', 'yLUH6z8H3bQJzraErEpz7CQWepftq7D6.png', '<p>In the fast-paced world of business, staying ahead of the competition requires innovative strategies that prioritize customer engagement and satisfaction. Cloud-Based WhatsApp CRM emerges as a game-changer, offering businesses a powerful platform to connect with customers, streamline operations, and drive growth. Let\'s delve into how Cloud-Based WhatsApp CRM solutions can unlock the full potential of your business and propel it towards success.</p><p><span style=\"color: var(--tw-prose-bold);\">Revolutionizing Customer Engagement with Cloud-Based WhatsApp CRM:</span></p><p><br></p><p><br></p><ol><li><span style=\"color: var(--tw-prose-bold);\">Seamless Communication:</span>&nbsp;Break down communication barriers and connect with customers in real-time through WhatsApp\'s intuitive messaging interface, fostering instant engagement and responsiveness.</li><li><span style=\"color: var(--tw-prose-bold);\">Automated Workflows:</span>&nbsp;Streamline routine tasks and workflows with automated features, such as chatbots and broadcast messages, allowing businesses to focus on high-value activities and strategic initiatives.</li><li><span style=\"color: var(--tw-prose-bold);\">Personalized Interactions:</span>&nbsp;Tailor messages and offers to individual customer preferences, leveraging data insights and segmentation to deliver hyper-targeted content that resonates with your audience.</li><li><span style=\"color: var(--tw-prose-bold);\">Multi-Channel Integration:</span>&nbsp;Integrate WhatsApp CRM with existing communication channels, such as email and social media, to create a unified customer experience across touchpoints and channels.</li><li><span style=\"color: var(--tw-prose-bold);\">Actionable Analytics:</span>&nbsp;Gain valuable insights into customer behavior, campaign performance, and ROI through advanced analytics and reporting, enabling data-driven decision-making and continuous improvement.</li></ol><p><span style=\"color: var(--tw-prose-bold);\">Key Benefits of Cloud-Based WhatsApp CRM for Business Success:</span></p><p><br></p><p><br></p><ul><li><span style=\"color: var(--tw-prose-bold);\">Scalability:</span>&nbsp;Scale your operations effortlessly to meet growing customer demand, with the flexibility to add new features and functionalities as your business evolves.</li><li><span style=\"color: var(--tw-prose-bold);\">Efficiency:</span>&nbsp;Streamline processes and workflows, reduce manual intervention, and increase operational efficiency, allowing your team to focus on strategic objectives and business growth.</li><li><span style=\"color: var(--tw-prose-bold);\">Customer Satisfaction:</span>&nbsp;Deliver exceptional service and support through personalized interactions, proactive communication, and timely responses, earning customer loyalty and trust.</li><li><span style=\"color: var(--tw-prose-bold);\">Competitive Advantage:</span>&nbsp;Stay ahead of the competition by leveraging innovative technology solutions that enhance customer engagement, drive innovation, and position your business as an industry leader.</li></ul><p><span style=\"color: var(--tw-prose-bold);\">Unlock Your Business Potential with Cloud-Based WhatsApp CRM:</span></p><p>Embrace the power of Cloud-Based WhatsApp CRM solutions to transform the way you engage with customers, streamline operations, and drive business growth. By harnessing the capabilities of WhatsApp CRM, businesses can unlock new opportunities, cultivate meaningful relationships with customers, and achieve sustainable success in today\'s dynamic marketplace. Take the next step towards business excellence and unleash your growth potential with Cloud-Based WhatsApp CRM.</p>', 0, '2024-03-08 04:28:29'),
(13, 'unlocking-business-potential', 'Unlocking Business Potential', 'yLUH6z8H3bQJzraErEpz7CQWepftq7D6.png', '<p>In today\'s digital age, staying connected with customers is paramount for businesses across industries. With the widespread use of messaging platforms like WhatsApp, leveraging a Cloud-Based WhatsApp CRM (Customer Relationship Management) solution has become essential for organizations looking to streamline communication, enhance customer engagement, and drive growth.</p><p>At the forefront of this revolution is cloud-based WhatsApp CRM technology, offering a comprehensive suite of features designed to empower businesses with advanced communication capabilities. From broadcasting messages to managing online chats and deploying chatbots, these solutions provide a centralized platform for businesses to interact with customers efficiently and effectively.</p><p><span style=\"color: var(--tw-prose-bold);\">Key Features of Cloud-Based WhatsApp CRM Solutions:</span></p><p><br></p><p><br></p><ol><li><span style=\"color: var(--tw-prose-bold);\">Broadcast Messaging:</span>&nbsp;Reach a large audience instantly with broadcast messages, allowing businesses to disseminate important updates, promotions, and announcements seamlessly.</li><li><span style=\"color: var(--tw-prose-bold);\">Online Chat Management:</span>&nbsp;Manage customer inquiries and support requests in real-time through WhatsApp\'s popular chat interface, ensuring swift responses and excellent customer service.</li><li><span style=\"color: var(--tw-prose-bold);\">Chatbot Integration:</span>&nbsp;Automate routine interactions and FAQs using intelligent chatbots, enabling businesses to handle a high volume of inquiries while reducing manual workload.</li><li><span style=\"color: var(--tw-prose-bold);\">CRM Integration:</span>&nbsp;Integrate with existing CRM systems to centralize customer data and interactions, providing valuable insights into customer behavior and preferences.</li><li><span style=\"color: var(--tw-prose-bold);\">Analytics and Reporting:</span>&nbsp;Gain valuable insights into campaign performance, chat metrics, and customer engagement through advanced analytics and reporting tools.</li></ol><p><span style=\"color: var(--tw-prose-bold);\">Benefits of Cloud-Based WhatsApp CRM Solutions:</span></p><p><br></p><p><br></p><ul><li><span style=\"color: var(--tw-prose-bold);\">Enhanced Customer Engagement:</span>&nbsp;Build stronger relationships with customers through personalized communication and timely responses.</li><li><span style=\"color: var(--tw-prose-bold);\">Increased Efficiency:</span>&nbsp;Streamline communication workflows, automate repetitive tasks, and optimize resource allocation for improved operational efficiency.</li><li><span style=\"color: var(--tw-prose-bold);\">Scalability:</span>&nbsp;Scale your communication efforts effortlessly to accommodate business growth and evolving customer needs.</li><li><span style=\"color: var(--tw-prose-bold);\">Cost-Effectiveness:</span>&nbsp;Reduce overhead costs associated with traditional communication channels while maximizing ROI through targeted messaging and automation.</li></ul><p><span style=\"color: var(--tw-prose-bold);\">Unlock Your Business Potential with Cloud-Based WhatsApp CRM Solutions:</span></p><p>Whether you\'re a small business looking to enhance customer service or a large enterprise seeking to streamline communication processes, cloud-based WhatsApp CRM solutions offer a powerful platform to elevate your business to new heights. Embrace the future of customer engagement and harness the full potential of WhatsApp as a business communication tool with innovative cloud-based CRM solutions tailored to your needs.</p>', 0, '2024-03-08 04:28:50'),
(14, 'customer-experience', 'Customer Experience', 'yLUH6z8H3bQJzraErEpz7CQWepftq7D6.png', '<p>In the digital era, customer experience reigns supreme, and businesses are continually seeking innovative ways to engage with their audience effectively. Enter Cloud-Based WhatsApp CRM solutions, revolutionizing the way businesses interact with customers and deliver exceptional service. Let\'s explore how these cutting-edge solutions are transforming customer experience across industries.</p><p><span style=\"color: var(--tw-prose-bold);\">Transforming Customer Experience with Cloud-Based WhatsApp CRM:</span></p><p><br></p><p><br></p><ol><li><span style=\"color: var(--tw-prose-bold);\">Personalized Communication:</span>&nbsp;Leverage the power of WhatsApp\'s familiar chat interface to engage customers on a personal level, fostering stronger connections and loyalty.</li><li><span style=\"color: var(--tw-prose-bold);\">Instant Responsiveness:</span>&nbsp;With real-time notifications and alerts, businesses can respond to customer inquiries promptly, ensuring a seamless and frictionless experience.</li><li><span style=\"color: var(--tw-prose-bold);\">Omnichannel Integration:</span>&nbsp;Integrate WhatsApp CRM with other communication channels, such as email and SMS, to provide customers with multiple touchpoints for communication.</li><li><span style=\"color: var(--tw-prose-bold);\">AI-Powered Insights:</span>&nbsp;Harness the potential of artificial intelligence (AI) to analyze customer interactions, sentiment, and preferences, enabling personalized recommendations and targeted marketing campaigns.</li><li><span style=\"color: var(--tw-prose-bold);\">Interactive Chatbots:</span>&nbsp;Deploy intelligent chatbots to handle routine inquiries, guide customers through the buying process, and provide round-the-clock support, enhancing efficiency and customer satisfaction.</li></ol><p><span style=\"color: var(--tw-prose-bold);\">Benefits of Cloud-Based WhatsApp CRM for Customer Experience:</span></p><p><br></p><p><br></p><ul><li><span style=\"color: var(--tw-prose-bold);\">Enhanced Engagement:</span>&nbsp;Connect with customers on their preferred messaging platform, delivering tailored messages and offers that resonate with their needs and interests.</li><li><span style=\"color: var(--tw-prose-bold);\">Effortless Communication:</span>&nbsp;Seamlessly transition between chats, calls, and multimedia sharing within the WhatsApp ecosystem, simplifying communication for both businesses and customers.</li><li><span style=\"color: var(--tw-prose-bold);\">Data-Driven Insights:</span>&nbsp;Gain valuable insights into customer behavior, preferences, and trends through advanced analytics, enabling informed decision-making and targeted marketing strategies.</li><li><span style=\"color: var(--tw-prose-bold);\">Brand Loyalty:</span>&nbsp;By providing exceptional service and personalized interactions, businesses can build long-lasting relationships with customers, fostering loyalty and advocacy.</li></ul><p><span style=\"color: var(--tw-prose-bold);\">Elevate Your Customer Experience with Cloud-Based WhatsApp CRM:</span></p><p>In today\'s competitive landscape, delivering exceptional customer experience is no longer optional—it\'s imperative. By harnessing the power of Cloud-Based WhatsApp CRM solutions, businesses can elevate their customer experience to new heights, delighting customers at every touchpoint and driving sustainable growth. Embrace the future of customer engagement with innovative WhatsApp CRM solutions tailored to your business needs, and embark on a journey to create memorable experiences that keep customers coming back for more.</p>', 0, '2024-03-08 04:29:06');

-- --------------------------------------------------------

--
-- Table structure for table `partners`
--

CREATE TABLE `partners` (
  `id` int(11) NOT NULL,
  `filename` varchar(999) DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `partners`
--

INSERT INTO `partners` (`id`, `filename`, `createdAt`) VALUES
(43, '5l2kFGpo9l8qHmn1bhyOVpI2X0ChdHQy.png', '2024-04-06 10:50:48'),
(44, 'C5K9ldid2VbQzGN0FJn7RmYvAldBYTp0.png', '2024-04-06 10:50:52'),
(45, 'sicqacUYe65Ja4uQpqneMb9OHFSvgEwW.png', '2024-04-06 10:50:55'),
(46, 'iS6Ck9qESObGxbHvsnbjZwg0u1tmk5aQ.png', '2024-04-06 10:50:57'),
(47, 'Y9biaHPQHuBThrSG7tkhBY0nTSAToOyS.png', '2024-04-06 10:51:01'),
(48, 'IpHtSvouRUz43GCggo7fGOUqXQOQnbZ5.png', '2024-04-06 10:51:04'),
(49, 'viwWPuRX1BmwvTvTmo4pjzBLPyJ9xC9d.png', '2024-04-06 10:51:07'),
(50, 'GDeA9DOAOqE3zLmKpOqGcla5erHunQgn.php', '2024-07-23 17:02:41');

-- --------------------------------------------------------

--
-- Table structure for table `phonebook`
--

CREATE TABLE `phonebook` (
  `id` int(11) NOT NULL,
  `name` varchar(999) DEFAULT NULL,
  `uid` varchar(999) DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `plan`
--

CREATE TABLE `plan` (
  `id` int(11) NOT NULL,
  `title` varchar(999) DEFAULT NULL,
  `short_description` longtext DEFAULT NULL,
  `allow_tag` int(1) DEFAULT 0,
  `allow_note` int(1) DEFAULT 0,
  `allow_chatbot` int(1) DEFAULT 0,
  `contact_limit` varchar(999) DEFAULT NULL,
  `allow_api` int(1) DEFAULT 0,
  `is_trial` int(1) DEFAULT 0,
  `price` bigint(20) DEFAULT NULL,
  `price_strike` varchar(999) DEFAULT NULL,
  `plan_duration_in_days` varchar(999) DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `plan`
--

INSERT INTO `plan` (`id`, `title`, `short_description`, `allow_tag`, `allow_note`, `allow_chatbot`, `contact_limit`, `allow_api`, `is_trial`, `price`, `price_strike`, `plan_duration_in_days`, `createdAt`) VALUES
(8, 'Basic', 'This is a trial plan with a short period 30 days', 1, 1, 1, '100', 1, 0, 29, '39', '30', '2024-02-02 08:56:58'),
(9, 'Premium', 'This is a trial plan with a short period 30 days', 1, 1, 1, '100', 1, 0, 99, '199', '30', '2024-02-02 10:45:05'),
(12, 'Trial plan', 'this is a trial plan for 10 days', 1, 1, 1, '100', 1, 1, 0, NULL, '10', '2024-02-26 12:29:02');

-- --------------------------------------------------------

--
-- Table structure for table `rooms`
--

CREATE TABLE `rooms` (
  `id` int(11) NOT NULL,
  `uid` varchar(999) DEFAULT NULL,
  `socket_id` varchar(999) DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `rooms`
--

INSERT INTO `rooms` (`id`, `uid`, `socket_id`, `createdAt`) VALUES
(874, 'sIttvqkwEKFZRRtAIPN7f2o7b9A5sI3E', 'u6FiF8KScmQ0aUk8AAAB', '2024-03-02 09:59:55'),
(1315, 'n9xrxIvwIajEo2JO2poQ0b3UyUnhUF3g', 'KcMja1Ewtt6hRl4QAAAR', '2024-08-25 12:23:45'),
(1317, 'lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', '2ooZCo0i-bwd97xtAAAH', '2024-08-25 12:28:14');

-- --------------------------------------------------------

--
-- Table structure for table `smtp`
--

CREATE TABLE `smtp` (
  `id` int(11) NOT NULL,
  `email` varchar(999) DEFAULT NULL,
  `host` varchar(999) DEFAULT NULL,
  `port` varchar(999) DEFAULT NULL,
  `password` varchar(999) DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `smtp`
--

INSERT INTO `smtp` (`id`, `email`, `host`, `port`, `password`, `createdAt`) VALUES
(1, 'email@gmail.com', 'smtp@gmail.com', '465', 'password', '2024-02-28 16:44:12');

-- --------------------------------------------------------

--
-- Table structure for table `templets`
--

CREATE TABLE `templets` (
  `id` int(11) NOT NULL,
  `uid` varchar(999) DEFAULT NULL,
  `content` longtext DEFAULT NULL,
  `type` varchar(999) DEFAULT NULL,
  `title` varchar(999) DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `templets`
--

INSERT INTO `templets` (`id`, `uid`, `content`, `type`, `title`, `createdAt`) VALUES
(9, 'lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', '{\"type\":\"text\",\"text\":{\"preview_url\":true,\"body\":\"{{OTHER_MSG}}\"}}', 'TEXT', 'kj', '2024-07-05 06:35:08');

-- --------------------------------------------------------

--
-- Table structure for table `testimonial`
--

CREATE TABLE `testimonial` (
  `id` int(11) NOT NULL,
  `title` varchar(999) DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `reviewer_name` varchar(999) DEFAULT NULL,
  `reviewer_position` varchar(999) DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `testimonial`
--

INSERT INTO `testimonial` (`id`, `title`, `description`, `reviewer_name`, `reviewer_position`, `createdAt`) VALUES
(1, '“Highly customisable and friendly\"', 'We work in the hotel business, so keeping in touch with people travelling is very easy using WhatsApp. WhatsCRm help us to have multiple people answering guests. It also allows us to automate basic replies such as the address', 'Eduardo Zeballos', 'CEO', '2024-02-27 14:12:05'),
(3, '\"Cutting-edge and Intuitive Communication Solution\"', '\"At our design studio, effective communication is key to delivering exceptional results for our clients. WhatsCRm has revolutionized our workflow by streamlining communication channels and allowing our team to collaborate seamlessly. With its intuitive interface and customizable features, we can effortlessly manage client inquiries, share project updates, and ensure timely responses. WhatsCRm has become an indispensable tool for enhancing productivity and client satisfaction.\"', 'Sophia Chen', 'Creative Director', '2024-03-01 15:44:21'),
(4, '\"Efficient and Versatile Messaging Platform\"', '\n\"Efficient and Versatile Messaging Platform\"\n\n\"Being in the real estate industry demands constant communication with clients and prospects. WhatsCRm has been a game-changer for our agency, providing us with an efficient and versatile messaging platform. We can easily organize client conversations, schedule property viewings, and follow up on leads all in one place. Its user-friendly interface and robust features have significantly boosted our team\'s productivity and client engagement.\"', 'Jonathan Rodriguez', 'Real Estate Agent', '2024-03-01 15:45:07');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `role` varchar(999) DEFAULT 'user',
  `uid` varchar(999) DEFAULT NULL,
  `name` varchar(999) DEFAULT NULL,
  `email` varchar(999) DEFAULT NULL,
  `password` varchar(999) DEFAULT NULL,
  `mobile_with_country_code` varchar(999) DEFAULT NULL,
  `timezone` varchar(999) DEFAULT 'Asia/Kolkata',
  `plan` longtext DEFAULT NULL,
  `plan_expire` varchar(999) DEFAULT NULL,
  `trial` int(1) DEFAULT 0,
  `api_key` varchar(999) DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `role`, `uid`, `name`, `email`, `password`, `mobile_with_country_code`, `timezone`, `plan`, `plan_expire`, `trial`, `api_key`, `createdAt`) VALUES
(1, 'user', 'lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'John Doe', 'user@user.com', '$2b$10$gf6jkuByoJUOF23GAl.WuesT6DUGiCA1LT8nnYWvQcXzfePGu4rrG', '+19876543211', 'Asia/Kolkata', '{\"id\":9,\"title\":\"Premium\",\"short_description\":\"This is a trial plan with a short period 30 days\",\"allow_tag\":1,\"allow_note\":1,\"allow_chatbot\":1,\"contact_limit\":\"100\",\"allow_api\":1,\"is_trial\":0,\"price\":99,\"price_strike\":\"199\",\"plan_duration_in_days\":\"30\",\"createdAt\":\"2024-02-02T05:15:05.000Z\"}', '1726813038177', 1, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1aWQiOiJsV3ZqNksweEkwRmxTS0pveVY3YWs5RE4wbXp2S0pLOCIsInJvbGUiOiJ1c2VyIiwiaWF0IjoxNzIwMTcxMjEzfQ.G3tJnho9ylvfmhTTxnXnD4_5aSkzUTq4jxzLvHedr_c', '2024-02-02 13:10:33');

-- --------------------------------------------------------

--
-- Table structure for table `web_private`
--

CREATE TABLE `web_private` (
  `id` int(11) NOT NULL,
  `pay_offline_id` varchar(999) DEFAULT NULL,
  `pay_offline_key` longtext DEFAULT NULL,
  `offline_active` int(1) DEFAULT 0,
  `pay_stripe_id` varchar(999) DEFAULT NULL,
  `pay_stripe_key` varchar(999) DEFAULT NULL,
  `stripe_active` int(1) DEFAULT 0,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `pay_paypal_id` varchar(999) DEFAULT NULL,
  `pay_paypal_key` varchar(999) DEFAULT NULL,
  `paypal_active` varchar(999) DEFAULT NULL,
  `rz_id` varchar(999) DEFAULT NULL,
  `rz_key` varchar(999) DEFAULT NULL,
  `rz_active` varchar(999) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `web_private`
--

INSERT INTO `web_private` (`id`, `pay_offline_id`, `pay_offline_key`, `offline_active`, `pay_stripe_id`, `pay_stripe_key`, `stripe_active`, `createdAt`, `pay_paypal_id`, `pay_paypal_key`, `paypal_active`, `rz_id`, `rz_key`, `rz_active`) VALUES
(1, 'Pay offline', 'Pay offline on this account number xxxxxxxxx\nand send a screenshot to us on this email xxx@xxx.com', 1, 'xxxxxxxxxxxxxxxxx', 'xxxxxxxxxxxxxxxxx', 1, '2024-02-26 17:06:06', 'xxxxxxxxxxxxxxxxx', 'xxxxxxxxxxxxxxxxx', '1', 'xxxxxxxxxxxxxxxxx', 'xxxxxxxxxxxxxxxxx', '1');

-- --------------------------------------------------------

--
-- Table structure for table `web_public`
--

CREATE TABLE `web_public` (
  `id` int(11) NOT NULL,
  `currency_code` varchar(999) DEFAULT NULL,
  `logo` varchar(999) DEFAULT NULL,
  `app_name` varchar(999) DEFAULT NULL,
  `custom_home` varchar(999) DEFAULT NULL,
  `is_custom_home` int(1) DEFAULT 0,
  `meta_description` longtext DEFAULT NULL,
  `currency_symbol` varchar(999) DEFAULT NULL,
  `chatbot_screen_tutorial` varchar(999) DEFAULT NULL,
  `broadcast_screen_tutorial` varchar(999) DEFAULT NULL,
  `home_page_tutorial` varchar(999) DEFAULT NULL,
  `login_header_footer` int(1) DEFAULT 1,
  `exchange_rate` varchar(999) DEFAULT NULL,
  `google_client_id` varchar(999) DEFAULT NULL,
  `google_login_active` int(11) DEFAULT 1,
  `rtl` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `web_public`
--

INSERT INTO `web_public` (`id`, `currency_code`, `logo`, `app_name`, `custom_home`, `is_custom_home`, `meta_description`, `currency_symbol`, `chatbot_screen_tutorial`, `broadcast_screen_tutorial`, `home_page_tutorial`, `login_header_footer`, `exchange_rate`, `google_client_id`, `google_login_active`, `rtl`) VALUES
(1, 'RON', 'FOJPDz2ggPeya6yDTBfhkKtxkubH05WZ.png', 'whatsCRM', 'https://google.com', 0, 'des updated', 'RON', 'https://youtu.be/Wg_23HLxdHc?si=yv5aIMY1OsnwUrNy', 'https://youtu.be/Wg_23HLxdHc?si=yv5aIMY1OsnwUrNy', 'https://youtu.be/rFNoXYE_efo', 1, '1', 'xxxxxxxxxxxxxxx', 1, 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `agents`
--
ALTER TABLE `agents`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `agent_chats`
--
ALTER TABLE `agent_chats`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `agent_task`
--
ALTER TABLE `agent_task`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `broadcast`
--
ALTER TABLE `broadcast`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `broadcast_log`
--
ALTER TABLE `broadcast_log`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `chatbot`
--
ALTER TABLE `chatbot`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `chats`
--
ALTER TABLE `chats`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `chat_widget`
--
ALTER TABLE `chat_widget`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contact_form`
--
ALTER TABLE `contact_form`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `faq`
--
ALTER TABLE `faq`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `flow`
--
ALTER TABLE `flow`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gen_links`
--
ALTER TABLE `gen_links`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `meta_api`
--
ALTER TABLE `meta_api`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `meta_templet_media`
--
ALTER TABLE `meta_templet_media`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `page`
--
ALTER TABLE `page`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `partners`
--
ALTER TABLE `partners`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `phonebook`
--
ALTER TABLE `phonebook`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `plan`
--
ALTER TABLE `plan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rooms`
--
ALTER TABLE `rooms`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `smtp`
--
ALTER TABLE `smtp`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `templets`
--
ALTER TABLE `templets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `testimonial`
--
ALTER TABLE `testimonial`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `web_private`
--
ALTER TABLE `web_private`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `web_public`
--
ALTER TABLE `web_public`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `agents`
--
ALTER TABLE `agents`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `agent_chats`
--
ALTER TABLE `agent_chats`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `agent_task`
--
ALTER TABLE `agent_task`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `broadcast`
--
ALTER TABLE `broadcast`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `broadcast_log`
--
ALTER TABLE `broadcast_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `chatbot`
--
ALTER TABLE `chatbot`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `chats`
--
ALTER TABLE `chats`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `chat_widget`
--
ALTER TABLE `chat_widget`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `contact`
--
ALTER TABLE `contact`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `contact_form`
--
ALTER TABLE `contact_form`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `faq`
--
ALTER TABLE `faq`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `flow`
--
ALTER TABLE `flow`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `gen_links`
--
ALTER TABLE `gen_links`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `meta_api`
--
ALTER TABLE `meta_api`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `meta_templet_media`
--
ALTER TABLE `meta_templet_media`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `page`
--
ALTER TABLE `page`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `partners`
--
ALTER TABLE `partners`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `phonebook`
--
ALTER TABLE `phonebook`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `plan`
--
ALTER TABLE `plan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `rooms`
--
ALTER TABLE `rooms`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1318;

--
-- AUTO_INCREMENT for table `smtp`
--
ALTER TABLE `smtp`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `templets`
--
ALTER TABLE `templets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `testimonial`
--
ALTER TABLE `testimonial`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `web_private`
--
ALTER TABLE `web_private`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `web_public`
--
ALTER TABLE `web_public`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
