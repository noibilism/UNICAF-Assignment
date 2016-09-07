-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema user_app
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema user_app
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `user_app` DEFAULT CHARACTER SET latin1 ;
USE `user_app` ;

-- -----------------------------------------------------
-- Table `user_app`.`configurations`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `user_app`.`configurations` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  `value` TEXT NULL DEFAULT NULL,
  `description` TEXT NULL DEFAULT NULL,
  `type` VARCHAR(50) NOT NULL,
  `editable` TINYINT(1) NOT NULL DEFAULT '1',
  `weight` INT(11) NULL DEFAULT '0',
  `autoload` TINYINT(1) NULL DEFAULT '1',
  `created` DATETIME NULL DEFAULT NULL,
  `modified` DATETIME NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 57
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `user_app`.`email_queue`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `user_app`.`email_queue` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `from_email` VARCHAR(255) NULL DEFAULT NULL,
  `from_name` VARCHAR(255) NULL DEFAULT NULL,
  `email_to` TEXT NOT NULL,
  `email_cc` TEXT NULL DEFAULT NULL,
  `email_bcc` TEXT NULL DEFAULT NULL,
  `email_reply_to` VARCHAR(255) NULL DEFAULT NULL,
  `subject` VARCHAR(255) NOT NULL,
  `config` VARCHAR(30) NOT NULL DEFAULT 'default',
  `template` VARCHAR(50) NOT NULL,
  `layout` VARCHAR(50) NOT NULL DEFAULT 'default',
  `theme` VARCHAR(50) NULL DEFAULT NULL,
  `format` VARCHAR(5) NOT NULL DEFAULT 'html',
  `template_vars` TEXT NULL DEFAULT NULL,
  `headers` TEXT NULL DEFAULT NULL,
  `sent` TINYINT(1) NULL DEFAULT '0',
  `locked` TINYINT(1) NULL DEFAULT '0',
  `send_tries` INT(2) NULL DEFAULT '0',
  `send_at` DATETIME NOT NULL,
  `created` DATETIME NULL DEFAULT NULL,
  `modified` DATETIME NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `user_app`.`phinxlog`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `user_app`.`phinxlog` (
  `version` BIGINT(20) NOT NULL,
  `migration_name` VARCHAR(100) NULL DEFAULT NULL,
  `start_time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `end_time` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`version`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `user_app`.`roles`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `user_app`.`roles` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `alias` VARCHAR(45) NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `description` VARCHAR(200) NULL DEFAULT NULL,
  `created` DATETIME NULL DEFAULT NULL,
  `modified` DATETIME NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `alias` (`alias` ASC))
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `user_app`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `user_app`.`users` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `role_id` INT(11) NOT NULL,
  `email` VARCHAR(100) NOT NULL,
  `full_name` VARCHAR(200) NOT NULL,
  `phone` VARCHAR(225) NOT NULL,
  `birthday` DATE NOT NULL,
  `password` VARCHAR(200) NOT NULL,
  `status` TINYINT(1) NOT NULL DEFAULT '0',
  `created` DATETIME NULL DEFAULT NULL,
  `modified` DATETIME NULL DEFAULT NULL,
  `token_created` DATETIME NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `email` (`email` ASC),
  INDEX `role_id` (`role_id` ASC),
  CONSTRAINT `users_ibfk_1`
    FOREIGN KEY (`role_id`)
    REFERENCES `user_app`.`roles` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
