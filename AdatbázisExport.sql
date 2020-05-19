-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2020. Máj 19. 20:26
-- Kiszolgáló verziója: 10.4.8-MariaDB
-- PHP verzió: 7.3.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `blog`
--

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- A tábla adatainak kiíratása `categories`
--

INSERT INTO `categories` (`id`, `user_id`, `name`, `created_at`) VALUES
(1, 1, 'Xbox', '2020-05-09 15:25:44'),
(2, 1, 'Kibertámadás', '2020-05-09 15:25:44'),
(3, 2, 'Nincs a listán a kategóriája', '2020-05-09 15:50:22'),
(4, 2, 'Kategoria test', '2020-05-09 18:14:44'),
(7, 1, 'awedad', '2020-05-19 17:16:48');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `comments`
--

CREATE TABLE `comments` (
  `id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `body` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- A tábla adatainak kiíratása `comments`
--

INSERT INTO `comments` (`id`, `post_id`, `name`, `email`, `body`, `created_at`) VALUES
(1, 1, 'Teszt Elek', 'teszt@elek.com', '0', '2020-05-10 07:57:50'),
(2, 1, 'Teszt Elek', 'teszt@elek.com', '0', '2020-05-10 08:12:52'),
(3, 1, 'Teszt Elek', 'teszt@elek.com', '0', '2020-05-10 08:15:29'),
(4, 1, 'Teszt Elek', 'teszt@elek.com', '0', '2020-05-10 08:17:01'),
(5, 1, 'Donkó Márk', 'donkomark@gmail.com', 'MÚKÖDJ MÁÁÁÁÁÁR', '2020-05-10 08:18:05');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `posts`
--

CREATE TABLE `posts` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `body` text NOT NULL,
  `post_image` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `category_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- A tábla adatainak kiíratása `posts`
--

INSERT INTO `posts` (`id`, `title`, `slug`, `body`, `post_image`, `created_at`, `category_id`, `user_id`) VALUES
(1, 'Saját lábra állva törne be a PC-piacra a Huawei', 'Sajat-labra-allva-torne-be-a-PC-piacra-a-Huawei', '<p>A Huawei az Egyes&uuml;lt &Aacute;llamok szankci&oacute;i ut&aacute;n erőteljesen l&eacute;pked abba az ir&aacute;nyba, hogy saj&aacute;t l&aacute;bra tudjanak &aacute;llni. Ez nyilv&aacute;n kock&aacute;zatosnak tekinthető, de sok v&aacute;laszt&aacute;st nem hagytak a c&eacute;g sz&aacute;m&aacute;ra, &iacute;gy megpr&oacute;b&aacute;lnak annyira f&uuml;ggetlenek lenni, amennyire az csak lehets&eacute;ges.A Huawei Central inform&aacute;ci&oacute;i szerint k&eacute;sz&uuml;l is a Kunpeng Desktop Board, ami egy PC-piacra sz&aacute;nt platform lenne. Az alapj&aacute;t a Kunpeng 920-as processzor adn&aacute;, n&eacute;gy vagy nyolc darab, 2,6 GHz-en ketyegő ARMv8.2-es maggal. Maga a Kunpeng 920 nem tekinthető &uacute;jdons&aacute;gnak, r&eacute;gebben bejelentett&eacute;k m&aacute;r, &eacute;s viszonylag t&aacute;g hat&aacute;rok k&ouml;z&ouml;tt sk&aacute;l&aacute;z&oacute;dik, hiszen a 7 nm-es node-on k&eacute;sz&uuml;lő fejleszt&eacute;s legjobb modelljei 64 magot is k&iacute;n&aacute;lnak, nyolccsatorn&aacute;s DDR4-es mem&oacute;riavez&eacute;rlő, illetve PCI Express 4.0 &eacute;s CCIX interf&eacute;sz t&aacute;mogat&aacute;sa mellett. Ezek nyilv&aacute;n a szerverpiacot c&eacute;lozz&aacute;k, de tervezhetők kisebb lapk&aacute;k, amelyek visszafogottabb param&eacute;terek mellett bevethetők p&eacute;ld&aacute;ul az asztali szegmensben is.A sz&oacute;ban forg&oacute; alaplapon n&eacute;gy darab DIMM csatol&oacute; lesz, amelyek 64 GB-nyi DDR4-es mem&oacute;ri&aacute;t kezelnek, hat darab 6 Gbps-os SATA interf&eacute;sz v&aacute;rja az adatt&aacute;rol&oacute;kat, k&eacute;t M.2-es csatol&oacute;val kieg&eacute;sz&iacute;tve, m&iacute;g a bőv&iacute;tők&aacute;rty&aacute;k egy x16-os, egy x4-es &eacute;s egy x1-es PCI Express 3.0-s slotba helyezhetők. Elvileg maga a processzor t&aacute;mogatja a PCI Express 4.0-t, de azt tudni kell, hogy a nagyobb s&aacute;vsz&eacute;less&eacute;g biztos&iacute;t&aacute;sa a nyomtatott &aacute;ramk&ouml;ri lap szintj&eacute;n dr&aacute;g&aacute;bb, teh&aacute;t elk&eacute;pzelhető olyan &uuml;zleti d&ouml;nt&eacute;s, amely miatt erről a k&eacute;pess&eacute;gről ink&aacute;bb lemondanak az&eacute;rt, hogy kedvezőbb lehessen a teljes rendszer elő&aacute;ll&iacute;t&aacute;si k&ouml;lts&eacute;ge &eacute;s ezzel egy&uuml;tt az &aacute;ra. Term&eacute;szetesen a szok&aacute;sos portok nem hi&aacute;nyoznak, &iacute;gy lesz gigabites Ethernet, illetve p&aacute;r USB 2.0-s &eacute;s 3.0-s aljzat. A platformhoz elvileg &eacute;rkezik a Harmony OS 2.0 is, amely a kor&aacute;bban leleplezett oper&aacute;ci&oacute;s rendszer tov&aacute;bbfejleszt&eacute;se, v&eacute;lhetően olyan ir&aacute;nyba, hogy az asztali piacon is meg&aacute;llja a hely&eacute;t. A Huawei a fejleszt&eacute;ssel a k&iacute;nai piacot c&eacute;lozhatja majd, &eacute;s ott tal&aacute;n m&eacute;g es&eacute;ly&uuml;k is van a sikerre, de az&eacute;rt el&eacute;g sok m&eacute;g a k&eacute;rd&eacute;s, amit majd csak egy k&eacute;sőbbi hivatalos bejelent&eacute;s tiszt&aacute;zhat.</p>\r\n', 'noimage.png', '2020-05-09 09:54:02', 3, 0),
(2, 'Kibertámadás érte a Stadler nemzetközi IT-rendszerét', 'Kibertamadas-erte-a-Stadler-nemzetkozi-IT-rendszeret', '<p>Az &uuml;gyben hat&oacute;s&aacute;gi &eacute;s &aacute;tfog&oacute; v&aacute;llalati nyomoz&aacute;s zajlik jelenleg &ndash; k&ouml;z&ouml;lte a v&aacute;llalatcsoport sajt&oacute;oszt&aacute;lya cs&uuml;t&ouml;rt&ouml;k&ouml;n este az MTI-vel. Hangs&uacute;lyozt&aacute;k, hogy az &eacute;rintett rendszerek &uacute;jraind&iacute;t&aacute;sa folyamatban van, a koronav&iacute;rus okozta j&aacute;rv&aacute;nyhelyzet &eacute;s a kibert&aacute;mad&aacute;s ellen&eacute;re az &uacute;j j&aacute;rművek gy&aacute;rt&aacute;sa, a j&aacute;rművek karbantart&aacute;sa tov&aacute;bbra is biztos&iacute;tott. A t&aacute;j&eacute;koztat&aacute;s szerint a c&eacute;g belső ellenőrz&eacute;si rendszere felt&aacute;rta, hogy a c&eacute;gcsoport informatikai h&aacute;l&oacute;zat&aacute;t rosszindulat&uacute; szoftvert&aacute;mad&aacute;s &eacute;rte, amely nagy val&oacute;sz&iacute;nűs&eacute;ggel adatsziv&aacute;rg&aacute;shoz vezetett, a nagys&aacute;grend meghat&aacute;roz&aacute;s&aacute;hoz tov&aacute;bbi vizsg&aacute;lat sz&uuml;ks&eacute;ges. A Stadler azt felt&eacute;telezi, hogy az incidens egy ismeretlen elk&ouml;vetők &aacute;ltal v&eacute;grehajtott, professzion&aacute;lisan szervezett t&aacute;mad&aacute;s eredm&eacute;nye. Az elk&ouml;vetők a Stadlertől nagy mennyis&eacute;gű p&eacute;nzt k&ouml;vetelnek, &eacute;s azzal fenyegetik a v&aacute;llalatcsoportot, hogy a megszerzett adatok nyilv&aacute;noss&aacute;gra hozatal&aacute;val k&aacute;rokat okoznak a t&aacute;rsas&aacute;gnak &eacute;s munkav&aacute;llal&oacute;inak egyar&aacute;nt &ndash; ismertett&eacute;k a k&ouml;zlem&eacute;nyben. Kiemelt&eacute;k, hogy a Stadler a sz&uuml;ks&eacute;ges biztons&aacute;gi int&eacute;zked&eacute;seket azonnal megtette, az &uuml;gy kezel&eacute;s&eacute;be k&uuml;lső szak&eacute;rtőkből &aacute;ll&oacute; csapatot, illetve az illet&eacute;kes hat&oacute;s&aacute;gokat vontak be. A t&aacute;rsas&aacute;g biztons&aacute;gi ment&eacute;sei teljes eg&eacute;sz&eacute;ben hozz&aacute;f&eacute;rhetők &eacute;s műk&ouml;dők&eacute;pesek.</p>\r\n', 'noimage.png', '2020-05-09 09:54:02', 2, 0),
(3, 'Inside Xbox (Május) - Az összes bejelentés egy helyen', 'Inside-Xbox-Majus-Az-osszes-bejelentes-egy-helyen', 'Április utolsó napján érkezett a hír, hogy küszöbön van egy újabb Inside Xbox előadás, ahol a középpontban az újgenerációs játékok lesznek, vagy legalábbis azok, amelyek az új konzolra is megjelenik (Pl.: a Smart Delivery szolgáltatásnak köszönhetően). A stream alatt egy tucatnyi friss trailert kaptunk a 2020-ban és 2021-ben megjelenő programokból, ezeket láthatjátok lentebb.A Bright Memory alap kiadása már egy ideje elérhető PC-n, azonban készül a bővített változat, amely az Infinite címet viseli. Ez utóbbiről láthattunk már korábban előzetest, azonban a műsor első vendégeként kiderült, hogy bizony Xbox Series X-re is megjelenik a különlegesnek szánt FPS.Az elmúlt napokban több jel is utalt arra, hogy bejelentésre készül a Codemasters, ezek között volt a hivatalosa DIRT közösségi csatornákon a logó megváltoztatása. Úgy tűnik, hogy a várakozás eddig tartott, leleplezték nekünk ugyanis a DIRT 5-öt, amely első ránézésre a Forza Horizon babérjaira kíván törni egyes elemeiben, de ami talán fontosabb, hogy mindezt 4K és 120FPS társaságában teszi majd Xbox Series X-en.Alig hisszük el, de már közel 6 éve, hogy 2014-ben bejelentették nekünk a SCORN című FPS-t, amelynek dizájnját szemmel láthatóan H.R. Giger ihlette, azonban a megjelenési dátum a mai napig nem ismert. Mivel a mai Inside Xbox-on a 2020/21-ben érkező programokról szólt, így külön izgatottak lettünk, hogy az Xbox Series X-re is bejelentett program is egy friss trailert kapott.Nem is kellett sokat várni arra, hogy a Microsoft műsorán az első, teljesen új IP is bemutatkozzon a CHORUS személyében. A lentebb látható trailer első ránézésre a Control képi világát jutatta az eszünkbe, azonban a speciális program egy űrharcokra kihegyezett sci-fi lesz. Szeretjük a stílust, így tűkön ülve várjuk, hogy milyen lesz a végeredmény.Több mint egy éve már, hogy leleplezték nekünk a Vampire: The Masquerade - Bloodlines 2-t, amely a tervek szerint valamikor idén év végén érkezik. A Hardsuit Labs pontosabb dátumot továbbra sem osztott meg velünk, azonban érkezett egy friss előzetes, érdemes lehet megnézni.A vámpírok után egy újabb friss program mutatkozott be a streamen, ezúttal a rajzfilmes grafikájú Call of the Sea-hez érkezett egy bemutató. Ebben az 1930-as években játszódó alkotásban egy rejtélyes sziget felfedezése lesz a feladatunk, miközben különböző fejtörőket kell megoldanunk ahhoz, hogy egy nagyobb titkot is megfejtsünk.Szeretitek a cyberpunk témát és a top-down shootereket? Akkora a The Ascent a ti játékotok lesz. Ebben az izometrikus nézetű RPG-ben egyedül, vagy akár kooperatív módban egy barátunkkal is szembeszállhatunk a világot uraló Megavállalatok és azok harcosai ellen.Akik szeretnek borzongani, azoknak jó hír lehet, hogy érkezik a The Medium, amely a leírás szerint egy újgenerációs pszichológiai horror lesz, amelyben egy médiumot irányítva kell a valós és a szellemvilág között lavíroznunk úgy, hogy mindkét oldalon rémségek várnak ránk. A projekt különlegessége, hogy a zenei felhozatalért az az Akira Yamaoka felel, akinek a neve a Silent Hill után lehet ismerős.A távoli jövőben az emberiség utolsó reménységei egy csoport mentálisan felturbozótt, pszionikus képességekkel rendelkező katona, akik a világunkat ostromló ellenfelek hada ellen vonul csatában. A Scarlet Nexus képi világa a Nintendo Switch-re megjelent Astral Chainre hajaz szerintünk, de a hasonlóság természetesen ennyiben ki is merül.Amikor először megláttuk a Second Extinction című játék előzetesét, egyből a Dino Crisis sorozat jutott az eszünkbe, de természetesen csak annyi a közös a két alkotásban, hogy őshüllőkre kell vadásznunk. A most bemutatott alkotásban egy idegen bolygón kell a dínókat semlegesíteni, de mindezt nem egyedül, hanem egy maximum 3 fős csapatban, egymással összedolgozva kell megtennünk, ehhez pedig számos eszköz a rendelkezésünkre áll majd.\r\n\r\nA SEGA az Inside Xbox keretében bejelentette, hogy az elismert Yakuza sorozat következő robbanékony része, a Yakuza: Like a Dragon nyitócímként lesz elérhető a következő generációs Xbox Series X konzolra, valamint szimultán az Xbox termékcsalád többi tagjára, PlayStation 4-re és PC-re.\r\n\r\nMinden bizonnyal sokan várták a Microsoft eseményének az egyik kiemelt pontját, amelyen az Assassin\'s Creed: Valhallát mutatták be nekünk a fejlesztők. Néhány órája kiderült, hogy nem egy hosszabb gameplay bemutatóra kell számítanunk, így mindössze a lentebb látható gameplay trailernek nevezett videót kaptuk meg.\r\n\r\nA fentebb látható videók és trailerek csak a kezdet, az elkövetkező hetekben és hónapokban számos új bejelentés és bemutató várható, a Microsoft belsős stúdiónak címeit például júliusban láthatja a nagyközönség.\r\n\r\n\r\n\r\n', 'noimage.png', '2020-05-09 12:05:29', 1, 0),
(6, 'áéőűáagi', 'aeouaagi', '<p>asdasd asd Minden bizonnyal sokan v&aacute;rt&aacute;k a Microsoft esem&eacute;ny&eacute;nek az egyik kiemelt pontj&aacute;t, amelyen az Assassin&#39;s Creed: Valhall&aacute;t mutatt&aacute;k be nek&uuml;nk a fejlesztők. N&eacute;h&aacute;ny &oacute;r&aacute;ja kider&uuml;lt, hogy nem egy hosszabb gameplay bemutat&oacute;ra kell sz&aacute;m&iacute;tanunk, &iacute;gy mind&ouml;ssze a lentebb l&aacute;that&oacute; gameplay trailernek nevezett vide&oacute;t kaptuk meg. A fentebb l&aacute;that&oacute; vide&oacute;k &eacute;s trailerek csak a kezdet, az elk&ouml;vetkező hetekben &eacute;s h&oacute;napokban sz&aacute;mos &uacute;j bejelent&eacute;s &eacute;s bemutat&oacute; v&aacute;rhat&oacute;, a Microsoft belsős st&uacute;di&oacute;nak c&iacute;meit p&eacute;ld&aacute;ul j&uacute;liusban l&aacute;thatja a nagyk&ouml;z&ouml;ns&eacute;g.</p>\r\n', 'noimage.png', '2020-05-09 12:45:20', 2, 0),
(9, 'Inside Xbox (Május) - Az összes bejelentés egy helyen', 'Inside-Xbox-Majus-Az-osszes-bejelentes-egy-helyen', '<p>&Aacute;prilis utols&oacute; napj&aacute;n &eacute;rkezett a h&iacute;r, hogy k&uuml;sz&ouml;b&ouml;n van egy &uacute;jabb&nbsp;<strong>Inside Xbox</strong>&nbsp;előad&aacute;s, ahol a k&ouml;z&eacute;ppontban az &uacute;jgener&aacute;ci&oacute;s j&aacute;t&eacute;kok lesznek, vagy legal&aacute;bbis azok, amelyek az &uacute;j konzolra is megjelenik (Pl.: a Smart Delivery szolg&aacute;ltat&aacute;snak k&ouml;sz&ouml;nhetően). A stream alatt egy tucatnyi friss trailert kaptunk a 2020-ban &eacute;s 2021-ben megjelenő programokb&oacute;l, ezeket l&aacute;thatj&aacute;tok lentebb.</p>\r\n\r\n<div style=\"page-break-after:always\"><span style=\"display:none\">&nbsp;</span></div>\r\n\r\n<p>A&nbsp;<strong>Bright Memory</strong>&nbsp;alap kiad&aacute;sa m&aacute;r&nbsp;<a href=\"https://gamepod.hu/hir/megjelent_a_bright_memory_vegso_kiadasa.html\" target=\"_blank\">egy ideje el&eacute;rhető PC-n,</a>&nbsp;azonban k&eacute;sz&uuml;l a bőv&iacute;tett v&aacute;ltozat, amely az&nbsp;<strong>Infinite</strong>&nbsp;c&iacute;met viseli. Ez ut&oacute;bbiről l&aacute;thattunk m&aacute;r kor&aacute;bban előzetest, azonban a műsor első vend&eacute;gek&eacute;nt kider&uuml;lt, hogy bizony Xbox Series X-re is megjelenik a k&uuml;l&ouml;nlegesnek sz&aacute;nt FPS.</p>\r\n\r\n<div style=\"page-break-after:always\"><span style=\"display:none\">&nbsp;</span></div>\r\n\r\n<p>Az elm&uacute;lt napokban t&ouml;bb jel is utalt arra, hogy bejelent&eacute;sre k&eacute;sz&uuml;l a Codemasters, ezek k&ouml;z&ouml;tt volt a hivatalosa DIRT k&ouml;z&ouml;ss&eacute;gi csatorn&aacute;kon a log&oacute; megv&aacute;ltoztat&aacute;sa. &Uacute;gy tűnik, hogy a v&aacute;rakoz&aacute;s eddig tartott, leleplezt&eacute;k nek&uuml;nk ugyanis a&nbsp;<strong>DIRT 5</strong>-&ouml;t, amely első r&aacute;n&eacute;z&eacute;sre a Forza Horizon bab&eacute;rjaira k&iacute;v&aacute;n t&ouml;rni egyes elemeiben, de ami tal&aacute;n fontosabb, hogy mindezt 4K &eacute;s 120FPS t&aacute;rsas&aacute;g&aacute;ban teszi majd Xbox Series X-en.</p>\r\n\r\n<div style=\"page-break-after:always\"><span style=\"display:none\">&nbsp;</span></div>\r\n\r\n<p>Alig hissz&uuml;k el, de m&aacute;r k&ouml;zel 6 &eacute;ve, hogy 2014-ben bejelentett&eacute;k nek&uuml;nk a&nbsp;<strong>SCORN</strong>&nbsp;c&iacute;mű FPS-t, amelynek diz&aacute;jnj&aacute;t szemmel l&aacute;that&oacute;an H.R. Giger ihlette, azonban a megjelen&eacute;si d&aacute;tum a mai napig nem ismert. Mivel a mai Inside Xbox-on a 2020/21-ben &eacute;rkező programokr&oacute;l sz&oacute;lt, &iacute;gy k&uuml;l&ouml;n izgatottak lett&uuml;nk, hogy az Xbox Series X-re is bejelentett program is egy friss trailert kapott.</p>\r\n\r\n<div style=\"page-break-after:always\"><span style=\"display:none\">&nbsp;</span></div>\r\n\r\n<p>Nem is kellett sokat v&aacute;rni arra, hogy a Microsoft műsor&aacute;n az első, teljesen &uacute;j IP is bemutatkozzon a&nbsp;<strong>CHORUS</strong>&nbsp;szem&eacute;ly&eacute;ben. A lentebb l&aacute;that&oacute; trailer első r&aacute;n&eacute;z&eacute;sre a Control k&eacute;pi vil&aacute;g&aacute;t jutatta az esz&uuml;nkbe, azonban a speci&aacute;lis program egy űrharcokra kihegyezett sci-fi lesz. Szeretj&uuml;k a st&iacute;lust, &iacute;gy tűk&ouml;n &uuml;lve v&aacute;rjuk, hogy milyen lesz a v&eacute;geredm&eacute;ny.</p>\r\n\r\n<div style=\"page-break-after:always\"><span style=\"display:none\">&nbsp;</span></div>\r\n\r\n<p>T&ouml;bb mint egy &eacute;ve m&aacute;r, hogy leleplezt&eacute;k nek&uuml;nk a&nbsp;<strong>Vampire: The Masquerade - Bloodlines 2</strong>-t, amely a tervek szerint valamikor id&eacute;n &eacute;v v&eacute;g&eacute;n &eacute;rkezik. A Hardsuit Labs pontosabb d&aacute;tumot tov&aacute;bbra sem osztott meg vel&uuml;nk, azonban &eacute;rkezett egy friss előzetes, &eacute;rdemes lehet megn&eacute;zni.</p>\r\n\r\n<div style=\"page-break-after:always\"><span style=\"display:none\">&nbsp;</span></div>\r\n\r\n<p>A v&aacute;mp&iacute;rok ut&aacute;n egy &uacute;jabb friss program mutatkozott be a streamen, ez&uacute;ttal a rajzfilmes grafik&aacute;j&uacute;&nbsp;<strong>Call of the Sea</strong>-hez &eacute;rkezett egy bemutat&oacute;. Ebben az 1930-as &eacute;vekben j&aacute;tsz&oacute;d&oacute; alkot&aacute;sban egy rejt&eacute;lyes sziget felfedez&eacute;se lesz a feladatunk, mik&ouml;zben k&uuml;l&ouml;nb&ouml;ző fejt&ouml;rőket kell megoldanunk ahhoz, hogy egy nagyobb titkot is megfejts&uuml;nk.</p>\r\n\r\n<div style=\"page-break-after:always\"><span style=\"display:none\">&nbsp;</span></div>\r\n\r\n<p>Szeretitek a cyberpunk t&eacute;m&aacute;t &eacute;s a top-down shootereket? Akkora a&nbsp;<strong>The Ascent</strong>&nbsp;a ti j&aacute;t&eacute;kotok lesz. Ebben az izometrikus n&eacute;zetű RPG-ben egyed&uuml;l, vagy ak&aacute;r kooperat&iacute;v m&oacute;dban egy bar&aacute;tunkkal is szembesz&aacute;llhatunk a vil&aacute;got ural&oacute; Megav&aacute;llalatok &eacute;s azok harcosai ellen.</p>\r\n\r\n<div style=\"page-break-after:always\"><span style=\"display:none\">&nbsp;</span></div>\r\n\r\n<p>Akik szeretnek borzongani, azoknak j&oacute; h&iacute;r lehet, hogy &eacute;rkezik a&nbsp;<strong>The Medium,</strong>&nbsp;amely a le&iacute;r&aacute;s szerint egy &uacute;jgener&aacute;ci&oacute;s pszichol&oacute;giai horror lesz, amelyben egy m&eacute;diumot ir&aacute;ny&iacute;tva kell a val&oacute;s &eacute;s a szellemvil&aacute;g k&ouml;z&ouml;tt lav&iacute;roznunk &uacute;gy, hogy mindk&eacute;t oldalon r&eacute;ms&eacute;gek v&aacute;rnak r&aacute;nk. A projekt k&uuml;l&ouml;nlegess&eacute;ge, hogy a zenei felhozatal&eacute;rt az az Akira Yamaoka felel, akinek a neve a Silent Hill ut&aacute;n lehet ismerős.</p>\r\n\r\n<div style=\"page-break-after:always\"><span style=\"display:none\">&nbsp;</span></div>\r\n\r\n<p>A t&aacute;voli j&ouml;vőben az emberis&eacute;g utols&oacute; rem&eacute;nys&eacute;gei egy csoport ment&aacute;lisan felturboz&oacute;tt, pszionikus k&eacute;pess&eacute;gekkel rendelkező katona, akik a vil&aacute;gunkat ostroml&oacute; ellenfelek hada ellen vonul csat&aacute;ban. A&nbsp;<strong>Scarlet Nexus</strong>&nbsp;k&eacute;pi vil&aacute;ga a Nintendo Switch-re megjelent Astral Chainre hajaz szerint&uuml;nk, de a hasonl&oacute;s&aacute;g term&eacute;szetesen ennyiben ki is mer&uuml;l.</p>\r\n\r\n<div style=\"page-break-after:always\"><span style=\"display:none\">&nbsp;</span></div>\r\n\r\n<p>Amikor elősz&ouml;r megl&aacute;ttuk a&nbsp;<strong>Second Extinction</strong>&nbsp;c&iacute;mű j&aacute;t&eacute;k előzetes&eacute;t, egyből a Dino Crisis sorozat jutott az esz&uuml;nkbe, de term&eacute;szetesen csak annyi a k&ouml;z&ouml;s a k&eacute;t alkot&aacute;sban, hogy ősh&uuml;llőkre kell vad&aacute;sznunk. A most bemutatott alkot&aacute;sban egy idegen bolyg&oacute;n kell a d&iacute;n&oacute;kat semleges&iacute;teni, de mindezt nem egyed&uuml;l, hanem egy maximum 3 fős csapatban, egym&aacute;ssal &ouml;sszedolgozva kell megtenn&uuml;nk, ehhez pedig sz&aacute;mos eszk&ouml;z a rendelkez&eacute;s&uuml;nkre &aacute;ll majd.</p>\r\n\r\n<div style=\"page-break-after:always\"><span style=\"display:none\">&nbsp;</span></div>\r\n\r\n<p>A SEGA az Inside Xbox keret&eacute;ben bejelentette, hogy az elismert&nbsp;<em>Yakuza</em>&nbsp;sorozat k&ouml;vetkező robban&eacute;kony r&eacute;sze, a&nbsp;<strong>Yakuza: Like a Dragon</strong>&nbsp;nyit&oacute;c&iacute;mk&eacute;nt lesz el&eacute;rhető a k&ouml;vetkező gener&aacute;ci&oacute;s Xbox Series X konzolra, valamint szimult&aacute;n az Xbox term&eacute;kcsal&aacute;d t&ouml;bbi tagj&aacute;ra, PlayStation 4-re &eacute;s PC-re.</p>\r\n\r\n<div style=\"page-break-after:always\"><span style=\"display:none\">&nbsp;</span></div>\r\n\r\n<p>Minden bizonnyal sokan v&aacute;rt&aacute;k a Microsoft esem&eacute;ny&eacute;nek az egyik kiemelt pontj&aacute;t, amelyen az&nbsp;<strong>Assassin&#39;s Creed: Valhall&aacute;t</strong>&nbsp;mutatt&aacute;k be nek&uuml;nk a fejlesztők. N&eacute;h&aacute;ny &oacute;r&aacute;ja kider&uuml;lt, hogy nem egy hosszabb gameplay bemutat&oacute;ra kell sz&aacute;m&iacute;tanunk, &iacute;gy mind&ouml;ssze a lentebb l&aacute;that&oacute; gameplay trailernek nevezett vide&oacute;t kaptuk meg.</p>\r\n\r\n<div style=\"page-break-after:always\"><span style=\"display:none\">&nbsp;</span></div>\r\n\r\n<p>A fentebb l&aacute;that&oacute; vide&oacute;k &eacute;s trailerek csak a kezdet, az elk&ouml;vetkező hetekben &eacute;s h&oacute;napokban sz&aacute;mos &uacute;j bejelent&eacute;s &eacute;s bemutat&oacute; v&aacute;rhat&oacute;, a Microsoft belsős st&uacute;di&oacute;nak c&iacute;meit p&eacute;ld&aacute;ul j&uacute;liusban l&aacute;thatja a nagyk&ouml;z&ouml;ns&eacute;g.</p>\r\n', 'noimage.png', '2020-05-09 15:48:57', 1, 0),
(10, 'Inside Xbox (Május) ', 'Inside-Xbox-Majus', '<p>&Aacute;prilis utols&oacute; napj&aacute;n &eacute;rkezett a h&iacute;r, hogy k&uuml;sz&ouml;b&ouml;n van egy &uacute;jabb&nbsp;<strong>Inside Xbox</strong>&nbsp;előad&aacute;s, ahol a k&ouml;z&eacute;ppontban az &uacute;jgener&aacute;ci&oacute;s j&aacute;t&eacute;kok lesznek, vagy legal&aacute;bbis azok, amelyek az &uacute;j konzolra is megjelenik (Pl.: a Smart Delivery szolg&aacute;ltat&aacute;snak k&ouml;sz&ouml;nhetően). A stream alatt egy tucatnyi friss trailert kaptunk a 2020-ban &eacute;s 2021-ben megjelenő programokb&oacute;l, ezeket l&aacute;thatj&aacute;tok lentebb.</p>\r\n\r\n<div style=\"page-break-after:always\"><span style=\"display:none\">&nbsp;</span></div>\r\n\r\n<p>A&nbsp;<strong>Bright Memory</strong>&nbsp;alap kiad&aacute;sa m&aacute;r&nbsp;<a href=\"https://gamepod.hu/hir/megjelent_a_bright_memory_vegso_kiadasa.html\" target=\"_blank\">egy ideje el&eacute;rhető PC-n,</a>&nbsp;azonban k&eacute;sz&uuml;l a bőv&iacute;tett v&aacute;ltozat, amely az&nbsp;<strong>Infinite</strong>&nbsp;c&iacute;met viseli. Ez ut&oacute;bbiről l&aacute;thattunk m&aacute;r kor&aacute;bban előzetest, azonban a műsor első vend&eacute;gek&eacute;nt kider&uuml;lt, hogy bizony Xbox Series X-re is megjelenik a k&uuml;l&ouml;nlegesnek sz&aacute;nt FPS.</p>\r\n\r\n<div style=\"page-break-after:always\"><span style=\"display:none\">&nbsp;</span></div>\r\n\r\n<p>Az elm&uacute;lt napokban t&ouml;bb jel is utalt arra, hogy bejelent&eacute;sre k&eacute;sz&uuml;l a Codemasters, ezek k&ouml;z&ouml;tt volt a hivatalosa DIRT k&ouml;z&ouml;ss&eacute;gi csatorn&aacute;kon a log&oacute; megv&aacute;ltoztat&aacute;sa. &Uacute;gy tűnik, hogy a v&aacute;rakoz&aacute;s eddig tartott, leleplezt&eacute;k nek&uuml;nk ugyanis a&nbsp;<strong>DIRT 5</strong>-&ouml;t, amely első r&aacute;n&eacute;z&eacute;sre a Forza Horizon bab&eacute;rjaira k&iacute;v&aacute;n t&ouml;rni egyes elemeiben, de ami tal&aacute;n fontosabb, hogy mindezt 4K &eacute;s 120FPS t&aacute;rsas&aacute;g&aacute;ban teszi majd Xbox Series X-en.</p>\r\n\r\n<div style=\"page-break-after:always\"><span style=\"display:none\">&nbsp;</span></div>\r\n\r\n<p>Alig hissz&uuml;k el, de m&aacute;r k&ouml;zel 6 &eacute;ve, hogy 2014-ben bejelentett&eacute;k nek&uuml;nk a&nbsp;<strong>SCORN</strong>&nbsp;c&iacute;mű FPS-t, amelynek diz&aacute;jnj&aacute;t szemmel l&aacute;that&oacute;an H.R. Giger ihlette, azonban a megjelen&eacute;si d&aacute;tum a mai napig nem ismert. Mivel a mai Inside Xbox-on a 2020/21-ben &eacute;rkező programokr&oacute;l sz&oacute;lt, &iacute;gy k&uuml;l&ouml;n izgatottak lett&uuml;nk, hogy az Xbox Series X-re is bejelentett program is egy friss trailert kapott.</p>\r\n\r\n<div style=\"page-break-after:always\"><span style=\"display:none\">&nbsp;</span></div>\r\n\r\n<p>Nem is kellett sokat v&aacute;rni arra, hogy a Microsoft műsor&aacute;n az első, teljesen &uacute;j IP is bemutatkozzon a&nbsp;<strong>CHORUS</strong>&nbsp;szem&eacute;ly&eacute;ben. A lentebb l&aacute;that&oacute; trailer első r&aacute;n&eacute;z&eacute;sre a Control k&eacute;pi vil&aacute;g&aacute;t jutatta az esz&uuml;nkbe, azonban a speci&aacute;lis program egy űrharcokra kihegyezett sci-fi lesz. Szeretj&uuml;k a st&iacute;lust, &iacute;gy tűk&ouml;n &uuml;lve v&aacute;rjuk, hogy milyen lesz a v&eacute;geredm&eacute;ny.</p>\r\n\r\n<div style=\"page-break-after:always\"><span style=\"display:none\">&nbsp;</span></div>\r\n\r\n<p>T&ouml;bb mint egy &eacute;ve m&aacute;r, hogy leleplezt&eacute;k nek&uuml;nk a&nbsp;<strong>Vampire: The Masquerade - Bloodlines 2</strong>-t, amely a tervek szerint valamikor id&eacute;n &eacute;v v&eacute;g&eacute;n &eacute;rkezik. A Hardsuit Labs pontosabb d&aacute;tumot tov&aacute;bbra sem osztott meg vel&uuml;nk, azonban &eacute;rkezett egy friss előzetes, &eacute;rdemes lehet megn&eacute;zni.</p>\r\n\r\n<div style=\"page-break-after:always\"><span style=\"display:none\">&nbsp;</span></div>\r\n\r\n<p>A v&aacute;mp&iacute;rok ut&aacute;n egy &uacute;jabb friss program mutatkozott be a streamen, ez&uacute;ttal a rajzfilmes grafik&aacute;j&uacute;&nbsp;<strong>Call of the Sea</strong>-hez &eacute;rkezett egy bemutat&oacute;. Ebben az 1930-as &eacute;vekben j&aacute;tsz&oacute;d&oacute; alkot&aacute;sban egy rejt&eacute;lyes sziget felfedez&eacute;se lesz a feladatunk, mik&ouml;zben k&uuml;l&ouml;nb&ouml;ző fejt&ouml;rőket kell megoldanunk ahhoz, hogy egy nagyobb titkot is megfejts&uuml;nk.</p>\r\n\r\n<div style=\"page-break-after:always\"><span style=\"display:none\">&nbsp;</span></div>\r\n\r\n<p>Szeretitek a cyberpunk t&eacute;m&aacute;t &eacute;s a top-down shootereket? Akkora a&nbsp;<strong>The Ascent</strong>&nbsp;a ti j&aacute;t&eacute;kotok lesz. Ebben az izometrikus n&eacute;zetű RPG-ben egyed&uuml;l, vagy ak&aacute;r kooperat&iacute;v m&oacute;dban egy bar&aacute;tunkkal is szembesz&aacute;llhatunk a vil&aacute;got ural&oacute; Megav&aacute;llalatok &eacute;s azok harcosai ellen.</p>\r\n\r\n<div style=\"page-break-after:always\"><span style=\"display:none\">&nbsp;</span></div>\r\n\r\n<p>Akik szeretnek borzongani, azoknak j&oacute; h&iacute;r lehet, hogy &eacute;rkezik a&nbsp;<strong>The Medium,</strong>&nbsp;amely a le&iacute;r&aacute;s szerint egy &uacute;jgener&aacute;ci&oacute;s pszichol&oacute;giai horror lesz, amelyben egy m&eacute;diumot ir&aacute;ny&iacute;tva kell a val&oacute;s &eacute;s a szellemvil&aacute;g k&ouml;z&ouml;tt lav&iacute;roznunk &uacute;gy, hogy mindk&eacute;t oldalon r&eacute;ms&eacute;gek v&aacute;rnak r&aacute;nk. A projekt k&uuml;l&ouml;nlegess&eacute;ge, hogy a zenei felhozatal&eacute;rt az az Akira Yamaoka felel, akinek a neve a Silent Hill ut&aacute;n lehet ismerős.</p>\r\n\r\n<div style=\"page-break-after:always\"><span style=\"display:none\">&nbsp;</span></div>\r\n\r\n<p>A t&aacute;voli j&ouml;vőben az emberis&eacute;g utols&oacute; rem&eacute;nys&eacute;gei egy csoport ment&aacute;lisan felturboz&oacute;tt, pszionikus k&eacute;pess&eacute;gekkel rendelkező katona, akik a vil&aacute;gunkat ostroml&oacute; ellenfelek hada ellen vonul csat&aacute;ban. A&nbsp;<strong>Scarlet Nexus</strong>&nbsp;k&eacute;pi vil&aacute;ga a Nintendo Switch-re megjelent Astral Chainre hajaz szerint&uuml;nk, de a hasonl&oacute;s&aacute;g term&eacute;szetesen ennyiben ki is mer&uuml;l.</p>\r\n\r\n<div style=\"page-break-after:always\"><span style=\"display:none\">&nbsp;</span></div>\r\n\r\n<p>Amikor elősz&ouml;r megl&aacute;ttuk a&nbsp;<strong>Second Extinction</strong>&nbsp;c&iacute;mű j&aacute;t&eacute;k előzetes&eacute;t, egyből a Dino Crisis sorozat jutott az esz&uuml;nkbe, de term&eacute;szetesen csak annyi a k&ouml;z&ouml;s a k&eacute;t alkot&aacute;sban, hogy ősh&uuml;llőkre kell vad&aacute;sznunk. A most bemutatott alkot&aacute;sban egy idegen bolyg&oacute;n kell a d&iacute;n&oacute;kat semleges&iacute;teni, de mindezt nem egyed&uuml;l, hanem egy maximum 3 fős csapatban, egym&aacute;ssal &ouml;sszedolgozva kell megtenn&uuml;nk, ehhez pedig sz&aacute;mos eszk&ouml;z a rendelkez&eacute;s&uuml;nkre &aacute;ll majd.</p>\r\n\r\n<div style=\"page-break-after:always\"><span style=\"display:none\">&nbsp;</span></div>\r\n\r\n<p>A SEGA az Inside Xbox keret&eacute;ben bejelentette, hogy az elismert&nbsp;<em>Yakuza</em>&nbsp;sorozat k&ouml;vetkező robban&eacute;kony r&eacute;sze, a&nbsp;<strong>Yakuza: Like a Dragon</strong>&nbsp;nyit&oacute;c&iacute;mk&eacute;nt lesz el&eacute;rhető a k&ouml;vetkező gener&aacute;ci&oacute;s Xbox Series X konzolra, valamint szimult&aacute;n az Xbox term&eacute;kcsal&aacute;d t&ouml;bbi tagj&aacute;ra, PlayStation 4-re &eacute;s PC-re.</p>\r\n\r\n<div style=\"page-break-after:always\"><span style=\"display:none\">&nbsp;</span></div>\r\n\r\n<p>Minden bizonnyal sokan v&aacute;rt&aacute;k a Microsoft esem&eacute;ny&eacute;nek az egyik kiemelt pontj&aacute;t, amelyen az&nbsp;<strong>Assassin&#39;s Creed: Valhall&aacute;t</strong>&nbsp;mutatt&aacute;k be nek&uuml;nk a fejlesztők. N&eacute;h&aacute;ny &oacute;r&aacute;ja kider&uuml;lt, hogy nem egy hosszabb gameplay bemutat&oacute;ra kell sz&aacute;m&iacute;tanunk, &iacute;gy mind&ouml;ssze a lentebb l&aacute;that&oacute; gameplay trailernek nevezett vide&oacute;t kaptuk meg.</p>\r\n\r\n<div style=\"page-break-after:always\"><span style=\"display:none\">&nbsp;</span></div>\r\n\r\n<p>A fentebb l&aacute;that&oacute; vide&oacute;k &eacute;s trailerek csak a kezdet, az elk&ouml;vetkező hetekben &eacute;s h&oacute;napokban sz&aacute;mos &uacute;j bejelent&eacute;s &eacute;s bemutat&oacute; v&aacute;rhat&oacute;, a Microsoft belsős st&uacute;di&oacute;nak c&iacute;meit p&eacute;ld&aacute;ul j&uacute;liusban l&aacute;thatja a nagyk&ouml;z&ouml;ns&eacute;g.</p>\r\n', 'noimage.png', '2020-05-09 15:49:36', 1, 0),
(12, 'Kép teszt', 'Kep-teszt', '<p>K&eacute;p teszt</p>\r\n', '1955d503ee6ce12c1598ea3063d8ad18.jpg', '2020-05-09 16:27:13', 2, 0),
(14, 'Jogosultság teszt', 'Jogosultsag-teszt', '<p>Jogosults&aacute;g teszt</p>\r\n', 'noimage.png', '2020-05-17 15:32:58', 3, 2),
(15, 'adasdad', 'adasdad', '<p>asffaf</p>\r\n', 'noimage.png', '2020-05-17 15:39:43', 4, 2);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `zipcode` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `register_data` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- A tábla adatainak kiíratása `users`
--

INSERT INTO `users` (`id`, `name`, `zipcode`, `email`, `username`, `password`, `register_data`) VALUES
(1, 'Donkó Márk', '2765', 'donkomark@gmail.com', 'donkomark', '33e1b232a4e6fa0028a6670753749a17', '2020-05-15 12:13:42'),
(2, 'admin', '3300', 'admin@admin.com', 'admin', '33e1b232a4e6fa0028a6670753749a17', '2020-05-17 14:33:50');

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT a táblához `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT a táblához `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT a táblához `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT a táblához `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
