-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Хост: 127.0.0.1
-- Время создания: Мар 21 2015 г., 22:48
-- Версия сервера: 5.6.21
-- Версия PHP: 5.6.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- База данных: `henrik`
--

-- --------------------------------------------------------

--
-- Структура таблицы `categories`
--

CREATE TABLE IF NOT EXISTS `categories` (
  `CategoryID` int(11) NOT NULL,
  `Name` varchar(250) NOT NULL,
  `Icon` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `categories`
--

INSERT INTO `categories` (`CategoryID`, `Name`, `Icon`) VALUES
(1, 'Drikke', 'drink.png'),
(2, 'Fisk og skalldyr', 'fish.png'),
(3, 'Frukt og bær', 'fruit.png'),
(4, 'Grønnsaker', 'vegetable.png'),
(5, 'Kjøtt og Fjørfe', 'meat.png'),
(6, 'Korn- og bakevarer', 'grain.png'),
(7, 'Meieriprodukter', 'dairy.png'),
(8, 'Tørrprodukter', 'dry.png'),
(9, 'Diverse', 'other.png');

-- --------------------------------------------------------

--
-- Структура таблицы `coursedetail`
--

CREATE TABLE IF NOT EXISTS `coursedetail` (
  `RecordID` int(11) NOT NULL,
  `CourseID` int(11) NOT NULL,
  `IngredientID` int(11) NOT NULL,
  `CategoryID` int(11) NOT NULL,
  `PrimaryYesNo` int(11) NOT NULL,
  `Quantity` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `coursedetail`
--

INSERT INTO `coursedetail` (`RecordID`, `CourseID`, `IngredientID`, `CategoryID`, `PrimaryYesNo`, `Quantity`) VALUES
(1, 1, 15, 7, 1, '3'),
(2, 1, 80, 5, 0, '100'),
(3, 1, 48, 4, 0, '1/2'),
(4, 1, 54, 7, 0, '40'),
(5, 1, 95, 1, 0, '0.1'),
(6, 1, 76, 8, 0, '1'),
(7, 1, 60, 8, 0, '1'),
(8, 1, 65, 4, 0, '1'),
(9, 1, 64, 9, 0, '1'),
(10, 2, 15, 7, 1, NULL),
(11, 2, 95, 1, 1, NULL),
(12, 2, 76, 8, 0, NULL),
(13, 2, 60, 8, 0, NULL),
(14, 3, 15, 7, 1, NULL),
(15, 3, 52, 7, 1, NULL),
(16, 3, 51, 8, 1, NULL),
(17, 3, 88, 8, 0, NULL),
(18, 3, 50, 7, 1, NULL),
(19, 3, 27, 6, 0, NULL),
(20, 4, 8, 6, 1, NULL),
(21, 4, 37, 9, 0, NULL),
(22, 4, 80, 5, 0, NULL),
(23, 4, 54, 7, 1, NULL),
(24, 4, 91, 4, 0, NULL),
(25, 5, 75, 4, 1, NULL),
(26, 5, 91, 4, 0, '1/2'),
(27, 5, 1, 4, 0, NULL),
(28, 5, 55, 4, 0, NULL),
(29, 5, 49, 4, 0, NULL),
(30, 5, 19, 7, 0, NULL),
(31, 5, 80, 5, 0, NULL),
(32, 5, 63, 9, 0, NULL),
(33, 5, 57, 8, 0, NULL),
(34, 5, 48, 4, 0, NULL),
(35, 5, 42, 5, 1, NULL),
(36, 6, 42, 5, 0, NULL),
(37, 6, 76, 8, 1, NULL),
(38, 6, 1, 4, 0, NULL),
(39, 6, 55, 4, 0, NULL),
(40, 6, 49, 4, 0, NULL),
(41, 6, 74, 7, 0, NULL),
(42, 6, 64, 9, 0, NULL),
(43, 6, 47, 6, 1, NULL),
(44, 7, 4, 6, 1, NULL),
(45, 7, 15, 7, 1, NULL),
(46, 7, 3, 5, 1, NULL),
(47, 7, 54, 7, 1, NULL),
(48, 7, 37, 9, 1, NULL),
(49, 8, 48, 4, 0, NULL),
(50, 8, 55, 4, 0, NULL),
(51, 8, 11, 4, 1, NULL),
(52, 8, 49, 4, 0, NULL),
(53, 8, 30, 8, 1, NULL),
(54, 8, 26, 4, 1, NULL),
(55, 8, 39, 8, 1, NULL),
(56, 8, 40, 4, 0, NULL),
(57, 9, 65, 4, 1, NULL),
(58, 9, 95, 1, 1, NULL),
(59, 9, 81, 7, 0, NULL),
(60, 9, 50, 7, 0, NULL),
(61, 9, 76, 8, 0, NULL),
(62, 9, 60, 8, 0, NULL),
(63, 9, 31, 4, 0, NULL),
(64, 10, 68, 5, 1, NULL),
(65, 10, 47, 6, 0, NULL),
(66, 10, 8, 6, 0, NULL),
(67, 10, 87, 8, 0, NULL),
(68, 10, 48, 4, 0, NULL),
(69, 10, 77, 9, 0, NULL),
(70, 10, 37, 9, 0, NULL),
(71, 10, 2, 9, 0, NULL),
(72, 10, 70, 2, 0, NULL),
(73, 10, 66, 7, 0, NULL),
(74, 11, 27, 6, 1, NULL),
(75, 11, 95, 1, 1, NULL),
(76, 11, 76, 8, 0, NULL),
(77, 11, 88, 8, 0, NULL),
(78, 11, 72, 8, 0, NULL),
(79, 11, 16, 3, 0, NULL),
(80, 11, 46, 8, 0, NULL),
(81, 11, 90, 9, 0, NULL),
(82, 11, 52, 7, 0, NULL),
(83, 12, 93, 8, 1, NULL),
(84, 12, 9, 8, 1, NULL),
(85, 12, 23, 4, 1, NULL),
(86, 12, 61, 5, 0, NULL),
(87, 12, 34, 5, 0, NULL),
(88, 12, 62, 4, 0, NULL),
(89, 12, 60, 8, 0, NULL),
(90, 12, 8, 6, 0, NULL),
(91, 12, 5, 6, 0, NULL),
(92, 12, 32, 6, 0, NULL),
(93, 12, 95, 1, 1, NULL),
(94, 13, 86, 4, 1, NULL),
(95, 13, 31, 4, 1, NULL),
(96, 13, 48, 4, 1, NULL),
(97, 13, 65, 4, 1, NULL),
(98, 13, 24, 8, 1, NULL),
(99, 13, 20, 7, 1, NULL),
(100, 14, 65, 4, 1, NULL),
(101, 14, 25, 4, 0, NULL),
(102, 14, 67, 4, 0, NULL),
(103, 14, 48, 4, 0, NULL),
(104, 14, 24, 8, 1, NULL),
(105, 14, 20, 7, 1, NULL),
(106, 14, 74, 7, 0, NULL),
(107, 14, 3, 5, 0, NULL),
(108, 14, 8, 6, 0, NULL),
(109, 14, 5, 6, 0, NULL),
(110, 15, 44, 5, 1, NULL),
(111, 15, 48, 4, 1, NULL),
(112, 15, 16, 3, 1, NULL),
(113, 15, 13, 7, 0, NULL),
(114, 15, 24, 8, 0, NULL),
(115, 15, 71, 6, 1, NULL),
(116, 15, 81, 7, 1, NULL),
(117, 15, 50, 7, 1, NULL),
(118, 15, 36, 8, 0, NULL),
(119, 15, 10, 8, 0, NULL),
(120, 15, 29, 8, 1, NULL),
(121, 15, 5, 6, 0, NULL),
(122, 16, 85, 5, 1, NULL),
(123, 16, 65, 4, 1, NULL),
(124, 16, 73, 4, 1, NULL),
(125, 16, 91, 4, 1, NULL),
(126, 16, 6, 9, 1, NULL),
(127, 17, 38, 5, 1, NULL),
(128, 17, 59, 9, 1, NULL),
(129, 17, 71, 6, 0, NULL),
(130, 17, 65, 4, 0, NULL),
(131, 17, 19, 7, 0, NULL),
(132, 17, 22, 4, 0, NULL),
(133, 18, 35, 5, 1, NULL),
(134, 18, 86, 4, 1, NULL),
(135, 18, 25, 4, 1, NULL),
(136, 18, 31, 4, 0, NULL),
(137, 18, 81, 7, 1, NULL),
(138, 18, 50, 7, 0, NULL),
(139, 18, 71, 6, 0, NULL),
(140, 18, 57, 8, 0, NULL),
(141, 19, 15, 7, 1, NULL),
(142, 19, 80, 5, 1, NULL),
(143, 19, 86, 4, 1, NULL),
(144, 19, 55, 4, 1, NULL),
(145, 19, 91, 4, 1, NULL),
(146, 19, 65, 4, 1, NULL),
(147, 20, 85, 8, 1, NULL),
(148, 20, 40, 5, 1, NULL),
(149, 20, 59, 9, 1, NULL),
(150, 21, 69, 8, 1, NULL),
(151, 21, 59, 9, 1, NULL),
(152, 21, 56, 7, 0, NULL),
(153, 21, 75, 4, 0, NULL),
(154, 21, 5, 6, 0, NULL),
(155, 22, 85, 8, 1, NULL),
(156, 22, 79, 2, 1, NULL),
(157, 22, 28, 8, 1, NULL),
(158, 22, 31, 4, 1, NULL),
(159, 22, 48, 4, 1, NULL),
(160, 22, 17, 1, 1, NULL),
(161, 22, 33, 1, 0, NULL),
(162, 23, 40, 5, 0, NULL),
(163, 23, 54, 7, 1, NULL),
(164, 23, 48, 4, 1, NULL),
(165, 23, 91, 4, 0, NULL),
(166, 23, 55, 4, 0, NULL),
(167, 23, 94, 6, 1, NULL),
(168, 24, 58, 8, 1, NULL),
(169, 24, 78, 4, 1, NULL),
(170, 24, 20, 7, 1, NULL),
(171, 24, 82, 7, 0, NULL),
(172, 24, 18, 4, 0, NULL),
(173, 24, 85, 5, 1, NULL),
(174, 25, 58, 8, 1, NULL),
(175, 25, 43, 5, 1, NULL),
(176, 25, 55, 4, 0, NULL),
(177, 25, 21, 9, 1, NULL),
(178, 26, 89, 5, 1, NULL),
(179, 26, 96, 4, 1, NULL),
(180, 26, 53, 8, 1, NULL),
(181, 26, 83, 9, 1, NULL),
(182, 27, 91, 4, 1, NULL),
(183, 27, 7, 4, 1, NULL),
(184, 27, 31, 4, 1, NULL),
(185, 27, 8, 6, 1, NULL),
(186, 28, 45, 2, 1, NULL),
(187, 28, 65, 4, 1, NULL),
(188, 28, 15, 7, 1, NULL),
(189, 28, 48, 4, 1, NULL),
(190, 28, 67, 4, 0, NULL),
(191, 28, 14, 4, 0, NULL),
(192, 28, 62, 4, 0, NULL),
(193, 28, 94, 6, 1, NULL),
(194, 29, 92, 2, 1, NULL),
(195, 29, 12, 9, 1, NULL),
(196, 29, 67, 4, 0, NULL),
(197, 29, 20, 7, 1, NULL),
(198, 29, 14, 4, 0, NULL),
(199, 30, 85, 5, 1, NULL),
(200, 30, 65, 4, 1, NULL),
(201, 30, 15, 7, 1, NULL),
(202, 30, 48, 4, 1, NULL),
(203, 30, 67, 4, 0, NULL),
(204, 30, 14, 4, 0, NULL),
(205, 30, 62, 4, 0, NULL),
(206, 30, 71, 6, 0, NULL),
(207, 30, 8, 6, 0, NULL),
(208, 31, 27, 6, 1, NULL),
(209, 31, 15, 7, 1, NULL),
(210, 31, 76, 8, 0, NULL),
(211, 31, 52, 7, 1, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `coursemain`
--

CREATE TABLE IF NOT EXISTS `coursemain` (
  `CourseID` int(11) NOT NULL,
  `Name` varchar(250) DEFAULT NULL,
  `LongName` varchar(250) DEFAULT NULL,
  `ImgPath` varchar(250) DEFAULT NULL,
  `ImgOrg` varchar(250) DEFAULT NULL,
  `ImgLarge` varchar(250) DEFAULT NULL,
  `ImgMedium` varchar(250) DEFAULT NULL,
  `ImgSmall` varchar(250) DEFAULT NULL,
  `ImgThumb` varchar(250) DEFAULT NULL,
  `Description` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `coursemain`
--

INSERT INTO `coursemain` (`CourseID`, `Name`, `LongName`, `ImgPath`, `ImgOrg`, `ImgLarge`, `ImgMedium`, `ImgSmall`, `ImgThumb`, `Description`) VALUES
(1, 'Omelett', 'Omelett med ost og skinke', 'images/', 'dummyImg.png', 'dummyImg_L.png', 'dummyImg_M.png', 'dummyImg_S.png', 'dummyImg_thumb.png', '100g skinke, gjerne krydret\r\n1 potet\r\n10 cm purre\r\n3 egg\r\n3 ss melk\r\nEn klype salt\r\nLitt revet ost\r\nEventuelt litt pesto\r\n\r\nGjerne en frisk salat og/eller brød som tilbehør\r\n\r\nSlik gjør du\r\n\r\n1.Kutt poteter og skinke i terninger. Stek potetterningene på middels varme i litt olje i ca 5 minutter. Tilsett skinken, og stek videre i 2 minutter.\r\n2.Kutt purren og tilsett i pannen.\r\n3.Pisk sammen egg, melk og salt. Hell blandingen over i pannen og skru ned til svak varme. Ha over litt revet ost.\r\n4.Omeletten stekes på svak varme til den har satt seg – ca 12 minutter. Legg eventuelt litt grønn pesto på omeletten før servering.\r\n5.Server gjerne sammen med en fisk salat og brød.\r\n\r\nTips\r\n\r\nDersom du har en panne med stålhåndtak kan du steke omeletten i ovnen på 200C i ca 10 minutter. Da blir omeletten mer luftig.\r\n'),
(2, 'Eggerøre', 'God og enkel eggerøre', 'images/', 'dummyImg.png', 'dummyImg_L.png', 'dummyImg_M.png', 'dummyImg_S.png', 'dummyImg_thumb.png', NULL),
(3, 'Pannekaker', NULL, 'images/', 'dummyImg.png', 'dummyImg_L.png', 'dummyImg_M.png', 'dummyImg_S.png', 'dummyImg_thumb.png', NULL),
(4, 'Toast', 'Deilig sprø toast', 'images/', 'dummyImg.png', 'dummyImg_L.png', 'dummyImg_M.png', 'dummyImg_S.png', 'dummyImg_thumb.png', NULL),
(5, 'Kyllingsalat', 'nydelig sunn salat', 'images/', 'dummyImg.png', 'dummyImg_L.png', 'dummyImg_M.png', 'dummyImg_S.png', 'dummyImg_thumb.png', '2 Kyllingfileter\r\n1/2 rødløk\r\n1/2 pakke cherrytomater\r\n1/2 pakke (40 g) vasket og klar ruccolasalat\r\n3 ss flytende margarin\r\n100 g fetaost i terninger (Kan sløyfes)\r\n150 g pastaskruer\r\nSalt og pepper\r\nDressing:\r\n2 ss kesam\r\n1,5 ss pesto\r\nSaften av 1/4 sitron\r\nSlik gjør du\r\n1. Kok pasta etter anvisning på pakken\r\n2. Kutt rødløk i strimler, tomatene i to, og bland sammen med ruccolasalaten og fetaosten.\r\n3. Skjær kyllingen i terninger på ca 2×1 cm og krydre den godt med salt og pepper.\r\n4. Varm smøret i en stekepanne. Ha platen på sterkeste eller, nest sterkeste varme. Stek deretter kyllingen i 4-5 minutter. La kyllingen ligge urørt i pannen på høy varme mesteparten av tiden, slik får du en sprø og god kylling.\r\n5. Bland sammen ingrediensene til dressingen.\r\n6. Ha kyllingen i salaten, og server.\r\n'),
(6, 'Wrap', 'perfekt lunsj', 'images/', 'dummyImg.png', 'dummyImg_L.png', 'dummyImg_M.png', 'dummyImg_S.png', 'dummyImg_thumb.png', NULL),
(7, 'bagel', 'perfekt lunsj og frokost', 'images/', 'dummyImg.png', 'dummyImg_L.png', 'dummyImg_M.png', 'dummyImg_S.png', 'dummyImg_thumb.png', '1.Varm bagelen i brødrister (del først bagelen i to deler),  eller i ovn.\r\n2.Stek baconet på middels til høy varme i ca 1 min på hver side. Legg det så til sides.\r\n3.Stek speilegg av de to eggene. (Lite eller mye stekt, alt ettersom hvordan du liker de)\r\n4.Ha ost og bacon på det ene speilegget, legg deretter det andre speilegget på toppen.\r\n5.Komponer deretter bagelen som vist på bildet, og server gjerne med litt ketchup til å dyppe i.\r\n\r\nTips\r\n•Det er ikke alle norske butikker som selger bagels. Jeg kjøpte mine på Rema 1000.\r\n•Ha smør på bagelen om ønskelig\r\n'),
(8, 'chilligryte', NULL, 'images/', 'dummyImg.png', 'dummyImg_L.png', 'dummyImg_M.png', 'dummyImg_S.png', 'dummyImg_thumb.png', '1/2 løk\r\n1 rød paprika\r\n1 chili (kan sløyfes)\r\n1 boks mais\r\n1 boks hvite bønner i tomatsaus\r\n1 boks hakkede tomater\r\n1 terning kjøttbuljong\r\n1 boks kokte linser\r\n Krydder (se fremgangsmåte)\r\n\r\nSlik gjør du:\r\n1.Begynn med å tømme boksene med linser og mais i en sil og skyll godt.\r\n2.Hakk løk og paprika (og chilifrukt, hvis du liker det sterkt), og fres i smør eller olje. Når løken begynner å se blank og gjennomsiktig ut, hell ned de hakkede tomatene, så mais, linser og bønnene i tomatsaus (du kan ev tømme ut litt av tomatsausen, men ikke alt, fra bønneboksen hvis du ikke er veldig glad i smaken av det.)\r\n3.Tøm oppi ca en desiliter vann, og legg i kjøttbuljongterningen. Senk varmen og la koke inn (jo lenger du koker det, jo mer får du vekk av råsmaken fra de hakkede tomatene, og jo mer kommer smakene frem fra ingrediensene, bare husk å røre slik at det ikke brenner seg fast!)\r\n4.Noen minutter før servering har du ned de krydder du vil ha (jeg anbefaler salt, pepper og spisskummen for å få en god, tacoaktig smak, så litt basilikum for å balansere med tomatene.) Hvis røren blir for tynn og vannaktig, rør ned noen msk med maizena blandet med vann (slik at det ikke klumper seg.) Gryten kan varieres med mye forskjellige ingredienser (gulrot, flere typer paprika, etc.), og hvis du vil kan du med fordel servere dette sammen med nachos og rømme, eller i tacolefse med salat, rømme og ost.\r\n5.Nyt måltidet!\r\n'),
(9, 'potetmos', NULL, 'images/', 'dummyImg.png', 'dummyImg_L.png', 'dummyImg_M.png', 'dummyImg_S.png', 'dummyImg_thumb.png', '1. Skrell poteter og dem i biter. Legg dem i kokende vann med purre. Kok det mørt, ca. 10 minutter. Ikke bruk salt i vannet.\r\n2. Slå av vannet, og mos potetene.\r\n3. Tillsett melk, smør og krydder, og rør godt mens potetmosen får et oppkok.\r\n'),
(10, 'pølser', NULL, 'images/', 'dummyImg.png', 'dummyImg_L.png', 'dummyImg_M.png', 'dummyImg_S.png', 'dummyImg_thumb.png', 'Slik trekker du pølser:\r\n\r\n1. Kok opp rikelig med vann i en stor kaserolle. Pølsene skal dekkes med vann. Tilsett gjerne en terning kjøttbuljong (pølsebuljong) i vannet om du ønsker mer smak i pølsene.\r\n\r\n2. Ta kjelen til side. Legg i pølsene, og la de trekke UNDER LOKK i ca 5 minutter. \r\n3. Pølsene serveres rett fra kjelen på bordet. Pølser skal ikke stables på serveringsfatfat, da blir de tørre, skukkete og seige\r\n\r\nTIPS! Fremgangsmåten over er ideell for wienerpølse. Skal du servere trekt grillpølse eller middagspølse som ligger vakumpakket med litt lake i pakningen, da kan du prøve følgende fremgangsmåte: stikk ett lite hull i plasten, og legg hele pakningen til trekking i gryta. Da trekker pølsene i sin egen "saft", og blir enda mer smaksrike. \r\n'),
(11, 'havregrøt', 'mettende frokost eller lunsj', 'images/', 'dummyImg.png', 'dummyImg_L.png', 'dummyImg_M.png', 'dummyImg_S.png', 'dummyImg_thumb.png', '1   dl   Havregryn    \r\n1   dl   Melk    \r\n1.5   dl   Vann    \r\n0.25   ts   Salt    \r\n1   ts   Jordbærsyltetøy    \r\n1   ss   Rosiner Ha melk, vann og havregryn i en kasserolle. \r\n\r\nKok opp under omrøring. La grøten småkoke i ca. 5 minutter til den er passe tykk. \r\n\r\nSmak til med litt salt før servering. \r\n\r\nServer med syltetøy og rosiner.\r\n'),
(12, 'tortellini suppe', NULL, 'images/', 'dummyImg.png', 'dummyImg_L.png', 'dummyImg_M.png', 'dummyImg_S.png', 'dummyImg_thumb.png', 'Kok opp 8 dl hønsebuljong og tilsett 4 ss olje. Kok tortellini eter anvisning. Smak til med pepper og salt og legg eventuelt i noen skiver stekt pepperoni eller kalkunkorv. Litt revet ost. 4 porsjoner 20 mi'),
(13, 'spinatsuppe', NULL, 'images/', 'dummyImg.png', 'dummyImg_L.png', 'dummyImg_M.png', 'dummyImg_S.png', 'dummyImg_thumb.png', 'Finhakk 4 hvitløksfedd og 1/2 løk, fres i litt olje. Forvell fersk spinat i 10-15 sekunder. Hvis du bruker frossen spinat må den presses for vann. Legg spinaten i pannen og fres i 1-2 minutter. Tilsett 1 liter buljong. Skrell to store poteter, skjær dem i tynne skiver og legg i suppen. La det småkoke i ca 20 min . Smak til med salt og pepper. Tilsett 3 dl fløte og kjør suppen i foodprocessor/stavmikser'),
(14, 'potetsuppe', NULL, 'images/', 'dummyImg.png', 'dummyImg_L.png', 'dummyImg_M.png', 'dummyImg_S.png', 'dummyImg_thumb.png', 'Sett over 1 1/2 liter vann. Tilsett 2 buljongterninger og 2 ss smør. Skrell 5-6 poteter og skjær dem i terninger. Skjær en gulrot, det hvite på purren og 1 løk i skiver. Legg alt i den kokende buljongen og smak til med salt og pepper. Kok til poteter og grønnsaker er møre. Ta gryten bort fra platen og rør inn 1 dl rømme eller fløte. Server potetsuppen med sprøstekt bacon og ferskt brød. 4 porsjoner 30 mi'),
(15, 'kyllingsuppe', NULL, 'images/', 'dummyImg.png', 'dummyImg_L.png', 'dummyImg_M.png', 'dummyImg_S.png', 'dummyImg_thumb.png', 'kok ris. Skjær kyllingen i biter, del et eple i terninge, finhakk 1 løk, smelt 2 ss smør i en kjele, fres alt smøret og tilsett 1 ss karri, 1 l vann, 2 buljongterninger og 3 dl creme fraiche. Rør inn en jevning av litt vann og hvetemel. La suppen småkoke i ca 10 minutter. Smak til med salt, pepper og 1 tsk sukker. Rør inn 1-2 dl ferdig kokt ris. server med wraps eller baguetter. 4 porsjoner 25 mi'),
(16, 'spekeskinke med balsamicopoteter', NULL, 'images/', 'dummyImg.png', 'dummyImg_L.png', 'dummyImg_M.png', 'dummyImg_S.png', 'dummyImg_thumb.png', 'skjær poteter i store terninger og kok i lettsaltet vann. Skjær løken i skiver. Bland tre deler olje og en del balsamico eddik og hell over de lune potetene. Server potetene med spekeskinke, rødløk og tomater. 4 pors 20 min.'),
(17, 'kjøttboller i tomatsaus', NULL, 'images/', 'dummyImg.png', 'dummyImg_L.png', 'dummyImg_M.png', 'dummyImg_S.png', 'dummyImg_thumb.png', 'Varm opp kjøttboller i tomatsausen. Smak til med nykvernet pepper. Server med salat, poteter eller potetstappe med fetaost på toppen. Gjerne en grønn salat ved side'),
(18, 'kalkunpanetter', NULL, 'images/', 'dummyImg.png', 'dummyImg_L.png', 'dummyImg_M.png', 'dummyImg_S.png', 'dummyImg_thumb.png', 'Stek kalkunpanetter som anvist. Skjær gulrøttene i staver. Smelt 2 ss smør i en panne og stek gulrøttene i 8-10 minutter. Tilsett spinaten, 2 finhakkede hvitløksfedd og ca 2 ss olivenolje. Krydre med salt og pepper og la det surre i to minutter. Server med poteter eller ris eller potetmos. 4 porsjoner 20 minutter'),
(19, 'frittata med spinat og paprika', NULL, 'images/', 'dummyImg.png', 'dummyImg_L.png', 'dummyImg_M.png', 'dummyImg_S.png', 'dummyImg_thumb.png', 'Kok opp lettsaltet vann og rilsett en pose fersk spinat. La det koke i noen få sekunder. Kutt spinaten i små biter. Skjær 2 paprikaer i terninger. Rør sammen 8 egg og tilsett spinat, paprika og øsnket mengde skinke. Varm 3 ss olivenolje i en panne og hell over eggeblandingen. Når eggene har swtivnet, ta et lokk eller stor tallerken og snu omeletten. Tilsett et par ss olje i pannen og stek på den an dre siden til den er kalr. Server med stekte poteter og tomater. 4 porsjoner 15 mi'),
(20, 'pasta bolognese', NULL, 'images/', 'dummyImg.png', 'dummyImg_L.png', 'dummyImg_M.png', 'dummyImg_S.png', 'dummyImg_thumb.png', 'Kok pasta. Stek kjøttdeig og bland i sausen. Server'),
(21, 'ravioli med tomatsaus', NULL, 'images/', 'dummyImg.png', 'dummyImg_L.png', 'dummyImg_M.png', 'dummyImg_S.png', 'dummyImg_thumb.png', 'Kok pastaen. Varm pastasausen og bland sammen med pastaen. Server med parmesan, salat etter ønske og baguett.'),
(22, 'spagetti marinara', NULL, 'images/', 'dummyImg.png', 'dummyImg_L.png', 'dummyImg_M.png', 'dummyImg_S.png', 'dummyImg_thumb.png', 'Kok pastaen. Hell olje i pannen og legg i en 1 finhakket løk og 3 hvitløksfedd. Stek i olje og eventuelt hvitvin elelr eplejuice, og la det putre i ca. 15 minutter. Sett til side og tilsett skalldyrmiksen uten lake. Bland sausen godt sammen med den ferdigkokte pastaen og smak til med pepper. 4 porsjoner 25 mi'),
(23, 'tortilla lefser', NULL, 'images/', 'dummyImg.png', 'dummyImg_L.png', 'dummyImg_M.png', 'dummyImg_S.png', 'dummyImg_thumb.png', 'Varm lefsene etter ansvisning på pakken, stek kjøttdeig og skjær ingrediensene. Legg i lefsene og spis.'),
(24, 'farfalle med skinke', NULL, 'images/', 'dummyImg.png', 'dummyImg_L.png', 'dummyImg_M.png', 'dummyImg_S.png', 'dummyImg_thumb.png', 'Smelt 3 ss smør i en kjele og stek 3 finhakkende sjalottløk til løken er myk. Ha i 2 dl fløte og 1 boks snøfrisk og varm opp.  Ha i erter ca 250 gr og la det småkoke i 3-4 minutte. Smak til med salt og pepper. Skjær skinken i grove stimler og plan di pastaen sammen med sausen. Klipp over persille og server.'),
(25, 'pasta med kylling', NULL, 'images/', 'dummyImg.png', 'dummyImg_L.png', 'dummyImg_M.png', 'dummyImg_S.png', 'dummyImg_thumb.png', 'Kok pasta, og bland inn ca 1 dl dressing. Stek kyllingbrystene i en varm panne i 2 -3 minutter ogla dem hvile. Stek aspargesbønner og 2 paprika i strimler i olivenolje, til de har blitt møre. Server pastaen med kylling, asparges og paprika på toppen. 4 porsjoner 20 min.'),
(26, 'nudler med strimlet svinekjøtt', NULL, 'images/', 'dummyImg.png', 'dummyImg_L.png', 'dummyImg_M.png', 'dummyImg_S.png', 'dummyImg_thumb.png', 'Kok opp 1,2 liter vann, tilsett nudelkrydderet og legg i kjøttet. Kok opp og la det trekke i 2 minutter. Tilsett nudler og grønnsaker og la alt trekke i ca 3. minutter. Smak til med soyasaus, slat og pepper. Ca 4 porsjoner 15 mi'),
(27, 'bruschetta', NULL, 'images/', 'dummyImg.png', 'dummyImg_L.png', 'dummyImg_M.png', 'dummyImg_S.png', 'dummyImg_thumb.png', 'Varm olivenolje i en panne. Stek brødet til det blir sprøtt og gyllent. Bland tomater, løk, hvitløk, basilikum og olivenolje i en bolle. Smak til med salt og pepper. Fordel blandingen på det stekte brødet. Serveres sammen med skiver av spekeskinke.'),
(28, 'laksetortillla', NULL, 'images/', 'dummyImg.png', 'dummyImg_L.png', 'dummyImg_M.png', 'dummyImg_S.png', 'dummyImg_thumb.png', 'Skjær 6 kokte poteter og 2 løk i skvier. Visp 4 egg og 1 dl melk og krydre med salt og pepepr. Fres 1 ss smø i pannen og legg i poteter og løk. Stek på middels varme til løken er myk. Slå eggene over potetene og løft forsiktig slik at eggene fordeles mellom potetskivene. Stek på svak varme til eggeblandningen har stivnet. Skjær en 1/2 purre i ringer og legg på tortilaen sammen med lakseskivene. server med brød.'),
(29, 'ovnsbakt torsk', NULL, 'images/', 'dummyImg.png', 'dummyImg_L.png', 'dummyImg_M.png', 'dummyImg_S.png', 'dummyImg_thumb.png', 'Smelt 3 ss smør i en panne. Skjær 1 purre i skiver og stek på svak varme til den har blitt myk. Hell purren over i en ildfast form og legg på torsk i serveringsstykker. Bland 5 ss chilisaus, 2 dl fløte og ca 1 dl finhakket dill. Hell blandingen over fisken og stek i ovnen på 220 gra der i 20 min. server med ris'),
(30, 'spekeskinketortilla', NULL, 'images/', 'dummyImg.png', 'dummyImg_L.png', 'dummyImg_M.png', 'dummyImg_S.png', 'dummyImg_thumb.png', 'Skjær 6 kokte poteter og 2 løk i skvier. Visp 4 egg og 1 dl melk og krydre med salt og pepepr. Fres 1 ss smø i pannen og legg i poteter og løk. Stek på middels varme til løken er myk. Slå eggene over potetene og løft forsiktig slik at eggene fordeles mellom potetskivene. Stek på svak varme til eggeblandningen har stivnet. Skjær en 1/2 purre i ringer og legg på tortilaen sammen med spekeskinke. server med brød.'),
(31, 'havrepannekaker', 'god frokost eller lunsj', 'images/', 'dummyImg.png', 'dummyImg_L.png', 'dummyImg_M.png', 'dummyImg_S.png', 'dummyImg_thumb.png', 'bland 3 desiliter havre med tre normalt store egg, ha oppi 1 desiliter melk ig rør sammen. tisett en halv ts salt. Stek med smør. Stek til gyllenbrun farge.');

-- --------------------------------------------------------

--
-- Структура таблицы `ingredients`
--

CREATE TABLE IF NOT EXISTS `ingredients` (
  `IngredientID` int(11) NOT NULL,
  `Name` varchar(250) NOT NULL,
  `CategoryID` int(11) NOT NULL,
  `MeasurementID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `ingredients`
--

INSERT INTO `ingredients` (`IngredientID`, `Name`, `CategoryID`, `MeasurementID`) VALUES
(1, 'agurk', 4, 1),
(2, 'agurkmiks', 9, 5),
(3, 'baco', 5, 3),
(4, 'bagel', 6, 6),
(5, 'baguette', 6, 6),
(6, 'balsamicoeddik', 9, 5),
(7, 'basilikum', 4, 4),
(8, 'brød', 6, 6),
(9, 'buljong', 8, 3),
(10, 'buljongterninger', 8, 6),
(11, 'chili', 4, 3),
(12, 'chilisaus', 9, 5),
(13, 'Creme fraiche', 7, 5),
(14, 'Dill', 4, 6),
(15, 'Egg', 7, 6),
(16, 'eple', 3, 6),
(17, 'eplejuice', 1, 2),
(18, 'erter', 4, 3),
(19, 'fetaost ', 7, 3),
(20, 'fløte', 7, 2),
(21, 'fransk dressing', 9, 5),
(22, 'grønn salat', 4, 6),
(23, 'grønnsaker', 4, 4),
(24, 'grønnsaksbuljong', 8, 4),
(25, 'gulrot', 4, 6),
(26, 'hakkede tomater', 4, 6),
(27, 'Havregry', 6, 2),
(28, 'hermetiske tomater', 8, 6),
(29, 'hvetemel', 8, 2),
(30, 'hvite bønner i tomatsaus', 8, 6),
(31, 'hvitløk', 4, 6),
(32, 'hvitløksbrød', 6, 6),
(33, 'hvitvi', 1, 2),
(34, 'kalkunkorv', 5, 3),
(35, 'kalkunpanetter', 5, 3),
(36, 'karri', 8, 6),
(37, 'ketchup', 9, 3),
(38, 'kjøttboller', 5, 3),
(39, 'kjøttbuljong', 8, 6),
(40, 'kjøttdeig', 5, 3),
(41, 'kokte linser', 4, 3),
(42, 'kylling', 5, 6),
(43, 'kyllingbryst', 5, 6),
(44, 'kyllingfileter', 5, 6),
(45, 'laks', 2, 3),
(46, 'linfrø', 8, 3),
(47, 'lomper', 6, 6),
(48, 'løk', 4, 6),
(49, 'mais', 4, 3),
(50, 'margari', 7, 3),
(51, 'mel', 8, 2),
(52, 'melk', 7, 2),
(53, 'nudler', 8, 3),
(54, 'ost', 7, 3),
(55, 'paprika', 4, 6),
(56, 'parmesa', 7, 5),
(57, 'pasta', 8, 3),
(58, 'Pasta (farfalle)', 8, 3),
(59, 'pastasaus', 9, 6),
(60, 'pepper', 8, 7),
(61, 'pepperoni', 5, 3),
(62, 'persille', 4, 6),
(63, 'peso', 9, 7),
(64, 'pesto', 9, 7),
(65, 'Potet', 4, 6),
(66, 'potetsalat', 7, 3),
(67, 'purre', 4, 6),
(68, 'Pølse', 5, 3),
(69, 'Ravioli (fersk pasta)', 8, 3),
(70, 'rekesalat', 2, 3),
(71, 'ris', 6, 2),
(72, 'rosiner', 8, 3),
(73, 'rødløk', 4, 6),
(74, 'rømme', 7, 5),
(75, 'salat', 4, 6),
(76, 'salt ', 8, 7),
(77, 'sennep', 9, 3),
(78, 'sjalottløk', 4, 6),
(79, 'Skalldyrsmiks i lake', 2, 6),
(80, 'skinke', 5, 3),
(81, 'smør', 7, 3),
(82, 'snøfrisk', 7, 3),
(83, 'soyasaus', 9, 7),
(84, 'spagetti', 8, 3),
(85, 'spekeskinke', 5, 3),
(86, 'spinat', 4, 4),
(87, 'stekt løk', 8, 3),
(88, 'sukker', 8, 7),
(89, 'Svinekjøtt', 5, 3),
(90, 'syltetøy', 9, 5),
(91, 'tomat', 4, 6),
(92, 'torsk (frossen)', 2, 3),
(93, 'tortellini', 8, 3),
(94, 'tortilla lefser', 6, 6),
(95, 'van', 1, 2),
(96, 'wokgrønnsaker', 4, 3),
(97, 'wraps ', 6, 6);

-- --------------------------------------------------------

--
-- Структура таблицы `measurements`
--

CREATE TABLE IF NOT EXISTS `measurements` (
  `MeasurementID` int(11) NOT NULL,
  `Name` varchar(24) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `measurements`
--

INSERT INTO `measurements` (`MeasurementID`, `Name`) VALUES
(1, 'cm'),
(2, 'dl'),
(3, 'g'),
(4, 'pakke'),
(5, 'ss'),
(6, 'stk'),
(7, 'teskje');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `categories`
--
ALTER TABLE `categories`
 ADD PRIMARY KEY (`CategoryID`);

--
-- Индексы таблицы `coursemain`
--
ALTER TABLE `coursemain`
 ADD PRIMARY KEY (`CourseID`);

--
-- Индексы таблицы `ingredients`
--
ALTER TABLE `ingredients`
 ADD PRIMARY KEY (`IngredientID`);

--
-- Индексы таблицы `measurements`
--
ALTER TABLE `measurements`
 ADD PRIMARY KEY (`MeasurementID`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
