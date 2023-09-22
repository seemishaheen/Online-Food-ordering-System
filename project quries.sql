create database MalikRestaurant;
CREATE TABLE `restaurant`.`user` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `firstName` VARCHAR(50) NULL DEFAULT NULL,
  `middleName` VARCHAR(50) NULL DEFAULT NULL,
  `lastName` VARCHAR(50) NULL DEFAULT NULL,
  `mobile` VARCHAR(15) NULL,
  `email` VARCHAR(50) NULL,
  `passwordHash` VARCHAR(32) NOT NULL,
  `admin` NOT NULL DEFAULT 0,
  `vendor`NOT NULL DEFAULT 0,
  `chef` NOT NULL DEFAULT 0,
  `agent` NOT NULL DEFAULT 0,
  `registeredAt` DATETIME NOT NULL,
  `lastLogin` DATETIME NULL DEFAULT NULL,
  `intro` TINYTEXT NULL DEFAULT NULL,
  `profile` TEXT NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `uq_mobile` (`mobile` ASC),
  UNIQUE INDEX `uq_email` (`email` ASC) );
  CREATE TABLE `restaurant`.`ingredient` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `userId` BIGINT NOT NULL,
  `vendorId` BIGINT DEFAULT NULL,
  `title` VARCHAR(75) NOT NULL,
  `slug` VARCHAR(100) NOT NULL,
  `summary` NULL,
  `type`  NOT NULL DEFAULT 0,
  `sku` VARCHAR(100) NOT NULL,
  `quantity` FLOAT NOT NULL DEFAULT 0,
  `unit` SMALLINT(6) NOT NULL DEFAULT 0,
  `createdAt` NOT NULL,
  `updatedAt` NULL DEFAULT NULL,
  `content` TEXT NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `uq_slug` (`slug` ASC),
  INDEX `idx_ingredient_user` (`User ID` ASC),
  CONSTRAINT `ingredient_user`
    FOREIGN KEY (`userId`)
    REFERENCES `restaurant`.`user` (`id`)
    ON DELETE RESTRICT
    ON UPDATE NO ACTION);

ALTER TABLE `restaurant`.`ingredient`
ADD INDEX `idx_ingredient_vendor` (`vendorId` ASC);
ALTER TABLE `restaurant`.`ingredient` 
ADD CONSTRAINT `fk_ingredient_vendor`
  FOREIGN KEY (`vendorId`)
  REFERENCES `restaurant`.`user` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;
  CREATE TABLE `restaurant`.`item` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `userId` BIGINT NOT NULL,
  `vendorId` BIGINT DEFAULT NULL,
  `title` VARCHAR(75) NOT NULL,
  `slug` VARCHAR(100) NOT NULL,
  `summary` TINYTEXT NULL,
  `type` SMALLINT(6) NOT NULL DEFAULT 0,
  `cooking` TINYINT(1) NOT NULL DEFAULT 0,
  `sku` VARCHAR(100) NOT NULL,
  `price` FLOAT NOT NULL DEFAULT 0,
  `quantity` FLOAT NOT NULL DEFAULT 0,
  `unit` SMALLINT(6) NOT NULL DEFAULT 0,
  `recipe` TEXT NULL DEFAULT NULL,
  `instructions` TEXT NULL DEFAULT NULL,
  `createdAt` DATETIME NOT NULL,
  `updatedAt` DATETIME NULL DEFAULT NULL,
  `content` TEXT NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `uq_slug` (`slug` ASC),
  INDEX `idx_item_user` (`userId` ASC),
  CONSTRAINT `fk_item_user`
    FOREIGN KEY (`userId`)
    REFERENCES `restaurant`.`user` (`id`)
    ON DELETE RESTRICT
    ON UPDATE NO ACTION);

ALTER TABLE `restaurant`.`item`
ADD INDEX `idx_item_vendor` (`vendorId` ASC);
ALTER TABLE `restaurant`.`item` 
ADD CONSTRAINT `fk_item_vendor`
  FOREIGN KEY (`vendorId`)
  REFERENCES `restaurant`.`user` (`id`);
