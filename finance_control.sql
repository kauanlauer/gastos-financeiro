-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 03/09/2024 às 22:22
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `finance_control`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `cofre`
--

CREATE TABLE `cofre` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `bank` varchar(255) NOT NULL,
  `date` date NOT NULL,
  `action` enum('deposit','withdraw') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `depositos`
--

CREATE TABLE `depositos` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `bank` varchar(255) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `depositos`
--

INSERT INTO `depositos` (`id`, `user_id`, `amount`, `bank`, `date`) VALUES
(0, 4, 1000.00, 'Pick Pay', '2024-08-26');

-- --------------------------------------------------------

--
-- Estrutura para tabela `followers`
--

CREATE TABLE `followers` (
  `id` int(11) NOT NULL,
  `follower_id` int(11) NOT NULL,
  `followed_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `followers`
--

INSERT INTO `followers` (`id`, `follower_id`, `followed_id`) VALUES
(8, 1, 3),
(9, 1, 2),
(10, 1, 4),
(11, 2, 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `groups`
--

CREATE TABLE `groups` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `owner_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `group_picture` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `groups`
--

INSERT INTO `groups` (`id`, `name`, `owner_id`, `created_at`, `group_picture`) VALUES
(4, 'Sapecária', 3, '2024-08-30 18:00:16', 'uploads/grupo.jpeg'),
(5, 'Grupo para testes', 1, '2024-09-02 10:42:09', 'uploads/grupo.jpg'),
(6, 'Comidas Caseiras', 4, '2024-09-02 14:26:12', 'uploads/grupo.jpg');

-- --------------------------------------------------------

--
-- Estrutura para tabela `group_expenses`
--

CREATE TABLE `group_expenses` (
  `id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `description` varchar(255) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `date` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `group_expenses`
--

INSERT INTO `group_expenses` (`id`, `group_id`, `user_id`, `description`, `amount`, `date`) VALUES
(5, 4, 1, 'Pao', 10.00, '2024-08-30 16:56:05');

-- --------------------------------------------------------

--
-- Estrutura para tabela `group_members`
--

CREATE TABLE `group_members` (
  `id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `group_members`
--

INSERT INTO `group_members` (`id`, `group_id`, `user_id`) VALUES
(9, 4, 1),
(10, 4, 3),
(12, 5, 2),
(13, 6, 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `group_messages`
--

CREATE TABLE `group_messages` (
  `id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `message` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `group_messages`
--

INSERT INTO `group_messages` (`id`, `group_id`, `user_id`, `message`, `created_at`) VALUES
(6, 4, 3, 'Eae, vai pagar aquele churas hj ou não?', '2024-08-30 18:00:46'),
(7, 4, 1, 'boraaa', '2024-08-30 18:01:09'),
(22, 4, 1, 'Rfhjg', '2024-08-30 19:55:28'),
(30, 5, 1, 'teste', '2024-09-02 11:35:35'),
(31, 5, 1, 'Kauan Lauer', '2024-09-02 11:36:17'),
(32, 5, 1, 'teste', '2024-09-02 11:38:51'),
(33, 5, 1, 'teste', '2024-09-02 11:41:52'),
(34, 5, 1, 'chat', '2024-09-02 11:41:59'),
(35, 5, 2, 'teste de outra conta', '2024-09-02 11:42:30'),
(36, 5, 1, 'churras', '2024-09-02 11:47:07'),
(37, 5, 1, 'teste', '2024-09-02 11:50:15'),
(38, 5, 1, 'teste', '2024-09-02 11:50:15'),
(39, 4, 1, 'novo teste', '2024-09-02 11:52:15'),
(40, 4, 1, 'teste', '2024-09-02 13:58:51'),
(41, 4, 1, 'funcioando', '2024-09-02 13:58:54'),
(42, 6, 4, 'olá', '2024-09-02 14:27:22'),
(43, 6, 4, 'Bom dia', '2024-09-02 14:27:29'),
(44, 6, 1, 'Teste', '2024-09-02 14:27:30'),
(45, 6, 4, 'de boa:???', '2024-09-02 14:27:32'),
(46, 6, 1, ':?', '2024-09-02 14:27:41'),
(47, 5, 1, 'oi', '2024-09-02 18:19:15'),
(48, 5, 1, 'teste', '2024-09-02 18:20:09'),
(49, 5, 2, 'Oi', '2024-09-02 19:15:20'),
(50, 5, 2, 'Oi', '2024-09-02 19:15:20'),
(51, 5, 1, 'olá', '2024-09-02 19:15:31'),
(52, 5, 1, 'olá', '2024-09-02 19:15:31'),
(53, 5, 1, 'Mandando mensagem de teste', '2024-09-02 19:16:01'),
(54, 5, 1, 'Mandando mensagem de teste', '2024-09-02 19:16:01'),
(55, 5, 1, 'teste', '2024-09-02 19:17:05'),
(56, 5, 1, 'teste', '2024-09-02 19:17:05'),
(57, 5, 1, 'está duplicando ainda', '2024-09-02 19:17:12'),
(58, 5, 1, 'está duplicando ainda', '2024-09-02 19:17:12'),
(59, 5, 1, 'teste', '2024-09-02 19:20:51'),
(60, 5, 1, 'teste', '2024-09-02 19:20:51'),
(61, 5, 2, 'Oi', '2024-09-02 19:21:04'),
(62, 5, 2, 'Oi', '2024-09-02 19:21:04'),
(63, 5, 1, 'Foi?', '2024-09-02 19:23:43'),
(64, 5, 1, 'Foi?', '2024-09-02 19:23:43'),
(65, 5, 1, 'teste', '2024-09-02 19:23:46'),
(66, 5, 1, 'teste', '2024-09-02 19:23:46'),
(67, 5, 2, 'Te', '2024-09-02 19:23:55'),
(68, 5, 2, 'Te', '2024-09-02 19:23:55'),
(69, 5, 2, 'Te', '2024-09-02 19:23:56'),
(70, 5, 2, 'Te', '2024-09-02 19:23:56'),
(71, 5, 1, 'a', '2024-09-02 19:24:20'),
(72, 5, 1, 'a', '2024-09-02 19:24:20'),
(73, 5, 1, 'teste', '2024-09-02 19:25:00'),
(74, 5, 1, 'teste', '2024-09-02 19:26:31'),
(75, 5, 1, 'tesss', '2024-09-02 19:26:46'),
(76, 5, 1, 'aaa', '2024-09-02 19:27:43'),
(77, 5, 1, 'oi', '2024-09-02 19:27:52'),
(78, 5, 1, 'teste', '2024-09-03 12:54:38'),
(79, 5, 1, 'teste', '2024-09-03 12:55:57'),
(80, 5, 1, 'Oi', '2024-09-03 12:56:15'),
(81, 5, 1, 'teste', '2024-09-03 13:09:26'),
(82, 5, 1, 'teste', '2024-09-03 13:09:31'),
(83, 5, 1, 'a', '2024-09-03 13:09:38'),
(84, 5, 1, 'a', '2024-09-03 13:09:46'),
(85, 5, 1, 'a', '2024-09-03 13:09:51'),
(86, 5, 1, 'teste', '2024-09-03 13:09:54'),
(87, 5, 1, 'a', '2024-09-03 13:09:57'),
(88, 5, 1, 'oi', '2024-09-03 13:12:43'),
(89, 5, 1, 'Olaa', '2024-09-03 13:13:15'),
(90, 5, 1, 'pppppppp', '2024-09-03 13:13:24'),
(91, 5, 1, 'A', '2024-09-03 13:13:29'),
(92, 5, 1, 'a', '2024-09-03 13:30:13'),
(93, 5, 1, 'Teste', '2024-09-03 13:31:32'),
(94, 5, 1, 'aaaa', '2024-09-03 13:33:57'),
(95, 5, 1, 'ppooopiop', '2024-09-03 13:34:09'),
(96, 5, 1, 'oooo', '2024-09-03 13:34:26'),
(97, 5, 1, 'klkkkkkkk', '2024-09-03 13:34:32'),
(98, 5, 1, 'a', '2024-09-03 13:40:24'),
(99, 5, 1, 'a', '2024-09-03 13:40:27'),
(100, 5, 1, 'kkkkkkkkkkk', '2024-09-03 13:40:31'),
(101, 5, 1, 'Aaaabrbieiebbdex', '2024-09-03 13:40:44'),
(102, 5, 1, 'a', '2024-09-03 13:58:02'),
(103, 5, 1, 'teste', '2024-09-03 16:35:45');

-- --------------------------------------------------------

--
-- Estrutura para tabela `predefined_categories`
--

CREATE TABLE `predefined_categories` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `description` varchar(255) NOT NULL,
  `type` enum('receita','despesa') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `predefined_categories`
--

INSERT INTO `predefined_categories` (`id`, `user_id`, `description`, `type`) VALUES
(1, 1, 'Salário', 'receita'),
(2, 1, 'Aluguel', 'despesa'),
(3, 1, 'Água', 'despesa');

-- --------------------------------------------------------

--
-- Estrutura para tabela `retiradas`
--

CREATE TABLE `retiradas` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `bank` varchar(255) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `retiradas`
--

INSERT INTO `retiradas` (`id`, `user_id`, `amount`, `bank`, `date`) VALUES
(0, 1, 150.00, 'Itaú', '2024-09-02');

-- --------------------------------------------------------

--
-- Estrutura para tabela `transactions`
--

CREATE TABLE `transactions` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `description` varchar(255) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `type` enum('despesa','receita') NOT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `transactions`
--

INSERT INTO `transactions` (`id`, `user_id`, `description`, `amount`, `type`, `date`) VALUES
(1, 1, 'Aluguel', 350.00, 'despesa', '2024-09-06 00:00:00'),
(2, 1, 'Moto', 290.00, 'despesa', '2024-09-06 00:00:00'),
(3, 1, 'Internet', 115.00, 'despesa', '2024-09-06 00:00:00'),
(4, 1, 'Luz', 25.00, 'despesa', '2024-09-06 00:00:00'),
(5, 1, 'Salario', 700.00, 'receita', '2024-09-06 00:00:00'),
(6, 1, 'Água', 200.00, 'despesa', '2024-08-20 00:00:00');

-- --------------------------------------------------------

--
-- Estrutura para tabela `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `profile_picture` varchar(255) DEFAULT NULL,
  `biography` text DEFAULT NULL,
  `gender` enum('Masculino','Feminino') DEFAULT NULL,
  `birth_date` date DEFAULT NULL,
  `birthdate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `profile_picture`, `biography`, `gender`, `birth_date`, `birthdate`) VALUES
(1, 'Kauan Lauer', 'erickkauanlauer@gmail.com', '$2y$10$m/Kaw3PM9LvmJBCnY0.cjeycF/M/So0B5SSTnXcGctWgzhY6xO552', 'uploads/eu.jpg', 'Criador do Site de controle de gastos', 'Masculino', NULL, '1998-08-24'),
(2, 'Erick Kauan', 'kauan@gmail.com', '$2y$10$63Pa0yxtjv.XhFesUS8ztuX5VLvGmukZF9xIr9Bdn7XtlXmINa0v6', 'uploads/user.png', 'Usuario de teste tmb', 'Masculino', NULL, '1998-05-01'),
(3, 'Joao Pedro', 'joao@gmail.com', '$2y$10$PF73dumfRFzSUepq3Bjpmu5ctRkG.pKHUDCi1jFUBM8x9vuaFKAz2', 'uploads/user.png', 'Usuario teste', 'Masculino', NULL, '1998-08-24'),
(4, 'Thiago Viana', 'thiago@gmail.com', '$2y$10$xMaYz4sTN3mr4OQ2pxluLOQ2W.a04L6.hCqI4rpAPC3WryQJrX8tW', 'uploads/user.png', 'usuario teste', 'Masculino', NULL, NULL);

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `followers`
--
ALTER TABLE `followers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `follower_id` (`follower_id`),
  ADD KEY `followed_id` (`followed_id`);

--
-- Índices de tabela `groups`
--
ALTER TABLE `groups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `owner_id` (`owner_id`);

--
-- Índices de tabela `group_expenses`
--
ALTER TABLE `group_expenses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `group_id` (`group_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Índices de tabela `group_members`
--
ALTER TABLE `group_members`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `group_id` (`group_id`,`user_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Índices de tabela `group_messages`
--
ALTER TABLE `group_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `group_id` (`group_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Índices de tabela `predefined_categories`
--
ALTER TABLE `predefined_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Índices de tabela `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `followers`
--
ALTER TABLE `followers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de tabela `groups`
--
ALTER TABLE `groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `group_expenses`
--
ALTER TABLE `group_expenses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `group_members`
--
ALTER TABLE `group_members`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de tabela `group_messages`
--
ALTER TABLE `group_messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=104;

--
-- AUTO_INCREMENT de tabela `predefined_categories`
--
ALTER TABLE `predefined_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `followers`
--
ALTER TABLE `followers`
  ADD CONSTRAINT `followers_ibfk_1` FOREIGN KEY (`follower_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `followers_ibfk_2` FOREIGN KEY (`followed_id`) REFERENCES `users` (`id`);

--
-- Restrições para tabelas `groups`
--
ALTER TABLE `groups`
  ADD CONSTRAINT `groups_ibfk_1` FOREIGN KEY (`owner_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `group_expenses`
--
ALTER TABLE `group_expenses`
  ADD CONSTRAINT `group_expenses_ibfk_1` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `group_expenses_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `group_members`
--
ALTER TABLE `group_members`
  ADD CONSTRAINT `group_members_ibfk_1` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `group_members_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `group_messages`
--
ALTER TABLE `group_messages`
  ADD CONSTRAINT `group_messages_ibfk_1` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `group_messages_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `predefined_categories`
--
ALTER TABLE `predefined_categories`
  ADD CONSTRAINT `predefined_categories_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
