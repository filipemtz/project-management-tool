-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Tempo de geração: 24/01/2019 às 03:43
-- Versão do servidor: 5.7.24-0ubuntu0.16.04.1
-- Versão do PHP: 7.0.32-0ubuntu0.16.04.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `todolist_db`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `task`
--

CREATE TABLE `task` (
  `id` bigint(20) NOT NULL,
  `name` varchar(256) COLLATE latin1_general_ci NOT NULL,
  `parent` bigint(20) UNSIGNED DEFAULT NULL,
  `deadline` date NOT NULL,
  `observations` text COLLATE latin1_general_ci,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Fazendo dump de dados para tabela `task`
--

INSERT INTO `task` (`id`, `name`, `parent`, `deadline`, `observations`, `user_id`) VALUES
(1, 'tarefa 1', 0, '2019-01-01', 'observacao da tarefa 1.', 12),
(2, 'tarefa 2', 0, '2019-01-31', 'observacao da tarefa 2.', 12),
(4, 'tarefa 3', 0, '2019-01-22', 'observacao da tarefa 3.', 12),
(5, 'tarefa 4', 0, '2019-01-26', 'observacao da tarefa 4.', 12),
(10, 'tarefa 1.1.1', 9, '2019-01-03', 'observacao da tarefa 1.1.1', 12),
(11, 'tarefa 1.1.2', 9, '2019-12-31', 'obs da tarefa 1.1.2', 12),
(12, 'tarefa 1.1.3', 9, '2019-12-30', 'bla', 12),
(13, 'tarefa 1.1.4', 9, '2019-12-31', 'bla2', 12),
(14, 'tarefa 2.1', 2, '2019-12-31', 'obs 2', 12),
(15, 'tarefa 2.2', 2, '2019-12-31', 'obs 2', 12),
(16, 'tarefa 1.1.5', 9, '2019-12-31', 'obs 3', 12),
(17, 'bla task 1', 0, '2019-12-31', '', 11),
(18, 'bla task 2', 0, '2019-12-31', '', 11);

-- --------------------------------------------------------

--
-- Estrutura para tabela `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(64) COLLATE latin1_general_ci NOT NULL,
  `email` varchar(64) COLLATE latin1_general_ci NOT NULL,
  `password` varchar(40) COLLATE latin1_general_ci NOT NULL,
  `date_creation` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Fazendo dump de dados para tabela `user`
--

INSERT INTO `user` (`id`, `username`, `email`, `password`, `date_creation`) VALUES
(11, 'bla', 'bla@bla.com', '128ecf542a35ac5270a87dc740918404', '2019-01-24 03:16:33'),
(12, 'filipe', 'filipemtz@gmail.com', '59dc2c3921372dd78bc538c65a4b8b70', '2019-01-24 03:33:51');

--
-- Índices de tabelas apagadas
--

--
-- Índices de tabela `task`
--
ALTER TABLE `task`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT de tabelas apagadas
--

--
-- AUTO_INCREMENT de tabela `task`
--
ALTER TABLE `task`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT de tabela `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
