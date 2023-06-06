-- MariaDB dump 10.19  Distrib 10.5.15-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: db    Database: db
-- ------------------------------------------------------
-- Server version	10.4.26-MariaDB-1:10.4.26+maria~ubu2004-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `addresses`
--

DROP TABLE IF EXISTS `addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `addresses` (
  `id` int(11) NOT NULL,
  `ownerId` int(11) DEFAULT NULL,
  `countryCode` varchar(255) NOT NULL,
  `administrativeArea` varchar(255) DEFAULT NULL,
  `locality` varchar(255) DEFAULT NULL,
  `dependentLocality` varchar(255) DEFAULT NULL,
  `postalCode` varchar(255) DEFAULT NULL,
  `sortingCode` varchar(255) DEFAULT NULL,
  `addressLine1` varchar(255) DEFAULT NULL,
  `addressLine2` varchar(255) DEFAULT NULL,
  `organization` varchar(255) DEFAULT NULL,
  `organizationTaxId` varchar(255) DEFAULT NULL,
  `fullName` varchar(255) DEFAULT NULL,
  `firstName` varchar(255) DEFAULT NULL,
  `lastName` varchar(255) DEFAULT NULL,
  `latitude` varchar(255) DEFAULT NULL,
  `longitude` varchar(255) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_gpceyopjkkuoaqisdngohstcyidsczrxqeaz` (`ownerId`),
  CONSTRAINT `fk_gpceyopjkkuoaqisdngohstcyidsczrxqeaz` FOREIGN KEY (`ownerId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_gvxwrkwwhwjopthxlphgkokzpdhqbsynumus` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `announcements`
--

DROP TABLE IF EXISTS `announcements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `announcements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `pluginId` int(11) DEFAULT NULL,
  `heading` varchar(255) NOT NULL,
  `body` text NOT NULL,
  `unread` tinyint(1) NOT NULL DEFAULT 1,
  `dateRead` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_wtborwzrlpnfelfuvhvqdhvoejkusesipzwu` (`userId`,`unread`,`dateRead`,`dateCreated`),
  KEY `idx_kgjgjtlvqytcihexgsvdabkdiydqbjbpirgu` (`dateRead`),
  KEY `fk_cpbzraiagrbvvhimumoalzdwrsgjbzxxsbws` (`pluginId`),
  CONSTRAINT `fk_cpbzraiagrbvvhimumoalzdwrsgjbzxxsbws` FOREIGN KEY (`pluginId`) REFERENCES `plugins` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_nlvjgmxabdjyiaglcmapdshqhbrwmiiaklyb` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `assetindexdata`
--

DROP TABLE IF EXISTS `assetindexdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assetindexdata` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sessionId` int(11) NOT NULL,
  `volumeId` int(11) NOT NULL,
  `uri` text DEFAULT NULL,
  `size` bigint(20) unsigned DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `isDir` tinyint(1) DEFAULT 0,
  `recordId` int(11) DEFAULT NULL,
  `isSkipped` tinyint(1) DEFAULT 0,
  `inProgress` tinyint(1) DEFAULT 0,
  `completed` tinyint(1) DEFAULT 0,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_cyarqhbfvosqdadyjszjwleornryzeyadytw` (`sessionId`,`volumeId`),
  KEY `idx_gadklzhkvzdgglesxfecipdmsjmikovfquss` (`volumeId`),
  CONSTRAINT `fk_fkxwrlijtuxlzetdmtpheeqzugrsijuvhmsq` FOREIGN KEY (`sessionId`) REFERENCES `assetindexingsessions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_nhocqycavgyfoplzefjzhjllrqxwtyzopfzq` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `assetindexingsessions`
--

DROP TABLE IF EXISTS `assetindexingsessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assetindexingsessions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `indexedVolumes` text DEFAULT NULL,
  `totalEntries` int(11) DEFAULT NULL,
  `processedEntries` int(11) NOT NULL DEFAULT 0,
  `cacheRemoteImages` tinyint(1) DEFAULT NULL,
  `listEmptyFolders` tinyint(1) DEFAULT 0,
  `isCli` tinyint(1) DEFAULT 0,
  `actionRequired` tinyint(1) DEFAULT 0,
  `processIfRootEmpty` tinyint(1) DEFAULT 0,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `assets`
--

DROP TABLE IF EXISTS `assets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assets` (
  `id` int(11) NOT NULL,
  `volumeId` int(11) DEFAULT NULL,
  `folderId` int(11) NOT NULL,
  `uploaderId` int(11) DEFAULT NULL,
  `filename` varchar(255) NOT NULL,
  `kind` varchar(50) NOT NULL DEFAULT 'unknown',
  `alt` text DEFAULT NULL,
  `width` int(11) unsigned DEFAULT NULL,
  `height` int(11) unsigned DEFAULT NULL,
  `size` bigint(20) unsigned DEFAULT NULL,
  `focalPoint` varchar(13) DEFAULT NULL,
  `deletedWithVolume` tinyint(1) DEFAULT NULL,
  `keptFile` tinyint(1) DEFAULT NULL,
  `dateModified` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_jzhmwcmxwilstiukcellbzsyajwbcktjhcjz` (`filename`,`folderId`),
  KEY `idx_fldwkkyguawgqxcbnndlznchxktxjynlnhyf` (`folderId`),
  KEY `idx_ilkqylcodcmwctwpmdpmepssskkphwaxhvyj` (`volumeId`),
  KEY `fk_fmijmbkiuvyitjegxdbbnugyjjwwktjyqzgn` (`uploaderId`),
  CONSTRAINT `fk_dgmxmbfbrdjkxutzsbtjsjvxkqwtphruqiyn` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_fmijmbkiuvyitjegxdbbnugyjjwwktjyqzgn` FOREIGN KEY (`uploaderId`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_tktqjdebrvyflxatmtwepuxnnbamoraxqhlr` FOREIGN KEY (`folderId`) REFERENCES `volumefolders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_ulufcwprxgcksrxtqyrynvstpiekulmtumje` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `parentId` int(11) DEFAULT NULL,
  `deletedWithGroup` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_njnwqpoegiqiuyzqzvnrsjfolargguhorris` (`groupId`),
  KEY `fk_brnseghdrmihgwhwpuodhwruwbmhzdxpnqbi` (`parentId`),
  CONSTRAINT `fk_brnseghdrmihgwhwpuodhwruwbmhzdxpnqbi` FOREIGN KEY (`parentId`) REFERENCES `categories` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_oufbnrifkdbyxdqqorkdcjfchanqaluoqpve` FOREIGN KEY (`groupId`) REFERENCES `categorygroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_rmwkrfbgvcnxgckziqxmbezffemrbwzmaenj` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `categorygroups`
--

DROP TABLE IF EXISTS `categorygroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categorygroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `structureId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `defaultPlacement` enum('beginning','end') NOT NULL DEFAULT 'end',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_oysjghtqoywlwumajzfeiczceidvvxawpaie` (`name`),
  KEY `idx_egbgplrqxohiyigjtxeuhkxqkxybuoxretel` (`handle`),
  KEY `idx_obowfaedowoliwixlhgkucvfyttbxrkjtynb` (`structureId`),
  KEY `idx_julwumrjcqfziesusbjzpcdiusesptysvwyz` (`fieldLayoutId`),
  KEY `idx_hbyjcxrcvgephodssryrbrctkrrlrzumwbsi` (`dateDeleted`),
  CONSTRAINT `fk_nzqupnhqnnhnvcwlqvcbzpxlngtyvdqawxbt` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_wgtcmftlodarmthjfntgwxabcalcujmadjsy` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `categorygroups_sites`
--

DROP TABLE IF EXISTS `categorygroups_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categorygroups_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT 1,
  `uriFormat` text DEFAULT NULL,
  `template` varchar(500) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_eqfzgyfgmfkvfubpmkbapsdantzqcoklepjv` (`groupId`,`siteId`),
  KEY `idx_ynrlzihlivqnpjvraxznovlytrxbwmxffbzz` (`siteId`),
  CONSTRAINT `fk_fosbtxifavuisrerynrqyulstdlirycrklgx` FOREIGN KEY (`groupId`) REFERENCES `categorygroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_vsvkmomhgyfnfgbyxuqmrfhrmfhwaznecqgc` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `changedattributes`
--

DROP TABLE IF EXISTS `changedattributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `changedattributes` (
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `attribute` varchar(255) NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `propagated` tinyint(1) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  PRIMARY KEY (`elementId`,`siteId`,`attribute`),
  KEY `idx_bptltycbqmjguoliowiknibhtyjyuytxjrvy` (`elementId`,`siteId`,`dateUpdated`),
  KEY `fk_hrtvibrvagfqsbyesfiydikefgyafnllnkwm` (`siteId`),
  KEY `fk_scryknfrcoufpycgrptiticfqgzfhxdkthwu` (`userId`),
  CONSTRAINT `fk_hrtvibrvagfqsbyesfiydikefgyafnllnkwm` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_pigrhancukwudehybcttnddahbliqqctbuwt` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_scryknfrcoufpycgrptiticfqgzfhxdkthwu` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `changedfields`
--

DROP TABLE IF EXISTS `changedfields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `changedfields` (
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `propagated` tinyint(1) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  PRIMARY KEY (`elementId`,`siteId`,`fieldId`),
  KEY `idx_rnaclkgmayastpygaxewbchagcacedkxcvjv` (`elementId`,`siteId`,`dateUpdated`),
  KEY `fk_mgdjolqufhsahucjatayezdzwaeqkshxvawk` (`siteId`),
  KEY `fk_ablogbxrtxanueetlbffkegnmjsmkuqtzqik` (`fieldId`),
  KEY `fk_gxhucxpmvhvstcewezpbmicipigkaxkkgebd` (`userId`),
  CONSTRAINT `fk_ablogbxrtxanueetlbffkegnmjsmkuqtzqik` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_akycmqubwphutumagdpebhckrrwarjfovvzc` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_gxhucxpmvhvstcewezpbmicipigkaxkkgebd` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_mgdjolqufhsahucjatayezdzwaeqkshxvawk` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `commerce_coupons`
--

DROP TABLE IF EXISTS `commerce_coupons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `commerce_coupons` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) DEFAULT NULL,
  `discountId` int(11) NOT NULL,
  `uses` int(11) NOT NULL DEFAULT 0,
  `maxUses` int(11) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_jrbvraygsqgvsanpckcugvolbssggshrggvn` (`discountId`),
  KEY `idx_zfuyoiqlxjytfysoflgbimelapspwndqbblf` (`code`),
  CONSTRAINT `fk_krkbjwormyksngihazhqozblvivxbhqizyvs` FOREIGN KEY (`discountId`) REFERENCES `commerce_discounts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `commerce_customer_discountuses`
--

DROP TABLE IF EXISTS `commerce_customer_discountuses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `commerce_customer_discountuses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `discountId` int(11) NOT NULL,
  `customerId` int(11) NOT NULL,
  `uses` int(11) unsigned NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_zsvczhjqsasaajtvpysbcylndpbpbvarmkwv` (`customerId`,`discountId`),
  KEY `idx_xcwzzpmrrjoyibevwysgyergukzgkmlksqrb` (`discountId`),
  CONSTRAINT `fk_gqirovjlyopudnxfsvpbmclinmlkqbpyteqn` FOREIGN KEY (`customerId`) REFERENCES `elements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_hbcrzoajugzzoelnrpunkgbdmugtmyssfdjl` FOREIGN KEY (`discountId`) REFERENCES `commerce_discounts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `commerce_customers`
--

DROP TABLE IF EXISTS `commerce_customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `commerce_customers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customerId` int(11) NOT NULL,
  `primaryBillingAddressId` int(11) DEFAULT NULL,
  `primaryShippingAddressId` int(11) DEFAULT NULL,
  `primaryPaymentSourceId` int(11) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_kfcufdcfpzukrwqqraqlnunxbdlgfwycyvqn` (`customerId`),
  KEY `idx_lxandydsougouadjkbsgijcvhwzjnsiqjwut` (`primaryBillingAddressId`),
  KEY `idx_wilcqjfvdecespginudgzuyurkzagnkxzaks` (`primaryShippingAddressId`),
  KEY `idx_vfojygmepnfjejylknoccneytuvskmaapqai` (`primaryPaymentSourceId`),
  CONSTRAINT `fk_ftlxcqaknbdljaqsgqffhqmwjkniqpessnrn` FOREIGN KEY (`primaryPaymentSourceId`) REFERENCES `commerce_paymentsources` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_kymogsrzphnsudfhlnhhbcydqnzmshctzyaz` FOREIGN KEY (`primaryBillingAddressId`) REFERENCES `elements` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_tonneobyncookkzusdjmqohvorbcxscrogaj` FOREIGN KEY (`customerId`) REFERENCES `elements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_uwqbcqffisrfgnfqjwgeyyhgwhvjyrpjxhbq` FOREIGN KEY (`primaryShippingAddressId`) REFERENCES `elements` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `commerce_discount_categories`
--

DROP TABLE IF EXISTS `commerce_discount_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `commerce_discount_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `discountId` int(11) NOT NULL,
  `categoryId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_bbvansauocohvubbbbkkopcajuzugifeuoyb` (`discountId`,`categoryId`),
  KEY `idx_szkxgtnbciwhmiyuoinchqbfnycjinyesicn` (`categoryId`),
  CONSTRAINT `fk_qqkakguhlhfbsfbbaliluuxvomvodqrxubyw` FOREIGN KEY (`discountId`) REFERENCES `commerce_discounts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_tncajkbqroanoonggysujyvvoquegxoeqrxa` FOREIGN KEY (`categoryId`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `commerce_discount_purchasables`
--

DROP TABLE IF EXISTS `commerce_discount_purchasables`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `commerce_discount_purchasables` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `discountId` int(11) NOT NULL,
  `purchasableId` int(11) NOT NULL,
  `purchasableType` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_gohceasabffirgkcpvwlytjoxxrxjkyqqvtm` (`discountId`,`purchasableId`),
  KEY `idx_nsenhgtepxsqppeljzwncvktxrlkeglshqun` (`purchasableId`),
  CONSTRAINT `fk_eaygqynsvttkwskrxzkmonafbnjuqlfiqnkt` FOREIGN KEY (`discountId`) REFERENCES `commerce_discounts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_gyiihjwbweeduwwxzokdzkkxizypfhuxtmug` FOREIGN KEY (`purchasableId`) REFERENCES `commerce_purchasables` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `commerce_discounts`
--

DROP TABLE IF EXISTS `commerce_discounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `commerce_discounts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `couponFormat` varchar(20) NOT NULL DEFAULT '######',
  `orderCondition` text DEFAULT NULL,
  `customerCondition` text DEFAULT NULL,
  `shippingAddressCondition` text DEFAULT NULL,
  `billingAddressCondition` text DEFAULT NULL,
  `perUserLimit` int(11) unsigned NOT NULL DEFAULT 0,
  `perEmailLimit` int(11) unsigned NOT NULL DEFAULT 0,
  `totalDiscountUses` int(11) unsigned NOT NULL DEFAULT 0,
  `totalDiscountUseLimit` int(11) unsigned NOT NULL DEFAULT 0,
  `dateFrom` datetime DEFAULT NULL,
  `dateTo` datetime DEFAULT NULL,
  `purchaseQty` int(11) NOT NULL DEFAULT 0,
  `purchaseTotal` decimal(14,4) NOT NULL DEFAULT 0.0000,
  `maxPurchaseQty` int(11) NOT NULL DEFAULT 0,
  `baseDiscount` decimal(14,4) NOT NULL DEFAULT 0.0000,
  `baseDiscountType` enum('value','percentTotal','percentTotalDiscounted','percentItems','percentItemsDiscounted') NOT NULL DEFAULT 'value',
  `perItemDiscount` decimal(14,4) NOT NULL DEFAULT 0.0000,
  `percentDiscount` decimal(14,4) NOT NULL DEFAULT 0.0000,
  `percentageOffSubject` enum('original','discounted') NOT NULL,
  `excludeOnSale` tinyint(1) NOT NULL DEFAULT 0,
  `hasFreeShippingForMatchingItems` tinyint(1) NOT NULL DEFAULT 0,
  `hasFreeShippingForOrder` tinyint(1) NOT NULL DEFAULT 0,
  `allPurchasables` tinyint(1) NOT NULL DEFAULT 0,
  `allCategories` tinyint(1) NOT NULL DEFAULT 0,
  `appliedTo` enum('matchingLineItems','allLineItems') NOT NULL DEFAULT 'matchingLineItems',
  `categoryRelationshipType` enum('element','sourceElement','targetElement') NOT NULL DEFAULT 'element',
  `orderConditionFormula` text DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `stopProcessing` tinyint(1) NOT NULL DEFAULT 0,
  `ignoreSales` tinyint(1) NOT NULL DEFAULT 0,
  `sortOrder` int(11) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_ruuyybageiygfsdtcamdxbqvucnignbhucfb` (`dateFrom`),
  KEY `idx_eftmdaycptcqvaltqsvkjsujfvhtaxsjzfjg` (`dateTo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `commerce_donations`
--

DROP TABLE IF EXISTS `commerce_donations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `commerce_donations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sku` varchar(255) NOT NULL,
  `availableForPurchase` tinyint(1) NOT NULL DEFAULT 0,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_mzbrmmwmekxhkbtykufdguigrgaspyjtolkm` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `commerce_email_discountuses`
--

DROP TABLE IF EXISTS `commerce_email_discountuses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `commerce_email_discountuses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `discountId` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `uses` int(11) unsigned NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_olspvelqrwrbscrnlstffaonvphrronwijcp` (`email`,`discountId`),
  KEY `idx_jewmfzkwvrmzrmupoifpgyhxljpzkduerejc` (`discountId`),
  CONSTRAINT `fk_bvmtnsmaayosgxabajnbvagzrxnoeaqbxmjo` FOREIGN KEY (`discountId`) REFERENCES `commerce_discounts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `commerce_emails`
--

DROP TABLE IF EXISTS `commerce_emails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `commerce_emails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `recipientType` enum('customer','custom') DEFAULT 'custom',
  `to` varchar(255) DEFAULT NULL,
  `bcc` varchar(255) DEFAULT NULL,
  `cc` varchar(255) DEFAULT NULL,
  `replyTo` varchar(255) DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `templatePath` varchar(255) NOT NULL,
  `plainTextTemplatePath` varchar(255) DEFAULT NULL,
  `pdfId` int(11) DEFAULT NULL,
  `language` varchar(255) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_wpxtvsddzczshseoohmnxgrvillbnfoqtbjc` (`pdfId`),
  CONSTRAINT `fk_wpxtvsddzczshseoohmnxgrvillbnfoqtbjc` FOREIGN KEY (`pdfId`) REFERENCES `commerce_pdfs` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `commerce_gateways`
--

DROP TABLE IF EXISTS `commerce_gateways`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `commerce_gateways` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `settings` text DEFAULT NULL,
  `paymentType` enum('authorize','purchase') NOT NULL DEFAULT 'purchase',
  `isFrontendEnabled` varchar(500) NOT NULL DEFAULT '1',
  `isArchived` tinyint(1) NOT NULL DEFAULT 0,
  `dateArchived` datetime DEFAULT NULL,
  `sortOrder` int(11) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_qwsoltgtvhpmqhuewyawctpmflixzywmrakc` (`handle`),
  KEY `idx_udzrzttsxxrcdpguowzzofictoveyfbyjnze` (`isArchived`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `commerce_lineitems`
--

DROP TABLE IF EXISTS `commerce_lineitems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `commerce_lineitems` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orderId` int(11) NOT NULL,
  `purchasableId` int(11) DEFAULT NULL,
  `taxCategoryId` int(11) NOT NULL,
  `shippingCategoryId` int(11) NOT NULL,
  `description` text DEFAULT NULL,
  `options` text DEFAULT NULL,
  `optionsSignature` varchar(255) NOT NULL,
  `price` decimal(14,4) unsigned NOT NULL,
  `saleAmount` decimal(14,4) NOT NULL DEFAULT 0.0000,
  `salePrice` decimal(14,4) NOT NULL DEFAULT 0.0000,
  `sku` varchar(255) DEFAULT NULL,
  `weight` decimal(14,4) unsigned NOT NULL DEFAULT 0.0000,
  `height` decimal(14,4) unsigned NOT NULL DEFAULT 0.0000,
  `length` decimal(14,4) unsigned NOT NULL DEFAULT 0.0000,
  `width` decimal(14,4) unsigned NOT NULL DEFAULT 0.0000,
  `subtotal` decimal(14,4) unsigned NOT NULL DEFAULT 0.0000,
  `total` decimal(14,4) NOT NULL DEFAULT 0.0000,
  `qty` int(11) unsigned NOT NULL,
  `note` text DEFAULT NULL,
  `privateNote` text DEFAULT NULL,
  `snapshot` longtext DEFAULT NULL,
  `lineItemStatusId` int(11) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_fijlgcyomhourfttvudfvfatwvmfmrsqbgxm` (`orderId`,`purchasableId`,`optionsSignature`),
  KEY `idx_exnshfmcpaylxdbcauueqrlqkxxnyzafulqv` (`purchasableId`),
  KEY `idx_mbqvgafukamdkxhujsctuqgmtswahmeuwzno` (`taxCategoryId`),
  KEY `idx_wwdpftzsbyzxpciombizcphbhdvkcjrodwke` (`shippingCategoryId`),
  CONSTRAINT `fk_bltwklzpatndczdhcygpwpvwhwwlbuuwszic` FOREIGN KEY (`purchasableId`) REFERENCES `elements` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_kmfcmqnfummtvceamsnrbxaikfnljykzkehy` FOREIGN KEY (`shippingCategoryId`) REFERENCES `commerce_shippingcategories` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_yqnqjcuxvqvwctiicsmrbolobfrkgxksgzjz` FOREIGN KEY (`taxCategoryId`) REFERENCES `commerce_taxcategories` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_zjfyookhhjrpntxgbuuvcfxqwzddafbfoagn` FOREIGN KEY (`orderId`) REFERENCES `commerce_orders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `commerce_lineitemstatuses`
--

DROP TABLE IF EXISTS `commerce_lineitemstatuses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `commerce_lineitemstatuses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `color` enum('green','orange','red','blue','yellow','pink','purple','turquoise','light','grey','black') NOT NULL DEFAULT 'green',
  `isArchived` tinyint(1) NOT NULL DEFAULT 0,
  `dateArchived` datetime DEFAULT NULL,
  `sortOrder` int(11) DEFAULT NULL,
  `default` tinyint(1) NOT NULL DEFAULT 0,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `commerce_orderadjustments`
--

DROP TABLE IF EXISTS `commerce_orderadjustments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `commerce_orderadjustments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orderId` int(11) NOT NULL,
  `lineItemId` int(11) DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `amount` decimal(14,4) NOT NULL,
  `included` tinyint(1) NOT NULL DEFAULT 0,
  `isEstimated` tinyint(1) NOT NULL DEFAULT 0,
  `sourceSnapshot` longtext DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_qibqxjlpevqbqfvyxxsbkmtexjkupbcgtmpe` (`orderId`),
  CONSTRAINT `fk_spitfhzphwfbybypxyqajnxqwkdbbndbfewh` FOREIGN KEY (`orderId`) REFERENCES `commerce_orders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `commerce_orderhistories`
--

DROP TABLE IF EXISTS `commerce_orderhistories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `commerce_orderhistories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orderId` int(11) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  `userName` varchar(255) DEFAULT NULL,
  `prevStatusId` int(11) DEFAULT NULL,
  `newStatusId` int(11) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_vjrvqbukkxiamiyeazlhdzubifnatbamwpzd` (`orderId`),
  KEY `idx_sjhaxnjtlgkterpnabsyeaihncvfccftdfgm` (`prevStatusId`),
  KEY `idx_pfntmsxwyulyqdeofidpfwxwrsjylamtymvi` (`newStatusId`),
  KEY `idx_vnbkwmmgeiwgkgdqwspsqjykumifyxxvxihp` (`userId`),
  CONSTRAINT `fk_hhlphexygwnubtgoiufoiztlrkmhylccjchq` FOREIGN KEY (`userId`) REFERENCES `elements` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_jjnxhogqhqtnpbpdxyxxsdibqehtmnyejsav` FOREIGN KEY (`orderId`) REFERENCES `commerce_orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_ooplkdggkvwpbzxkxyejhofxqqdajdkqcdem` FOREIGN KEY (`newStatusId`) REFERENCES `commerce_orderstatuses` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_xhmeaszueoammctzwgkjeorwdximwiicnijq` FOREIGN KEY (`prevStatusId`) REFERENCES `commerce_orderstatuses` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `commerce_ordernotices`
--

DROP TABLE IF EXISTS `commerce_ordernotices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `commerce_ordernotices` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orderId` int(11) NOT NULL,
  `type` varchar(255) DEFAULT NULL,
  `attribute` varchar(255) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_gshmqlhmwvhmtrapaufyipmjxvcdwrkzuxjk` (`orderId`),
  CONSTRAINT `fk_fkufgzcnjeascsqiamzzcpwlsyxezfaffelm` FOREIGN KEY (`orderId`) REFERENCES `commerce_orders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `commerce_orders`
--

DROP TABLE IF EXISTS `commerce_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `commerce_orders` (
  `id` int(11) NOT NULL,
  `billingAddressId` int(11) DEFAULT NULL,
  `shippingAddressId` int(11) DEFAULT NULL,
  `estimatedBillingAddressId` int(11) DEFAULT NULL,
  `estimatedShippingAddressId` int(11) DEFAULT NULL,
  `sourceShippingAddressId` int(11) DEFAULT NULL,
  `sourceBillingAddressId` int(11) DEFAULT NULL,
  `gatewayId` int(11) DEFAULT NULL,
  `paymentSourceId` int(11) DEFAULT NULL,
  `customerId` int(11) DEFAULT NULL,
  `orderStatusId` int(11) DEFAULT NULL,
  `number` varchar(32) DEFAULT NULL,
  `reference` varchar(255) DEFAULT NULL,
  `couponCode` varchar(255) DEFAULT NULL,
  `itemTotal` decimal(14,4) DEFAULT 0.0000,
  `itemSubtotal` decimal(14,4) DEFAULT 0.0000,
  `totalQty` int(11) unsigned DEFAULT NULL,
  `total` decimal(14,4) DEFAULT 0.0000,
  `totalPrice` decimal(14,4) DEFAULT 0.0000,
  `totalPaid` decimal(14,4) DEFAULT 0.0000,
  `totalDiscount` decimal(14,4) DEFAULT 0.0000,
  `totalTax` decimal(14,4) DEFAULT 0.0000,
  `totalTaxIncluded` decimal(14,4) DEFAULT 0.0000,
  `totalShippingCost` decimal(14,4) DEFAULT 0.0000,
  `paidStatus` enum('paid','partial','unpaid','overPaid') DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `isCompleted` tinyint(1) NOT NULL DEFAULT 0,
  `dateOrdered` datetime DEFAULT NULL,
  `datePaid` datetime DEFAULT NULL,
  `dateAuthorized` datetime DEFAULT NULL,
  `currency` varchar(255) DEFAULT NULL,
  `paymentCurrency` varchar(255) DEFAULT NULL,
  `lastIp` varchar(255) DEFAULT NULL,
  `orderLanguage` varchar(12) NOT NULL,
  `origin` enum('web','cp','remote') NOT NULL DEFAULT 'web',
  `message` text DEFAULT NULL,
  `registerUserOnOrderComplete` tinyint(1) NOT NULL DEFAULT 0,
  `recalculationMode` enum('all','none','adjustmentsOnly') NOT NULL DEFAULT 'all',
  `returnUrl` text DEFAULT NULL,
  `cancelUrl` text DEFAULT NULL,
  `shippingMethodHandle` varchar(255) NOT NULL DEFAULT '',
  `shippingMethodName` varchar(255) NOT NULL DEFAULT '',
  `orderSiteId` int(11) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_ltbtnahvofzdlwuouqpttepeurazpxwyppqg` (`number`),
  KEY `idx_ddjpipsqjampivyocjdhdqrgzfmchaykdbum` (`reference`),
  KEY `idx_zpcopbnksygyjhpsvmszfocddmtfpqcenmek` (`billingAddressId`),
  KEY `idx_vdcnmizerseblvgqliqludrjzirngjurcwql` (`shippingAddressId`),
  KEY `idx_jnmwnoecvsvwylfyjypbaurzaxfyunwlqkrj` (`estimatedBillingAddressId`),
  KEY `idx_dwmngofbtrbtjbujpnxwylmzlnihpqpvhfkq` (`estimatedShippingAddressId`),
  KEY `idx_rduslwlhrsbygnaaaauqqtekaksosrjstado` (`gatewayId`),
  KEY `idx_wxgmkpoklomctnsovxkbuftbnopflahsshcl` (`customerId`),
  KEY `idx_ehamftzbdpbqbygwajxsaorvuopfztosmsii` (`orderStatusId`),
  KEY `idx_cbluilbdpbyunblarvzadedcluzzdmzefkfc` (`email`),
  KEY `fk_veqoyyluildojrhyrkmbggqvdhmojxedfreg` (`paymentSourceId`),
  CONSTRAINT `fk_amaspfotphtpkyemfmxdligqeyucllkfuriv` FOREIGN KEY (`orderStatusId`) REFERENCES `commerce_orderstatuses` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_ebnyxiuycrljfrevccvasglopahzzdlbbzeu` FOREIGN KEY (`gatewayId`) REFERENCES `commerce_gateways` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_mikpgnzucckaovcfxgqmamqkwsnxpwjtscfs` FOREIGN KEY (`estimatedShippingAddressId`) REFERENCES `elements` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_ncpnqetoszlsduvfyoutlbfzxqsrapcxfpyy` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_qchykumaeqslbnmhrdlszzmlskdoxnznlsvh` FOREIGN KEY (`shippingAddressId`) REFERENCES `elements` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_rbztffkxsjicinainlqizjlpflojnadnbvko` FOREIGN KEY (`customerId`) REFERENCES `elements` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_rvfsvfysrnwzscmhsluzlybeuhibesdxmzls` FOREIGN KEY (`billingAddressId`) REFERENCES `elements` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_usrjvqkyllbkojuyvwxfewotiwdfspthjiuv` FOREIGN KEY (`estimatedBillingAddressId`) REFERENCES `elements` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_veqoyyluildojrhyrkmbggqvdhmojxedfreg` FOREIGN KEY (`paymentSourceId`) REFERENCES `commerce_paymentsources` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `commerce_orderstatus_emails`
--

DROP TABLE IF EXISTS `commerce_orderstatus_emails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `commerce_orderstatus_emails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orderStatusId` int(11) NOT NULL,
  `emailId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_lwqimlyglptcijglphmybwguoplkypfpujtc` (`orderStatusId`),
  KEY `idx_hxezeccxkhcuneowrmzsqtzlnwynsfxqxnid` (`emailId`),
  CONSTRAINT `fk_dxfjzkzeyimlxrnuxtsejlldiwvndywgpadx` FOREIGN KEY (`emailId`) REFERENCES `commerce_emails` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_hpkefjukcqoouvaupnwsrbralmqzqjczzoji` FOREIGN KEY (`orderStatusId`) REFERENCES `commerce_orderstatuses` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `commerce_orderstatuses`
--

DROP TABLE IF EXISTS `commerce_orderstatuses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `commerce_orderstatuses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `color` enum('green','orange','red','blue','yellow','pink','purple','turquoise','light','grey','black') NOT NULL DEFAULT 'green',
  `description` varchar(255) DEFAULT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `sortOrder` int(11) DEFAULT NULL,
  `default` tinyint(1) NOT NULL DEFAULT 0,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `commerce_paymentcurrencies`
--

DROP TABLE IF EXISTS `commerce_paymentcurrencies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `commerce_paymentcurrencies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `iso` varchar(3) NOT NULL,
  `primary` tinyint(1) NOT NULL DEFAULT 0,
  `rate` decimal(14,4) NOT NULL DEFAULT 0.0000,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_phjhwuwcrvrgtlkeyudkyrexdjhpcgnzbhmw` (`iso`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `commerce_paymentsources`
--

DROP TABLE IF EXISTS `commerce_paymentsources`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `commerce_paymentsources` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customerId` int(11) NOT NULL,
  `gatewayId` int(11) NOT NULL,
  `token` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `response` text DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_opvagsfngqamvwspwqdyojfdoxfckxkshkgt` (`customerId`),
  KEY `fk_kkzmqjjrroqqcaopofzlkmuygvxaasfjzjmi` (`gatewayId`),
  CONSTRAINT `fk_kkzmqjjrroqqcaopofzlkmuygvxaasfjzjmi` FOREIGN KEY (`gatewayId`) REFERENCES `commerce_gateways` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_opvagsfngqamvwspwqdyojfdoxfckxkshkgt` FOREIGN KEY (`customerId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `commerce_pdfs`
--

DROP TABLE IF EXISTS `commerce_pdfs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `commerce_pdfs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `templatePath` varchar(255) NOT NULL,
  `fileNameFormat` varchar(255) DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `isDefault` tinyint(1) NOT NULL DEFAULT 0,
  `sortOrder` int(11) DEFAULT NULL,
  `language` varchar(255) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_aknsoohaqpphizqgvtgyclwhwzujvyqkcvue` (`handle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `commerce_plans`
--

DROP TABLE IF EXISTS `commerce_plans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `commerce_plans` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gatewayId` int(11) DEFAULT NULL,
  `planInformationId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `reference` varchar(255) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 0,
  `planData` text DEFAULT NULL,
  `isArchived` tinyint(1) NOT NULL DEFAULT 0,
  `dateArchived` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `sortOrder` int(11) DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_xncukznxxzixqhdcntruklavthunvhccfusf` (`handle`),
  KEY `idx_syjizkanpolifgteoijzqpbijheklvadwpzu` (`gatewayId`),
  KEY `idx_epexggujxqyiwspfghcsahuyzwbczuogkzjz` (`reference`),
  KEY `fk_hkvjyeqhtqmnakcxdqwdgcwwpmgjnvyibvyk` (`planInformationId`),
  CONSTRAINT `fk_hkvjyeqhtqmnakcxdqwdgcwwpmgjnvyibvyk` FOREIGN KEY (`planInformationId`) REFERENCES `elements` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_xurrewdxxhyhxxfoxqmrwbcfqfoyjfekkphj` FOREIGN KEY (`gatewayId`) REFERENCES `commerce_gateways` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `commerce_products`
--

DROP TABLE IF EXISTS `commerce_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `commerce_products` (
  `id` int(11) NOT NULL,
  `typeId` int(11) DEFAULT NULL,
  `taxCategoryId` int(11) NOT NULL,
  `shippingCategoryId` int(11) NOT NULL,
  `defaultVariantId` int(11) DEFAULT NULL,
  `postDate` datetime DEFAULT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `promotable` tinyint(1) NOT NULL DEFAULT 0,
  `availableForPurchase` tinyint(1) NOT NULL DEFAULT 1,
  `freeShipping` tinyint(1) NOT NULL DEFAULT 1,
  `defaultSku` varchar(255) DEFAULT NULL,
  `defaultPrice` decimal(14,4) DEFAULT NULL,
  `defaultHeight` decimal(14,4) DEFAULT NULL,
  `defaultLength` decimal(14,4) DEFAULT NULL,
  `defaultWidth` decimal(14,4) DEFAULT NULL,
  `defaultWeight` decimal(14,4) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_lowybsusrbejflyrcmymqrkrtrukzznultsv` (`typeId`),
  KEY `idx_bluxukkzjsmjdeygcrspbpnirujecywyyoia` (`postDate`),
  KEY `idx_ivmatuaklyaotojhvaqzlrogsptwpnjagjzw` (`expiryDate`),
  KEY `idx_cdhwjttzhwutlasxziccaokxrefigdkbtqjb` (`taxCategoryId`),
  KEY `idx_mqixozicvgypgxkoacjvbkmxfkcyiyinoghg` (`shippingCategoryId`),
  CONSTRAINT `fk_mcpbqiboiqlhrvmjofsfxeiitjxosstculdf` FOREIGN KEY (`shippingCategoryId`) REFERENCES `commerce_shippingcategories` (`id`),
  CONSTRAINT `fk_pmduwrruenilmnsbmgvbhjimmkijmngshhez` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_svccldicmfgbawzjjrysyipwydboiqoebahz` FOREIGN KEY (`taxCategoryId`) REFERENCES `commerce_taxcategories` (`id`),
  CONSTRAINT `fk_treunwzegrqfbraevbmcpmmcadhyavsbewmn` FOREIGN KEY (`typeId`) REFERENCES `commerce_producttypes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `commerce_producttypes`
--

DROP TABLE IF EXISTS `commerce_producttypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `commerce_producttypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `variantFieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `hasDimensions` tinyint(1) NOT NULL DEFAULT 0,
  `hasVariants` tinyint(1) NOT NULL DEFAULT 0,
  `hasVariantTitleField` tinyint(1) NOT NULL DEFAULT 1,
  `variantTitleFormat` varchar(255) NOT NULL,
  `hasProductTitleField` tinyint(1) NOT NULL DEFAULT 1,
  `productTitleFormat` varchar(255) DEFAULT NULL,
  `skuFormat` varchar(255) DEFAULT NULL,
  `descriptionFormat` varchar(255) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_iqmsgqnfzuvsiggfoxpjrorjchazhvxkgfiw` (`handle`),
  KEY `idx_lzkvonfvmqrmrywtjkktmfszciaksemrxfki` (`fieldLayoutId`),
  KEY `idx_npyfcnjyojsncuegmolcfslynxsieumejjft` (`variantFieldLayoutId`),
  CONSTRAINT `fk_dqcghwjyvgzetsyfuntbpxpquzrxxtcadmtp` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_jqrphfqxshypvtfavzapdiyfsjrondaskfkp` FOREIGN KEY (`variantFieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `commerce_producttypes_shippingcategories`
--

DROP TABLE IF EXISTS `commerce_producttypes_shippingcategories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `commerce_producttypes_shippingcategories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `productTypeId` int(11) NOT NULL,
  `shippingCategoryId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_pjcwtgpmopywnqghrtzmgiymvosauocjujur` (`productTypeId`,`shippingCategoryId`),
  KEY `idx_lmxiruifyrbjbvaadifbndbnihbkskkmwkke` (`shippingCategoryId`),
  CONSTRAINT `fk_xbnkgknzhebroqpyltrtaodvcuflekmhrkvi` FOREIGN KEY (`shippingCategoryId`) REFERENCES `commerce_shippingcategories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_zflmxyrkjaptbegymzxloqnqoomsfyallbpv` FOREIGN KEY (`productTypeId`) REFERENCES `commerce_producttypes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `commerce_producttypes_sites`
--

DROP TABLE IF EXISTS `commerce_producttypes_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `commerce_producttypes_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `productTypeId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `uriFormat` text DEFAULT NULL,
  `template` varchar(500) DEFAULT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT 0,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_eigeqtpxgoawfzfmqhnbvvlxpesklomdskiv` (`productTypeId`,`siteId`),
  KEY `idx_klfujnlcecnicskvuhafrwpsqnkguqifqdlq` (`siteId`),
  CONSTRAINT `fk_eirjogaojcqclqvyyjahrbkdqvljuulscwpq` FOREIGN KEY (`productTypeId`) REFERENCES `commerce_producttypes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_hllamkbajgevbelydxtjidqdrevudbohkgmc` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `commerce_producttypes_taxcategories`
--

DROP TABLE IF EXISTS `commerce_producttypes_taxcategories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `commerce_producttypes_taxcategories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `productTypeId` int(11) NOT NULL,
  `taxCategoryId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_crpngbpbgshvmagoeisqjdaqxacoegoahocq` (`productTypeId`,`taxCategoryId`),
  KEY `idx_ptmldkxssjezcatwrmobhqxfisjzdkdgzbkl` (`taxCategoryId`),
  CONSTRAINT `fk_ivztgwcpnhungtqftaofhsyrmoctucdurwrf` FOREIGN KEY (`productTypeId`) REFERENCES `commerce_producttypes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_kqlrvbbwbvkbzeurpmszuwxbpobcvwwdeavj` FOREIGN KEY (`taxCategoryId`) REFERENCES `commerce_taxcategories` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `commerce_purchasables`
--

DROP TABLE IF EXISTS `commerce_purchasables`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `commerce_purchasables` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sku` varchar(255) NOT NULL,
  `price` decimal(14,4) NOT NULL,
  `description` text DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_gnsebfrmphfkrxwjazailrgbrymyorzjvtkq` (`sku`),
  CONSTRAINT `fk_bbgqdxzmzdbolodwvsfuhgfayihgeesolxil` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `commerce_sale_categories`
--

DROP TABLE IF EXISTS `commerce_sale_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `commerce_sale_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `saleId` int(11) NOT NULL,
  `categoryId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_lfjmmnuncqakezgibvnswpypyypzmbxszdit` (`saleId`,`categoryId`),
  KEY `idx_lwvxcoyqmzceflpksffdyxjgbbiaxrcujiiu` (`categoryId`),
  CONSTRAINT `fk_vhtujhfmlaaompdkzufhclytayygsftrqgbm` FOREIGN KEY (`saleId`) REFERENCES `commerce_sales` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_wktdlipsjcnkmjyckfcpoybhknsalvuuuvxb` FOREIGN KEY (`categoryId`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `commerce_sale_purchasables`
--

DROP TABLE IF EXISTS `commerce_sale_purchasables`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `commerce_sale_purchasables` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `saleId` int(11) NOT NULL,
  `purchasableId` int(11) NOT NULL,
  `purchasableType` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_ztlaosmoatzxflwefpbokodkssijeguorura` (`saleId`,`purchasableId`),
  KEY `idx_qjapjzllcxdpmhwbiydklhtedwrzxcpkqtqd` (`purchasableId`),
  CONSTRAINT `fk_bpbqyayqehthewnxuxkykosqmgpehbhzcmxo` FOREIGN KEY (`saleId`) REFERENCES `commerce_sales` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_bshjinwippztovitpiuewyprcbblvsxfefmx` FOREIGN KEY (`purchasableId`) REFERENCES `commerce_purchasables` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `commerce_sale_usergroups`
--

DROP TABLE IF EXISTS `commerce_sale_usergroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `commerce_sale_usergroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `saleId` int(11) NOT NULL,
  `userGroupId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_hnpchojcinmuqqjlkztqakewayvwkqxhfoee` (`saleId`,`userGroupId`),
  KEY `idx_osklgotrznafzbrimbpkqfsvvalvykgwnald` (`userGroupId`),
  CONSTRAINT `fk_pkyazkfpgwldhsoehpppybpdopyazogyehth` FOREIGN KEY (`saleId`) REFERENCES `commerce_sales` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_stmrnwwbsijrspfrefzhtuxjjkfeevbxmdbl` FOREIGN KEY (`userGroupId`) REFERENCES `usergroups` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `commerce_sales`
--

DROP TABLE IF EXISTS `commerce_sales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `commerce_sales` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `dateFrom` datetime DEFAULT NULL,
  `dateTo` datetime DEFAULT NULL,
  `apply` enum('toPercent','toFlat','byPercent','byFlat') NOT NULL,
  `applyAmount` decimal(14,4) NOT NULL,
  `allGroups` tinyint(1) NOT NULL DEFAULT 0,
  `allPurchasables` tinyint(1) NOT NULL DEFAULT 0,
  `allCategories` tinyint(1) NOT NULL DEFAULT 0,
  `categoryRelationshipType` enum('element','sourceElement','targetElement') NOT NULL DEFAULT 'element',
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `ignorePrevious` tinyint(1) NOT NULL DEFAULT 0,
  `stopProcessing` tinyint(1) NOT NULL DEFAULT 0,
  `sortOrder` int(11) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `commerce_shippingcategories`
--

DROP TABLE IF EXISTS `commerce_shippingcategories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `commerce_shippingcategories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `default` tinyint(1) NOT NULL DEFAULT 0,
  `dateDeleted` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `commerce_shippingmethods`
--

DROP TABLE IF EXISTS `commerce_shippingmethods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `commerce_shippingmethods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `isLite` tinyint(1) NOT NULL DEFAULT 0,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_zbblwtjuiysdljyydqxwkhcpcwvtzynpgxzv` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `commerce_shippingrule_categories`
--

DROP TABLE IF EXISTS `commerce_shippingrule_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `commerce_shippingrule_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `shippingRuleId` int(11) DEFAULT NULL,
  `shippingCategoryId` int(11) DEFAULT NULL,
  `condition` enum('allow','disallow','require') NOT NULL,
  `perItemRate` decimal(14,4) DEFAULT NULL,
  `weightRate` decimal(14,4) DEFAULT NULL,
  `percentageRate` decimal(14,4) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_afpreaxxamtcquxhhqfmnfqvajxisgjcggbm` (`shippingRuleId`),
  KEY `idx_pycqkyfohmgtwtpnnzlkgkkxpsbwyekmoouq` (`shippingCategoryId`),
  CONSTRAINT `fk_apfgmgxinkvogonnacmysppbirvrgfmhynfl` FOREIGN KEY (`shippingRuleId`) REFERENCES `commerce_shippingrules` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_qpjugxinmofirwxxgxvjjftvgxfukebsgkfd` FOREIGN KEY (`shippingCategoryId`) REFERENCES `commerce_shippingcategories` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `commerce_shippingrules`
--

DROP TABLE IF EXISTS `commerce_shippingrules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `commerce_shippingrules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `shippingZoneId` int(11) DEFAULT NULL,
  `methodId` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `priority` int(11) NOT NULL DEFAULT 0,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `orderConditionFormula` text DEFAULT NULL,
  `minQty` int(11) NOT NULL DEFAULT 0,
  `maxQty` int(11) NOT NULL DEFAULT 0,
  `minTotal` decimal(14,4) NOT NULL DEFAULT 0.0000,
  `maxTotal` decimal(14,4) NOT NULL DEFAULT 0.0000,
  `minMaxTotalType` enum('salePrice','salePriceWithDiscounts') NOT NULL DEFAULT 'salePrice',
  `minWeight` decimal(14,4) NOT NULL DEFAULT 0.0000,
  `maxWeight` decimal(14,4) NOT NULL DEFAULT 0.0000,
  `baseRate` decimal(14,4) NOT NULL DEFAULT 0.0000,
  `perItemRate` decimal(14,4) NOT NULL DEFAULT 0.0000,
  `weightRate` decimal(14,4) NOT NULL DEFAULT 0.0000,
  `percentageRate` decimal(14,4) NOT NULL DEFAULT 0.0000,
  `minRate` decimal(14,4) NOT NULL DEFAULT 0.0000,
  `maxRate` decimal(14,4) NOT NULL DEFAULT 0.0000,
  `isLite` tinyint(1) NOT NULL DEFAULT 0,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_thcyjrmdynsfhysfvgrdbhccmoapsjgnedro` (`name`),
  KEY `idx_ljqrlyixkyzgqmqcyaddxcdayqcsnwsxqvvr` (`methodId`),
  KEY `idx_alxsqysrhvagapnhbukuxyybazfommhsyccm` (`shippingZoneId`),
  CONSTRAINT `fk_auflhrqhsnngjtmqbiinqqzmupqqbhnyxepi` FOREIGN KEY (`shippingZoneId`) REFERENCES `commerce_shippingzones` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_lnguuffmnwhbztxhczukecyfjtysrmnqiubd` FOREIGN KEY (`methodId`) REFERENCES `commerce_shippingmethods` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `commerce_shippingzones`
--

DROP TABLE IF EXISTS `commerce_shippingzones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `commerce_shippingzones` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `condition` text DEFAULT NULL,
  `default` tinyint(1) NOT NULL DEFAULT 0,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_bjcbpcuxrlkotwdlheytabztithpqgxbbxyt` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `commerce_stores`
--

DROP TABLE IF EXISTS `commerce_stores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `commerce_stores` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `locationAddressId` int(11) DEFAULT NULL,
  `countries` text DEFAULT NULL,
  `marketAddressCondition` text DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `commerce_subscriptions`
--

DROP TABLE IF EXISTS `commerce_subscriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `commerce_subscriptions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `planId` int(11) DEFAULT NULL,
  `gatewayId` int(11) DEFAULT NULL,
  `orderId` int(11) DEFAULT NULL,
  `reference` varchar(255) NOT NULL,
  `subscriptionData` text DEFAULT NULL,
  `trialDays` int(11) NOT NULL,
  `nextPaymentDate` datetime DEFAULT NULL,
  `hasStarted` tinyint(1) NOT NULL DEFAULT 1,
  `isSuspended` tinyint(1) NOT NULL DEFAULT 0,
  `dateSuspended` datetime DEFAULT NULL,
  `isCanceled` tinyint(1) NOT NULL DEFAULT 0,
  `dateCanceled` datetime DEFAULT NULL,
  `isExpired` tinyint(1) NOT NULL DEFAULT 0,
  `dateExpired` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_axgcoenyodyzurlpcglsuqlnhfzyvtgyhael` (`reference`),
  KEY `idx_gzpedbacuprdekfudaoohadjgzvqpfxjscil` (`userId`),
  KEY `idx_cdihqnehwojmdakjeqiddrxxiynletrzgtpi` (`planId`),
  KEY `idx_tpfynozbjqkmlffzrapofhqaocnsuukbxsur` (`gatewayId`),
  KEY `idx_wvgfhvdrlivwzxfubcgtppskalqpawpyoyfm` (`nextPaymentDate`),
  KEY `idx_mdrkmyvdrelzyznphwfxzqqozhkgetepxhgx` (`dateCreated`),
  KEY `idx_ehdgpuvvczhykjxzccecefwnpyxzzuuynpyd` (`dateExpired`),
  KEY `fk_jgrzvahrbxvbxdfdpwbqatcjjtqwmemsheut` (`orderId`),
  CONSTRAINT `fk_hvydlrolktprbpyqewslwcjqubdmqpujuoas` FOREIGN KEY (`gatewayId`) REFERENCES `commerce_gateways` (`id`),
  CONSTRAINT `fk_jgrzvahrbxvbxdfdpwbqatcjjtqwmemsheut` FOREIGN KEY (`orderId`) REFERENCES `commerce_orders` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_rlwzcpqbunuytvtwrstyrkubavazwyinjwxb` FOREIGN KEY (`planId`) REFERENCES `commerce_plans` (`id`),
  CONSTRAINT `fk_rofnxftvdluqbmcehearfbwsyagpywzlohbz` FOREIGN KEY (`userId`) REFERENCES `users` (`id`),
  CONSTRAINT `fk_ycbkikrkxcnzkzusmbmseaktvpjjwitbjjla` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `commerce_taxcategories`
--

DROP TABLE IF EXISTS `commerce_taxcategories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `commerce_taxcategories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `default` tinyint(1) NOT NULL DEFAULT 0,
  `dateDeleted` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `commerce_taxrates`
--

DROP TABLE IF EXISTS `commerce_taxrates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `commerce_taxrates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `taxZoneId` int(11) DEFAULT NULL,
  `isEverywhere` tinyint(1) NOT NULL DEFAULT 1,
  `taxCategoryId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `code` varchar(255) DEFAULT NULL,
  `rate` decimal(14,10) NOT NULL,
  `include` tinyint(1) NOT NULL DEFAULT 0,
  `isVat` tinyint(1) NOT NULL DEFAULT 0,
  `removeIncluded` tinyint(1) NOT NULL DEFAULT 0,
  `removeVatIncluded` tinyint(1) NOT NULL DEFAULT 0,
  `taxable` enum('purchasable','price','shipping','price_shipping','order_total_shipping','order_total_price') NOT NULL,
  `isLite` tinyint(1) NOT NULL DEFAULT 0,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_dktccjpjtzflqeftdpyvlutvmysdsvlhxtno` (`taxZoneId`),
  KEY `idx_fjzzcqadodfkxzpnvsxehtaxtuajfeqptjms` (`taxCategoryId`),
  CONSTRAINT `fk_hbkheodwwlhrspligfxqhzqaoloqeiuiqyhq` FOREIGN KEY (`taxCategoryId`) REFERENCES `commerce_taxcategories` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_ioarzumzwegmirbumthkshglqccocuzcloal` FOREIGN KEY (`taxZoneId`) REFERENCES `commerce_taxzones` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `commerce_taxzones`
--

DROP TABLE IF EXISTS `commerce_taxzones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `commerce_taxzones` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `condition` text DEFAULT NULL,
  `default` tinyint(1) NOT NULL DEFAULT 0,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_stlqhhmegmrwyjzpfmzsymqubeivjypawazw` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `commerce_transactions`
--

DROP TABLE IF EXISTS `commerce_transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `commerce_transactions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orderId` int(11) NOT NULL,
  `parentId` int(11) DEFAULT NULL,
  `gatewayId` int(11) DEFAULT NULL,
  `userId` int(11) DEFAULT NULL,
  `hash` varchar(32) DEFAULT NULL,
  `type` enum('authorize','capture','purchase','refund') NOT NULL,
  `amount` decimal(14,4) DEFAULT NULL,
  `paymentAmount` decimal(14,4) DEFAULT NULL,
  `currency` varchar(255) DEFAULT NULL,
  `paymentCurrency` varchar(255) DEFAULT NULL,
  `paymentRate` decimal(14,4) DEFAULT NULL,
  `status` enum('pending','redirect','success','failed','processing') NOT NULL,
  `reference` varchar(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `note` mediumtext DEFAULT NULL,
  `response` text DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_yosdriwnajfqtqyjlrojczgycgqfllrkxzwd` (`parentId`),
  KEY `idx_wzafitvbdvvyoivwfbphtucqvtetylqwhten` (`gatewayId`),
  KEY `idx_zdwlyznevkqriflxbzdqtqvbyvpmsvyzrefi` (`orderId`),
  KEY `idx_tjnqkpnubfsuxooglvwnbuizrrflpoesdaqr` (`userId`),
  CONSTRAINT `fk_bctvpyrraqgftvuwveehosfigdlrmxhnzynf` FOREIGN KEY (`userId`) REFERENCES `elements` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_kixwfahddqletgqyzvvhpgwfkpyskwgbuyxm` FOREIGN KEY (`gatewayId`) REFERENCES `commerce_gateways` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_mimeimcuoqftwlsnhjsapgqlokypgerggrqu` FOREIGN KEY (`parentId`) REFERENCES `commerce_transactions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_oylwhxsjdhkitjeydoegkyvxjwsnnyqtrcmd` FOREIGN KEY (`orderId`) REFERENCES `commerce_orders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `commerce_variants`
--

DROP TABLE IF EXISTS `commerce_variants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `commerce_variants` (
  `id` int(11) NOT NULL,
  `productId` int(11) DEFAULT NULL,
  `sku` varchar(255) NOT NULL,
  `isDefault` tinyint(1) NOT NULL DEFAULT 0,
  `price` decimal(14,4) NOT NULL,
  `sortOrder` int(11) DEFAULT NULL,
  `width` decimal(14,4) DEFAULT NULL,
  `height` decimal(14,4) DEFAULT NULL,
  `length` decimal(14,4) DEFAULT NULL,
  `weight` decimal(14,4) DEFAULT NULL,
  `stock` int(11) NOT NULL DEFAULT 0,
  `hasUnlimitedStock` tinyint(1) NOT NULL DEFAULT 0,
  `minQty` int(11) DEFAULT NULL,
  `maxQty` int(11) DEFAULT NULL,
  `deletedWithProduct` tinyint(1) NOT NULL DEFAULT 0,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_sualrroxnnqodaxovtobkrgyljqxqzyngeqf` (`sku`),
  KEY `idx_qsnlxpmvvjqsmisgyvjoaetscnxcajpcegvh` (`productId`),
  CONSTRAINT `fk_uzdyrgunoigalqcolkusacmticfynbuhqjow` FOREIGN KEY (`productId`) REFERENCES `commerce_products` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_vferlhaqbkdzdobtppotuaqlhpgtaqmqskvu` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `content`
--

DROP TABLE IF EXISTS `content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `content` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  `field_story_cdrtxzcb` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_jpbiwzygkfdrqieokermfestisdnrjtscksm` (`elementId`,`siteId`),
  KEY `idx_kfxuoszqbauvmjfkjonwianqzhoampbloxbb` (`siteId`),
  KEY `idx_vmlerrrplschmpcipzjeqciwkrrmutvwgyvo` (`title`),
  CONSTRAINT `fk_dqkqwkehzsgpikjnowjvxqkwiyetmokekgwe` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_wktkgflzlvvaeqbwalgkzgmbmxaljraohrxr` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `craftidtokens`
--

DROP TABLE IF EXISTS `craftidtokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craftidtokens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `accessToken` text NOT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_bnpexdtlrmeetomgtdmhzfqcuvpnfiyvjdqp` (`userId`),
  CONSTRAINT `fk_bnpexdtlrmeetomgtdmhzfqcuvpnfiyvjdqp` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `deprecationerrors`
--

DROP TABLE IF EXISTS `deprecationerrors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `deprecationerrors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(255) NOT NULL,
  `fingerprint` varchar(255) NOT NULL,
  `lastOccurrence` datetime NOT NULL,
  `file` varchar(255) NOT NULL,
  `line` smallint(6) unsigned DEFAULT NULL,
  `message` text DEFAULT NULL,
  `traces` text DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_tqdglyewjcopfbmljhxkkexzpkhjguocvcji` (`key`,`fingerprint`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `drafts`
--

DROP TABLE IF EXISTS `drafts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `drafts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `canonicalId` int(11) DEFAULT NULL,
  `creatorId` int(11) DEFAULT NULL,
  `provisional` tinyint(1) NOT NULL DEFAULT 0,
  `name` varchar(255) NOT NULL,
  `notes` text DEFAULT NULL,
  `trackChanges` tinyint(1) NOT NULL DEFAULT 0,
  `dateLastMerged` datetime DEFAULT NULL,
  `saved` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `idx_yckbcglssvcvobhpxgfnckxnasedodaozsrv` (`creatorId`,`provisional`),
  KEY `idx_gxmxprqkablcstrbxnepzjjkyzvkkjxfjqgm` (`saved`),
  KEY `fk_krpuzeawhwpvirecqzecvhnrpxjtfzggtznq` (`canonicalId`),
  CONSTRAINT `fk_awysoqudtspoztiwaaespjafseirdodkzslm` FOREIGN KEY (`creatorId`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_krpuzeawhwpvirecqzecvhnrpxjtfzggtznq` FOREIGN KEY (`canonicalId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `elements`
--

DROP TABLE IF EXISTS `elements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `canonicalId` int(11) DEFAULT NULL,
  `draftId` int(11) DEFAULT NULL,
  `revisionId` int(11) DEFAULT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `archived` tinyint(1) NOT NULL DEFAULT 0,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateLastMerged` datetime DEFAULT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_woyxqnzeabflmnrtrobytntrjxsqnpkruzhv` (`dateDeleted`),
  KEY `idx_pgawzrvngxpqfacspuyxrubvqvanrczqdqbk` (`fieldLayoutId`),
  KEY `idx_czfcaysbcaeldweqooxjcuesjhnjwiudrzhf` (`type`),
  KEY `idx_qmlnnlwxqcduqohspgpclcgcqavgqbfaxbqj` (`enabled`),
  KEY `idx_fgldkjhnistazvmrqbpfuccpvhuadwyapint` (`canonicalId`),
  KEY `idx_kmzetwiyifooalforjitaciguulqznoqqqwy` (`archived`,`dateCreated`),
  KEY `idx_qeiqncoxcimofqrhibtxnsvssbdgwjniaigk` (`archived`,`dateDeleted`,`draftId`,`revisionId`,`canonicalId`),
  KEY `idx_anyklrovzpavnbaliyeqkcaezojsjyllhndc` (`archived`,`dateDeleted`,`draftId`,`revisionId`,`canonicalId`,`enabled`),
  KEY `fk_mambfrnmkowgtustugemlodtmffjwyhgxiay` (`draftId`),
  KEY `fk_sheaauicznbryvvotlltoqnfbwsfxfqmufzo` (`revisionId`),
  CONSTRAINT `fk_cblupzcmoxfkotghkqtlzthvsqmhfiaosobt` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_eclgeqriddvcffzqyqctxnvendleubnjgiow` FOREIGN KEY (`canonicalId`) REFERENCES `elements` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_mambfrnmkowgtustugemlodtmffjwyhgxiay` FOREIGN KEY (`draftId`) REFERENCES `drafts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_sheaauicznbryvvotlltoqnfbwsfxfqmufzo` FOREIGN KEY (`revisionId`) REFERENCES `revisions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `elements_sites`
--

DROP TABLE IF EXISTS `elements_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elements_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `uri` varchar(255) DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_tbxswypjujlwfnzgmdzzdkupozeefdwwamot` (`elementId`,`siteId`),
  KEY `idx_dhajghufnbyqhfdfyienqydqmqziqshbxzvt` (`siteId`),
  KEY `idx_wmrmlwdzfitfkbozwlsdggpbtpgrqsgbszhj` (`slug`,`siteId`),
  KEY `idx_dewlgjnfdlskrukkcdhqqnqvfzjozuyhmvhh` (`enabled`),
  KEY `idx_fmbvmlktryzuiptivkfvbadcfahiieedqnqs` (`uri`,`siteId`),
  CONSTRAINT `fk_jlvwyeeietitgqnfbloqctkibbvridsctctj` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_yjqonczienxlblxndotpkrvnumwdwecnjjzs` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `entries`
--

DROP TABLE IF EXISTS `entries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entries` (
  `id` int(11) NOT NULL,
  `sectionId` int(11) NOT NULL,
  `parentId` int(11) DEFAULT NULL,
  `typeId` int(11) NOT NULL,
  `authorId` int(11) DEFAULT NULL,
  `postDate` datetime DEFAULT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `deletedWithEntryType` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_nzxmqrqvysgzrbmooumqdelevonfjdhywjao` (`postDate`),
  KEY `idx_twgxwruxudsosaeiohcqfxpsxutroqegwvgi` (`expiryDate`),
  KEY `idx_phvgdsoiokgnkeerxovgejeobfwpccybgqno` (`authorId`),
  KEY `idx_mswezuozwejzygdwiiwlhoqkrufjzmicvbba` (`sectionId`),
  KEY `idx_kvonynmokijimsdvkbirjvscylakferxjfqi` (`typeId`),
  KEY `fk_obnsugmwaalqadyvpwooffwyzvcnbuyqjcii` (`parentId`),
  CONSTRAINT `fk_dadpfzzlmhantnsnxvrpfhsmbsbxtrbxganu` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_dnlnuwvgbfabdbuehavxlyaozfxabjcumyjh` FOREIGN KEY (`typeId`) REFERENCES `entrytypes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_gbttxjhnvqxbklhjhlxscesjyjhajdibqjls` FOREIGN KEY (`authorId`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_hocjjkkdyenbfguyibmyqxlvaufrneyeuifu` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_obnsugmwaalqadyvpwooffwyzvcnbuyqjcii` FOREIGN KEY (`parentId`) REFERENCES `entries` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `entrytypes`
--

DROP TABLE IF EXISTS `entrytypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entrytypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sectionId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `hasTitleField` tinyint(1) NOT NULL DEFAULT 1,
  `titleTranslationMethod` varchar(255) NOT NULL DEFAULT 'site',
  `titleTranslationKeyFormat` text DEFAULT NULL,
  `titleFormat` varchar(255) DEFAULT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_koszxqgfgkoaourhmiyvrvfzevdcqcavkmun` (`name`,`sectionId`),
  KEY `idx_quktbpjufyhrsceyulvksacazxbfaseknhcu` (`handle`,`sectionId`),
  KEY `idx_bqgbhnstqkenkoqplhlvrpzkxduwcftfeudw` (`sectionId`),
  KEY `idx_jzozpmevtyehjgoujnojrpybecnicdbbbntx` (`fieldLayoutId`),
  KEY `idx_zzaskgpqvebtssmphyduxagdljzlijhdpfwb` (`dateDeleted`),
  CONSTRAINT `fk_bemnzjfufufnymkqvzjuyiztsfxpmgrmjmbu` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_htghfqcgaecstmxwwjhfckytpdwkrvlkidcw` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fieldgroups`
--

DROP TABLE IF EXISTS `fieldgroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fieldgroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_ukmkthrkevvweujtzjxpdyeswovopqirfkkd` (`name`),
  KEY `idx_sjgagssgjqypevtzzfgncrxavcdrtirwkrgn` (`dateDeleted`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fieldlayoutfields`
--

DROP TABLE IF EXISTS `fieldlayoutfields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fieldlayoutfields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `layoutId` int(11) NOT NULL,
  `tabId` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT 0,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_qbaxticyfcgfzefrxdpwmdbqenmfbpclaoob` (`layoutId`,`fieldId`),
  KEY `idx_yahooicdyvhnktblrhmdodfajrhiuzunykmi` (`sortOrder`),
  KEY `idx_xcrelhltmpanprvixiuzhqsdlszhtqfwrfkd` (`tabId`),
  KEY `idx_kzapvpiiuzkmtyxvxdqfpsobwbzniogvvsoj` (`fieldId`),
  CONSTRAINT `fk_nsvuldmukkasnzuyicawxbpsiocvbvwfldsh` FOREIGN KEY (`layoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_qylgbgtquejkejhshoshyrcnsieepvlhlnfg` FOREIGN KEY (`tabId`) REFERENCES `fieldlayouttabs` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_tfcqwizcopnlcijeepnptnrzsbkthbamhgka` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fieldlayouts`
--

DROP TABLE IF EXISTS `fieldlayouts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fieldlayouts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_ezmjiyxbnsuccuatcdipuqyimzxypyfxwyfa` (`dateDeleted`),
  KEY `idx_fctqhodtosyivihzbdxcrdiclmrixsriqhrx` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fieldlayouttabs`
--

DROP TABLE IF EXISTS `fieldlayouttabs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fieldlayouttabs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `layoutId` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `settings` text DEFAULT NULL,
  `elements` text DEFAULT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_pahzngeyhalewumomyflggkfmnbjhigkhcov` (`sortOrder`),
  KEY `idx_viejhcesaugooxujesduafcupvsphoefdvmf` (`layoutId`),
  CONSTRAINT `fk_ltltdhvtcwmoznjnevyywtmimvsqtmfrguzi` FOREIGN KEY (`layoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fields`
--

DROP TABLE IF EXISTS `fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(64) NOT NULL,
  `context` varchar(255) NOT NULL DEFAULT 'global',
  `columnSuffix` char(8) DEFAULT NULL,
  `instructions` text DEFAULT NULL,
  `searchable` tinyint(1) NOT NULL DEFAULT 1,
  `translationMethod` varchar(255) NOT NULL DEFAULT 'none',
  `translationKeyFormat` text DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `settings` text DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_itweequczqfnwujgkhqhtvvyclziohwuwtnn` (`handle`,`context`),
  KEY `idx_uqfxfdvewelgfmkqkykqtbaxtttulyobfzuv` (`groupId`),
  KEY `idx_izwwivftqjhqajimpiajfederaxcnobbwevk` (`context`),
  CONSTRAINT `fk_hqiaffojvxedzlrhexszhwwndxrgyumgrrrx` FOREIGN KEY (`groupId`) REFERENCES `fieldgroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `globalsets`
--

DROP TABLE IF EXISTS `globalsets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `globalsets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_gygwpjrrwdzdtyswyzbtzdfehudfaxahharj` (`name`),
  KEY `idx_nexleptrmjqvvamxdiuppkoxgelavjyeevmv` (`handle`),
  KEY `idx_rxuyetrsollfkrslkulxpfmryquobnvgumtg` (`fieldLayoutId`),
  KEY `idx_zwhpbmurkkiqezuipqntrdysddpopeexvdet` (`sortOrder`),
  CONSTRAINT `fk_ikspkyipxwfosamecccwbexhoedocmbzzxnq` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_olapsmlveprclvpvzpnmhwzpiunriwsimeom` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gqlschemas`
--

DROP TABLE IF EXISTS `gqlschemas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gqlschemas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `scope` text DEFAULT NULL,
  `isPublic` tinyint(1) NOT NULL DEFAULT 0,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gqltokens`
--

DROP TABLE IF EXISTS `gqltokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gqltokens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `accessToken` varchar(255) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `expiryDate` datetime DEFAULT NULL,
  `lastUsed` datetime DEFAULT NULL,
  `schemaId` int(11) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_omfamnmzghdivpjnccwgsbgfyrhuptenjhaw` (`accessToken`),
  UNIQUE KEY `idx_wfnjdpgmuhrajxtfabxaxbsoirwgksgfxgvq` (`name`),
  KEY `fk_mmydxskijahuuieokkpgwskisfvfvagjooow` (`schemaId`),
  CONSTRAINT `fk_mmydxskijahuuieokkpgwskisfvfvagjooow` FOREIGN KEY (`schemaId`) REFERENCES `gqlschemas` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `imagetransformindex`
--

DROP TABLE IF EXISTS `imagetransformindex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `imagetransformindex` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `assetId` int(11) NOT NULL,
  `transformer` varchar(255) DEFAULT NULL,
  `filename` varchar(255) DEFAULT NULL,
  `format` varchar(255) DEFAULT NULL,
  `transformString` varchar(255) NOT NULL,
  `fileExists` tinyint(1) NOT NULL DEFAULT 0,
  `inProgress` tinyint(1) NOT NULL DEFAULT 0,
  `error` tinyint(1) NOT NULL DEFAULT 0,
  `dateIndexed` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_otlcdqwfqyxgjrzkmzakxckrrvwfnoojquce` (`assetId`,`transformString`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `imagetransforms`
--

DROP TABLE IF EXISTS `imagetransforms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `imagetransforms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `mode` enum('stretch','fit','crop','letterbox') NOT NULL DEFAULT 'crop',
  `position` enum('top-left','top-center','top-right','center-left','center-center','center-right','bottom-left','bottom-center','bottom-right') NOT NULL DEFAULT 'center-center',
  `width` int(11) unsigned DEFAULT NULL,
  `height` int(11) unsigned DEFAULT NULL,
  `format` varchar(255) DEFAULT NULL,
  `quality` int(11) DEFAULT NULL,
  `interlace` enum('none','line','plane','partition') NOT NULL DEFAULT 'none',
  `fill` varchar(11) DEFAULT NULL,
  `upscale` tinyint(1) NOT NULL DEFAULT 1,
  `parameterChangeTime` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_pmnmnvjaqprofadyoxsmwovwmhxfyjvbksid` (`name`),
  KEY `idx_avhbieezywzcsrueskranqktydzbytdustgg` (`handle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `info`
--

DROP TABLE IF EXISTS `info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `version` varchar(50) NOT NULL,
  `schemaVersion` varchar(15) NOT NULL,
  `maintenance` tinyint(1) NOT NULL DEFAULT 0,
  `configVersion` char(12) NOT NULL DEFAULT '000000000000',
  `fieldVersion` char(12) NOT NULL DEFAULT '000000000000',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `matrixblocks`
--

DROP TABLE IF EXISTS `matrixblocks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `matrixblocks` (
  `id` int(11) NOT NULL,
  `primaryOwnerId` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `typeId` int(11) NOT NULL,
  `deletedWithOwner` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_jtntitiuiryiubocqekdwbibttdvmorqtlac` (`primaryOwnerId`),
  KEY `idx_clrxgrjskzfaunlduksyzjkrlirnvghnnzrp` (`fieldId`),
  KEY `idx_npyxgxepsdyfjtsvwnoxmkbjjdgotsyhybph` (`typeId`),
  CONSTRAINT `fk_cxpiqqgwjpfwwoslpbbedmadktgpehoidocu` FOREIGN KEY (`typeId`) REFERENCES `matrixblocktypes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_deuymtxcimjfkrqmaujouawigypwmcgbwynn` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_ghqthmgijgbwgmyihomydbozaqoaiznfbcpu` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_zdoyzbunneuhweayvervtiaehuxzihexrfin` FOREIGN KEY (`primaryOwnerId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `matrixblocks_owners`
--

DROP TABLE IF EXISTS `matrixblocks_owners`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `matrixblocks_owners` (
  `blockId` int(11) NOT NULL,
  `ownerId` int(11) NOT NULL,
  `sortOrder` smallint(6) unsigned NOT NULL,
  PRIMARY KEY (`blockId`,`ownerId`),
  KEY `fk_rgtrelfuknytiqbvgplzbggwkbaccbpybjnd` (`ownerId`),
  CONSTRAINT `fk_rgtrelfuknytiqbvgplzbggwkbaccbpybjnd` FOREIGN KEY (`ownerId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_rgynmgiwmjtotgtuexdlohluolgdjaibfwwd` FOREIGN KEY (`blockId`) REFERENCES `matrixblocks` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `matrixblocktypes`
--

DROP TABLE IF EXISTS `matrixblocktypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `matrixblocktypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fieldId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_xnmlmscsscegelfwyvrljrcrnvikltmtgqxs` (`name`,`fieldId`),
  KEY `idx_ignzroqdozhndyorekcgrmvlqdfhcliconsb` (`handle`,`fieldId`),
  KEY `idx_jgayqnwbpztxhtslmmplsxnodvwsmdcjlewt` (`fieldId`),
  KEY `idx_crteufiqtgktnmkenkrnijqxqpqlacdiornn` (`fieldLayoutId`),
  CONSTRAINT `fk_payccjcylsfpanzavedcuesoutlmjredhdhv` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_xsvyrfwuaoknfkcwtmguouaybyvjvxwihlbh` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `track` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applyTime` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_amghrkfqwdwuvmjousryorqxgilortaswyof` (`track`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `plugins`
--

DROP TABLE IF EXISTS `plugins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plugins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `handle` varchar(255) NOT NULL,
  `version` varchar(255) NOT NULL,
  `schemaVersion` varchar(255) NOT NULL,
  `installDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_oundwggltnicckkfnddocouwtcaurcqivrvk` (`handle`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `projectconfig`
--

DROP TABLE IF EXISTS `projectconfig`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `projectconfig` (
  `path` varchar(255) NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`path`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `queue`
--

DROP TABLE IF EXISTS `queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `queue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `channel` varchar(255) NOT NULL DEFAULT 'queue',
  `job` longblob NOT NULL,
  `description` text DEFAULT NULL,
  `timePushed` int(11) NOT NULL,
  `ttr` int(11) NOT NULL,
  `delay` int(11) NOT NULL DEFAULT 0,
  `priority` int(11) unsigned NOT NULL DEFAULT 1024,
  `dateReserved` datetime DEFAULT NULL,
  `timeUpdated` int(11) DEFAULT NULL,
  `progress` smallint(6) NOT NULL DEFAULT 0,
  `progressLabel` varchar(255) DEFAULT NULL,
  `attempt` int(11) DEFAULT NULL,
  `fail` tinyint(1) DEFAULT 0,
  `dateFailed` datetime DEFAULT NULL,
  `error` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_huzzhqzphkzogutoemwhwmqealwgizvfidui` (`channel`,`fail`,`timeUpdated`,`timePushed`),
  KEY `idx_zjmpuuzepthrctewhmovqvrsjczlgupgzftt` (`channel`,`fail`,`timeUpdated`,`delay`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `relations`
--

DROP TABLE IF EXISTS `relations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `relations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fieldId` int(11) NOT NULL,
  `sourceId` int(11) NOT NULL,
  `sourceSiteId` int(11) DEFAULT NULL,
  `targetId` int(11) NOT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_jpdgmkdafseubionicxhlsjjiefwbenfxdpc` (`fieldId`,`sourceId`,`sourceSiteId`,`targetId`),
  KEY `idx_kaibyufqfsilwtuhiuvjxpuohlgsipktzfni` (`sourceId`),
  KEY `idx_cjthtynldsugzmilueobwfrypnqwpzjdkyzw` (`targetId`),
  KEY `idx_jgtzrpaodspmosznopmsmjthveabfptiagaf` (`sourceSiteId`),
  CONSTRAINT `fk_hjbtiqbqwakjeuehloobihlkmyfwrppldqcv` FOREIGN KEY (`sourceSiteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_rxshluufdjtwykpneyigbzfklvxprckmovio` FOREIGN KEY (`sourceId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_xlcteuugpdvyyvhchvgjqlzzbyktugjxpbqw` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `resourcepaths`
--

DROP TABLE IF EXISTS `resourcepaths`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resourcepaths` (
  `hash` varchar(255) NOT NULL,
  `path` varchar(255) NOT NULL,
  PRIMARY KEY (`hash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `revisions`
--

DROP TABLE IF EXISTS `revisions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `revisions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `canonicalId` int(11) NOT NULL,
  `creatorId` int(11) DEFAULT NULL,
  `num` int(11) NOT NULL,
  `notes` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_elkbqhthqozrjvwzzolzxvkbxahlwzzsmwvn` (`canonicalId`,`num`),
  KEY `fk_szphrkhqyqfolsqoxvhjtfqsizccnraecijq` (`creatorId`),
  CONSTRAINT `fk_mpwmefvspxpsbydalbfkrdjvsbbczecituxp` FOREIGN KEY (`canonicalId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_szphrkhqyqfolsqoxvhjtfqsizccnraecijq` FOREIGN KEY (`creatorId`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `searchindex`
--

DROP TABLE IF EXISTS `searchindex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `searchindex` (
  `elementId` int(11) NOT NULL,
  `attribute` varchar(25) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `keywords` text NOT NULL,
  PRIMARY KEY (`elementId`,`attribute`,`fieldId`,`siteId`),
  FULLTEXT KEY `idx_mybjiglsjujoprmyqykueibrngcebksxtgxf` (`keywords`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sections`
--

DROP TABLE IF EXISTS `sections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sections` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `structureId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `type` enum('single','channel','structure') NOT NULL DEFAULT 'channel',
  `enableVersioning` tinyint(1) NOT NULL DEFAULT 0,
  `propagationMethod` varchar(255) NOT NULL DEFAULT 'all',
  `defaultPlacement` enum('beginning','end') NOT NULL DEFAULT 'end',
  `previewTargets` text DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_wyeiwcmxaqrvmjdhxoenurbkexnithfaayyj` (`handle`),
  KEY `idx_vkcckmcrfapisuixhbmjhudqicthfzmfacpk` (`name`),
  KEY `idx_imegiyuixzetcrwtgmwnszbhfnfivfpxltjh` (`structureId`),
  KEY `idx_kfdlulqkstmjffpcxusczbhuivagcgvtowta` (`dateDeleted`),
  CONSTRAINT `fk_nzondswprhqsoeltzdgkatcndfomorwusrhl` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sections_sites`
--

DROP TABLE IF EXISTS `sections_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sections_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sectionId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT 1,
  `uriFormat` text DEFAULT NULL,
  `template` varchar(500) DEFAULT NULL,
  `enabledByDefault` tinyint(1) NOT NULL DEFAULT 1,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_dhuirvjrfsabbbokzztkmapjbcajwyxbpyvx` (`sectionId`,`siteId`),
  KEY `idx_jzfmaexwrvumhfrloyuouepkqgslccwwsmoo` (`siteId`),
  CONSTRAINT `fk_gucscqfahybrosxpycbfgaqmnglqlcecrbyu` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_lzdcrrwttdupzhgvtxdnmegokglvmmkyhrbs` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sequences`
--

DROP TABLE IF EXISTS `sequences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sequences` (
  `name` varchar(255) NOT NULL,
  `next` int(11) unsigned NOT NULL DEFAULT 1,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sessions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `token` char(100) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_xtbxjijutrnsgxjtfepojyhdbfpyujdniaxr` (`uid`),
  KEY `idx_qpdvzkfdaeopfyxkhhmladowwiakapmrmrqi` (`token`),
  KEY `idx_akjmvgixreajfctznomslvdsnggnvyphkxof` (`dateUpdated`),
  KEY `idx_kzqzopexfxefupazdvkbrzgjbckqscclgcad` (`userId`),
  CONSTRAINT `fk_gegxixskranmixzjlffywvccrgakotxjezik` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `shunnedmessages`
--

DROP TABLE IF EXISTS `shunnedmessages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shunnedmessages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `message` varchar(255) NOT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_jxwuzulqrzvpxfchmlhhytuvwxqulnmmnbfy` (`userId`,`message`),
  CONSTRAINT `fk_wvxryqsjccizcmlfzqaoanzzzmzfyjxxzqcr` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sitegroups`
--

DROP TABLE IF EXISTS `sitegroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sitegroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_mwttcygglwgtmbybicpbsmteojqgeiboxchu` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sites`
--

DROP TABLE IF EXISTS `sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) NOT NULL,
  `primary` tinyint(1) NOT NULL,
  `enabled` varchar(255) NOT NULL DEFAULT 'true',
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `language` varchar(12) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT 0,
  `baseUrl` varchar(255) DEFAULT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_rtqarygdzmylabqmsqrnvstvebtlampgumza` (`dateDeleted`),
  KEY `idx_wfaonenzzjrudczmjnwhiwvjornfixnrkwam` (`handle`),
  KEY `idx_exocyqermcqxxvukldtwmtznhvoujyudpzgo` (`sortOrder`),
  KEY `fk_pqdnbfwzrmbejhzhkbfuazupyrevlzgyedfg` (`groupId`),
  CONSTRAINT `fk_pqdnbfwzrmbejhzhkbfuazupyrevlzgyedfg` FOREIGN KEY (`groupId`) REFERENCES `sitegroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `stripe_customers`
--

DROP TABLE IF EXISTS `stripe_customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stripe_customers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `gatewayId` int(11) NOT NULL,
  `reference` varchar(255) NOT NULL,
  `response` text DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_aqpyeacxmoenkzjaaerogjlygppozsswenxq` (`reference`),
  KEY `idx_cudhonhtbujdzeogbbjtrfyaaxlecrfaygkn` (`gatewayId`),
  KEY `idx_peniwrpeeopcetgveqgybdsjycexsuduoqlg` (`userId`),
  CONSTRAINT `fk_gtpuggonzbvwumguukasixrizqgafjmqnrpr` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_swduqqhhbngkylhecevfvmbqdjmlbxkohjhx` FOREIGN KEY (`gatewayId`) REFERENCES `commerce_gateways` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `stripe_invoices`
--

DROP TABLE IF EXISTS `stripe_invoices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stripe_invoices` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `reference` varchar(255) DEFAULT NULL,
  `subscriptionId` int(11) NOT NULL,
  `invoiceData` text DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_lpzgauztfxinjaiufbxrtlauurtpmkpvfara` (`reference`),
  KEY `idx_sbyqritrnuuywhufqldyzzqkhoxgtlpvhdro` (`subscriptionId`),
  CONSTRAINT `fk_dwcflafasmhslhyennvpieoqmknrnpasnyyp` FOREIGN KEY (`subscriptionId`) REFERENCES `commerce_subscriptions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `stripe_paymentintents`
--

DROP TABLE IF EXISTS `stripe_paymentintents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stripe_paymentintents` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `reference` varchar(255) DEFAULT NULL,
  `gatewayId` int(11) NOT NULL,
  `customerId` int(11) NOT NULL,
  `orderId` int(11) NOT NULL,
  `transactionHash` varchar(255) NOT NULL,
  `intentData` text DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_yredodtghlcutruyphfjowjnhqngqmokfvhv` (`orderId`,`gatewayId`,`customerId`,`transactionHash`),
  UNIQUE KEY `idx_kmgbblbjkyqcxxkfbzlrappcshrpvrgnxqyj` (`reference`),
  KEY `fk_mtcytnpanhcyozbqvchbiolbtapieoiqmavc` (`gatewayId`),
  KEY `fk_nybgjnwrulmdmqxdsakfnoxdkmpxlrpvfyhp` (`customerId`),
  CONSTRAINT `fk_mtcytnpanhcyozbqvchbiolbtapieoiqmavc` FOREIGN KEY (`gatewayId`) REFERENCES `commerce_gateways` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_nybgjnwrulmdmqxdsakfnoxdkmpxlrpvfyhp` FOREIGN KEY (`customerId`) REFERENCES `stripe_customers` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_ppvrletzjbfnolhhrxzkhrmphisgoobwpnvm` FOREIGN KEY (`orderId`) REFERENCES `commerce_orders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `structureelements`
--

DROP TABLE IF EXISTS `structureelements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `structureelements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `structureId` int(11) NOT NULL,
  `elementId` int(11) DEFAULT NULL,
  `root` int(11) unsigned DEFAULT NULL,
  `lft` int(11) unsigned NOT NULL,
  `rgt` int(11) unsigned NOT NULL,
  `level` smallint(6) unsigned NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_dlbvhjknbrmtaxqgdnwlksywghzzvwhxdpcj` (`structureId`,`elementId`),
  KEY `idx_oqlpulebsoqgzfcbelrgccavzwsmejmatgzx` (`root`),
  KEY `idx_rkezisssfzrrdgyittxspuapeescuxsxabji` (`lft`),
  KEY `idx_oyqvkhacqafhwaiqixrknwdprevdqskvvmga` (`rgt`),
  KEY `idx_ojukkufeacchmmgabxxaahdhzquvcnurelfy` (`level`),
  KEY `idx_ojuyfclcpdebzpkkjjmjsvurkthbsprbkvqn` (`elementId`),
  CONSTRAINT `fk_pjysuwxhjsanswplfuzuhsrwjlcsoqwqxutb` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `structures`
--

DROP TABLE IF EXISTS `structures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `structures` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `maxLevels` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_pkwoyxjkwnxrqplyzlubujzdsvppptcdybnf` (`dateDeleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `systemmessages`
--

DROP TABLE IF EXISTS `systemmessages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `systemmessages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `language` varchar(255) NOT NULL,
  `key` varchar(255) NOT NULL,
  `subject` text NOT NULL,
  `body` text NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_asfxxhoupnvdxoqyyplfwknvvjjuhmpyowbz` (`key`,`language`),
  KEY `idx_smciwravgkhiubutzhnnphellaxmbifcafsc` (`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `taggroups`
--

DROP TABLE IF EXISTS `taggroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `taggroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_ueexmdmgidstzcakysphtcridwzwlrpjhtsb` (`name`),
  KEY `idx_rxfgnblrmttitrfmiammnesczrmqeeqdwcqr` (`handle`),
  KEY `idx_rhiqayaojqsjvddcibigepjfcsvykzlkzavg` (`dateDeleted`),
  KEY `fk_algrszdbamutrxgnhmunffuzkvcvndtbjmgh` (`fieldLayoutId`),
  CONSTRAINT `fk_algrszdbamutrxgnhmunffuzkvcvndtbjmgh` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tags` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `deletedWithGroup` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_qmoubptbvtnphtliuxdosxkhwvqdxtprqada` (`groupId`),
  CONSTRAINT `fk_rtbyucsfqfrncbcphenxejpxicizmtbdpwga` FOREIGN KEY (`groupId`) REFERENCES `taggroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_rwwtezbiqgfkyapquwizmjijkvzkgwilatyt` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tokens`
--

DROP TABLE IF EXISTS `tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tokens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `token` char(32) NOT NULL,
  `route` text DEFAULT NULL,
  `usageLimit` tinyint(3) unsigned DEFAULT NULL,
  `usageCount` tinyint(3) unsigned DEFAULT NULL,
  `expiryDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_uuocqwftqhrbbgvkpqydkxylwdprftiddimd` (`token`),
  KEY `idx_xfmwthhfmztloznywuaztxrvfzfkqyqxlbtb` (`expiryDate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `usergroups`
--

DROP TABLE IF EXISTS `usergroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usergroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_iceofjnkjxbpglccvuxbkpjxaupdauauuxyn` (`handle`),
  KEY `idx_dpxppyeeufdrheyhcgibafzumzjkhmeaxvip` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `usergroups_users`
--

DROP TABLE IF EXISTS `usergroups_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usergroups_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_zwepmcfwnzjglsqknszbtfhluudlbtviniaz` (`groupId`,`userId`),
  KEY `idx_uazdxwcqdwpdxkkdioiskikvpyvecbmveyvp` (`userId`),
  CONSTRAINT `fk_mffncbymkovimlvnmzlbuxpnpvrkhxfbmzhb` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_uslveovafzvwkktrvuswxgqddgfvcfbjezzk` FOREIGN KEY (`groupId`) REFERENCES `usergroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `userpermissions`
--

DROP TABLE IF EXISTS `userpermissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userpermissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_rsegklalavsroktrktttiilyccjzmspasadh` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `userpermissions_usergroups`
--

DROP TABLE IF EXISTS `userpermissions_usergroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userpermissions_usergroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `permissionId` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_tuljykqsdxqqubdndxcppzjmbwsymmhthand` (`permissionId`,`groupId`),
  KEY `idx_aijqcqkdydxfrifcncfpafadkflfxuthxikl` (`groupId`),
  CONSTRAINT `fk_mieklsnetzsqcubwocpfvcsnqrcmczpqbtrt` FOREIGN KEY (`permissionId`) REFERENCES `userpermissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_vhjwoqfxwhudoprkkcgfkjtatqoeincwqaiv` FOREIGN KEY (`groupId`) REFERENCES `usergroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `userpermissions_users`
--

DROP TABLE IF EXISTS `userpermissions_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userpermissions_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `permissionId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_hzuwhagfgmtsftnsnykvaqseirurpvrkfgeo` (`permissionId`,`userId`),
  KEY `idx_dzekvbqntzzscbkxobfwkzbpzoilynlyouek` (`userId`),
  CONSTRAINT `fk_lxeevrakgsxomqkcfxxsuxztznfxcosnbnau` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_xnkfjcrqelznytywvaxfdboftgxrhuhswogz` FOREIGN KEY (`permissionId`) REFERENCES `userpermissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `userpreferences`
--

DROP TABLE IF EXISTS `userpreferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userpreferences` (
  `userId` int(11) NOT NULL AUTO_INCREMENT,
  `preferences` text DEFAULT NULL,
  PRIMARY KEY (`userId`),
  CONSTRAINT `fk_zqqwxsrnbfubdgvmqqblzarlqsyjkwfhobzl` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `photoId` int(11) DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 0,
  `pending` tinyint(1) NOT NULL DEFAULT 0,
  `locked` tinyint(1) NOT NULL DEFAULT 0,
  `suspended` tinyint(1) NOT NULL DEFAULT 0,
  `admin` tinyint(1) NOT NULL DEFAULT 0,
  `username` varchar(255) DEFAULT NULL,
  `fullName` varchar(255) DEFAULT NULL,
  `firstName` varchar(255) DEFAULT NULL,
  `lastName` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `lastLoginDate` datetime DEFAULT NULL,
  `lastLoginAttemptIp` varchar(45) DEFAULT NULL,
  `invalidLoginWindowStart` datetime DEFAULT NULL,
  `invalidLoginCount` tinyint(3) unsigned DEFAULT NULL,
  `lastInvalidLoginDate` datetime DEFAULT NULL,
  `lockoutDate` datetime DEFAULT NULL,
  `hasDashboard` tinyint(1) NOT NULL DEFAULT 0,
  `verificationCode` varchar(255) DEFAULT NULL,
  `verificationCodeIssuedDate` datetime DEFAULT NULL,
  `unverifiedEmail` varchar(255) DEFAULT NULL,
  `passwordResetRequired` tinyint(1) NOT NULL DEFAULT 0,
  `lastPasswordChangeDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_mlghthsauuotvmdzkfxilminkmbbgqhvkful` (`active`),
  KEY `idx_ckxwyrcabnbsiekmiuzkldhurbyphnyqfbvc` (`locked`),
  KEY `idx_zbierymrummjymznedwtidsbtyawqbcwnlkj` (`pending`),
  KEY `idx_otpugdjkyujwcihtnlxbujbxjootcwtubjyy` (`suspended`),
  KEY `idx_exlitebngfmzbdzhmsqynyyvphreerqyyibv` (`verificationCode`),
  KEY `idx_giozkgtguiqygrlbodvkcbbfrsrunkwfkkju` (`email`),
  KEY `idx_iwrozxcqxlhyfpscdevhnbirzjslcbepsfgl` (`username`),
  KEY `fk_vwyjjoegstwdgzvsfvcvuvcyjntcmwfnklzf` (`photoId`),
  CONSTRAINT `fk_txxufjsszhumrbshqeiauffquqybrnyfndjj` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_vwyjjoegstwdgzvsfvcvuvcyjntcmwfnklzf` FOREIGN KEY (`photoId`) REFERENCES `assets` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `volumefolders`
--

DROP TABLE IF EXISTS `volumefolders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `volumefolders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parentId` int(11) DEFAULT NULL,
  `volumeId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `path` varchar(255) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_kxvaeulbdtunooilhmbzknaeugoulueolscv` (`name`,`parentId`,`volumeId`),
  KEY `idx_jdlzodyjcudlfrweanlbnixufvgkrbiptkye` (`parentId`),
  KEY `idx_jjlvtkveeqkurgvnxzjbzqgrxxirpvfyowbn` (`volumeId`),
  CONSTRAINT `fk_twbhydfhgneuliosrbbpwdqmcdavgfdpqozj` FOREIGN KEY (`parentId`) REFERENCES `volumefolders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_umzwusunizahmxpciuauvbfdnquczaykrsjx` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `volumes`
--

DROP TABLE IF EXISTS `volumes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `volumes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `fs` varchar(255) NOT NULL,
  `transformFs` varchar(255) DEFAULT NULL,
  `transformSubpath` varchar(255) DEFAULT NULL,
  `titleTranslationMethod` varchar(255) NOT NULL DEFAULT 'site',
  `titleTranslationKeyFormat` text DEFAULT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_ajjbuuxawrybkuoxidqtrnusiagvkswlzvvb` (`name`),
  KEY `idx_rzyfhrdkxujntocwalfndbdqwajuuhvrogsw` (`handle`),
  KEY `idx_rtkvethcknqpddyzmddykboamxdxqlxukitn` (`fieldLayoutId`),
  KEY `idx_leuetujqwuyxtajeakyjmncswnfnchvoqlcd` (`dateDeleted`),
  CONSTRAINT `fk_mycvjaktdwamtwbpouucmtlmshhcwbwnwklf` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `widgets`
--

DROP TABLE IF EXISTS `widgets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `widgets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `colspan` tinyint(3) DEFAULT NULL,
  `settings` text DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_wzowypazuolwvxltgzfkjrwkbhjryumvesdd` (`userId`),
  CONSTRAINT `fk_mhugkgyefqgtqhtiqhniabcnegoodxegwcar` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping routines for database 'db'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-06-06  9:51:20
-- MariaDB dump 10.19  Distrib 10.5.15-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: db    Database: db
-- ------------------------------------------------------
-- Server version	10.4.26-MariaDB-1:10.4.26+maria~ubu2004-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Dumping data for table `addresses`
--

LOCK TABLES `addresses` WRITE;
/*!40000 ALTER TABLE `addresses` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `addresses` VALUES (5,NULL,'BE',NULL,'Kortrijk',NULL,'8500',NULL,' Dam 2a',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2023-06-04 11:05:38','2023-06-04 11:06:57');
/*!40000 ALTER TABLE `addresses` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `announcements`
--

LOCK TABLES `announcements` WRITE;
/*!40000 ALTER TABLE `announcements` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `announcements` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `assetindexingsessions`
--

LOCK TABLES `assetindexingsessions` WRITE;
/*!40000 ALTER TABLE `assetindexingsessions` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `assetindexingsessions` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `assets`
--

LOCK TABLES `assets` WRITE;
/*!40000 ALTER TABLE `assets` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `assets` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `categorygroups`
--

LOCK TABLES `categorygroups` WRITE;
/*!40000 ALTER TABLE `categorygroups` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `categorygroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `categorygroups_sites`
--

LOCK TABLES `categorygroups_sites` WRITE;
/*!40000 ALTER TABLE `categorygroups_sites` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `categorygroups_sites` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `changedattributes`
--

LOCK TABLES `changedattributes` WRITE;
/*!40000 ALTER TABLE `changedattributes` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `changedattributes` VALUES (2,1,'postDate','2023-06-03 12:35:25',0,1),(2,1,'slug','2023-06-03 12:35:24',0,1),(2,1,'title','2023-06-03 12:35:24',0,1),(2,1,'uri','2023-06-03 12:35:24',0,1),(5,1,'addressLine1','2023-06-04 11:06:57',0,1),(5,1,'administrativeArea','2023-06-04 11:06:57',0,1),(5,1,'countryCode','2023-06-04 11:06:57',0,1),(5,1,'locality','2023-06-04 11:06:57',0,1),(5,1,'postalCode','2023-06-04 11:06:57',0,1),(7,1,'postDate','2023-06-05 09:01:32',0,1),(7,1,'slug','2023-06-05 09:01:27',0,1),(7,1,'title','2023-06-05 09:01:27',0,1),(7,1,'uri','2023-06-05 09:01:27',0,1);
/*!40000 ALTER TABLE `changedattributes` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `changedfields`
--

LOCK TABLES `changedfields` WRITE;
/*!40000 ALTER TABLE `changedfields` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `changedfields` VALUES (2,1,1,'2023-06-03 12:35:24',0,1),(7,1,1,'2023-06-05 09:01:31',0,1);
/*!40000 ALTER TABLE `changedfields` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `commerce_coupons`
--

LOCK TABLES `commerce_coupons` WRITE;
/*!40000 ALTER TABLE `commerce_coupons` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `commerce_coupons` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `commerce_customer_discountuses`
--

LOCK TABLES `commerce_customer_discountuses` WRITE;
/*!40000 ALTER TABLE `commerce_customer_discountuses` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `commerce_customer_discountuses` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `commerce_customers`
--

LOCK TABLES `commerce_customers` WRITE;
/*!40000 ALTER TABLE `commerce_customers` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `commerce_customers` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `commerce_discount_categories`
--

LOCK TABLES `commerce_discount_categories` WRITE;
/*!40000 ALTER TABLE `commerce_discount_categories` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `commerce_discount_categories` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `commerce_discount_purchasables`
--

LOCK TABLES `commerce_discount_purchasables` WRITE;
/*!40000 ALTER TABLE `commerce_discount_purchasables` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `commerce_discount_purchasables` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `commerce_discounts`
--

LOCK TABLES `commerce_discounts` WRITE;
/*!40000 ALTER TABLE `commerce_discounts` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `commerce_discounts` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `commerce_donations`
--

LOCK TABLES `commerce_donations` WRITE;
/*!40000 ALTER TABLE `commerce_donations` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `commerce_donations` VALUES (4,'DONATION-CC4',0,'2023-06-04 11:04:37','2023-06-04 11:15:55','208b4ab9-39e1-4a62-a65f-cc7fe5a66a13');
/*!40000 ALTER TABLE `commerce_donations` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `commerce_email_discountuses`
--

LOCK TABLES `commerce_email_discountuses` WRITE;
/*!40000 ALTER TABLE `commerce_email_discountuses` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `commerce_email_discountuses` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `commerce_emails`
--

LOCK TABLES `commerce_emails` WRITE;
/*!40000 ALTER TABLE `commerce_emails` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `commerce_emails` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `commerce_gateways`
--

LOCK TABLES `commerce_gateways` WRITE;
/*!40000 ALTER TABLE `commerce_gateways` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `commerce_gateways` VALUES (1,'craft\\commerce\\gateways\\Dummy','Dummy','dummy',NULL,'purchase','1',0,NULL,99,'2023-06-04 11:04:37','2023-06-04 11:04:37','b0fe49ca-cc76-423d-85b1-5114b12dad38');
/*!40000 ALTER TABLE `commerce_gateways` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `commerce_lineitems`
--

LOCK TABLES `commerce_lineitems` WRITE;
/*!40000 ALTER TABLE `commerce_lineitems` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `commerce_lineitems` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `commerce_lineitemstatuses`
--

LOCK TABLES `commerce_lineitemstatuses` WRITE;
/*!40000 ALTER TABLE `commerce_lineitemstatuses` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `commerce_lineitemstatuses` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `commerce_orderadjustments`
--

LOCK TABLES `commerce_orderadjustments` WRITE;
/*!40000 ALTER TABLE `commerce_orderadjustments` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `commerce_orderadjustments` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `commerce_orderhistories`
--

LOCK TABLES `commerce_orderhistories` WRITE;
/*!40000 ALTER TABLE `commerce_orderhistories` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `commerce_orderhistories` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `commerce_ordernotices`
--

LOCK TABLES `commerce_ordernotices` WRITE;
/*!40000 ALTER TABLE `commerce_ordernotices` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `commerce_ordernotices` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `commerce_orders`
--

LOCK TABLES `commerce_orders` WRITE;
/*!40000 ALTER TABLE `commerce_orders` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `commerce_orders` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `commerce_orderstatus_emails`
--

LOCK TABLES `commerce_orderstatus_emails` WRITE;
/*!40000 ALTER TABLE `commerce_orderstatus_emails` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `commerce_orderstatus_emails` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `commerce_orderstatuses`
--

LOCK TABLES `commerce_orderstatuses` WRITE;
/*!40000 ALTER TABLE `commerce_orderstatuses` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `commerce_orderstatuses` VALUES (1,'New','new','green',NULL,NULL,99,1,'2023-06-04 11:04:37','2023-06-04 11:04:37','ee9b1680-d7fc-47ea-a3ec-691fe2dc77e3');
/*!40000 ALTER TABLE `commerce_orderstatuses` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `commerce_paymentcurrencies`
--

LOCK TABLES `commerce_paymentcurrencies` WRITE;
/*!40000 ALTER TABLE `commerce_paymentcurrencies` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `commerce_paymentcurrencies` VALUES (1,'EUR',1,1.0000,'2023-06-04 11:04:37','2023-06-04 11:15:47','72da13c6-83cf-4337-a184-aa905e9322a4');
/*!40000 ALTER TABLE `commerce_paymentcurrencies` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `commerce_paymentsources`
--

LOCK TABLES `commerce_paymentsources` WRITE;
/*!40000 ALTER TABLE `commerce_paymentsources` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `commerce_paymentsources` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `commerce_pdfs`
--

LOCK TABLES `commerce_pdfs` WRITE;
/*!40000 ALTER TABLE `commerce_pdfs` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `commerce_pdfs` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `commerce_plans`
--

LOCK TABLES `commerce_plans` WRITE;
/*!40000 ALTER TABLE `commerce_plans` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `commerce_plans` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `commerce_products`
--

LOCK TABLES `commerce_products` WRITE;
/*!40000 ALTER TABLE `commerce_products` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `commerce_products` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `commerce_producttypes`
--

LOCK TABLES `commerce_producttypes` WRITE;
/*!40000 ALTER TABLE `commerce_producttypes` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `commerce_producttypes` VALUES (1,3,NULL,'Senne','senne',0,0,0,'{product.title}',1,'','','{product.title} - {title}','2023-06-06 09:39:49','2023-06-06 09:39:49','17688985-a8f9-4bcf-b2e8-131053d1f7d7');
/*!40000 ALTER TABLE `commerce_producttypes` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `commerce_producttypes_shippingcategories`
--

LOCK TABLES `commerce_producttypes_shippingcategories` WRITE;
/*!40000 ALTER TABLE `commerce_producttypes_shippingcategories` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `commerce_producttypes_shippingcategories` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `commerce_producttypes_sites`
--

LOCK TABLES `commerce_producttypes_sites` WRITE;
/*!40000 ALTER TABLE `commerce_producttypes_sites` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `commerce_producttypes_sites` VALUES (1,1,1,'senne/{slug}','',1,'2023-06-06 09:39:49','2023-06-06 09:39:49','49327733-8d20-422b-ba06-2e52a7ef8742');
/*!40000 ALTER TABLE `commerce_producttypes_sites` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `commerce_producttypes_taxcategories`
--

LOCK TABLES `commerce_producttypes_taxcategories` WRITE;
/*!40000 ALTER TABLE `commerce_producttypes_taxcategories` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `commerce_producttypes_taxcategories` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `commerce_purchasables`
--

LOCK TABLES `commerce_purchasables` WRITE;
/*!40000 ALTER TABLE `commerce_purchasables` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `commerce_purchasables` VALUES (4,'DONATION-CC4',0.0000,'Donation','2023-06-04 11:04:37','2023-06-04 11:15:55','2191bc54-d33d-456d-9420-34ff05f549b3');
/*!40000 ALTER TABLE `commerce_purchasables` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `commerce_sale_categories`
--

LOCK TABLES `commerce_sale_categories` WRITE;
/*!40000 ALTER TABLE `commerce_sale_categories` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `commerce_sale_categories` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `commerce_sale_purchasables`
--

LOCK TABLES `commerce_sale_purchasables` WRITE;
/*!40000 ALTER TABLE `commerce_sale_purchasables` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `commerce_sale_purchasables` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `commerce_sale_usergroups`
--

LOCK TABLES `commerce_sale_usergroups` WRITE;
/*!40000 ALTER TABLE `commerce_sale_usergroups` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `commerce_sale_usergroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `commerce_sales`
--

LOCK TABLES `commerce_sales` WRITE;
/*!40000 ALTER TABLE `commerce_sales` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `commerce_sales` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `commerce_shippingcategories`
--

LOCK TABLES `commerce_shippingcategories` WRITE;
/*!40000 ALTER TABLE `commerce_shippingcategories` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `commerce_shippingcategories` VALUES (1,'General','general',NULL,1,NULL,'2023-06-04 11:04:37','2023-06-04 11:04:37','fb5b843a-3c4a-4c0b-b88e-db737a4262d3');
/*!40000 ALTER TABLE `commerce_shippingcategories` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `commerce_shippingmethods`
--

LOCK TABLES `commerce_shippingmethods` WRITE;
/*!40000 ALTER TABLE `commerce_shippingmethods` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `commerce_shippingmethods` VALUES (1,'Free Shipping','freeShipping',1,0,'2023-06-04 11:04:37','2023-06-04 11:04:37','5c41fb5d-1142-424d-a470-ee9d8bcd5e70');
/*!40000 ALTER TABLE `commerce_shippingmethods` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `commerce_shippingrule_categories`
--

LOCK TABLES `commerce_shippingrule_categories` WRITE;
/*!40000 ALTER TABLE `commerce_shippingrule_categories` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `commerce_shippingrule_categories` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `commerce_shippingrules`
--

LOCK TABLES `commerce_shippingrules` WRITE;
/*!40000 ALTER TABLE `commerce_shippingrules` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `commerce_shippingrules` VALUES (1,NULL,1,'Free Everywhere','All countries, free shipping',0,1,NULL,0,0,0.0000,0.0000,'salePrice',0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0,'2023-06-04 11:04:37','2023-06-04 11:04:37','3b571ce1-93be-4b93-8f30-1eee51487b35');
/*!40000 ALTER TABLE `commerce_shippingrules` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `commerce_shippingzones`
--

LOCK TABLES `commerce_shippingzones` WRITE;
/*!40000 ALTER TABLE `commerce_shippingzones` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `commerce_shippingzones` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `commerce_stores`
--

LOCK TABLES `commerce_stores` WRITE;
/*!40000 ALTER TABLE `commerce_stores` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `commerce_stores` VALUES (1,5,'[\"BE\"]','{\"elementType\":\"craft\\\\elements\\\\Address\",\"fieldContext\":\"global\",\"class\":\"craft\\\\commerce\\\\elements\\\\conditions\\\\addresses\\\\ZoneAddressCondition\",\"conditionRules\":[]}','2023-06-04 11:04:37','2023-06-04 11:15:29','8bd2a1e2-08f7-4c40-b852-cc79d0f00d6b');
/*!40000 ALTER TABLE `commerce_stores` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `commerce_subscriptions`
--

LOCK TABLES `commerce_subscriptions` WRITE;
/*!40000 ALTER TABLE `commerce_subscriptions` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `commerce_subscriptions` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `commerce_taxcategories`
--

LOCK TABLES `commerce_taxcategories` WRITE;
/*!40000 ALTER TABLE `commerce_taxcategories` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `commerce_taxcategories` VALUES (1,'General','general',NULL,1,NULL,'2023-06-04 11:04:37','2023-06-04 11:04:37','efd44402-2be3-4b90-832c-619467dec949');
/*!40000 ALTER TABLE `commerce_taxcategories` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `commerce_taxrates`
--

LOCK TABLES `commerce_taxrates` WRITE;
/*!40000 ALTER TABLE `commerce_taxrates` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `commerce_taxrates` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `commerce_taxzones`
--

LOCK TABLES `commerce_taxzones` WRITE;
/*!40000 ALTER TABLE `commerce_taxzones` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `commerce_taxzones` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `commerce_transactions`
--

LOCK TABLES `commerce_transactions` WRITE;
/*!40000 ALTER TABLE `commerce_transactions` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `commerce_transactions` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `commerce_variants`
--

LOCK TABLES `commerce_variants` WRITE;
/*!40000 ALTER TABLE `commerce_variants` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `commerce_variants` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `content`
--

LOCK TABLES `content` WRITE;
/*!40000 ALTER TABLE `content` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `content` VALUES (1,1,1,NULL,'2023-06-01 17:57:06','2023-06-01 17:57:06','8b6456fb-7530-4af7-b186-d1ebaa144309',NULL),(2,2,1,'YOU MAMA','2023-06-03 12:35:17','2023-06-03 12:35:25','909d8b9a-b000-427d-84cc-4bf9337e2d60','THOMAS IS GAY'),(3,3,1,'YOU MAMA','2023-06-03 12:35:25','2023-06-03 12:35:25','428d850a-b857-4983-b3ab-1fd25ac18b11','THOMAS IS GAY'),(4,5,1,'Store','2023-06-04 11:05:38','2023-06-04 11:06:57','7d4d580e-be5d-46dc-9338-26f97a0169d4',NULL),(6,7,1,'Senne boi','2023-06-05 09:01:24','2023-06-05 09:01:32','414cf347-77fd-4cdb-b9d1-2e339e5dffc2','I have no story'),(7,8,1,'Senne boi','2023-06-05 09:01:32','2023-06-05 09:01:32','99a5f8ec-957b-4ccc-969c-7f703e85bea2','I have no story');
/*!40000 ALTER TABLE `content` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `craftidtokens`
--

LOCK TABLES `craftidtokens` WRITE;
/*!40000 ALTER TABLE `craftidtokens` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `craftidtokens` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `deprecationerrors`
--

LOCK TABLES `deprecationerrors` WRITE;
/*!40000 ALTER TABLE `deprecationerrors` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `deprecationerrors` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `drafts`
--

LOCK TABLES `drafts` WRITE;
/*!40000 ALTER TABLE `drafts` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `drafts` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `elements`
--

LOCK TABLES `elements` WRITE;
/*!40000 ALTER TABLE `elements` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `elements` VALUES (1,NULL,NULL,NULL,NULL,'craft\\elements\\User',1,0,'2023-06-01 17:57:06','2023-06-01 17:57:06',NULL,NULL,'c8a845f3-ffd5-4b7d-bcb0-4a77a648b1d1'),(2,NULL,NULL,NULL,1,'craft\\elements\\Entry',1,0,'2023-06-03 12:35:17','2023-06-03 12:35:25',NULL,NULL,'0808e959-8d48-48ec-8ea8-10cfb1071cb9'),(3,2,NULL,1,1,'craft\\elements\\Entry',1,0,'2023-06-03 12:35:25','2023-06-03 12:35:25',NULL,NULL,'cc2f8e71-6d07-4906-82cf-4db3a62fdec6'),(4,NULL,NULL,NULL,NULL,'craft\\commerce\\elements\\Donation',0,0,'2023-06-04 11:04:37','2023-06-04 11:15:55',NULL,NULL,'d4556eba-3bd2-46b4-898e-648613fbe9e7'),(5,NULL,NULL,NULL,NULL,'craft\\elements\\Address',1,0,'2023-06-04 11:05:38','2023-06-04 11:06:57',NULL,NULL,'375bfcf1-bdb9-4819-9fe5-a798d1a62cd4'),(7,NULL,NULL,NULL,1,'craft\\elements\\Entry',1,0,'2023-06-05 09:01:23','2023-06-05 09:01:32',NULL,NULL,'19584886-80e7-4675-b5b8-e1e8d6fb2a4a'),(8,7,NULL,2,1,'craft\\elements\\Entry',1,0,'2023-06-05 09:01:32','2023-06-05 09:01:32',NULL,NULL,'2fdb534f-3e32-4f58-9a18-e78ef874d70a');
/*!40000 ALTER TABLE `elements` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `elements_sites`
--

LOCK TABLES `elements_sites` WRITE;
/*!40000 ALTER TABLE `elements_sites` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `elements_sites` VALUES (1,1,1,NULL,NULL,1,'2023-06-01 17:57:06','2023-06-01 17:57:06','b9dbb5ad-e339-4ce3-820b-d70208f4b637'),(2,2,1,'you-mama','designs/you-mama',1,'2023-06-03 12:35:17','2023-06-03 12:35:24','426d1305-74c1-417a-acac-d779fb00e571'),(3,3,1,'you-mama','designs/you-mama',1,'2023-06-03 12:35:25','2023-06-03 12:35:25','5b280ac0-9c8c-4d95-8e7f-19677de39bcd'),(4,4,1,NULL,NULL,1,'2023-06-04 11:04:37','2023-06-04 11:04:37','afe9467c-476d-442d-9b6e-f3540be15028'),(5,5,1,NULL,NULL,1,'2023-06-04 11:05:38','2023-06-04 11:05:38','194cbfc1-4d24-4c7a-8aa5-ea692d3c4c8b'),(7,7,1,'senne-boi','designs/senne-boi',1,'2023-06-05 09:01:23','2023-06-05 09:01:27','8afe73a8-42d4-4ff6-8dbb-f7e742159f0c'),(8,8,1,'senne-boi','designs/senne-boi',1,'2023-06-05 09:01:32','2023-06-05 09:01:32','8b2fdf45-235b-4388-b462-cd63731e5706');
/*!40000 ALTER TABLE `elements_sites` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `entries`
--

LOCK TABLES `entries` WRITE;
/*!40000 ALTER TABLE `entries` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `entries` VALUES (2,1,NULL,1,1,'2023-06-03 12:35:00',NULL,NULL,'2023-06-03 12:35:17','2023-06-03 12:35:25'),(3,1,NULL,1,1,'2023-06-03 12:35:00',NULL,NULL,'2023-06-03 12:35:25','2023-06-03 12:35:25'),(7,1,NULL,1,1,'2023-06-05 09:01:00',NULL,NULL,'2023-06-05 09:01:23','2023-06-05 09:01:32'),(8,1,NULL,1,1,'2023-06-05 09:01:00',NULL,NULL,'2023-06-05 09:01:32','2023-06-05 09:01:32');
/*!40000 ALTER TABLE `entries` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `entrytypes`
--

LOCK TABLES `entrytypes` WRITE;
/*!40000 ALTER TABLE `entrytypes` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `entrytypes` VALUES (1,1,1,'Default','default',1,'site',NULL,NULL,1,'2023-06-03 12:33:15','2023-06-03 12:33:15',NULL,'97163395-0194-4622-850e-b48d3d65be82');
/*!40000 ALTER TABLE `entrytypes` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `fieldgroups`
--

LOCK TABLES `fieldgroups` WRITE;
/*!40000 ALTER TABLE `fieldgroups` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `fieldgroups` VALUES (1,'Common','2023-06-01 17:57:05','2023-06-01 17:57:05',NULL,'35c69e63-d07d-4933-ac1c-4bcfdee0632e');
/*!40000 ALTER TABLE `fieldgroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `fieldlayoutfields`
--

LOCK TABLES `fieldlayoutfields` WRITE;
/*!40000 ALTER TABLE `fieldlayoutfields` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `fieldlayoutfields` VALUES (1,1,2,1,0,1,'2023-06-03 12:33:47','2023-06-03 12:33:47','e39c3558-c2ad-4ea0-80a3-0729d80642d6');
/*!40000 ALTER TABLE `fieldlayoutfields` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `fieldlayouts`
--

LOCK TABLES `fieldlayouts` WRITE;
/*!40000 ALTER TABLE `fieldlayouts` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `fieldlayouts` VALUES (1,'craft\\elements\\Entry','2023-06-03 12:33:15','2023-06-03 12:33:15',NULL,'dae3a5c9-9d6c-4970-94ad-b75b08df7d05'),(2,'craft\\commerce\\elements\\Order','2023-06-04 11:04:37','2023-06-04 11:04:37',NULL,'191ff9e3-9ac6-4cdc-982d-db4d8ed27326'),(3,'craft\\commerce\\elements\\Product','2023-06-06 09:39:49','2023-06-06 09:39:49',NULL,'65f3286d-488c-4174-86a7-f1b2cc8cd216');
/*!40000 ALTER TABLE `fieldlayouts` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `fieldlayouttabs`
--

LOCK TABLES `fieldlayouttabs` WRITE;
/*!40000 ALTER TABLE `fieldlayouttabs` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `fieldlayouttabs` VALUES (2,1,'Content','{\"userCondition\":null,\"elementCondition\":null}','[{\"type\":\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\",\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"width\":100,\"uid\":\"cf43cba7-e953-4a21-af75-17f404138c5b\",\"userCondition\":null,\"elementCondition\":null},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"3ccbc357-69a3-470f-8d71-1596c5f605ed\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"d5b7ca04-6137-41bf-ab70-95818c16f640\"}]',1,'2023-06-03 12:33:47','2023-06-03 12:33:47','2d3b04ba-04de-49c4-8d1b-a1036d3f1c9f'),(3,3,'Content','{\"userCondition\":null,\"elementCondition\":null}','[{\"type\":\"craft\\\\commerce\\\\fieldlayoutelements\\\\ProductTitleField\",\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"width\":100,\"uid\":\"843ea16f-44a6-4e7e-a228-1be35dfabe86\",\"userCondition\":null,\"elementCondition\":null},{\"type\":\"craft\\\\commerce\\\\fieldlayoutelements\\\\VariantsField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"uid\":\"4d7283fc-d87e-4f8e-be89-b613dbd4695d\",\"userCondition\":null,\"elementCondition\":null}]',1,'2023-06-06 09:39:49','2023-06-06 09:39:49','05816368-22c7-4698-8d1f-28187b2b9156');
/*!40000 ALTER TABLE `fieldlayouttabs` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `fields`
--

LOCK TABLES `fields` WRITE;
/*!40000 ALTER TABLE `fields` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `fields` VALUES (1,1,'story','story','global','cdrtxzcb',NULL,0,'none',NULL,'craft\\fields\\PlainText','{\"byteLimit\":null,\"charLimit\":null,\"code\":false,\"columnType\":null,\"initialRows\":4,\"multiline\":false,\"placeholder\":null,\"uiMode\":\"normal\"}','2023-06-03 12:33:37','2023-06-03 12:33:37','d5b7ca04-6137-41bf-ab70-95818c16f640');
/*!40000 ALTER TABLE `fields` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `globalsets`
--

LOCK TABLES `globalsets` WRITE;
/*!40000 ALTER TABLE `globalsets` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `globalsets` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `gqlschemas`
--

LOCK TABLES `gqlschemas` WRITE;
/*!40000 ALTER TABLE `gqlschemas` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `gqlschemas` VALUES (1,'Public Schema','[\"sites.ca98a93c-411a-4bbc-9174-0e0b3a88fb5e:read\",\"elements.drafts:read\",\"elements.revisions:read\",\"elements.inactive:read\",\"sections.098bf40a-4116-4672-b3b5-303b57a938cd:read\",\"entrytypes.97163395-0194-4622-850e-b48d3d65be82:read\",\"usergroups.everyone:read\",\"sections.098bf40a-4116-4672-b3b5-303b57a938cd:edit\",\"entrytypes.97163395-0194-4622-850e-b48d3d65be82:edit\",\"entrytypes.97163395-0194-4622-850e-b48d3d65be82:create\",\"entrytypes.97163395-0194-4622-850e-b48d3d65be82:save\",\"entrytypes.97163395-0194-4622-850e-b48d3d65be82:delete\"]',1,'2023-06-01 18:05:27','2023-06-04 21:49:09','346570d1-a361-4775-95ec-af7a9ee7592a');
/*!40000 ALTER TABLE `gqlschemas` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `gqltokens`
--

LOCK TABLES `gqltokens` WRITE;
/*!40000 ALTER TABLE `gqltokens` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `gqltokens` VALUES (1,'Public Token','__PUBLIC__',1,NULL,'2023-06-05 11:41:42',NULL,'2023-06-01 18:05:56','2023-06-05 11:41:42','b24ebb37-ecf2-41a6-94a1-d986bd49ef80');
/*!40000 ALTER TABLE `gqltokens` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `imagetransforms`
--

LOCK TABLES `imagetransforms` WRITE;
/*!40000 ALTER TABLE `imagetransforms` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `imagetransforms` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `info`
--

LOCK TABLES `info` WRITE;
/*!40000 ALTER TABLE `info` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `info` VALUES (1,'4.4.13','4.4.0.4',0,'vfwqlhhdwofs','3@cpggogkyhl','2023-06-01 17:57:05','2023-06-06 09:40:47','473d5f34-e6a7-4bfb-bf7a-483205395724');
/*!40000 ALTER TABLE `info` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `matrixblocks`
--

LOCK TABLES `matrixblocks` WRITE;
/*!40000 ALTER TABLE `matrixblocks` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `matrixblocks` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `matrixblocks_owners`
--

LOCK TABLES `matrixblocks_owners` WRITE;
/*!40000 ALTER TABLE `matrixblocks_owners` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `matrixblocks_owners` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `matrixblocktypes`
--

LOCK TABLES `matrixblocktypes` WRITE;
/*!40000 ALTER TABLE `matrixblocktypes` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `matrixblocktypes` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `migrations` VALUES (1,'craft','Install','2023-06-01 17:57:07','2023-06-01 17:57:07','2023-06-01 17:57:07','2fde78a4-fbc1-4694-8ef9-8d152b577f00'),(2,'craft','m210121_145800_asset_indexing_changes','2023-06-01 17:57:07','2023-06-01 17:57:07','2023-06-01 17:57:07','33ac5045-3876-47b5-9970-4d7b14dac3a7'),(3,'craft','m210624_222934_drop_deprecated_tables','2023-06-01 17:57:07','2023-06-01 17:57:07','2023-06-01 17:57:07','2ca40244-e225-466c-9e87-5fbfa522c677'),(4,'craft','m210724_180756_rename_source_cols','2023-06-01 17:57:07','2023-06-01 17:57:07','2023-06-01 17:57:07','5fdd2b0a-bd7a-4d92-9e21-44f79ffc585f'),(5,'craft','m210809_124211_remove_superfluous_uids','2023-06-01 17:57:07','2023-06-01 17:57:07','2023-06-01 17:57:07','a3531649-e782-4582-b1ef-b06678a7dd15'),(6,'craft','m210817_014201_universal_users','2023-06-01 17:57:07','2023-06-01 17:57:07','2023-06-01 17:57:07','fbf21541-9740-4f05-8212-2829b4d813f9'),(7,'craft','m210904_132612_store_element_source_settings_in_project_config','2023-06-01 17:57:07','2023-06-01 17:57:07','2023-06-01 17:57:07','1a8b173d-e5bd-4c83-9e25-3bdeb73c1466'),(8,'craft','m211115_135500_image_transformers','2023-06-01 17:57:07','2023-06-01 17:57:07','2023-06-01 17:57:07','8a876e27-6671-4542-bbe5-3dc2f91a913f'),(9,'craft','m211201_131000_filesystems','2023-06-01 17:57:07','2023-06-01 17:57:07','2023-06-01 17:57:07','045a2bee-5610-4611-86dc-1604aca6c405'),(10,'craft','m220103_043103_tab_conditions','2023-06-01 17:57:08','2023-06-01 17:57:08','2023-06-01 17:57:08','4a5b0513-d919-42e6-93cc-a80ad9992225'),(11,'craft','m220104_003433_asset_alt_text','2023-06-01 17:57:08','2023-06-01 17:57:08','2023-06-01 17:57:08','5e1a846c-af6c-4e95-a766-ced40b8252f2'),(12,'craft','m220123_213619_update_permissions','2023-06-01 17:57:08','2023-06-01 17:57:08','2023-06-01 17:57:08','085e3d75-6c1e-49e0-aed7-13d323ac4821'),(13,'craft','m220126_003432_addresses','2023-06-01 17:57:08','2023-06-01 17:57:08','2023-06-01 17:57:08','1170ae93-1f2a-4cb5-9b70-7cf531ea4352'),(14,'craft','m220209_095604_add_indexes','2023-06-01 17:57:08','2023-06-01 17:57:08','2023-06-01 17:57:08','98a964f7-0592-4613-aa33-570b6e0f4c04'),(15,'craft','m220213_015220_matrixblocks_owners_table','2023-06-01 17:57:08','2023-06-01 17:57:08','2023-06-01 17:57:08','23ff0820-64a9-4584-bb35-a0673e0e5f03'),(16,'craft','m220214_000000_truncate_sessions','2023-06-01 17:57:08','2023-06-01 17:57:08','2023-06-01 17:57:08','daccbf22-4904-4197-b080-a2892db20d15'),(17,'craft','m220222_122159_full_names','2023-06-01 17:57:08','2023-06-01 17:57:08','2023-06-01 17:57:08','b851a5e3-1b69-41ff-9d6a-cc15b0667c74'),(18,'craft','m220223_180559_nullable_address_owner','2023-06-01 17:57:08','2023-06-01 17:57:08','2023-06-01 17:57:08','3c1505c2-f644-4085-82cc-fc6efe707529'),(19,'craft','m220225_165000_transform_filesystems','2023-06-01 17:57:08','2023-06-01 17:57:08','2023-06-01 17:57:08','aa7866d2-bf88-448b-a699-fafec79efdad'),(20,'craft','m220309_152006_rename_field_layout_elements','2023-06-01 17:57:08','2023-06-01 17:57:08','2023-06-01 17:57:08','a7f0b55e-c619-469e-b9fd-6cc964f7c132'),(21,'craft','m220314_211928_field_layout_element_uids','2023-06-01 17:57:08','2023-06-01 17:57:08','2023-06-01 17:57:08','6d331b8e-1b6e-408e-b76d-1f29d12e6cbb'),(22,'craft','m220316_123800_transform_fs_subpath','2023-06-01 17:57:08','2023-06-01 17:57:08','2023-06-01 17:57:08','94bca524-4c67-4506-8f75-105c0f772cbd'),(23,'craft','m220317_174250_release_all_jobs','2023-06-01 17:57:08','2023-06-01 17:57:08','2023-06-01 17:57:08','973bdebb-be4c-4fd1-bd28-8ed00b400e18'),(24,'craft','m220330_150000_add_site_gql_schema_components','2023-06-01 17:57:08','2023-06-01 17:57:08','2023-06-01 17:57:08','967073dc-f09e-4b3a-8fe5-47b7fe4b7ecb'),(25,'craft','m220413_024536_site_enabled_string','2023-06-01 17:57:08','2023-06-01 17:57:08','2023-06-01 17:57:08','3167ea49-e8e7-43d2-aec6-cefb3d0058b7'),(26,'craft','m221027_160703_add_image_transform_fill','2023-06-01 17:57:08','2023-06-01 17:57:08','2023-06-01 17:57:08','92a5cda2-2f65-4063-86df-73f738aaae54'),(27,'craft','m221028_130548_add_canonical_id_index','2023-06-01 17:57:08','2023-06-01 17:57:08','2023-06-01 17:57:08','fd86d907-b28d-4b36-a3f1-7e1c909b0ef8'),(28,'craft','m221118_003031_drop_element_fks','2023-06-01 17:57:08','2023-06-01 17:57:08','2023-06-01 17:57:08','ae2bc189-1460-4062-a66f-af1314d14852'),(29,'craft','m230131_120713_asset_indexing_session_new_options','2023-06-01 17:57:08','2023-06-01 17:57:08','2023-06-01 17:57:08','1b40d231-9697-45ff-863c-aab0fde91774'),(30,'craft','m230226_013114_drop_plugin_license_columns','2023-06-01 17:57:08','2023-06-01 17:57:08','2023-06-01 17:57:08','a51eaaea-c6e9-4b67-b499-81d1c4fecf2f'),(31,'plugin:commerce','Install','2023-06-04 11:04:37','2023-06-04 11:04:37','2023-06-04 11:04:37','2ad59b96-1486-425c-8cde-4f962dfb8e0a'),(32,'plugin:commerce','m210614_073359_detailed_permission','2023-06-04 11:04:37','2023-06-04 11:04:37','2023-06-04 11:04:37','5981b677-9e1f-43cd-bcc8-40d73bb18d6a'),(33,'plugin:commerce','m210831_080542_rename_variant_title_format_field','2023-06-04 11:04:37','2023-06-04 11:04:37','2023-06-04 11:04:37','f228312f-0d40-4191-9ea5-d37c2f5c3a40'),(34,'plugin:commerce','m210901_211323_not_null_booleans','2023-06-04 11:04:37','2023-06-04 11:04:37','2023-06-04 11:04:37','0691ac9e-db09-4944-98a4-699a0f4ddf97'),(35,'plugin:commerce','m210922_133729_add_discount_order_condition_builder','2023-06-04 11:04:37','2023-06-04 11:04:37','2023-06-04 11:04:37','096b5ffe-d64e-4708-b1f0-1b17c04d702a'),(36,'plugin:commerce','m211118_101920_split_coupon_codes','2023-06-04 11:04:37','2023-06-04 11:04:37','2023-06-04 11:04:37','9fbb5db4-35f8-4ddb-ae9b-648b9300c0d3'),(37,'plugin:commerce','m220301_022054_user_addresses','2023-06-04 11:04:37','2023-06-04 11:04:37','2023-06-04 11:04:37','3304ff4b-9b84-4c2a-a0d0-35ad878ff733'),(38,'plugin:commerce','m220302_133730_add_discount_user_addresses_condition_builders','2023-06-04 11:04:37','2023-06-04 11:04:37','2023-06-04 11:04:37','0653ba73-f5b1-4ef3-8c39-e4672b9a2b98'),(39,'plugin:commerce','m220304_094835_discount_conditions','2023-06-04 11:04:37','2023-06-04 11:04:37','2023-06-04 11:04:37','aad7ad1c-6e3c-42ee-887e-6de9c61488a1'),(40,'plugin:commerce','m220308_221717_orderhistory_name','2023-06-04 11:04:37','2023-06-04 11:04:37','2023-06-04 11:04:37','a753b9af-5d84-40fa-b459-94130bb2baa1'),(41,'plugin:commerce','m220329_075053_convert_gateway_frontend_enabled_column','2023-06-04 11:04:37','2023-06-04 11:04:37','2023-06-04 11:04:37','e610608e-dde8-4f73-9556-43c2e8c11636'),(42,'plugin:commerce','m220706_132118_add_purchasable_tax_type','2023-06-04 11:04:37','2023-06-04 11:04:37','2023-06-04 11:04:37','96be6e69-ae5a-4797-b9be-18cc152e120b'),(43,'plugin:commerce','m220812_104819_add_primary_payment_source_column','2023-06-04 11:04:37','2023-06-04 11:04:37','2023-06-04 11:04:37','a50494fd-6680-42f0-b9e8-a564f130f57d'),(44,'plugin:commerce','m220817_135050_add_purchase_total_back_if_missing','2023-06-04 11:04:37','2023-06-04 11:04:37','2023-06-04 11:04:37','44e7d025-d8fc-436b-ba9a-dc5590e91699'),(45,'plugin:commerce','m220912_111800_add_order_total_qty_column','2023-06-04 11:04:37','2023-06-04 11:04:37','2023-06-04 11:04:37','b3f1b708-ce1d-433c-a841-0bbf29ad38e0'),(46,'plugin:commerce','m221027_070322_add_tax_shipping_category_soft_delete','2023-06-04 11:04:37','2023-06-04 11:04:37','2023-06-04 11:04:37','e9ea746a-7a1d-4d40-b4fd-6114bca008f7'),(47,'plugin:commerce','m221027_074805_update_shipping_tax_category_indexes','2023-06-04 11:04:37','2023-06-04 11:04:37','2023-06-04 11:04:37','a9598f1e-39b6-4616-bbfb-4083bdaf6268'),(48,'plugin:commerce','m221028_192112_add_indexes_to_address_columns_on_orders','2023-06-04 11:04:37','2023-06-04 11:04:37','2023-06-04 11:04:37','594ea7aa-dda3-47b4-a71e-794fbe569c3f'),(49,'plugin:commerce','m221122_155735_update_orders_shippingMethodHandle_default','2023-06-04 11:04:37','2023-06-04 11:04:37','2023-06-04 11:04:37','b83dd972-d769-433b-b13a-46b78b001c76'),(50,'plugin:commerce-stripe','Install','2023-06-04 11:05:14','2023-06-04 11:05:14','2023-06-04 11:05:14','185b134d-c0be-4300-a443-c582aafd58c5'),(51,'plugin:commerce-stripe','m190502_153000_payment_intents','2023-06-04 11:05:14','2023-06-04 11:05:14','2023-06-04 11:05:14','ebacf19b-a6d0-45b6-a080-33bd1d01d9b7'),(52,'plugin:commerce-stripe','m210903_040320_payment_intent_unique_on_transaction','2023-06-04 11:05:14','2023-06-04 11:05:14','2023-06-04 11:05:14','f6d70bc7-8a93-4dd8-9cad-958282df50eb'),(53,'plugin:commerce-stripe','m220406_160425_remove_charge_gateway_references','2023-06-04 11:05:14','2023-06-04 11:05:14','2023-06-04 11:05:14','7f3c2cc0-2cd1-4b6c-8564-204695727e1c');
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `plugins`
--

LOCK TABLES `plugins` WRITE;
/*!40000 ALTER TABLE `plugins` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `plugins` VALUES (1,'vite','4.0.5','1.0.0','2023-06-01 18:28:13','2023-06-01 18:28:13','2023-06-01 18:28:13','fab8781e-7d8f-4977-a173-a63bb04f9dc2'),(2,'commerce','4.2.11','4.2.3','2023-06-04 11:04:30','2023-06-04 11:04:30','2023-06-06 09:35:29','74009aff-ccda-4c15-b8c4-e73bdb6ced46'),(3,'commerce-stripe','3.1.1','3.0.0','2023-06-04 11:05:13','2023-06-04 11:05:13','2023-06-06 09:35:30','7193d863-3d54-42ca-a5fa-ec2214530bbc');
/*!40000 ALTER TABLE `plugins` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `projectconfig`
--

LOCK TABLES `projectconfig` WRITE;
/*!40000 ALTER TABLE `projectconfig` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `projectconfig` VALUES ('commerce.gateways.b0fe49ca-cc76-423d-85b1-5114b12dad38.handle','\"dummy\"'),('commerce.gateways.b0fe49ca-cc76-423d-85b1-5114b12dad38.isFrontendEnabled','\"1\"'),('commerce.gateways.b0fe49ca-cc76-423d-85b1-5114b12dad38.name','\"Dummy\"'),('commerce.gateways.b0fe49ca-cc76-423d-85b1-5114b12dad38.paymentType','\"purchase\"'),('commerce.gateways.b0fe49ca-cc76-423d-85b1-5114b12dad38.sortOrder','99'),('commerce.gateways.b0fe49ca-cc76-423d-85b1-5114b12dad38.type','\"craft\\\\commerce\\\\gateways\\\\Dummy\"'),('commerce.orderStatuses.ee9b1680-d7fc-47ea-a3ec-691fe2dc77e3.color','\"green\"'),('commerce.orderStatuses.ee9b1680-d7fc-47ea-a3ec-691fe2dc77e3.default','true'),('commerce.orderStatuses.ee9b1680-d7fc-47ea-a3ec-691fe2dc77e3.description','null'),('commerce.orderStatuses.ee9b1680-d7fc-47ea-a3ec-691fe2dc77e3.handle','\"new\"'),('commerce.orderStatuses.ee9b1680-d7fc-47ea-a3ec-691fe2dc77e3.name','\"New\"'),('commerce.orderStatuses.ee9b1680-d7fc-47ea-a3ec-691fe2dc77e3.sortOrder','99'),('commerce.productTypes.17688985-a8f9-4bcf-b2e8-131053d1f7d7.descriptionFormat','\"{product.title} - {title}\"'),('commerce.productTypes.17688985-a8f9-4bcf-b2e8-131053d1f7d7.handle','\"senne\"'),('commerce.productTypes.17688985-a8f9-4bcf-b2e8-131053d1f7d7.hasDimensions','false'),('commerce.productTypes.17688985-a8f9-4bcf-b2e8-131053d1f7d7.hasProductTitleField','true'),('commerce.productTypes.17688985-a8f9-4bcf-b2e8-131053d1f7d7.hasVariants','false'),('commerce.productTypes.17688985-a8f9-4bcf-b2e8-131053d1f7d7.hasVariantTitleField','false'),('commerce.productTypes.17688985-a8f9-4bcf-b2e8-131053d1f7d7.name','\"Senne\"'),('commerce.productTypes.17688985-a8f9-4bcf-b2e8-131053d1f7d7.productFieldLayouts.65f3286d-488c-4174-86a7-f1b2cc8cd216.tabs.0.elementCondition','null'),('commerce.productTypes.17688985-a8f9-4bcf-b2e8-131053d1f7d7.productFieldLayouts.65f3286d-488c-4174-86a7-f1b2cc8cd216.tabs.0.elements.0.autocapitalize','true'),('commerce.productTypes.17688985-a8f9-4bcf-b2e8-131053d1f7d7.productFieldLayouts.65f3286d-488c-4174-86a7-f1b2cc8cd216.tabs.0.elements.0.autocomplete','false'),('commerce.productTypes.17688985-a8f9-4bcf-b2e8-131053d1f7d7.productFieldLayouts.65f3286d-488c-4174-86a7-f1b2cc8cd216.tabs.0.elements.0.autocorrect','true'),('commerce.productTypes.17688985-a8f9-4bcf-b2e8-131053d1f7d7.productFieldLayouts.65f3286d-488c-4174-86a7-f1b2cc8cd216.tabs.0.elements.0.class','null'),('commerce.productTypes.17688985-a8f9-4bcf-b2e8-131053d1f7d7.productFieldLayouts.65f3286d-488c-4174-86a7-f1b2cc8cd216.tabs.0.elements.0.disabled','false'),('commerce.productTypes.17688985-a8f9-4bcf-b2e8-131053d1f7d7.productFieldLayouts.65f3286d-488c-4174-86a7-f1b2cc8cd216.tabs.0.elements.0.elementCondition','null'),('commerce.productTypes.17688985-a8f9-4bcf-b2e8-131053d1f7d7.productFieldLayouts.65f3286d-488c-4174-86a7-f1b2cc8cd216.tabs.0.elements.0.id','null'),('commerce.productTypes.17688985-a8f9-4bcf-b2e8-131053d1f7d7.productFieldLayouts.65f3286d-488c-4174-86a7-f1b2cc8cd216.tabs.0.elements.0.instructions','null'),('commerce.productTypes.17688985-a8f9-4bcf-b2e8-131053d1f7d7.productFieldLayouts.65f3286d-488c-4174-86a7-f1b2cc8cd216.tabs.0.elements.0.label','null'),('commerce.productTypes.17688985-a8f9-4bcf-b2e8-131053d1f7d7.productFieldLayouts.65f3286d-488c-4174-86a7-f1b2cc8cd216.tabs.0.elements.0.max','null'),('commerce.productTypes.17688985-a8f9-4bcf-b2e8-131053d1f7d7.productFieldLayouts.65f3286d-488c-4174-86a7-f1b2cc8cd216.tabs.0.elements.0.min','null'),('commerce.productTypes.17688985-a8f9-4bcf-b2e8-131053d1f7d7.productFieldLayouts.65f3286d-488c-4174-86a7-f1b2cc8cd216.tabs.0.elements.0.name','null'),('commerce.productTypes.17688985-a8f9-4bcf-b2e8-131053d1f7d7.productFieldLayouts.65f3286d-488c-4174-86a7-f1b2cc8cd216.tabs.0.elements.0.orientation','null'),('commerce.productTypes.17688985-a8f9-4bcf-b2e8-131053d1f7d7.productFieldLayouts.65f3286d-488c-4174-86a7-f1b2cc8cd216.tabs.0.elements.0.placeholder','null'),('commerce.productTypes.17688985-a8f9-4bcf-b2e8-131053d1f7d7.productFieldLayouts.65f3286d-488c-4174-86a7-f1b2cc8cd216.tabs.0.elements.0.readonly','false'),('commerce.productTypes.17688985-a8f9-4bcf-b2e8-131053d1f7d7.productFieldLayouts.65f3286d-488c-4174-86a7-f1b2cc8cd216.tabs.0.elements.0.requirable','false'),('commerce.productTypes.17688985-a8f9-4bcf-b2e8-131053d1f7d7.productFieldLayouts.65f3286d-488c-4174-86a7-f1b2cc8cd216.tabs.0.elements.0.size','null'),('commerce.productTypes.17688985-a8f9-4bcf-b2e8-131053d1f7d7.productFieldLayouts.65f3286d-488c-4174-86a7-f1b2cc8cd216.tabs.0.elements.0.step','null'),('commerce.productTypes.17688985-a8f9-4bcf-b2e8-131053d1f7d7.productFieldLayouts.65f3286d-488c-4174-86a7-f1b2cc8cd216.tabs.0.elements.0.tip','null'),('commerce.productTypes.17688985-a8f9-4bcf-b2e8-131053d1f7d7.productFieldLayouts.65f3286d-488c-4174-86a7-f1b2cc8cd216.tabs.0.elements.0.title','null'),('commerce.productTypes.17688985-a8f9-4bcf-b2e8-131053d1f7d7.productFieldLayouts.65f3286d-488c-4174-86a7-f1b2cc8cd216.tabs.0.elements.0.type','\"craft\\\\commerce\\\\fieldlayoutelements\\\\ProductTitleField\"'),('commerce.productTypes.17688985-a8f9-4bcf-b2e8-131053d1f7d7.productFieldLayouts.65f3286d-488c-4174-86a7-f1b2cc8cd216.tabs.0.elements.0.uid','\"843ea16f-44a6-4e7e-a228-1be35dfabe86\"'),('commerce.productTypes.17688985-a8f9-4bcf-b2e8-131053d1f7d7.productFieldLayouts.65f3286d-488c-4174-86a7-f1b2cc8cd216.tabs.0.elements.0.userCondition','null'),('commerce.productTypes.17688985-a8f9-4bcf-b2e8-131053d1f7d7.productFieldLayouts.65f3286d-488c-4174-86a7-f1b2cc8cd216.tabs.0.elements.0.warning','null'),('commerce.productTypes.17688985-a8f9-4bcf-b2e8-131053d1f7d7.productFieldLayouts.65f3286d-488c-4174-86a7-f1b2cc8cd216.tabs.0.elements.0.width','100'),('commerce.productTypes.17688985-a8f9-4bcf-b2e8-131053d1f7d7.productFieldLayouts.65f3286d-488c-4174-86a7-f1b2cc8cd216.tabs.0.elements.1.elementCondition','null'),('commerce.productTypes.17688985-a8f9-4bcf-b2e8-131053d1f7d7.productFieldLayouts.65f3286d-488c-4174-86a7-f1b2cc8cd216.tabs.0.elements.1.instructions','null'),('commerce.productTypes.17688985-a8f9-4bcf-b2e8-131053d1f7d7.productFieldLayouts.65f3286d-488c-4174-86a7-f1b2cc8cd216.tabs.0.elements.1.label','null'),('commerce.productTypes.17688985-a8f9-4bcf-b2e8-131053d1f7d7.productFieldLayouts.65f3286d-488c-4174-86a7-f1b2cc8cd216.tabs.0.elements.1.required','false'),('commerce.productTypes.17688985-a8f9-4bcf-b2e8-131053d1f7d7.productFieldLayouts.65f3286d-488c-4174-86a7-f1b2cc8cd216.tabs.0.elements.1.tip','null'),('commerce.productTypes.17688985-a8f9-4bcf-b2e8-131053d1f7d7.productFieldLayouts.65f3286d-488c-4174-86a7-f1b2cc8cd216.tabs.0.elements.1.type','\"craft\\\\commerce\\\\fieldlayoutelements\\\\VariantsField\"'),('commerce.productTypes.17688985-a8f9-4bcf-b2e8-131053d1f7d7.productFieldLayouts.65f3286d-488c-4174-86a7-f1b2cc8cd216.tabs.0.elements.1.uid','\"4d7283fc-d87e-4f8e-be89-b613dbd4695d\"'),('commerce.productTypes.17688985-a8f9-4bcf-b2e8-131053d1f7d7.productFieldLayouts.65f3286d-488c-4174-86a7-f1b2cc8cd216.tabs.0.elements.1.userCondition','null'),('commerce.productTypes.17688985-a8f9-4bcf-b2e8-131053d1f7d7.productFieldLayouts.65f3286d-488c-4174-86a7-f1b2cc8cd216.tabs.0.elements.1.warning','null'),('commerce.productTypes.17688985-a8f9-4bcf-b2e8-131053d1f7d7.productFieldLayouts.65f3286d-488c-4174-86a7-f1b2cc8cd216.tabs.0.name','\"Content\"'),('commerce.productTypes.17688985-a8f9-4bcf-b2e8-131053d1f7d7.productFieldLayouts.65f3286d-488c-4174-86a7-f1b2cc8cd216.tabs.0.uid','\"05816368-22c7-4698-8d1f-28187b2b9156\"'),('commerce.productTypes.17688985-a8f9-4bcf-b2e8-131053d1f7d7.productFieldLayouts.65f3286d-488c-4174-86a7-f1b2cc8cd216.tabs.0.userCondition','null'),('commerce.productTypes.17688985-a8f9-4bcf-b2e8-131053d1f7d7.productTitleFormat','\"\"'),('commerce.productTypes.17688985-a8f9-4bcf-b2e8-131053d1f7d7.siteSettings.ca98a93c-411a-4bbc-9174-0e0b3a88fb5e.hasUrls','true'),('commerce.productTypes.17688985-a8f9-4bcf-b2e8-131053d1f7d7.siteSettings.ca98a93c-411a-4bbc-9174-0e0b3a88fb5e.template','\"\"'),('commerce.productTypes.17688985-a8f9-4bcf-b2e8-131053d1f7d7.siteSettings.ca98a93c-411a-4bbc-9174-0e0b3a88fb5e.uriFormat','\"senne/{slug}\"'),('commerce.productTypes.17688985-a8f9-4bcf-b2e8-131053d1f7d7.skuFormat','\"\"'),('commerce.productTypes.17688985-a8f9-4bcf-b2e8-131053d1f7d7.variantTitleFormat','\"{product.title}\"'),('dateModified','1686044447'),('email.fromEmail','\"minh.tri.ha@student.howest.be\"'),('email.fromName','\"kultureX\"'),('email.transportType','\"craft\\\\mail\\\\transportadapters\\\\Sendmail\"'),('entryTypes.97163395-0194-4622-850e-b48d3d65be82.fieldLayouts.dae3a5c9-9d6c-4970-94ad-b75b08df7d05.tabs.0.elementCondition','null'),('entryTypes.97163395-0194-4622-850e-b48d3d65be82.fieldLayouts.dae3a5c9-9d6c-4970-94ad-b75b08df7d05.tabs.0.elements.0.autocapitalize','true'),('entryTypes.97163395-0194-4622-850e-b48d3d65be82.fieldLayouts.dae3a5c9-9d6c-4970-94ad-b75b08df7d05.tabs.0.elements.0.autocomplete','false'),('entryTypes.97163395-0194-4622-850e-b48d3d65be82.fieldLayouts.dae3a5c9-9d6c-4970-94ad-b75b08df7d05.tabs.0.elements.0.autocorrect','true'),('entryTypes.97163395-0194-4622-850e-b48d3d65be82.fieldLayouts.dae3a5c9-9d6c-4970-94ad-b75b08df7d05.tabs.0.elements.0.class','null'),('entryTypes.97163395-0194-4622-850e-b48d3d65be82.fieldLayouts.dae3a5c9-9d6c-4970-94ad-b75b08df7d05.tabs.0.elements.0.disabled','false'),('entryTypes.97163395-0194-4622-850e-b48d3d65be82.fieldLayouts.dae3a5c9-9d6c-4970-94ad-b75b08df7d05.tabs.0.elements.0.elementCondition','null'),('entryTypes.97163395-0194-4622-850e-b48d3d65be82.fieldLayouts.dae3a5c9-9d6c-4970-94ad-b75b08df7d05.tabs.0.elements.0.id','null'),('entryTypes.97163395-0194-4622-850e-b48d3d65be82.fieldLayouts.dae3a5c9-9d6c-4970-94ad-b75b08df7d05.tabs.0.elements.0.instructions','null'),('entryTypes.97163395-0194-4622-850e-b48d3d65be82.fieldLayouts.dae3a5c9-9d6c-4970-94ad-b75b08df7d05.tabs.0.elements.0.label','null'),('entryTypes.97163395-0194-4622-850e-b48d3d65be82.fieldLayouts.dae3a5c9-9d6c-4970-94ad-b75b08df7d05.tabs.0.elements.0.max','null'),('entryTypes.97163395-0194-4622-850e-b48d3d65be82.fieldLayouts.dae3a5c9-9d6c-4970-94ad-b75b08df7d05.tabs.0.elements.0.min','null'),('entryTypes.97163395-0194-4622-850e-b48d3d65be82.fieldLayouts.dae3a5c9-9d6c-4970-94ad-b75b08df7d05.tabs.0.elements.0.name','null'),('entryTypes.97163395-0194-4622-850e-b48d3d65be82.fieldLayouts.dae3a5c9-9d6c-4970-94ad-b75b08df7d05.tabs.0.elements.0.orientation','null'),('entryTypes.97163395-0194-4622-850e-b48d3d65be82.fieldLayouts.dae3a5c9-9d6c-4970-94ad-b75b08df7d05.tabs.0.elements.0.placeholder','null'),('entryTypes.97163395-0194-4622-850e-b48d3d65be82.fieldLayouts.dae3a5c9-9d6c-4970-94ad-b75b08df7d05.tabs.0.elements.0.readonly','false'),('entryTypes.97163395-0194-4622-850e-b48d3d65be82.fieldLayouts.dae3a5c9-9d6c-4970-94ad-b75b08df7d05.tabs.0.elements.0.requirable','false'),('entryTypes.97163395-0194-4622-850e-b48d3d65be82.fieldLayouts.dae3a5c9-9d6c-4970-94ad-b75b08df7d05.tabs.0.elements.0.size','null'),('entryTypes.97163395-0194-4622-850e-b48d3d65be82.fieldLayouts.dae3a5c9-9d6c-4970-94ad-b75b08df7d05.tabs.0.elements.0.step','null'),('entryTypes.97163395-0194-4622-850e-b48d3d65be82.fieldLayouts.dae3a5c9-9d6c-4970-94ad-b75b08df7d05.tabs.0.elements.0.tip','null'),('entryTypes.97163395-0194-4622-850e-b48d3d65be82.fieldLayouts.dae3a5c9-9d6c-4970-94ad-b75b08df7d05.tabs.0.elements.0.title','null'),('entryTypes.97163395-0194-4622-850e-b48d3d65be82.fieldLayouts.dae3a5c9-9d6c-4970-94ad-b75b08df7d05.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\"'),('entryTypes.97163395-0194-4622-850e-b48d3d65be82.fieldLayouts.dae3a5c9-9d6c-4970-94ad-b75b08df7d05.tabs.0.elements.0.uid','\"cf43cba7-e953-4a21-af75-17f404138c5b\"'),('entryTypes.97163395-0194-4622-850e-b48d3d65be82.fieldLayouts.dae3a5c9-9d6c-4970-94ad-b75b08df7d05.tabs.0.elements.0.userCondition','null'),('entryTypes.97163395-0194-4622-850e-b48d3d65be82.fieldLayouts.dae3a5c9-9d6c-4970-94ad-b75b08df7d05.tabs.0.elements.0.warning','null'),('entryTypes.97163395-0194-4622-850e-b48d3d65be82.fieldLayouts.dae3a5c9-9d6c-4970-94ad-b75b08df7d05.tabs.0.elements.0.width','100'),('entryTypes.97163395-0194-4622-850e-b48d3d65be82.fieldLayouts.dae3a5c9-9d6c-4970-94ad-b75b08df7d05.tabs.0.elements.1.elementCondition','null'),('entryTypes.97163395-0194-4622-850e-b48d3d65be82.fieldLayouts.dae3a5c9-9d6c-4970-94ad-b75b08df7d05.tabs.0.elements.1.fieldUid','\"d5b7ca04-6137-41bf-ab70-95818c16f640\"'),('entryTypes.97163395-0194-4622-850e-b48d3d65be82.fieldLayouts.dae3a5c9-9d6c-4970-94ad-b75b08df7d05.tabs.0.elements.1.instructions','null'),('entryTypes.97163395-0194-4622-850e-b48d3d65be82.fieldLayouts.dae3a5c9-9d6c-4970-94ad-b75b08df7d05.tabs.0.elements.1.label','null'),('entryTypes.97163395-0194-4622-850e-b48d3d65be82.fieldLayouts.dae3a5c9-9d6c-4970-94ad-b75b08df7d05.tabs.0.elements.1.required','false'),('entryTypes.97163395-0194-4622-850e-b48d3d65be82.fieldLayouts.dae3a5c9-9d6c-4970-94ad-b75b08df7d05.tabs.0.elements.1.tip','null'),('entryTypes.97163395-0194-4622-850e-b48d3d65be82.fieldLayouts.dae3a5c9-9d6c-4970-94ad-b75b08df7d05.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.97163395-0194-4622-850e-b48d3d65be82.fieldLayouts.dae3a5c9-9d6c-4970-94ad-b75b08df7d05.tabs.0.elements.1.uid','\"3ccbc357-69a3-470f-8d71-1596c5f605ed\"'),('entryTypes.97163395-0194-4622-850e-b48d3d65be82.fieldLayouts.dae3a5c9-9d6c-4970-94ad-b75b08df7d05.tabs.0.elements.1.userCondition','null'),('entryTypes.97163395-0194-4622-850e-b48d3d65be82.fieldLayouts.dae3a5c9-9d6c-4970-94ad-b75b08df7d05.tabs.0.elements.1.warning','null'),('entryTypes.97163395-0194-4622-850e-b48d3d65be82.fieldLayouts.dae3a5c9-9d6c-4970-94ad-b75b08df7d05.tabs.0.elements.1.width','100'),('entryTypes.97163395-0194-4622-850e-b48d3d65be82.fieldLayouts.dae3a5c9-9d6c-4970-94ad-b75b08df7d05.tabs.0.name','\"Content\"'),('entryTypes.97163395-0194-4622-850e-b48d3d65be82.fieldLayouts.dae3a5c9-9d6c-4970-94ad-b75b08df7d05.tabs.0.uid','\"2d3b04ba-04de-49c4-8d1b-a1036d3f1c9f\"'),('entryTypes.97163395-0194-4622-850e-b48d3d65be82.fieldLayouts.dae3a5c9-9d6c-4970-94ad-b75b08df7d05.tabs.0.userCondition','null'),('entryTypes.97163395-0194-4622-850e-b48d3d65be82.handle','\"default\"'),('entryTypes.97163395-0194-4622-850e-b48d3d65be82.hasTitleField','true'),('entryTypes.97163395-0194-4622-850e-b48d3d65be82.name','\"Default\"'),('entryTypes.97163395-0194-4622-850e-b48d3d65be82.section','\"098bf40a-4116-4672-b3b5-303b57a938cd\"'),('entryTypes.97163395-0194-4622-850e-b48d3d65be82.sortOrder','1'),('entryTypes.97163395-0194-4622-850e-b48d3d65be82.titleFormat','null'),('entryTypes.97163395-0194-4622-850e-b48d3d65be82.titleTranslationKeyFormat','null'),('entryTypes.97163395-0194-4622-850e-b48d3d65be82.titleTranslationMethod','\"site\"'),('fieldGroups.35c69e63-d07d-4933-ac1c-4bcfdee0632e.name','\"Common\"'),('fields.d5b7ca04-6137-41bf-ab70-95818c16f640.columnSuffix','\"cdrtxzcb\"'),('fields.d5b7ca04-6137-41bf-ab70-95818c16f640.contentColumnType','\"text\"'),('fields.d5b7ca04-6137-41bf-ab70-95818c16f640.fieldGroup','\"35c69e63-d07d-4933-ac1c-4bcfdee0632e\"'),('fields.d5b7ca04-6137-41bf-ab70-95818c16f640.handle','\"story\"'),('fields.d5b7ca04-6137-41bf-ab70-95818c16f640.instructions','null'),('fields.d5b7ca04-6137-41bf-ab70-95818c16f640.name','\"story\"'),('fields.d5b7ca04-6137-41bf-ab70-95818c16f640.searchable','false'),('fields.d5b7ca04-6137-41bf-ab70-95818c16f640.settings.byteLimit','null'),('fields.d5b7ca04-6137-41bf-ab70-95818c16f640.settings.charLimit','null'),('fields.d5b7ca04-6137-41bf-ab70-95818c16f640.settings.code','false'),('fields.d5b7ca04-6137-41bf-ab70-95818c16f640.settings.columnType','null'),('fields.d5b7ca04-6137-41bf-ab70-95818c16f640.settings.initialRows','4'),('fields.d5b7ca04-6137-41bf-ab70-95818c16f640.settings.multiline','false'),('fields.d5b7ca04-6137-41bf-ab70-95818c16f640.settings.placeholder','null'),('fields.d5b7ca04-6137-41bf-ab70-95818c16f640.settings.uiMode','\"normal\"'),('fields.d5b7ca04-6137-41bf-ab70-95818c16f640.translationKeyFormat','null'),('fields.d5b7ca04-6137-41bf-ab70-95818c16f640.translationMethod','\"none\"'),('fields.d5b7ca04-6137-41bf-ab70-95818c16f640.type','\"craft\\\\fields\\\\PlainText\"'),('graphql.publicToken.enabled','true'),('graphql.publicToken.expiryDate','null'),('graphql.schemas.346570d1-a361-4775-95ec-af7a9ee7592a.isPublic','true'),('graphql.schemas.346570d1-a361-4775-95ec-af7a9ee7592a.name','\"Public Schema\"'),('graphql.schemas.346570d1-a361-4775-95ec-af7a9ee7592a.scope.0','\"sites.ca98a93c-411a-4bbc-9174-0e0b3a88fb5e:read\"'),('graphql.schemas.346570d1-a361-4775-95ec-af7a9ee7592a.scope.1','\"elements.drafts:read\"'),('graphql.schemas.346570d1-a361-4775-95ec-af7a9ee7592a.scope.10','\"entrytypes.97163395-0194-4622-850e-b48d3d65be82:save\"'),('graphql.schemas.346570d1-a361-4775-95ec-af7a9ee7592a.scope.11','\"entrytypes.97163395-0194-4622-850e-b48d3d65be82:delete\"'),('graphql.schemas.346570d1-a361-4775-95ec-af7a9ee7592a.scope.2','\"elements.revisions:read\"'),('graphql.schemas.346570d1-a361-4775-95ec-af7a9ee7592a.scope.3','\"elements.inactive:read\"'),('graphql.schemas.346570d1-a361-4775-95ec-af7a9ee7592a.scope.4','\"sections.098bf40a-4116-4672-b3b5-303b57a938cd:read\"'),('graphql.schemas.346570d1-a361-4775-95ec-af7a9ee7592a.scope.5','\"entrytypes.97163395-0194-4622-850e-b48d3d65be82:read\"'),('graphql.schemas.346570d1-a361-4775-95ec-af7a9ee7592a.scope.6','\"usergroups.everyone:read\"'),('graphql.schemas.346570d1-a361-4775-95ec-af7a9ee7592a.scope.7','\"sections.098bf40a-4116-4672-b3b5-303b57a938cd:edit\"'),('graphql.schemas.346570d1-a361-4775-95ec-af7a9ee7592a.scope.8','\"entrytypes.97163395-0194-4622-850e-b48d3d65be82:edit\"'),('graphql.schemas.346570d1-a361-4775-95ec-af7a9ee7592a.scope.9','\"entrytypes.97163395-0194-4622-850e-b48d3d65be82:create\"'),('meta.__names__.098bf40a-4116-4672-b3b5-303b57a938cd','\"designs\"'),('meta.__names__.17688985-a8f9-4bcf-b2e8-131053d1f7d7','\"Senne\"'),('meta.__names__.346570d1-a361-4775-95ec-af7a9ee7592a','\"Public Schema\"'),('meta.__names__.35c69e63-d07d-4933-ac1c-4bcfdee0632e','\"Common\"'),('meta.__names__.3c3816f3-e10f-4183-beae-7ab3f1fbc5e6','\"kultureX\"'),('meta.__names__.97163395-0194-4622-850e-b48d3d65be82','\"Default\"'),('meta.__names__.b0fe49ca-cc76-423d-85b1-5114b12dad38','\"Dummy\"'),('meta.__names__.ca98a93c-411a-4bbc-9174-0e0b3a88fb5e','\"kultureX\"'),('meta.__names__.d5b7ca04-6137-41bf-ab70-95818c16f640','\"story\"'),('meta.__names__.ee9b1680-d7fc-47ea-a3ec-691fe2dc77e3','\"New\"'),('plugins.commerce-stripe.edition','\"standard\"'),('plugins.commerce-stripe.enabled','true'),('plugins.commerce-stripe.schemaVersion','\"3.0.0\"'),('plugins.commerce.edition','\"lite\"'),('plugins.commerce.enabled','true'),('plugins.commerce.licenseKey','\"6R4O7N9Y66GW5IQUXG523KMF\"'),('plugins.commerce.schemaVersion','\"4.2.3\"'),('plugins.commerce.settings.activeCartDuration','3600'),('plugins.commerce.settings.allowCheckoutWithoutPayment','false'),('plugins.commerce.settings.allowEmptyCartOnCheckout','false'),('plugins.commerce.settings.allowPartialPaymentOnCheckout','false'),('plugins.commerce.settings.autoSetCartShippingMethodOption','false'),('plugins.commerce.settings.autoSetNewCartAddresses','true'),('plugins.commerce.settings.autoSetPaymentSource','false'),('plugins.commerce.settings.cartVariable','\"cart\"'),('plugins.commerce.settings.defaultView','\"commerce/products\"'),('plugins.commerce.settings.dimensionUnits','\"mm\"'),('plugins.commerce.settings.emailSenderAddress','null'),('plugins.commerce.settings.emailSenderAddressPlaceholder','null'),('plugins.commerce.settings.emailSenderName','null'),('plugins.commerce.settings.emailSenderNamePlaceholder','null'),('plugins.commerce.settings.freeOrderPaymentStrategy','\"complete\"'),('plugins.commerce.settings.gatewayPostRedirectTemplate','\"\"'),('plugins.commerce.settings.loadCartRedirectUrl','null'),('plugins.commerce.settings.minimumTotalPriceStrategy','\"default\"'),('plugins.commerce.settings.orderReferenceFormat','\"{{number[:7]}}\"'),('plugins.commerce.settings.paymentCurrency','null'),('plugins.commerce.settings.pdfAllowRemoteImages','false'),('plugins.commerce.settings.pdfPaperOrientation','\"portrait\"'),('plugins.commerce.settings.pdfPaperSize','\"letter\"'),('plugins.commerce.settings.purgeInactiveCarts','true'),('plugins.commerce.settings.purgeInactiveCartsDuration','7776000'),('plugins.commerce.settings.requireBillingAddressAtCheckout','false'),('plugins.commerce.settings.requireShippingAddressAtCheckout','false'),('plugins.commerce.settings.requireShippingMethodSelectionAtCheckout','false'),('plugins.commerce.settings.showEditUserCommerceTab','true'),('plugins.commerce.settings.updateBillingDetailsUrl','\"\"'),('plugins.commerce.settings.updateCartSearchIndexes','true'),('plugins.commerce.settings.useBillingAddressForTax','false'),('plugins.commerce.settings.validateBusinessTaxIdAsVatId','false'),('plugins.commerce.settings.validateCartCustomFieldsOnSubmission','false'),('plugins.commerce.settings.weightUnits','\"g\"'),('plugins.vite.edition','\"standard\"'),('plugins.vite.enabled','true'),('plugins.vite.schemaVersion','\"1.0.0\"'),('sections.098bf40a-4116-4672-b3b5-303b57a938cd.defaultPlacement','\"end\"'),('sections.098bf40a-4116-4672-b3b5-303b57a938cd.enableVersioning','true'),('sections.098bf40a-4116-4672-b3b5-303b57a938cd.handle','\"designs\"'),('sections.098bf40a-4116-4672-b3b5-303b57a938cd.name','\"designs\"'),('sections.098bf40a-4116-4672-b3b5-303b57a938cd.previewTargets.0.__assoc__.0.0','\"label\"'),('sections.098bf40a-4116-4672-b3b5-303b57a938cd.previewTargets.0.__assoc__.0.1','\"Primary entry page\"'),('sections.098bf40a-4116-4672-b3b5-303b57a938cd.previewTargets.0.__assoc__.1.0','\"urlFormat\"'),('sections.098bf40a-4116-4672-b3b5-303b57a938cd.previewTargets.0.__assoc__.1.1','\"{url}\"'),('sections.098bf40a-4116-4672-b3b5-303b57a938cd.previewTargets.0.__assoc__.2.0','\"refresh\"'),('sections.098bf40a-4116-4672-b3b5-303b57a938cd.previewTargets.0.__assoc__.2.1','\"1\"'),('sections.098bf40a-4116-4672-b3b5-303b57a938cd.propagationMethod','\"all\"'),('sections.098bf40a-4116-4672-b3b5-303b57a938cd.siteSettings.ca98a93c-411a-4bbc-9174-0e0b3a88fb5e.enabledByDefault','true'),('sections.098bf40a-4116-4672-b3b5-303b57a938cd.siteSettings.ca98a93c-411a-4bbc-9174-0e0b3a88fb5e.hasUrls','true'),('sections.098bf40a-4116-4672-b3b5-303b57a938cd.siteSettings.ca98a93c-411a-4bbc-9174-0e0b3a88fb5e.template','\"designs/_entry\"'),('sections.098bf40a-4116-4672-b3b5-303b57a938cd.siteSettings.ca98a93c-411a-4bbc-9174-0e0b3a88fb5e.uriFormat','\"designs/{slug}\"'),('sections.098bf40a-4116-4672-b3b5-303b57a938cd.type','\"channel\"'),('siteGroups.3c3816f3-e10f-4183-beae-7ab3f1fbc5e6.name','\"kultureX\"'),('sites.ca98a93c-411a-4bbc-9174-0e0b3a88fb5e.baseUrl','\"$PRIMARY_SITE_URL\"'),('sites.ca98a93c-411a-4bbc-9174-0e0b3a88fb5e.handle','\"default\"'),('sites.ca98a93c-411a-4bbc-9174-0e0b3a88fb5e.hasUrls','true'),('sites.ca98a93c-411a-4bbc-9174-0e0b3a88fb5e.language','\"en-US\"'),('sites.ca98a93c-411a-4bbc-9174-0e0b3a88fb5e.name','\"kultureX\"'),('sites.ca98a93c-411a-4bbc-9174-0e0b3a88fb5e.primary','true'),('sites.ca98a93c-411a-4bbc-9174-0e0b3a88fb5e.siteGroup','\"3c3816f3-e10f-4183-beae-7ab3f1fbc5e6\"'),('sites.ca98a93c-411a-4bbc-9174-0e0b3a88fb5e.sortOrder','1'),('system.edition','\"pro\"'),('system.live','true'),('system.name','\"kultureX\"'),('system.schemaVersion','\"4.4.0.4\"'),('system.timeZone','\"America/Los_Angeles\"'),('users.allowPublicRegistration','false'),('users.defaultGroup','null'),('users.photoSubpath','null'),('users.photoVolumeUid','null'),('users.requireEmailVerification','true');
/*!40000 ALTER TABLE `projectconfig` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `queue`
--

LOCK TABLES `queue` WRITE;
/*!40000 ALTER TABLE `queue` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `queue` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `relations`
--

LOCK TABLES `relations` WRITE;
/*!40000 ALTER TABLE `relations` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `relations` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `revisions`
--

LOCK TABLES `revisions` WRITE;
/*!40000 ALTER TABLE `revisions` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `revisions` VALUES (1,2,1,1,''),(2,7,1,1,'');
/*!40000 ALTER TABLE `revisions` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `searchindex`
--

LOCK TABLES `searchindex` WRITE;
/*!40000 ALTER TABLE `searchindex` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `searchindex` VALUES (1,'email',0,1,' minh tri ha student howest be '),(1,'firstname',0,1,''),(1,'fullname',0,1,''),(1,'lastname',0,1,''),(1,'slug',0,1,''),(1,'username',0,1,' admin '),(2,'slug',0,1,' you mama '),(2,'title',0,1,' you mama '),(4,'slug',0,1,''),(5,'addressline1',0,1,' dam 2a '),(5,'addressline2',0,1,''),(5,'administrativearea',0,1,''),(5,'countrycode',0,1,' be '),(5,'dependentlocality',0,1,''),(5,'fullname',0,1,''),(5,'locality',0,1,' kortrijk '),(5,'organization',0,1,''),(5,'organizationtaxid',0,1,''),(5,'postalcode',0,1,' 8500 '),(5,'slug',0,1,''),(5,'sortingcode',0,1,''),(5,'title',0,1,' store '),(7,'slug',0,1,' senne boi '),(7,'title',0,1,' senne boi ');
/*!40000 ALTER TABLE `searchindex` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sections`
--

LOCK TABLES `sections` WRITE;
/*!40000 ALTER TABLE `sections` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `sections` VALUES (1,NULL,'designs','designs','channel',1,'all','end','[{\"label\":\"Primary entry page\",\"urlFormat\":\"{url}\",\"refresh\":\"1\"}]','2023-06-03 12:33:15','2023-06-03 12:33:15',NULL,'098bf40a-4116-4672-b3b5-303b57a938cd');
/*!40000 ALTER TABLE `sections` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sections_sites`
--

LOCK TABLES `sections_sites` WRITE;
/*!40000 ALTER TABLE `sections_sites` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `sections_sites` VALUES (1,1,1,1,'designs/{slug}','designs/_entry',1,'2023-06-03 12:33:15','2023-06-03 12:33:15','49156155-a161-4ff0-860e-123fee69756e');
/*!40000 ALTER TABLE `sections_sites` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sequences`
--

LOCK TABLES `sequences` WRITE;
/*!40000 ALTER TABLE `sequences` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `sequences` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `shunnedmessages`
--

LOCK TABLES `shunnedmessages` WRITE;
/*!40000 ALTER TABLE `shunnedmessages` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `shunnedmessages` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sitegroups`
--

LOCK TABLES `sitegroups` WRITE;
/*!40000 ALTER TABLE `sitegroups` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `sitegroups` VALUES (1,'kultureX','2023-06-01 17:57:06','2023-06-01 17:57:06',NULL,'3c3816f3-e10f-4183-beae-7ab3f1fbc5e6');
/*!40000 ALTER TABLE `sitegroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sites`
--

LOCK TABLES `sites` WRITE;
/*!40000 ALTER TABLE `sites` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `sites` VALUES (1,1,1,'true','kultureX','default','en-US',1,'$PRIMARY_SITE_URL',1,'2023-06-01 17:57:06','2023-06-01 17:57:06',NULL,'ca98a93c-411a-4bbc-9174-0e0b3a88fb5e');
/*!40000 ALTER TABLE `sites` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `stripe_customers`
--

LOCK TABLES `stripe_customers` WRITE;
/*!40000 ALTER TABLE `stripe_customers` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `stripe_customers` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `stripe_invoices`
--

LOCK TABLES `stripe_invoices` WRITE;
/*!40000 ALTER TABLE `stripe_invoices` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `stripe_invoices` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `stripe_paymentintents`
--

LOCK TABLES `stripe_paymentintents` WRITE;
/*!40000 ALTER TABLE `stripe_paymentintents` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `stripe_paymentintents` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `structureelements`
--

LOCK TABLES `structureelements` WRITE;
/*!40000 ALTER TABLE `structureelements` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `structureelements` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `structures`
--

LOCK TABLES `structures` WRITE;
/*!40000 ALTER TABLE `structures` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `structures` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `systemmessages`
--

LOCK TABLES `systemmessages` WRITE;
/*!40000 ALTER TABLE `systemmessages` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `systemmessages` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `taggroups`
--

LOCK TABLES `taggroups` WRITE;
/*!40000 ALTER TABLE `taggroups` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `taggroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `tokens`
--

LOCK TABLES `tokens` WRITE;
/*!40000 ALTER TABLE `tokens` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `tokens` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `usergroups`
--

LOCK TABLES `usergroups` WRITE;
/*!40000 ALTER TABLE `usergroups` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `usergroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `usergroups_users`
--

LOCK TABLES `usergroups_users` WRITE;
/*!40000 ALTER TABLE `usergroups_users` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `usergroups_users` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `userpermissions`
--

LOCK TABLES `userpermissions` WRITE;
/*!40000 ALTER TABLE `userpermissions` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `userpermissions` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `userpermissions_usergroups`
--

LOCK TABLES `userpermissions_usergroups` WRITE;
/*!40000 ALTER TABLE `userpermissions_usergroups` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `userpermissions_usergroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `userpermissions_users`
--

LOCK TABLES `userpermissions_users` WRITE;
/*!40000 ALTER TABLE `userpermissions_users` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `userpermissions_users` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `userpreferences`
--

LOCK TABLES `userpreferences` WRITE;
/*!40000 ALTER TABLE `userpreferences` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `userpreferences` VALUES (1,'{\"language\":\"en-US\"}');
/*!40000 ALTER TABLE `userpreferences` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `users` VALUES (1,NULL,1,0,0,0,1,'admin',NULL,NULL,NULL,'minh.tri.ha@student.howest.be','$2y$13$sk5QsMlGS0v18sPQmC8dc.dJmoVCA2fdq1qQ2DAol.J9Vd/4tZhlC','2023-06-06 09:20:35',NULL,NULL,NULL,'2023-06-04 21:49:05',NULL,1,NULL,NULL,NULL,0,'2023-06-01 17:57:07','2023-06-01 17:57:07','2023-06-06 09:20:35');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `volumefolders`
--

LOCK TABLES `volumefolders` WRITE;
/*!40000 ALTER TABLE `volumefolders` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `volumefolders` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `volumes`
--

LOCK TABLES `volumes` WRITE;
/*!40000 ALTER TABLE `volumes` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `volumes` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `widgets`
--

LOCK TABLES `widgets` WRITE;
/*!40000 ALTER TABLE `widgets` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `widgets` VALUES (1,1,'craft\\widgets\\RecentEntries',1,NULL,'{\"siteId\":1,\"section\":\"*\",\"limit\":10}',1,'2023-06-01 18:01:22','2023-06-01 18:01:22','0f3d6ca4-2239-45cd-9075-640434d37345'),(2,1,'craft\\widgets\\CraftSupport',2,NULL,'[]',1,'2023-06-01 18:01:22','2023-06-01 18:01:22','489d854d-375b-4965-93fc-33603628feee'),(3,1,'craft\\widgets\\Updates',3,NULL,'[]',1,'2023-06-01 18:01:22','2023-06-01 18:01:22','c3aaed26-b47b-40c3-8b38-e773b3c163e6'),(4,1,'craft\\widgets\\Feed',4,NULL,'{\"url\":\"https:\\/\\/craftcms.com\\/news.rss\",\"title\":\"Craft News\",\"limit\":5}',1,'2023-06-01 18:01:22','2023-06-01 18:01:22','38433a57-dc12-4d14-8476-d6f685b97a91');
/*!40000 ALTER TABLE `widgets` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping routines for database 'db'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-06-06  9:51:20
