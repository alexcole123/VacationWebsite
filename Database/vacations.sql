-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Mar 23, 2024 at 12:21 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `vacations`
--
CREATE DATABASE IF NOT EXISTS `vacations` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `vacations`;

-- --------------------------------------------------------

--
-- Table structure for table `cities`
--

CREATE TABLE `cities` (
  `id` int(11) NOT NULL,
  `city` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cities`
--

INSERT INTO `cities` (`id`, `city`) VALUES
(1, 'Buenos Aires & Rio de Janeiro, Argentina & Brazil'),
(2, 'Munich, Germany'),
(3, 'Seoul, South Korea'),
(4, 'Amsterdam, Netherland'),
(5, 'Tokyo, Japan'),
(6, 'Rome, Italy'),
(7, 'Madrid, Spain'),
(8, 'Lisbon, Portugal'),
(9, 'Paris, France'),
(10, 'Mexico City, Mexico'),
(11, 'Las Vegas, US'),
(12, 'Banff, Canada'),
(13, 'Budapest, Hungary'),
(14, 'Santorini, Greece');

-- --------------------------------------------------------

--
-- Table structure for table `holidays`
--

CREATE TABLE `holidays` (
  `id` int(11) NOT NULL,
  `city_id` int(11) NOT NULL,
  `description` varchar(10000) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `price` int(11) NOT NULL,
  `image_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `holidays`
--

INSERT INTO `holidays` (`id`, `city_id`, `description`, `start_date`, `end_date`, `price`, `image_name`) VALUES
(1, 7, 'Embark on a captivating journey to Spain, where ancient history meets modern charm. Explore vibrant cities adorned with architectural marvels, savor tantalizing flavors of Mediterranean cuisine, and unwind on sun-drenched coastlines. From flamenco rhythms to cultural fiestas, Spain invites you to immerse yourself in its passionate spirit and diverse landscapes, promising a holiday filled with unforgettable moments.', '2024-07-10', '2024-07-17', 1800, 'a813890f-e443-4620-abbc-2f5ccd9ae773.webp'),
(2, 3, 'South Korea offers a captivating blend of tradition and modernity, making it an intriguing destination for travelers. The country is known for its bustling cities like Seoul with futuristic architecture juxtaposed against ancient palaces and temples. Visitors can explore the vibrant street markets, indulge in delicious cuisine like Korean BBQ and kimchi, and experience the energetic K-pop culture.\r\n\r\nSouth Korea\'s rich history can be seen in places like Gyeongbokgung Palace and the traditional Bukchon Hanok Village. Additionally, the country\'s natural beauty shines through its national parks, serene temples nestled in the mountains, and stunning coastlines.\r\n\r\nThe country\'s advanced technology is evident in its efficient transportation systems and innovative attractions like high-tech entertainment centers. Whether you\'re exploring historical sites, diving into Korean pop culture, enjoying the bustling city life, or relaxing in the countryside, South Korea offers a diverse and captivating travel experience.', '2024-04-05', '2024-04-21', 2500, 'b04db058-d351-4a45-b495-f03243d4c0be.jpeg'),
(3, 5, 'Japan is a captivating blend of ancient tradition and modern innovation, offering a unique and diverse experience for travelers. The country is known for its deep-rooted cultural heritage, stunning natural landscapes, and technological advancements.\r\n\r\nVisitors to Japan can explore the bustling metropolis of Tokyo, where futuristic skyscrapers coexist with historic temples and gardens. The country\'s rich history is evident in places like Kyoto, where traditional tea houses, shrines, and geisha districts transport you back in time.\r\n\r\nJapan\'s natural beauty is breathtaking, from the iconic peak of Mount Fuji to serene bamboo forests in Arashiyama and the picturesque landscapes of Hokkaido. Onsen (hot spring baths), sushi and culinary delights, anime and manga culture, and the intricate art of tea ceremonies are just a few elements that contribute to Japan\'s diverse appeal.\r\n\r\nThe country\'s efficiency, cleanliness, and punctuality in its transportation systems are renowned, making it easy to explore different regions. Whether you\'re seeking historical and cultural immersion, outdoor adventures, or a taste of modern city life, Japan offers a multifaceted travel experience that leaves a lasting impression.', '2024-03-13', '2024-03-29', 4200, '6ff8bf05-fa1a-4b59-95e3-fcaaceb3c49c.jpeg'),
(4, 13, 'Welcome to Hungary, a tapestry of history, culture, and breathtaking landscapes in the heart of Europe. Explore Budapest, the \'Pearl of the Danube,\' where grandiose architecture meets vibrant nightlife along the riverbanks. Wander through historic streets adorned with medieval castles, soak in the healing waters of thermal baths, and savor the flavors of Hungarian cuisine, from hearty goulash to delicate pastries. Venture beyond the capital to discover charming towns like Eger or Pécs, each offering a unique glimpse into Hungary\'s rich heritage. Amidst rolling vineyards, ancient ruins, and the majestic beauty of Lake Balaton, Hungary beckons with its warm hospitality and a treasure trove of cultural delights waiting to be explored', '2024-09-13', '2024-09-20', 1200, '4c1ab08e-9275-4c8a-849f-e2f5910922c3.jpg'),
(5, 9, 'Step into the timeless elegance and romance of France, a country that effortlessly blends art, culture, and culinary delights. Explore Paris, the City of Lights, where iconic landmarks like the Eiffel Tower and Louvre Museum enchant visitors at every turn. Stroll through charming cobblestone streets of historic villages in Provence or Alsace, adorned with colorful flower markets and vineyards. Indulge in exquisite French cuisine, from buttery croissants to gourmet cheeses and world-class wines. Immerse yourself in the artistic legacy of Monet in Giverny or marvel at the grandeur of châteaux in the Loire Valley. France captivates with its rich history, artistic treasures, and the sheer beauty of its landscapes, promising a journey steeped in sophistication and cultural allure.', '2024-06-20', '2024-06-30', 2800, '23fdbbee-0d43-4586-b320-bde0b1a69cd2.avif'),
(6, 8, 'Welcome to Portugal, a country of captivating contrasts where old-world charm meets stunning natural beauty. Discover Lisbon, a city steeped in history, where pastel-colored buildings adorn narrow cobblestone streets and Fado music echoes through intimate taverns. Explore Porto, where the Douro River winds past picturesque vineyards and the scent of port wine fills the air. Bask in the golden beaches of the Algarve or lose yourself in the rugged beauty of the Azores and Madeira islands. Indulge in Portugal\'s culinary delights, from fresh seafood to delectable pastries like pastel de nata. With its rich maritime heritage, architectural wonders, and warm hospitality, Portugal invites you to uncover its hidden treasures and embrace the laid-back pace of life, promising a journey filled with charm and authenticity.', '2024-10-10', '2024-10-14', 1100, 'bcd82499-25a5-4ab1-a5eb-700b79c20d9a.jpeg'),
(7, 6, 'Welcome to Italy, a country that embodies la dolce vita—the sweet life—where every cobblestone street whispers tales of ancient history and artistic brilliance. Explore Rome, the Eternal City, where iconic landmarks like the Colosseum and Vatican City stand as testaments to millennia of civilization. Wander through Florence, the birthplace of the Renaissance, where artistry flourishes in every corner, from Michelangelo\'s David to the Uffizi Gallery\'s masterpieces. Indulge in Italy\'s culinary delights, from mouthwatering pasta dishes to gelato savored under the Mediterranean sun. Discover the romantic allure of Venice\'s winding canals or lose yourself in the charm of the Amalfi Coast\'s picturesque villages. Italy\'s rich tapestry of art, culture, and gastronomy promises an unforgettable journey through time and beauty.', '2024-07-12', '2024-07-20', 2200, '543c9b9f-3d37-4217-9f4e-a648d35f3777.jpeg'),
(8, 2, 'Experience the heart of Europe in Germany, a country that seamlessly blends rich history with modern innovation. Discover Berlin, a vibrant metropolis pulsating with creativity, where remnants of the Berlin Wall stand as a testament to the city\'s tumultuous past. Explore the fairytale charm of Bavaria, where medieval castles like Neuschwanstein captivate with their grandeur. Immerse yourself in the cultural gems of Munich, from Oktoberfest celebrations to historic beer gardens. Delight in Germany\'s diverse cuisine, from hearty sausages to delectable pastries, while sipping on world-renowned beers. Traverse the scenic landscapes of the Rhine Valley or delve into the enchanting Black Forest. With its blend of old-world traditions and contemporary allure, Germany invites you on a journey filled with cultural richness and warm hospitality.', '2024-09-21', '2024-10-06', 3000, '9fac8964-2f3f-4b4a-bf27-53bc9f55c7ca.webp'),
(9, 10, 'Welcome to Mexico, a land of vibrant colors, ancient wonders, and rich cultural heritage. Explore the bustling streets of Mexico City, a dynamic metropolis where pre-Columbian ruins intertwine with modern skyscrapers. Discover the remnants of Mayan and Aztec civilizations in places like Chichen Itza and Teotihuacan, standing as testaments to a glorious past. Indulge in the tantalizing flavors of Mexican cuisine, from spicy tacos to rich mole sauces, while sipping on authentic aguas frescas. Immerse yourself in the warmth of Mexico\'s hospitality and fiesta spirit, where mariachi melodies fill the air and lively festivals showcase the country\'s diverse traditions. Whether lounging on pristine beaches in Cancun or exploring the colonial charm of Oaxaca, Mexico invites you on a journey filled with ancient history, natural beauty, and a vibrant tapestry of culture.', '2024-02-01', '2024-02-18', 2400, 'bf913391-b54d-48a4-bcb4-a0f1cbb21aaf.jpeg'),
(10, 1, 'Embark on a South American odyssey through Argentina and Brazil, where diverse cultures, stunning landscapes, and vibrant rhythms await. Begin in Argentina, where the pulsating beats of tango echo through Buenos Aires\' streets and the mighty Iguazu Falls mesmerize with their natural grandeur. Indulge in succulent steaks and the rich flavors of Malbec wine while immersing yourself in the gaucho traditions of the pampas.\r\n\r\nThen, venture into Brazil, where the iconic Christ the Redeemer statue welcomes you to Rio de Janeiro, a city of samba rhythms and golden beaches. Witness the breathtaking beauty of the Amazon rainforest and the majestic Ipanema and Copacabana beaches. Delight in Brazil\'s diverse cuisine, from feijoada to caipirinhas, and immerse yourself in the vibrant energy of Carnival.\r\n\r\nBetween Argentina\'s passionate spirit and Brazil\'s exuberant culture, this journey promises an unforgettable fusion of landscapes, traditions, and experiences, inviting you to explore the best of South America', '2024-01-29', '2024-03-01', 4700, 'f900f812-aac8-430e-8120-f93b00a8f074.jpeg'),
(11, 12, 'From the stunning natural beauty of the Canadian Rockies to the vibrant city life of Toronto and Montreal, there\'s something for everyone. You can explore national parks, indulge in outdoor adventures like hiking or skiing, experience rich cultural diversity, and enjoy excellent cuisine. Canada\'s attractions include Niagara Falls, Banff National Park, historic Quebec City, the CN Tower, and much more. The country\'s welcoming atmosphere and wide array of activities make it an ideal destination for nature lovers, adventure seekers, and those interested in exploring multicultural cities.', '2024-10-02', '2024-11-12', 2900, '0ef103b1-88a6-4da7-81e1-ce6a1ebc81c3.jpeg'),
(12, 11, 'From iconic cities like New York and Los Angeles to natural wonders such as the Grand Canyon and Yellowstone National Park, the US has something for everyone. You can explore diverse landscapes, from stunning coastlines to breathtaking mountains, indulge in world-class entertainment, visit historical landmarks, and enjoy a rich variety of cuisines. Attractions range from the Statue of Liberty and Central Park to the Golden Gate Bridge and Disney World. The country\'s size and diversity cater to different interests, whether it\'s exploring vibrant urban scenes, relaxing on picturesque beaches, or discovering the charm of small towns across the nation.', '2024-05-23', '2024-06-14', 6800, '6a5438c0-ca8d-46fd-a67d-92ba4d9b7e84.jpeg'),
(13, 4, 'The country is known for its iconic windmills, tulip fields, and charming canal cities. Visitors can explore the historic streets of Amsterdam, visit world-class museums like the Rijksmuseum and Van Gogh Museum, and enjoy leisurely bike rides through scenic countryside paths. The Netherlands boasts beautiful tulip gardens, stunning architecture, and a relaxed atmosphere. From the Anne Frank House to the Keukenhof Gardens and the UNESCO-listed canals of Amsterdam, there\'s a mix of cultural, historical, and natural attractions to explore. The Dutch culture, with its emphasis on art, design, and cycling, adds to the unique charm of this European destination.\r\n\r\n\r\n\r\n\r\n', '2025-04-17', '2025-04-28', 2000, 'bbbd11a6-d3c2-453f-b49f-f1677bbe19c7.jpeg'),
(24, 14, 'A holiday to Greece offers a mesmerizing experience filled with ancient history, stunning landscapes, delicious cuisine, and vibrant culture. From the iconic Acropolis in Athens to the breathtaking Santorini sunsets, Greece offers diverse experiences for travelers. Explore ancient ruins like the Parthenon, stroll through picturesque villages with whitewashed houses and narrow cobblestone streets, indulge in Greek cuisine with delectable dishes like souvlaki and moussaka, and relax on beautiful beaches with crystal-clear waters.', '2025-04-12', '2025-04-19', 2100, 'b3064e13-484f-4b73-a18b-1f4390da052b.jpeg');

-- --------------------------------------------------------

--
-- Table structure for table `likes`
--

CREATE TABLE `likes` (
  `user_id` int(11) NOT NULL,
  `holiday_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `likes`
--

INSERT INTO `likes` (`user_id`, `holiday_id`) VALUES
(21, 2),
(21, 1),
(21, 8),
(21, 12),
(21, 4),
(23, 10),
(21, 7),
(21, 11),
(21, 6),
(21, 24),
(21, 10),
(21, 9),
(21, 3),
(21, 5),
(21, 3),
(24, 13),
(24, 3),
(24, 2),
(24, 2),
(24, 24),
(24, 24),
(24, 24),
(24, 9),
(23, 9),
(23, 3);

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(11) NOT NULL,
  `name` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`) VALUES
(1, 'Amin'),
(2, 'User');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(256) NOT NULL,
  `role_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `password`, `role_id`) VALUES
(21, 'bart', 'simpson', 'bart@gmail.com', '09fdc0645838c210b9001cb206a70ba9701efbf0d90b9fd166fde15836baa9ab850d4ff298a9b53d6486c4b0cf18efe6dfe20d806b73cc8d867fbab89fd449fc', 2),
(22, 'Alex', 'Cole', 'alex@gmail.com', '09fdc0645838c210b9001cb206a70ba9701efbf0d90b9fd166fde15836baa9ab850d4ff298a9b53d6486c4b0cf18efe6dfe20d806b73cc8d867fbab89fd449fc', 1),
(23, 'son', 'goku', 'songoku@gmail.com', '09fdc0645838c210b9001cb206a70ba9701efbf0d90b9fd166fde15836baa9ab850d4ff298a9b53d6486c4b0cf18efe6dfe20d806b73cc8d867fbab89fd449fc', 2),
(24, 'john', 'snow', 'snow12@gmail.com', '09fdc0645838c210b9001cb206a70ba9701efbf0d90b9fd166fde15836baa9ab850d4ff298a9b53d6486c4b0cf18efe6dfe20d806b73cc8d867fbab89fd449fc', 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cities`
--
ALTER TABLE `cities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `holidays`
--
ALTER TABLE `holidays`
  ADD PRIMARY KEY (`id`),
  ADD KEY `country_id` (`city_id`);

--
-- Indexes for table `likes`
--
ALTER TABLE `likes`
  ADD KEY `user_id` (`user_id`),
  ADD KEY `vacation_id` (`holiday_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `role_id` (`role_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cities`
--
ALTER TABLE `cities`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `holidays`
--
ALTER TABLE `holidays`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `holidays`
--
ALTER TABLE `holidays`
  ADD CONSTRAINT `holidays_ibfk_1` FOREIGN KEY (`city_id`) REFERENCES `cities` (`id`);

--
-- Constraints for table `likes`
--
ALTER TABLE `likes`
  ADD CONSTRAINT `likes_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `likes_ibfk_2` FOREIGN KEY (`holiday_id`) REFERENCES `holidays` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `Roles` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
