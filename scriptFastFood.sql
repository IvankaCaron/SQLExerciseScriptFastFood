CREATE TABLE `restaurant` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`name` varchar(255) NOT NULL,
	`adresse` varchar(255) NOT NULL,
	`pays` varchar(255) NOT NULL,
	`capacite` INT NOT NULL,
	`espace_enfant` BOOLEAN NOT NULL,
	`bornes_service_rapide` BOOLEAN NOT NULL,
	`accessible_mobil_reduite` BOOLEAN NOT NULL,
	`parking` BOOLEAN NOT NULL,
	`code_postal` varchar(10) NOT NULL,
	`carte_id` INT NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `employes_et_manager` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`nom` varchar(255) NOT NULL,
	`id_fonction` int NOT NULL,
	`experience_en_annees` INT NOT NULL,
	`num_compte` INT NOT NULL,
	`adresse` varchar(255) NOT NULL,
	`salaire` INT NOT NULL,
	`note` INT NOT NULL,
	`id_restaurant` INT NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `carte` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`id_pays` INT NOT NULL,
	`id_boisson` INT NOT NULL,
	`id_plat` INT NOT NULL,
	`id_dessert` INT NOT NULL,
	`id_menu` INT NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `boisson` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`prix` FLOAT NOT NULL,
	`nom` varchar(255) NOT NULL,
	`taille` FLOAT NOT NULL,
	`quantite` FLOAT NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `plat` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`nom` varchar(255) NOT NULL,
	`prix_item` FLOAT NOT NULL,
	`id_ingredients` int NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `dessert` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`nom` varchar(255) NOT NULL,
	`prix_item` FLOAT NOT NULL,
	`id_ingredients` int NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `ingredients` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`nom` varchar(255) NOT NULL,
	`prix` FLOAT NOT NULL,
	`quantite` FLOAT NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `menu` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`prix` FLOAT NOT NULL,
	`nom` varchar(255) NOT NULL,
	`id_plat` int NOT NULL,
	`id_boisson` int NOT NULL,
	`id_dessert` int NOT NULL,
	`reduction` FLOAT NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `ticket` (
	`id` INT NOT NULL,
	`heure` DATETIME NOT NULL,
	`id_vendeur` INT NOT NULL,
	`id_restaurant_ticket` INT NOT NULL,
	`type_paiement` FLOAT NOT NULL,
	`somme` FLOAT NOT NULL,
	`id_items_vente` INT NOT NULL
);

CREATE TABLE `items_vente` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`id_boisson` INT NOT NULL,
	`id_plat` INT NOT NULL,
	`id_menu` INT NOT NULL,
	`id_dessert` INT NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `fonction` (
	`id` int NOT NULL AUTO_INCREMENT,
	`name` varchar(255) NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `salaire` (
	`id` int NOT NULL AUTO_INCREMENT,
	`date` DATE NOT NULL,
	`salaire` FLOAT NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `pays` (
	`id` int NOT NULL AUTO_INCREMENT,
	`name` varchar NOT NULL,
	PRIMARY KEY (`id`)
);

ALTER TABLE `restaurant` ADD CONSTRAINT `restaurant_fk0` FOREIGN KEY (`carte_id`) REFERENCES `carte`(`id`);

ALTER TABLE `employes_et_manager` ADD CONSTRAINT `employes_et_manager_fk0` FOREIGN KEY (`id_fonction`) REFERENCES `fonction`(`id`);

ALTER TABLE `employes_et_manager` ADD CONSTRAINT `employes_et_manager_fk1` FOREIGN KEY (`id_restaurant`) REFERENCES `restaurant`(`id`);

ALTER TABLE `employes_et_manager` ADD CONSTRAINT `employes_et_manager_fk2` FOREIGN KEY (`id_salaire`) REFERENCES `salaire`(`id`);

ALTER TABLE `carte` ADD CONSTRAINT `carte_fk0` FOREIGN KEY (`id_boisson`) REFERENCES `boisson`(`id`);

ALTER TABLE `carte` ADD CONSTRAINT `carte_fk1` FOREIGN KEY (`id_plat`) REFERENCES `plat`(`id`);

ALTER TABLE `carte` ADD CONSTRAINT `carte_fk2` FOREIGN KEY (`id_dessert`) REFERENCES `dessert`(`id`);

ALTER TABLE `carte` ADD CONSTRAINT `carte_fk3` FOREIGN KEY (`id_menu`) REFERENCES `menu`(`id`);


ALTER TABLE `carte` ADD CONSTRAINT `carte_fk4` FOREIGN KEY (`id_pays`) REFERENCES `pays`(`id`);


ALTER TABLE `plat` ADD CONSTRAINT `plat_fk0` FOREIGN KEY (`id_ingredients`) REFERENCES `ingredients`(`id`);

ALTER TABLE `dessert` ADD CONSTRAINT `dessert_fk0` FOREIGN KEY (`id_ingredients`) REFERENCES `ingredients`(`id`);

ALTER TABLE `menu` ADD CONSTRAINT `menu_fk0` FOREIGN KEY (`id_plat`) REFERENCES `plat`(`id`);

ALTER TABLE `menu` ADD CONSTRAINT `menu_fk1` FOREIGN KEY (`id_boisson`) REFERENCES `boisson`(`id`);

ALTER TABLE `menu` ADD CONSTRAINT `menu_fk2` FOREIGN KEY (`id_dessert`) REFERENCES `dessert`(`id`);

ALTER TABLE `ticket` ADD CONSTRAINT `ticket_fk0` FOREIGN KEY (`id_vendeur`) REFERENCES `employes_et_manager`(`id`);

ALTER TABLE `ticket` ADD CONSTRAINT `ticket_fk1` FOREIGN KEY (`id_restaurant_ticket`) REFERENCES `restaurant`(`id`);

ALTER TABLE `ticket` ADD CONSTRAINT `ticket_fk2` FOREIGN KEY (`id_items_vente`) REFERENCES `items_vente`(`id`);

ALTER TABLE `items_vente` ADD CONSTRAINT `items_vente_fk0` FOREIGN KEY (`id_boisson`) REFERENCES `boisson`(`id`);

ALTER TABLE `items_vente` ADD CONSTRAINT `items_vente_fk1` FOREIGN KEY (`id_plat`) REFERENCES `plat`(`id`);

ALTER TABLE `items_vente` ADD CONSTRAINT `items_vente_fk2` FOREIGN KEY (`id_menu`) REFERENCES `menu`(`id`);

ALTER TABLE `items_vente` ADD CONSTRAINT `items_vente_fk3` FOREIGN KEY (`id_dessert`) REFERENCES `dessert`(`id`);