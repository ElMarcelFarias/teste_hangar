-- --------------------------------------------------------
-- Servidor:                     localhost
-- Versão do servidor:           10.3.32-MariaDB-0ubuntu0.20.04.1 - Ubuntu 20.04
-- OS do Servidor:               debian-linux-gnu
-- HeidiSQL Versão:              11.1.0.6116
-- --------------------------------------------------------
create database testehangar;
use testehangar;

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Copiando estrutura para tabela teste.orders
CREATE TABLE IF NOT EXISTS `orders` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_user_id` int(11) DEFAULT NULL,
  `order_total` int(11) DEFAULT NULL,
  `order_date` datetime DEFAULT NULL,
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela teste.orders: ~5 rows (aproximadamente)
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` (`order_id`, `order_user_id`, `order_total`, `order_date`) VALUES
	(1, 2, 2000, '2021-01-05 10:34:25'),
	(2, 4, 8000, '2021-01-06 04:42:36'),
	(5, 5, 5000, '2021-01-06 23:57:21'),
	(6, 1, 2000, '2021-01-09 12:17:03'),
	(7, 5, 10000, '2021-02-01 14:04:00');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;

-- Copiando estrutura para tabela teste.user
CREATE TABLE IF NOT EXISTS `user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(50) DEFAULT NULL,
  `user_address` varchar(50) DEFAULT NULL,
  `user_city` varchar(50) DEFAULT NULL,
  `user_country` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela teste.user: ~5 rows (aproximadamente)
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` (`user_id`, `user_name`, `user_address`, `user_city`, `user_country`) VALUES
	(1, 'Sheldon Cooper', 'Street 101, APT 4A', 'Pasadena', 'USA'),
	(2, 'Leonard Hofstadter', 'Street 101, APT 4A', 'Pasadena', 'USA'),
	(3, 'Penny', 'Street 101, APT A3', 'Pasadena', 'USA'),
	(4, 'Howard Wolowitz', 'Street 256', 'Toronto', 'USA'),
	(5, 'Rajesh Koothrappali', 'Av. Gandhi, 542', 'Mumbai', 'India');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;


update `user`
set user_country = "Canada"
where user_id = 4;

select
	u.`user_country`,
    SUM(`order_total`) as total,
    o.`order_date`
from
	`user` u 
inner join `orders` o on
(u.`user_id` = o.`order_user_id`)
group by `user_country`,
		year(`order_date`),
        month(`order_date`);

/*Fiz um código que somasse as order_total da tabela orders pelos paises da tabela user nomeando para total*/




    



