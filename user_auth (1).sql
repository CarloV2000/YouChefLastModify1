-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Creato il: Mag 22, 2025 alle 22:30
-- Versione del server: 10.10.3-MariaDB
-- Versione PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `user_auth`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `recipes`
--

CREATE TABLE `recipes` (
  `id` int(11) NOT NULL,
  `nome` varchar(512) NOT NULL,
  `categoria` varchar(512) DEFAULT NULL,
  `tempoStimato` int(11) DEFAULT NULL,
  `ingredienti` varchar(5000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dump dei dati per la tabella `recipes`
--

INSERT INTO `recipes` (`id`, `nome`, `categoria`, `tempoStimato`, `ingredienti`) VALUES
(1, 'pasta al sugo', 'primo', 70, 'Pasta(320 g) - Olio extravergine di oliva(30 g) - basilico() - pomodori pelati (800 g) - aglio(1 spicchio) - sale grosso() - sale fino()'),
(2, 'pasta alla carbonara', 'primo', 25, 'Pasta(320 g) - Tuorli di uova medie(6 pz) - guanciale(150 g) - Pecorino Romano(50 g) - pepe nero()'),
(3, 'pollo in padella al vino', 'secondo', 40, 'Pollo(800 g) - 2 bicchieri di vino bianco() - 2 spicchi di aglio() - rosmarino() - alloro() - maggiorana() - olio extravergine di oliva() - sale()'),
(4, 'Verdure grigliate', 'contorno', 20, 'Melanzane - Zucchine');

-- --------------------------------------------------------

--
-- Struttura della tabella `steps`
--

CREATE TABLE `steps` (
  `id` int(11) NOT NULL,
  `ricetta_id` int(11) NOT NULL,
  `passaggio` text NOT NULL,
  `ordine` int(11) NOT NULL,
  `tempo` int(11) DEFAULT NULL,
  `temperaturamin1` int(11) DEFAULT NULL,
  `temperaturamax1` int(11) DEFAULT NULL,
  `temperaturamin2` int(11) DEFAULT NULL,
  `temperaturamax2` int(11) DEFAULT NULL,
  `TimerRichiesto` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dump dei dati per la tabella `steps`
--

INSERT INTO `steps` (`id`, `ricetta_id`, `passaggio`, `ordine`, `tempo`, `temperaturamin1`, `temperaturamax1`, `temperaturamin2`, `temperaturamax2`, `TimerRichiesto`) VALUES
(0, 1, 'Versare olio extravergine di oliva con uno spicchio di aglio sbucciato e diviso in due in una padella da posizionare sotto il sensore 1. Mantenere il fuoco moderato fino a raggiungimento della temperatura indicata, per poii abbassare il fuoco a fiamma bassa. Aspettare che gli spicchi si dorino leggermente.', 1, 0, 100, 140, 0, 0, 0),
(1, 1, 'Mettere nella stessa padella i pomodori pelati o una passata di pomodoro ed aggiungere sale a gradimento. Aspettare che il sugo raggiunga la temperatura indicata.', 2, 0, 80, 95, 0, 0, 0),
(2, 1, 'Lasciare il sugo a cuocere per circa 30 minuti, mescolando circa ogni 5 minuti, poi rimuovere aglio e parti di buccia di pomodoro alla fine.', 3, 1800, 80, 95, 0, 0, 1),
(3, 1, 'Lasciare a fiamma spenta il sugo, aggiungere basilico e chiudere coperchio, in parallelo: mettere acqua in una pentola posizionata sotto il sensore 2 ed accendere fornello attendendo che vada in ebollizione.', 4, 0, 0, 0, 95, 105, 0),
(4, 1, 'Aggiungere sale, buttare la pasta nella pentola ed attendere la cottura impostando un timer della durata scritta sulla confezione.', 5, 0, 0, 0, 95, 105, 0),
(5, 1, 'Scolare la pasta e versarla nella padella contenente il sugo.', 6, 0, 0, 0, 0, 0, 0),
(6, 2, 'Mettere una pentola sotto il sensore 1 con acqua fino a che non raggiunge la temperatura indicata. Nel frattempo eliminare la cotenna dal guanciale e tagliarlo prima a fette e poi a striscioline spesse circa 1cm; poi versare i pezzetti di guanciale in una padella antiaderente posizionata sotto il sensore 2, accendere il fornello,  mantenere la temperatura indicata regolando la fiamma fino al raggiungimento di una colorazione ambrata del guanciale. Spegnere il fuoco della padella sotto il sensore 2. Travasare il guanciale in una ciotola e coprirlo eventualmente con della carta per renderlo croccante.', 1, 0, 95, 105, 140, 160, 0),
(7, 2, 'Nella pentola posizionata sotto il sensore 1 buttare il sale e gli spaghetti e far cuocere fino ad un minuto prima della cottura indicata sulla confezione. Versare i tuorli in una ciotolina, aggiungere il pecorino e il pepe nero, mescolare il tutto con una frusta a mano fino ad ottenere una crema liscia, mescolare il grasso rimasto sulla padella in cui abbiamo precedentemente cotto il guanciale nella ciotolina con uova, pecorino e pepe, aggiungendo un cucchiaio di acqua bollente prelevata dalla pentola della pasta.', 2, 0, 95, 105, 0, 0, 0),
(8, 2, 'Scolare la pasta conservando un mestolo di acqua di cottura e versarla nella padella precedentemente utilizzata per il guaciale.', 3, 0, 0, 0, 0, 0, 0),
(9, 2, 'Aspettare il tempo indicato, per poi aggiungere il composto di uova, pepe e pecorino, mescolando energicamente. Aggiungere il guanciale nella pentola, rimescolare e a discrezione aggiungere pecorino grattugiato.', 5, 45, 0, 0, 0, 0, 1),
(10, 2, 'Ultimare la cottura della pasta mescolando spesso e mantenendo la fiamma medio-alta, rispettando tempi e temperatura indicati. Assicurarsi sia che la pasta non si asciughi troppo sia che l\'acqua di cottura sul fondo non sia eccessiva Spegnere a questo punto la fiamma.', 4, 120, 80, 120, 0, 0, 0),
(11, 3, 'Tagliare il pollo a pezzi, tritare rosmarino e maggiorana, mettere il pollo con la pelle su un piano da lavoro e spennellarlo con olio extravergine di oliva.', 1, 0, 0, 0, 0, 0, 0),
(12, 3, 'Mettere sopra al pollo il trito di erbe aromatiche e alloro, chiudere il tutto in un contenitore e lasciarlo marinare per 30 minuti fuori frigo. ', 2, 1800, 0, 0, 0, 0, 1),
(13, 3, 'Mettere in un tegame 4 cucchiai di olio extravergine di oliva e i due spicchi di aglio tagliandoli in due. Posizionare sopra il sensore 1 il tegame e accendere il fuoco, mantenendolo medio-alto fino a che la padella non raggiunge la temperatura indicata, per poi abbassarlo a medio-basso. Togliere l\'aglio una volta dorato.', 3, 0, 120, 150, 0, 0, 0),
(14, 3, 'Aumentare la fiamma in modo da portare la padella alla temperatura indicata. Versare il pollo a pezzi nel tegame dalla parte della pelle a fuoco medio-alto per 10 minuti, cercando di mantenere la temperatura dell\'olio indicata; girare il pollo dopo 5 minuti. Sfumare con il vino, aumentando il fuoco.', 4, 600, 150, 170, 0, 0, 1),
(15, 3, 'Una volta evaporato il vino (non si avverte odore di alcol), abbassare la fiamma in modo che sia medio-bassa e lasciare cuocere col coperchio per il tempo indicato, aggiustare infine di sale.', 5, 1200, 0, 0, 0, 0, 1),
(16, 4, 'Tagliare le melanzane a cubetti di lato circa 2 cm, versa le melanzane in una ciotola e cospargere di sale. Lasciare riposare per 20 minuti, nel mentre tagliare le zucchine a rondelle spesse circa 0,5 cm.', 1, 20, 0, 0, 0, 0, 1),
(17, 4, 'Versare 2 cucchiai di olio su una padella ed aggiungere 2 spicchi di aglio spellati e tagliati in due, poi posizionare la padella sotto al sensore 1 ed accendere il fuoco a fiamma media cercando di mantenere l\'olio alla temperatura indicata fin quando l\'aglio non raggiunge una colorazione dorata', 2, 0, 120, 150, 0, 0, 0),
(18, 4, 'Togliere aglio, aggiungere i cubetti di melanzane, cuocere a fiamma medio-alta per il tempo indicato mescolando di tanto in tanto, aggiungendo un cucchiaio di olio nel caso in cui le melanzane si stiano seccando eccessivamente.', 3, 500, 0, 0, 0, 0, 0),
(19, 4, 'Aggiungi le zucchine e mantieni in cottura per il tempo indicato, regolando alla fine di sale, pepe e tutti condimenti desiderati. Spegnere il fuoco.', 4, 400, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Struttura della tabella `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dump dei dati per la tabella `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `created_at`) VALUES
(1, 'aaa', 'aaa.aaa@gmail.com', '$2y$10$uDTzBZNYXB0lU/smpkjvf.iO./WokhulJFVnc3HLA6CTKnjcPte7a', '2025-05-16 10:31:52');

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `recipes`
--
ALTER TABLE `recipes`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `steps`
--
ALTER TABLE `steps`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ricetta_id` (`ricetta_id`);

--
-- Indici per le tabelle `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT per le tabelle scaricate
--

--
-- AUTO_INCREMENT per la tabella `recipes`
--
ALTER TABLE `recipes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT per la tabella `steps`
--
ALTER TABLE `steps`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT per la tabella `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `steps`
--
ALTER TABLE `steps`
  ADD CONSTRAINT `steps_ibfk_1` FOREIGN KEY (`ricetta_id`) REFERENCES `recipes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
