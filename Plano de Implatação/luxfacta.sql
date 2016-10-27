-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: 27-Out-2016 às 18:37
-- Versão do servidor: 5.7.15-0ubuntu0.16.04.1
-- PHP Version: 7.0.8-0ubuntu0.16.04.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `luxfacta`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `categorias`
--

CREATE TABLE `categorias` (
  `cod_categoria` int(11) NOT NULL,
  `nom_categoria` varchar(100) DEFAULT NULL,
  `dat_criacao` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `categorias`
--

INSERT INTO `categorias` (`cod_categoria`, `nom_categoria`, `dat_criacao`) VALUES
(1, 'Alimentos', '2016-10-26 19:13:36'),
(2, 'Decoração', '2016-10-26 19:13:36');

-- --------------------------------------------------------

--
-- Estrutura da tabela `fornecedores`
--

CREATE TABLE `fornecedores` (
  `cod_fornecedor` int(11) NOT NULL,
  `nom_fornecedor` varchar(100) DEFAULT NULL,
  `dat_criacao` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `fornecedores`
--

INSERT INTO `fornecedores` (`cod_fornecedor`, `nom_fornecedor`, `dat_criacao`) VALUES
(1, 'Tio jõao', '2016-10-26 19:13:57'),
(2, 'Estrela', '2016-10-26 19:13:57');

-- --------------------------------------------------------

--
-- Estrutura da tabela `marcas`
--

CREATE TABLE `marcas` (
  `cod_marca` int(11) NOT NULL,
  `nom_marca` varchar(100) DEFAULT NULL,
  `dat_criacao` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `marcas`
--

INSERT INTO `marcas` (`cod_marca`, `nom_marca`, `dat_criacao`) VALUES
(1, 'Vasconcelos', '2016-10-26 19:14:29'),
(2, 'REI ', '2016-10-26 19:14:29');

-- --------------------------------------------------------

--
-- Estrutura da tabela `produtos`
--

CREATE TABLE `produtos` (
  `cod_produto` int(11) NOT NULL,
  `non_produto` varchar(120) NOT NULL,
  `val_produto` float(10,2) NOT NULL,
  `qtd_produto` int(11) NOT NULL DEFAULT '0',
  `cod_categoria` int(11) DEFAULT NULL,
  `cod_marca` int(11) DEFAULT NULL,
  `cod_usuario` int(11) DEFAULT NULL,
  `cod_ean` char(15) DEFAULT NULL,
  `cod_fornecedor` int(11) DEFAULT NULL,
  `dsc_observacoes` text,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `produtos`
--

INSERT INTO `produtos` (`cod_produto`, `non_produto`, `val_produto`, `qtd_produto`, `cod_categoria`, `cod_marca`, `cod_usuario`, `cod_ean`, `cod_fornecedor`, `dsc_observacoes`, `updated_at`, `created_at`) VALUES
(20, 'Arroz A', 25.90, 17, 1, 1, NULL, '1230', 2, 'Arroz com boa qualidade', '2016-10-27 20:31:41', '2016-10-27 20:20:28'),
(21, 'Arroz B', 30.50, 0, 2, 1, NULL, '2233', 1, 'Arroz B observação', '2016-10-27 20:46:05', '2016-10-27 20:21:56'),
(22, 'Arroz A', 25.90, 0, 1, 1, NULL, '1230', 2, 'Arroz com boa qualidade', '2016-10-27 20:46:00', '2016-10-27 20:20:28'),
(23, 'Arroz B', 30.50, 5, 2, 1, NULL, '2233', 1, 'Arroz B observação', '2016-10-27 20:21:56', '2016-10-27 20:21:56'),
(25, 'Arroz B', 30.50, 5, 2, 1, NULL, '2233', 1, 'Arroz B observação', '2016-10-27 20:21:56', '2016-10-27 20:21:56'),
(27, 'Arroz BC', 30.50, 5, 2, 1, NULL, '2233', 1, 'Arroz B observação', '2016-10-27 20:33:11', '2016-10-27 20:21:56'),
(28, 'Arroz tipo c', 34.90, 78, 1, 1, NULL, '2211', 2, 'Observação aqui', '2016-10-27 20:34:27', '2016-10-27 20:34:27');

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuarios`
--

CREATE TABLE `usuarios` (
  `cod_usuario` int(11) NOT NULL,
  `nom_usuario` varchar(100) DEFAULT NULL,
  `bol_ativo` tinyint(1) DEFAULT '1',
  `dat_criacao` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`cod_categoria`);

--
-- Indexes for table `fornecedores`
--
ALTER TABLE `fornecedores`
  ADD PRIMARY KEY (`cod_fornecedor`);

--
-- Indexes for table `marcas`
--
ALTER TABLE `marcas`
  ADD PRIMARY KEY (`cod_marca`);

--
-- Indexes for table `produtos`
--
ALTER TABLE `produtos`
  ADD PRIMARY KEY (`cod_produto`),
  ADD KEY `cod_categoria` (`cod_categoria`,`cod_marca`,`cod_ean`,`cod_fornecedor`,`cod_usuario`),
  ADD KEY `cod_marca` (`cod_marca`),
  ADD KEY `cod_fornecedor` (`cod_fornecedor`),
  ADD KEY `cod_usuario` (`cod_usuario`);

--
-- Indexes for table `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`cod_usuario`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categorias`
--
ALTER TABLE `categorias`
  MODIFY `cod_categoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `fornecedores`
--
ALTER TABLE `fornecedores`
  MODIFY `cod_fornecedor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `marcas`
--
ALTER TABLE `marcas`
  MODIFY `cod_marca` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `produtos`
--
ALTER TABLE `produtos`
  MODIFY `cod_produto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;
--
-- AUTO_INCREMENT for table `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `cod_usuario` int(11) NOT NULL AUTO_INCREMENT;
--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `produtos`
--
ALTER TABLE `produtos`
  ADD CONSTRAINT `produtos_ibfk_1` FOREIGN KEY (`cod_categoria`) REFERENCES `categorias` (`cod_categoria`),
  ADD CONSTRAINT `produtos_ibfk_2` FOREIGN KEY (`cod_marca`) REFERENCES `marcas` (`cod_marca`),
  ADD CONSTRAINT `produtos_ibfk_3` FOREIGN KEY (`cod_fornecedor`) REFERENCES `fornecedores` (`cod_fornecedor`),
  ADD CONSTRAINT `produtos_ibfk_4` FOREIGN KEY (`cod_usuario`) REFERENCES `usuarios` (`cod_usuario`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
