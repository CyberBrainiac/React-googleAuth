CREATE DATABASE  IF NOT EXISTS `sigma_camp` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `sigma_camp`;
-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: sigma_camp
-- ------------------------------------------------------
-- Server version	8.0.34

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `idCategory` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`idCategory`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (9,'Fresh'),(11,'Health'),(10,'Millets'),(12,'Nuts'),(8,'Vegetable');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_product`
--

DROP TABLE IF EXISTS `order_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_product` (
  `idOrder` int unsigned NOT NULL,
  `idProduct` int unsigned NOT NULL,
  `productCount` int unsigned NOT NULL,
  PRIMARY KEY (`idOrder`,`idProduct`),
  KEY `idProduct_idx` (`idProduct`),
  CONSTRAINT `fk_idProduct` FOREIGN KEY (`idProduct`) REFERENCES `products` (`idProduct`) ON UPDATE CASCADE,
  CONSTRAINT `idOrder` FOREIGN KEY (`idOrder`) REFERENCES `orders` (`idOrder`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_product`
--

LOCK TABLES `order_product` WRITE;
/*!40000 ALTER TABLE `order_product` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `idOrder` int unsigned NOT NULL AUTO_INCREMENT,
  `idUser` int unsigned NOT NULL,
  `message` tinytext,
  PRIMARY KEY (`idOrder`,`idUser`),
  KEY `fk_Orders_User1_idx` (`idUser`) /*!80000 INVISIBLE */,
  CONSTRAINT `fk_Orders_User1` FOREIGN KEY (`idUser`) REFERENCES `user` (`idUser`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_category`
--

DROP TABLE IF EXISTS `product_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_category` (
  `idProduct` int unsigned NOT NULL,
  `idCategory` int unsigned NOT NULL,
  PRIMARY KEY (`idProduct`,`idCategory`),
  KEY `idCategory` (`idCategory`),
  CONSTRAINT `idCategory` FOREIGN KEY (`idCategory`) REFERENCES `category` (`idCategory`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `idProduct` FOREIGN KEY (`idProduct`) REFERENCES `products` (`idProduct`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_category`
--

LOCK TABLES `product_category` WRITE;
/*!40000 ALTER TABLE `product_category` DISABLE KEYS */;
INSERT INTO `product_category` VALUES (17,8),(20,8),(29,8),(30,8),(32,8),(18,9),(20,9),(23,9),(25,9),(27,9),(28,9),(31,9),(19,10),(26,10),(17,11),(21,11),(23,11),(24,11),(30,11),(19,12),(22,12),(26,12),(28,12);
/*!40000 ALTER TABLE `product_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `idProduct` int unsigned NOT NULL AUTO_INCREMENT,
  `imgUrl` varchar(3000) DEFAULT NULL,
  `name` varchar(60) NOT NULL,
  `price` float unsigned NOT NULL DEFAULT '0',
  `discount` float unsigned DEFAULT '0',
  `stars` int DEFAULT '0',
  `shortDescription` tinytext,
  `productDescription` text,
  `additionalInfo` text,
  PRIMARY KEY (`idProduct`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (17,'/src/assets/images/products-imgs/Broccoli.png','Calabrese Broccoli',20,7,4,'Nutrient-rich broccoli, a cruciferous vegetable, offers a vibrant green color and a distinct flavor, making it a versatile choice in cooking.','Delight in the health benefits of broccoli. Packed with vitamins, fiber, and antioxidants, it\'s a culinary powerhouse. Whether steamed, roasted, or sautéed, its earthy taste and tender florets enrich salads, stir-fries, and more.','Broccoli\'s high vitamin C content supports immunity, while its sulforaphane compounds are associated with potential anti-cancer properties. Cooking methods can preserve its nutrients and flavor effectively.'),(18,'/src/assets/images/products-imgs/Banana.png','Banana',18,5,5,'Bananas, nature\'s energy boosters, sport a vibrant yellow peel and offer a delightful mix of sweetness and creaminess.','Experience the natural goodness of bananas. Packed with potassium, fiber, and vitamins, they make for a convenient and nutritious snack. Their soft texture and subtly sweet taste lend themselves to smoothies, baking, and as a topping for cereals and yogurt.','Bananas provide instant energy due to their carbohydrates. The presence of vitamin B6 supports heart health, and their low sodium content makes them a heart-healthy choice. Ripe bananas with brown spots are sweeter and easier to digest.'),(19,'/src/assets/images/products-imgs/Pistachios.png','Pistachios',25,6,5,'Pistachios, the vibrant green nuts, combine a satisfying crunch with a rich, slightly sweet flavor, making them a popular snack.','Indulge in the irresistible taste of pistachios. With their unique green hue and impressive nutritional profile, these nuts offer healthy fats, protein, and fiber. Enjoy them shelled as a snack, sprinkled over salads, or incorporated into both sweet and savory dishes for an added crunch and nutty essence.','Pistachios are nutrient-dense, aiding weight management and heart health. Their antioxidants and phytosterols contribute to cholesterol reduction. Opt for unsalted or lightly salted versions to control sodium intake.'),(20,'/src/assets/images/products-imgs/Tomato.png','Red Tomato',16,3,4,'Tomatoes, vibrant and versatile, bring a burst of juicy sweetness to dishes, whether in salads, sauces, or salsas.','Savor the lusciousness of tomatoes. These red, yellow, or orange gems are a kitchen staple, rich in vitamins C and A. From fresh Caprese salads to hearty pasta sauces, their tangy-sweet taste elevates a variety of cuisines. Choose plum tomatoes for sauces and beefsteak tomatoes for sandwiches, enjoying their myriad culinary possibilities.','Tomatoes\' lycopene content is linked to antioxidant benefits. Sun-dried tomatoes intensify flavor, while cherry tomatoes offer poppable bites. Store at room temperature for optimal taste, but refrigerate if fully ripe to prolong freshness.'),(21,'/src/assets/images/products-imgs/Mung-Bean.png','Mung Bean',20,6,3,'Mung beans, small and green, offer a mild taste and a nutrient-packed profile, perfect for both sprouting and cooking.','Discover the versatility of mung beans. These legumes, rich in plant-based protein, fiber, and vitamins, can be sprouted for salads or cooked into stews, curries, and dals. Their delicate flavor pairs well with various spices and ingredients, making them a staple in Asian cuisines. Embrace their nutritional value and adaptability in your culinary creations.','Mung beans are easily digestible and low in fat, making them a healthy protein source. Sprouting enhances their nutrient content. Incorporate them into vegetarian and vegan diets for essential amino acids and minerals.'),(22,'/src/assets/images/products-imgs/Hazelnut.png','Brown Hazelnut',22,4,5,'Hazelnuts, with a rich, buttery flavor, present a delightful combination of crunchiness and nuttiness, enhancing both sweet and savory dishes.','Indulge in the enchanting taste of hazelnuts. These versatile nuts offer a spectrum of culinary possibilities, from Nutella to roasted spreads, pastries, and salads. Rich in healthy fats and antioxidants, hazelnuts deliver a distinctive texture and flavor that elevates your creations. Incorporate them into your recipes for a touch of sophistication and natural goodness.','Hazelnuts are a good source of vitamin E and folate. They contribute to heart health and may aid in reducing inflammation. Store them in a cool, dry place to maintain their flavor and quality.'),(23,'/src/assets/images/products-imgs/Eggs.png','Eggs',12,2,4,'Eggs, a versatile kitchen essential, offer a complete protein source with a multitude of preparation methods and culinary applications.','Enjoy the unparalleled versatility of eggs. These nutrient-packed wonders provide high-quality protein, vitamins, and minerals. Fry, boil, scramble, or poach them to suit your taste. From breakfast classics to decadent baked goods, eggs lend moisture, structure, and flavor, making them indispensable in kitchens worldwide.','Eggs are rich in choline, supporting brain health, and contain antioxidants beneficial for eye health. Brown and white eggs have similar nutritional value. Store them in their original carton in the refrigerator for freshness.'),(24,'/src/assets/images/products-imgs/Bread.png','Bread',8,1,5,'Bread, a staple comfort food, comes in various textures and flavors, offering a satisfying foundation for sandwiches, toasts, and meals.','Discover the comforting allure of bread. From crusty artisan loaves to soft sandwich slices, bread is a versatile canvas for both sweet and savory creations. Rich in carbohydrates, it provides essential energy. Select whole-grain options for added fiber and nutrients. Enjoy its endless possibilities as a foundation for breakfast, lunch, dinner, and snacks.','Whole-grain breads offer more fiber, aiding digestion and promoting fullness. Bread\'s glycemic index varies; whole grains have a lower impact on blood sugar. Store bread in a cool, dry place or freeze for extended freshness.'),(25,'/src/assets/images/products-imgs/Zucchini.png','Zucchini',18,4,4,'Zucchini, a versatile summer squash, boasts a mild flavor and tender texture, lending itself to both savory and sweet dishes.','Embrace the culinary charm of zucchini. This vibrant squash adds a nutritious touch to your meals. Whether spiralized into \"zoodles,\" baked into muffins, or sautéed with herbs, its delicate taste and moisture enhance various recipes. Loaded with vitamins, minerals, and fiber, zucchini is a must-have ingredient that offers both taste and health benefits.','Zucchini\'s high water content contributes to hydration. Its skin holds extra nutrients, so consider leaving it on. Young zucchinis are more tender, while larger ones may have more seeds. Store them in the refrigerator\'s crisper drawer.'),(26,'/src/assets/images/products-imgs/Cashew.png','Cashew',24,5,5,'Cashews, creamy and slightly sweet, are versatile nuts, enriching dishes with a buttery texture and providing a delightful snacking option.','Experience the allure of cashews. These kidney-shaped nuts offer a delectable combination of taste and nutrition. Their smooth texture and mild flavor make them a perfect addition to both savory and sweet recipes. Rich in healthy fats, vitamins, and minerals, cashews can be enjoyed on their own, used in cooking, or blended into creamy sauces and nut butters.','Cashews are a good source of monounsaturated fats and magnesium, benefiting heart health and bone strength. They\'re often used in vegan recipes for creaminess. Store them in an airtight container in a cool place to maintain freshness.'),(27,'/src/assets/images/products-imgs/Corn.png','Corn',16,3,5,'Corn, with its golden kernels, is a versatile staple offering sweetness and a satisfying crunch, whether on the cob or in various dishes.','Explore the timeless appeal of corn. From buttered cobs at summer barbecues to creamy corn chowders, this grain enriches a wide array of recipes. Packed with fiber and antioxidants, corn offers a naturally sweet taste and a hearty texture. Enjoy it fresh, grilled, or as a versatile ingredient in soups, salads, and salsas.','Corn\'s dietary fiber supports digestion and promotes fullness. Its antioxidants contribute to eye health. Choose fresh corn for optimal taste or opt for frozen varieties when fresh isn\'t available. Store in the refrigerator for best quality.'),(28,'/src/assets/images/products-imgs/Almond.png','Almond',26,4,4,'Almonds, with a delicate crunch and subtly sweet taste, offer a nutritious boost as both a snack and a versatile ingredient.','Delight in the elegance of almonds. These heart-healthy nuts are a rich source of protein, fiber, and essential nutrients. Whether enjoyed raw, roasted, or as creamy almond butter, they elevate dishes with their satisfying texture and distinct flavor. From salads to baked goods, almonds contribute both taste and nourishment to your culinary repertoire.','Almonds are packed with vitamin E, benefiting skin health and immunity. Their healthy fats and fiber contribute to satiety. Store them in a cool, dry place or in the refrigerator to prevent rancidity.'),(29,'/src/assets/images/products-imgs/Broccoli-special.png','Broccoli Special',17,0,5,'Broccoli, a vibrant cruciferous vegetable, offers a unique blend of earthy flavor and nutrient density, perfect for versatile culinary creations.','Experience the exceptional qualities of broccoli. Rich in vitamins, minerals, and antioxidants, this verdant vegetable adds both taste and health benefits to your meals. Whether steamed, roasted, or stir-fried, its tender florets and nutrient-packed stalks complement a range of dishes. Embrace its role as a source of vitamins K and C, fiber, and potential anti-cancer compounds.','Broccoli\'s sulforaphane content is linked to potential health benefits. Its versatility makes it a valuable addition to a balanced diet. Blending with other vegetables or adding to pasta dishes can expand its culinary applications while retaining nutritional value.'),(30,'/src/assets/images/products-imgs/Squash.png','Squash',16,0,4,'Squash, a diverse family of vegetables, offers a range of flavors and textures, adding both vibrancy and nutrition to various dishes.','Explore the delightful world of squash. From sweet butternut to versatile zucchini, these vegetables bring color and nutrients to your table. Roast, sauté, or blend them into soups for hearty and flavorful meals. Packed with vitamins, fiber, and antioxidants, squash varieties contribute to overall well-being while enhancing the taste and visual appeal of your culinary creations.','Different squash types offer unique tastes and nutrients. Winter squash, like acorn and pumpkin, are rich in beta-carotene, while summer squash, including zucchini, are hydrating and low-calorie. Store in a cool, dark place for extended freshness.'),(31,'/src/assets/images/products-imgs/Onion.png','Onion',13,0,5,'Onions, pungent and versatile, lend layers of flavor to dishes, from savory to sweet, making them a kitchen essential.','Embrace the savory power of onions. With their distinctive aroma and taste, they form the foundation of countless recipes. From caramelized sweetness to tangy crunch in salads, onions enhance a variety of cuisines. Packed with antioxidants and nutrients, they offer both culinary appeal and potential health benefits, making them a staple ingredient in kitchens worldwide.','Onions\' sulfur compounds are linked to potential health advantages. Varieties range from pungent red onions to mild shallots. Store them in a cool, dry place, away from potatoes, for prolonged shelf life.'),(32,'/src/assets/images/products-imgs/Cabbage.png','Cabbage',15,0,4,'Cabbage, sturdy and versatile, offers a mild flavor that ranges from crisp and refreshing in salads to tender and comforting in cooked dishes.','Discover the culinary charm of cabbage. This cruciferous vegetable adds texture and nutrition to meals. Shredded in coleslaw, fermented into sauerkraut, or stir-fried with savory seasonings, cabbage\'s flexibility shines. Rich in vitamins, fiber, and antioxidants, it offers a wide range of preparations to suit your palate and dietary needs.','Cabbage\'s glucosinolates have potential health benefits. Green and red varieties offer distinct tastes; Napa cabbage is popular in Asian cuisines. Store it whole in the refrigerator\'s crisper drawer for freshness.');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `idUser` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `surname` varchar(50) DEFAULT NULL,
  `middleName` varchar(50) DEFAULT NULL,
  `email` varchar(200) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `avatarUrl` blob,
  `password` varchar(128) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `registrationTime` timestamp(6) NULL DEFAULT NULL,
  `address` varchar(100) NOT NULL,
  PRIMARY KEY (`idUser`),
  UNIQUE KEY `phone_UNIQUE` (`phone`),
  UNIQUE KEY `password_UNIQUE` (`password`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userrole`
--

DROP TABLE IF EXISTS `userrole`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userrole` (
  `index` int unsigned NOT NULL AUTO_INCREMENT,
  `roleName` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`index`),
  UNIQUE KEY `roleName_UNIQUE` (`roleName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userrole`
--

LOCK TABLES `userrole` WRITE;
/*!40000 ALTER TABLE `userrole` DISABLE KEYS */;
/*!40000 ALTER TABLE `userrole` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userslist`
--

DROP TABLE IF EXISTS `userslist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userslist` (
  `idUser` int unsigned NOT NULL,
  `userRole` int unsigned NOT NULL,
  PRIMARY KEY (`idUser`,`userRole`),
  KEY `userRole_idx` (`userRole`),
  CONSTRAINT `fk_idUser` FOREIGN KEY (`idUser`) REFERENCES `user` (`idUser`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `userRole` FOREIGN KEY (`userRole`) REFERENCES `userrole` (`index`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userslist`
--

LOCK TABLES `userslist` WRITE;
/*!40000 ALTER TABLE `userslist` DISABLE KEYS */;
/*!40000 ALTER TABLE `userslist` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-09-01  1:21:33
