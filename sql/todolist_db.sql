-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Tempo de geração: 18/02/2019 às 16:33
-- Versão do servidor: 5.6.39-cll-lve
-- Versão do PHP: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
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
  `user_id` bigint(20) NOT NULL,
  `status` int(11) NOT NULL,
  `estimated_duration` float NOT NULL,
  `class` tinyint(4) NOT NULL,
  `actual_duration` float NOT NULL,
  `running_status` tinyint(4) NOT NULL,
  `time_status_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Fazendo dump de dados para tabela `task`
--

INSERT INTO `task` (`id`, `name`, `parent`, `deadline`, `observations`, `user_id`, `status`, `estimated_duration`, `class`, `actual_duration`, `running_status`, `time_status_update`) VALUES
(3, 'Pessoal', 0, '2100-12-31', '', 1, 0, 0, 100, 0, 0, '2019-02-18 23:17:56'),
(4, 'Doutorado', 0, '2019-08-01', '', 1, 0, 0, 100, 0, 0, '2019-02-18 23:17:56'),
(5, 'Submeter artigo para revista', 4, '2019-04-01', '', 1, 0, 0, 100, 0, 0, '2019-02-18 23:17:56'),
(6, 'Escrever tese', 4, '2019-07-01', '', 1, 0, 0, 100, 0, 0, '2019-02-18 23:17:56'),
(7, 'Defesa de Proposa de Tese', 4, '2019-02-25', '', 1, 0, 0, 100, 0, 0, '2019-02-18 23:17:56'),
(8, 'IFES', 0, '2100-12-31', '', 1, 0, 0, 100, 0, 0, '2019-02-18 23:17:56'),
(9, 'CAPES', 0, '2019-08-01', 'Obrigacoes relacionadas ao doutorado sanduiche', 1, 0, 0, 100, 0, 0, '2019-02-18 23:17:56'),
(10, 'Enviar comprovante de permanencia no Brasil e curriculo lattes atualizado.', 9, '2019-06-27', 'manual do bolsista, pÃ¡g 28, PerÃ­odo de InterstÃ­cio: https://www.capes.gov.br/images/stories/download/bolsas/1562015-manual-Bolsistas-PDSE.pdf', 1, 0, 0, 100, 0, 0, '2019-02-18 23:17:56'),
(11, 'Comprar presente e organizar festinha ', 38, '2019-01-28', '', 1, 1, 0, 100, 0, 0, '2019-02-18 23:17:56'),
(12, 'Enviar tese no final do doutorado.', 9, '2019-08-01', '', 1, 0, 0, 100, 0, 0, '2019-02-18 23:17:56'),
(13, 'Comprovante de plano de saude', 8, '2019-04-01', '', 1, 0, 0, 100, 0, 0, '2019-02-18 23:17:56'),
(14, 'Relatorio Semestral', 8, '2018-12-01', '', 1, 1, 0, 100, 0, 0, '2019-02-18 23:17:56'),
(15, 'Pai', 3, '2100-12-31', '', 1, 0, 0, 100, 0, 0, '2019-02-18 23:17:56'),
(16, 'Cirurgiao', 15, '2019-01-25', '', 1, 1, 0, 100, 0, 0, '2019-02-18 23:17:56'),
(17, 'Oftalmo', 15, '2019-01-25', '', 1, 1, 0, 100, 0, 0, '2019-02-18 23:17:56'),
(18, 'Dentista', 15, '2019-01-25', '', 1, 1, 0, 100, 0, 0, '2019-02-18 23:17:56'),
(19, 'Medico do Sono', 15, '2019-01-25', '', 1, 1, 0, 100, 0, 0, '2019-02-18 23:17:56'),
(20, 'URGENTE', 0, '2100-12-31', '', 1, 0, 0, 100, 0, 0, '2019-02-18 23:17:56'),
(21, 'Sanitas', 20, '2019-01-25', 'Salvar comprovante de pagamento no dropbox e e-mail confirmando que nao tenho debitos mais.', 1, 1, 0, 100, 0, 0, '2019-02-18 23:17:56'),
(22, 'Progressoes', 8, '2019-03-01', 'Checar se precisa msm dada a aceleracao.', 1, 0, 0, 100, 0, 0, '2019-02-18 23:17:56'),
(24, 'Planejar Rotina Eficiente', 37, '2019-03-01', '', 1, 0, 0, 100, 0, 0, '2019-02-18 23:17:56'),
(25, 'Me inscrever na academia', 37, '2019-03-31', '', 1, 0, 0, 100, 0, 0, '2019-02-18 23:17:56'),
(26, 'Site e Redes Sociais', 0, '2100-12-31', '', 1, 0, 0, 100, 0, 0, '2019-02-18 23:17:56'),
(27, 'todolist', 26, '2100-12-31', '', 1, 0, 0, 100, 0, 0, '2019-02-18 23:17:56'),
(28, 'login com senha', 27, '2019-01-25', '', 1, 1, 0, 100, 0, 0, '2019-02-18 23:17:56'),
(29, 'bolinha enquanto as operacoes de POST nao terminam.', 99, '2019-03-01', '', 1, 0, 0, 100, 0, 0, '2019-02-18 23:17:56'),
(30, 'mudar o pai de uma tarefa', 27, '2019-03-01', '', 1, 1, 0, 100, 0, 0, '2019-02-18 23:17:56'),
(31, 'ver urgentes', 27, '2019-03-01', '', 1, 1, 0, 100, 0, 0, '2019-02-18 23:17:56'),
(32, 'data em formato brasileiro', 99, '2019-03-01', '', 1, 0, 0, 100, 0, 0, '2019-02-18 23:17:56'),
(34, 'Pagina Pessoal', 26, '2100-12-31', '', 1, 0, 0, 100, 0, 0, '2019-02-18 23:17:56'),
(35, 'Reestruturar pagina principal', 34, '2019-03-01', '', 1, 0, 0, 100, 0, 0, '2019-02-18 23:17:56'),
(36, 'Adicionar links para os trabalhos', 34, '2019-03-01', '', 1, 0, 0, 100, 0, 0, '2019-02-18 23:17:56'),
(37, 'Filipe', 3, '2100-12-31', '', 1, 0, 0, 100, 0, 0, '2019-02-18 23:17:56'),
(38, 'Ana', 3, '2100-12-31', '', 1, 0, 0, 100, 0, 0, '2019-02-18 23:17:56'),
(39, 'Projetos', 4, '2019-08-01', '', 1, 0, 0, 100, 0, 0, '2019-02-18 23:17:56'),
(40, 'Paper segmentacao semantica IJCNN', 39, '2019-02-28', '', 1, 0, 0, 100, 0, 0, '2019-02-18 23:17:56'),
(41, 'Videos de mapeamento', 40, '2019-01-25', '', 1, 1, 0, 100, 0, 0, '2019-02-18 23:17:56'),
(42, 'Videos de localizacao', 40, '2019-01-25', '', 1, 1, 0, 100, 0, 0, '2019-02-18 23:17:56'),
(43, 'Fotos dos mapas', 40, '2019-01-25', '', 1, 1, 0, 100, 0, 0, '2019-02-18 23:17:56'),
(45, 'Consertar lateral do carro', 37, '2019-01-31', '', 1, 1, 0, 100, 0, 0, '2019-02-18 23:17:56'),
(46, 'Consertar radio', 37, '2019-02-28', '', 1, 1, 0, 100, 0, 0, '2019-02-18 23:17:56'),
(47, 'Checar investimentos', 53, '2019-03-01', '', 1, 0, 0, 100, 0, 0, '2019-02-18 23:17:56'),
(48, 'Funprev', 8, '2019-03-01', '', 1, 0, 0, 100, 0, 0, '2019-02-18 23:17:56'),
(49, 'Ajeitar redes sociais', 26, '2019-06-01', '', 1, 0, 0, 100, 0, 0, '2019-02-18 23:17:56'),
(50, 'Planejar Carreira', 37, '2019-09-01', '', 1, 0, 0, 100, 0, 0, '2019-02-18 23:17:56'),
(52, 'Atualizar Lattes', 95, '2019-05-01', '', 1, 0, 0, 100, 0, 0, '2019-02-18 23:17:56'),
(53, 'Bens e Financas', 3, '2100-12-31', '', 1, 0, 0, 100, 0, 0, '2019-02-18 23:17:56'),
(54, 'Checar se o nosso plano pode ficar mais barato', 53, '2019-05-01', '', 1, 0, 0, 100, 0, 0, '2019-02-18 23:17:56'),
(55, 'Checar se o plano do pai pode ficar mais barato', 53, '2019-05-01', '', 1, 0, 0, 100, 0, 0, '2019-02-18 23:17:56'),
(56, 'Plano funerario', 53, '2019-05-01', '', 1, 0, 0, 100, 0, 0, '2019-02-18 23:17:56'),
(57, 'Checar se contas do pai estao em dia', 53, '2019-04-01', '', 1, 0, 0, 100, 0, 0, '2019-02-18 23:17:56'),
(58, 'Documentos das casas', 53, '2019-06-01', '', 1, 0, 0, 100, 0, 0, '2019-02-18 23:17:56'),
(59, 'Checar se os nomes nas contas do pai estao certos.', 53, '2019-05-01', '', 1, 0, 0, 100, 0, 0, '2019-02-18 23:17:56'),
(60, 'Relevar fotos da viagem', 38, '2019-03-01', '', 1, 0, 0, 100, 0, 0, '2019-02-18 23:17:56'),
(61, 'Comprar roupas', 15, '2019-03-01', '', 1, 0, 0, 100, 0, 0, '2019-02-18 23:17:56'),
(62, 'Atividades extras (hidroginastica, aprender a mexer na internet, etc.)', 15, '2019-03-01', '', 1, 0, 0, 100, 0, 0, '2019-02-18 23:17:56'),
(63, 'Planejar atividades para horas vagas', 37, '2019-04-01', '', 1, 0, 0, 100, 0, 0, '2019-02-18 23:17:56'),
(64, 'Dividas', 95, '2019-12-31', '', 1, 0, 0, 100, 0, 0, '2019-02-18 23:17:56'),
(65, 'Artigo HPG com Paulo', 64, '2100-12-31', '', 1, 0, 0, 100, 0, 0, '2019-02-18 23:17:56'),
(66, 'data de subtask nao pode ser posterior a task', 99, '2019-03-01', '', 1, 0, 0, 100, 0, 0, '2019-02-18 23:17:56'),
(67, 'Disciplina de SI com Varejao', 64, '2100-12-31', '', 1, 0, 0, 100, 0, 0, '2019-02-18 23:17:56'),
(68, 'Disciplina de Graphical Models com Alberto', 64, '2100-12-31', '', 1, 0, 0, 100, 0, 0, '2019-02-18 23:17:56'),
(70, 'Marcar clinico geral', 37, '2019-01-25', 'xixi fedendo (calor?), dor no tornozelo e joelho, falta de ar / dor quando tusso no pulmao, engordei rapido, queimacao forte no estomago ou garganta (refluxo?)', 1, 1, 0, 100, 0, 0, '2019-02-18 23:17:56'),
(74, 'Revisao de Literatura de Segmentacao Semantica', 7, '2019-01-28', 'Avaliar se vale a pena ir nessa direcao. Identificar como o GT eh gerado e quais metricas sao comumente usadas.', 1, 1, 0, 100, 0, 0, '2019-02-18 23:17:56'),
(75, 'Gerar groundtruth bom para dados do lcad', 77, '2019-02-20', '', 1, 0, 0, 100, 0, 0, '2019-02-18 23:17:56'),
(77, 'Rodar experimentos comparativos', 7, '2019-02-20', '', 1, 0, 0, 100, 0, 0, '2019-02-18 23:17:56'),
(78, 'Escrever defesa', 7, '2019-02-25', '', 1, 0, 0, 100, 0, 0, '2019-02-18 23:17:56'),
(79, 'bug: setinha nao esta mudando', 99, '2019-02-25', '', 1, 1, 0, 100, 0, 0, '2019-02-18 23:17:56'),
(80, 'Correcoes no texto', 40, '2019-02-28', '', 1, 0, 0, 100, 0, 0, '2019-02-18 23:17:56'),
(81, 'Segmentacao semantica torna o mapa invariante a condicoes de iluminacao e weather', 80, '2019-02-28', '', 1, 0, 0, 100, 0, 0, '2019-02-18 23:17:56'),
(82, 'ir para pagina de login qnd acabar o tempo sessao.', 99, '2019-02-28', 'falta testar', 1, 0, 0, 100, 0, 0, '2019-02-18 23:17:56'),
(83, 'HD Maps', 74, '2019-01-27', '', 1, 1, 0, 100, 0, 0, '2019-02-18 23:17:56'),
(84, 'Semantic mapping', 74, '2019-01-26', '', 1, 1, 0, 100, 0, 0, '2019-02-18 23:17:56'),
(86, 'Incremental Semantic Stereo Fusion', 84, '2019-01-26', '', 1, 1, 0, 100, 0, 0, '2019-02-18 23:17:56'),
(87, 'Semantic 3d occupancy mapping', 84, '2019-01-25', '', 1, 1, 0, 100, 0, 0, '2019-02-18 23:17:56'),
(88, 'Skimming Semantic Fusion', 84, '2019-01-25', '', 1, 1, 0, 100, 0, 0, '2019-02-18 23:17:56'),
(89, 'Large-scale 3d semantic mapping using stereo vision', 84, '2019-01-26', '', 1, 1, 0, 100, 0, 0, '2019-02-18 23:17:56'),
(90, 'Skimming kinectfusion', 84, '2019-01-25', '', 1, 1, 0, 100, 0, 0, '2019-02-18 23:17:56'),
(91, 'Adicionar comentario sobre tempo de execucao. Justificar porque nao usamos a mobilenet. ', 80, '2019-02-28', 'No paper \"Semantic 3d occupancy mapping ...\", os autores dizem que a ENet roda em real time. Avaliar se ela eh boa.', 1, 0, 0, 100, 0, 0, '2019-02-18 23:17:56'),
(92, 'Dar uma tarefa como concluida', 27, '2019-02-28', '', 1, 1, 0, 100, 0, 0, '2019-02-18 23:17:56'),
(93, 'Omitir tarefas concluidas', 27, '2019-02-28', '', 1, 1, 0, 100, 0, 0, '2019-02-18 23:17:56'),
(94, 'criar funcao para aplicar atualizacoes de forma recursiva', 99, '2019-03-01', 'ex.: apagar e atualizar status de conclusao', 1, 0, 0, 100, 0, 0, '2019-02-18 23:17:56'),
(95, 'Miscellaneous', 0, '2100-12-31', '', 1, 0, 0, 100, 0, 0, '2019-02-18 23:17:56'),
(96, 'mudar cor de tarefas com deadlines proximos', 101, '2019-02-15', 'Amarelo fica muito apagado.', 1, 1, 0, 100, 0, 0, '2019-02-18 23:17:56'),
(97, 'setar a largura da tag main para 100% quando urgentes estiverem invisiveis', 101, '2019-02-15', '', 1, 1, 0, 100, 0, 0, '2019-02-18 23:17:56'),
(98, 'A formatacao das tarefas urgentes esta ruim no site real', 101, '2019-02-15', '', 1, 1, 0, 100, 0, 0, '2019-02-18 23:17:56'),
(99, 'Baixa prioridade', 27, '2019-06-01', '', 1, 0, 0, 100, 0, 0, '2019-02-18 23:17:56'),
(100, 'Aplicar justified apenas para observacoes.', 101, '2019-02-15', '', 1, 1, 0, 100, 0, 0, '2019-02-18 23:17:56'),
(101, 'Alta prioridade', 27, '2019-06-01', '', 1, 0, 0, 100, 0, 0, '2019-02-18 23:17:56'),
(102, 'Nao mostrar tarefas concluidas nas urgentes e no update de parents', 101, '2019-02-15', '', 1, 1, 0, 100, 0, 0, '2019-02-18 23:17:56'),
(103, 'Atualizar lista de proximos deadlines sempre que uma operacao eh realizada nas tarefas.', 101, '2019-06-01', '', 1, 0, 0, 100, 0, 0, '2019-02-18 23:17:56'),
(104, 'herdar deadline do pai', 99, '2019-06-01', '', 1, 0, 0, 100, 0, 0, '2019-02-18 23:17:56'),
(105, 'Parar de pular para o topo quando os botoes de adicionar e atualizar tarefas sao pressionado.', 101, '2019-06-01', '', 1, 0, 0, 100, 0, 0, '2019-02-18 23:17:56'),
(106, 'adicionar estatisticas', 99, '2019-06-01', 'ex.: numero de tarefas cadastradas, porcentagem de tarefas cumpridas no prazo, etc.', 1, 0, 0, 100, 0, 0, '2019-02-18 23:17:56'),
(107, 'A distancia para a lateral esquerda esta mudando quando eu abro a baixa prioridade.', 99, '2019-06-01', 'Provavelmente tem a ver com o tamanho das observacoes e do titulo da tarefa.', 1, 1, 0, 100, 0, 0, '2019-02-18 23:17:56'),
(108, 'Checar se o link para o site esta certo nos videos.', 40, '2019-01-28', '', 1, 1, 0, 100, 0, 0, '2019-02-18 23:17:56'),
(109, 'Quando eu clico em marcar como concluido, e depois escolho nao na janela de confirmacao, o checkbox fica marcado.', 99, '2019-06-01', '', 1, 0, 0, 100, 0, 0, '2019-02-18 23:17:56'),
(110, 'Fazer GICP dos logs de localizacao em relacao aos de mapeamento.', 75, '2019-02-01', 'Fixar poses de mapeamento. Usar graphslam como guess do gicp.', 1, 1, 0, 100, 0, 0, '2019-02-18 23:17:56'),
(111, 'Matheus \"eu vou trabalhar no seu lab\"', 64, '2100-02-03', '', 1, 0, 0, 100, 0, 0, '2019-02-18 23:17:56'),
(112, 'Filipes Opinions on Youtube', 26, '2100-12-31', 'Um canal sobre minhas opinioes.', 1, 0, 0, 100, 0, 0, '2019-02-18 23:17:56'),
(113, 'Checar planos da vivo', 53, '2019-02-20', '', 1, 0, 0, 100, 0, 0, '2019-02-18 23:17:56'),
(114, 'Checar se estou movendo do velodyne para o carro depois do gicp', 75, '2019-02-18', '', 1, 0, 0, 100, 0, 0, '2019-02-18 23:17:56'),
(116, 'Marcar psicÃ³loga.', 37, '2019-03-01', '', 1, 0, 0, 100, 0, 0, '2019-02-18 23:17:56'),
(117, 'LCAD', 0, '2100-02-06', '', 1, 0, 0, 100, 0, 0, '2019-02-18 23:17:56'),
(118, 'Liberar espaÃ§o na monster', 117, '2019-03-01', '', 1, 1, 0, 100, 0, 0, '2019-02-18 23:17:56'),
(119, 'Ir no banco pedir reducao da anuidade.', 53, '2019-02-28', '', 1, 0, 0, 100, 0, 0, '2019-02-18 23:17:56'),
(121, 'Adicionar HD extra na lcad10', 117, '2019-03-01', '', 1, 1, 0, 100, 0, 0, '2019-02-18 23:17:56'),
(122, 'Aprender a reproduzir a sensor box', 117, '2019-09-01', '', 1, 0, 0, 100, 0, 0, '2019-02-18 23:17:56'),
(123, 'Aprender a mexer no CAN', 117, '2019-09-01', '', 1, 0, 0, 100, 0, 0, '2019-02-18 23:17:56'),
(124, 'Organizacao', 3, '2019-03-06', '', 1, 0, 0, 100, 0, 0, '2019-02-18 23:17:56'),
(126, 'Atualizar historicos medicos e lista de medicos meus, do pai, e da ana.', 124, '2019-03-06', '', 1, 0, 0, 100, 0, 0, '2019-02-18 23:17:56'),
(127, 'Subir meus contatos do cel para nuvem', 124, '2019-03-06', 'Salvar na nuvem.', 1, 1, 0, 100, 0, 0, '2019-02-18 23:17:56'),
(129, 'Imprimir exames do pai do site da cremasco', 15, '2019-02-20', '', 1, 0, 0, 100, 0, 0, '2019-02-18 23:17:56'),
(130, 'Criar uma forma de organizar participacoes em coisas ', 124, '2019-03-06', 'bancas, comissoes, etc.', 1, 0, 0, 100, 0, 0, '2019-02-18 23:17:56'),
(132, 'NÃ£o apagar a atividade do banco quando ela for apagada para permitir recuperar.', 99, '2019-03-01', '', 1, 0, 0, 100, 0, 0, '2019-02-18 23:17:56'),
(133, 'Salvar documentos do ifes que estao no hd no dropbox.', 124, '2019-03-06', 'projetos finais do ifes, documentos antigos, arquivo do IRF, etc.', 1, 0, 0, 100, 0, 0, '2019-02-18 23:17:56'),
(134, 'Revisar relatorio do Scart.', 20, '2018-12-30', '', 1, 1, 0, 100, 0, 0, '2019-02-18 23:17:56'),
(135, 'Subir o tutorial de como cadastrar usuarios na wiki', 117, '2019-02-22', '', 1, 0, 0, 100, 0, 0, '2019-02-18 23:17:56'),
(136, 'Criar driver do ouster', 117, '2019-02-12', '', 1, 1, 0, 100, 0, 0, '2019-02-18 23:17:56'),
(137, 'Adicionar no readme do ouster como obter o nome do sensor.', 136, '2019-02-12', '', 1, 1, 0, 100, 0, 0, '2019-02-18 23:17:56'),
(138, 'Publicar mensagem da IMU', 136, '2019-02-12', '', 1, 1, 0, 100, 0, 0, '2019-02-18 23:17:56'),
(139, 'Publicar mensagem da velodyne', 136, '2019-02-12', '', 1, 1, 0, 100, 0, 0, '2019-02-18 23:17:56'),
(140, 'Adicionar visualizador', 136, '2019-02-12', '', 1, 1, 0, 100, 0, 0, '2019-02-18 23:17:56'),
(141, 'usar o timestamp do ouster', 136, '2019-02-12', '', 1, 1, 0, 100, 0, 0, '2019-02-18 23:17:56'),
(142, 'Criar uma biblioteca com dados de calibracao', 136, '2019-02-12', 'os angulos verticais, etc.', 1, 1, 0, 100, 0, 0, '2019-02-18 23:17:56'),
(143, 'Adicionar no viewer do ouster a paletta de cores bonita do viewer deles', 136, '2019-12-02', '', 1, 1, 0, 100, 0, 0, '2019-02-18 23:17:56'),
(144, 'Fazer tratamento para publicacao da nuvem completa no ouster', 136, '2019-02-12', '', 1, 1, 0, 100, 0, 0, '2019-02-18 23:17:56'),
(145, 'Adicionar opÃ§Ãµes para publicar os diferentes tipos de cor', 136, '2019-02-12', '', 1, 1, 0, 100, 0, 0, '2019-02-18 23:17:56'),
(146, 'ver conta de luz estranha do pai', 20, '2018-02-28', '', 1, 0, 0, 100, 0, 0, '2019-02-18 23:17:56'),
(147, 'Ajustar o codigo para usar calibracao do remission', 148, '2019-02-20', '', 1, 0, 0, 100, 0, 0, '2019-02-18 23:17:56'),
(148, 'Implementar baselines', 77, '2019-02-20', 'Obstaculos e remission', 1, 0, 0, 100, 0, 0, '2019-02-18 23:17:56'),
(149, 'Ler nuvens do velodyne em coordenadas esfericas', 148, '2019-02-19', 'aproveitar para melhorar a estrutura do codigo, e aumentar eficiencia percorrendo a nuvem uma vez so.', 1, 0, 0, 100, 0, 0, '2019-02-18 23:17:56'),
(150, 'Implementar codigo para comparacao automatica.', 148, '2019-02-20', '', 1, 0, 0, 100, 0, 0, '2019-02-18 23:17:56'),
(151, 'Imprimir exames e voltar no clinico geral', 37, '2019-02-20', '', 1, 0, 0, 100, 0, 0, '2019-02-18 23:17:56'),
(152, 'remarcar geriatra e oftalmo do pai', 20, '2018-02-18', '', 1, 1, 0, 100, 0, 0, '2019-02-18 23:17:56'),
(153, 'Terminar de ler papers da revisao de literatura', 7, '2019-02-14', '', 1, 0, 0, 100, 0, 0, '2019-02-18 23:17:56'),
(155, 'Ler Robust Dense Mapping for Large-Scale Dynamic Environments', 153, '2019-02-14', 'meshes bonitas', 1, 0, 0, 100, 0, 0, '2019-02-18 23:17:56'),
(156, 'Ler Robust LIDAR localization using multiresolution Gaussian mixture maps for autonomous driving', 153, '2019-02-14', 'Localizacao estado-da-arte. Multi-resolution maps. Geracao de GT. Avaliacao. ', 1, 0, 0, 100, 0, 0, '2019-02-18 23:17:56'),
(157, 'Skim papers listados no drive para ver se tem mais algum que vale a pena ler.', 153, '2019-02-14', '', 1, 0, 0, 100, 0, 0, '2019-02-18 23:17:56'),
(158, 'Salvar backup dos dados do paper do ijcnn', 40, '2019-02-28', '', 1, 0, 0, 100, 0, 0, '2019-02-18 23:17:56'),
(159, 'Salvar um snapshot estavel do codigo do ijcnn.', 40, '2019-02-28', '', 1, 0, 0, 100, 0, 0, '2019-02-18 23:17:56'),
(160, 'Encontrar datasets para rodar experimentos', 77, '2019-02-18', '', 1, 0, 0, 100, 0, 0, '2019-02-18 23:17:56'),
(161, 'Rodar experimentos com datasets consolidados', 77, '2019-02-19', '', 1, 0, 0, 100, 0, 0, '2019-02-18 23:17:56'),
(162, 'Melhorias no codigo', 5, '2019-04-01', 'Replanejar datas', 1, 0, 0, 100, 0, 0, '2019-02-18 23:17:56'),
(163, 'Criar uma pasta com coisas do GICP', 162, '2019-04-01', 'criar uma libgicp no carmen?', 1, 0, 0, 100, 0, 0, '2019-02-18 23:17:56'),
(164, 'Adicionar o visualizador da PCL em uma biblioteca para evitar codigos replicados', 162, '2019-04-01', '', 1, 0, 0, 100, 0, 0, '2019-02-18 23:17:56'),
(165, 'Atualizar o graphslam para receber um dataset como entrada', 162, '2019-04-01', '', 1, 0, 0, 100, 0, 0, '2019-02-18 23:17:56'),
(166, 'Atualizar o tipo DatasetCarmen para ler os dados do log direto.', 162, '2019-04-01', '', 1, 0, 0, 100, 0, 0, '2019-02-18 23:17:56'),
(167, 'Implementar formas alternativas de fechamento de loop e usa-las no graphslam', 162, '2019-04-01', 'Map matching (?), bound and branch (?)', 1, 0, 0, 100, 0, 0, '2019-02-18 23:17:56'),
(168, 'Atualizar mapeador para tornar a funcao de salvar mapas explicita para ficar claro onde mapas estao sendo salvos.', 162, '2019-04-01', '', 1, 0, 0, 100, 0, 0, '2019-02-18 23:17:56'),
(169, 'Criar funcoes que permitam a facil integracao do codigo no carmen.', 162, '2019-04-01', '', 1, 0, 0, 100, 0, 0, '2019-02-18 23:17:56'),
(170, 'Atualizar mapeador para possibilitar a manutencao de dois mapas da mesma regiao.', 162, '2019-04-01', 'Isso vai ser importante para implementar fechamento de loop com map matching.', 1, 0, 0, 100, 0, 0, '2019-02-18 23:17:56'),
(171, 'Organizar pasta de scripts.', 162, '2019-04-01', '', 1, 0, 0, 100, 0, 0, '2019-02-18 23:17:56'),
(172, 'Usar dados da IMU', 162, '2019-04-01', 'yaw no graphslam; pitch e roll para mapeamento.', 1, 0, 0, 100, 0, 0, '2019-02-18 23:17:56'),
(173, 'Usar odometria baseada em GICP?', 162, '2019-04-01', '', 1, 0, 0, 100, 0, 0, '2019-02-18 23:17:56'),
(174, 'Criar forma melhor de escolher qual tipo de mapa usar.', 162, '2019-04-01', '', 1, 0, 0, 100, 0, 0, '2019-02-18 23:17:56'),
(175, 'Permitir o armazenamento de diferentes mapas da mesma regiao', 162, '2019-04-01', 'permitir mapas do mesmo tipo? como diferenciar?', 1, 0, 0, 100, 0, 0, '2019-02-18 23:17:56'),
(176, 'Criar um arquivo de hyperparametros.', 162, '2019-04-01', '', 1, 0, 0, 100, 0, 0, '2019-02-18 23:17:56'),
(177, 'Usar formas eficientes de representar o mapa (hash?)', 162, '2019-04-01', '', 1, 0, 0, 100, 0, 0, '2019-02-18 23:17:56'),
(178, 'Tentar melhorar a segmentacao semantica usando CRF', 162, '2019-04-01', '', 1, 0, 0, 100, 0, 0, '2019-02-18 23:17:56'),
(179, 'Implementar truques dos papers da revisao de literatura', 162, '2019-04-01', '', 1, 0, 0, 100, 0, 0, '2019-02-18 23:17:56'),
(180, 'Melhorar measurement model para considerar mais incertezas (ex.: atualizar celulas vizinhas)', 162, '2019-04-01', '', 1, 0, 0, 100, 0, 0, '2019-02-18 23:17:56'),
(181, 'Verificar se orientacoes estao corretas.', 162, '2019-04-01', 'ex.: inversao de sinal na leitura do dataset; correcao da nuvem devido a movimento, etc.', 1, 0, 0, 100, 0, 0, '2019-02-18 23:17:56'),
(182, 'Criar uma forma de organizar o conhecimento adquirido', 124, '2019-04-01', 'ex.: o que eu aprendi com videos sobre auto-melhoria no youtube. Sera que eh possivel criar um servico para que pessoas comuns depositem o conhecimento delas la? Sera que o stack overflow ja nao atende isso?', 1, 0, 0, 100, 0, 0, '2019-02-18 23:17:56'),
(183, 'Test', 0, '2019-03-02', 'minha observacao', 1, 0, 0.5, 7, 0.00305555, 0, '2019-02-18 23:31:36');

-- --------------------------------------------------------

--
-- Estrutura para tabela `user`
--

CREATE TABLE `user` (
  `id` bigint(20) NOT NULL,
  `username` varchar(64) NOT NULL,
  `email` varchar(64) NOT NULL,
  `password` varchar(40) NOT NULL,
  `date_creation` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Fazendo dump de dados para tabela `user`
--

INSERT INTO `user` (`id`, `username`, `email`, `password`, `date_creation`) VALUES
(1, 'filipe', 'filipemtz@gmail.com', '59dc2c3921372dd78bc538c65a4b8b70', '2019-01-23 22:46:30'),
(2, 'pedro', 'pepeaze@gmail.com', '0f00d2ac0f67a8ceb43250f91de6d6e7', '2019-02-06 10:10:26');

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
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=184;

--
-- AUTO_INCREMENT de tabela `user`
--
ALTER TABLE `user`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
