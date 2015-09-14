-- MySQL Script generated by MySQL Workbench
-- 09/13/15 16:37:01
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Table `mommy`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mommy` ;

CREATE TABLE IF NOT EXISTS `mommy` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `nome` VARCHAR(150) NOT NULL COMMENT '',
  `login` VARCHAR(75) NOT NULL COMMENT '',
  `pass` VARCHAR(256) NOT NULL COMMENT '',
  `avatar` VARCHAR(150) NULL COMMENT '',
  `email` VARCHAR(150) NOT NULL COMMENT '',
  `cadastro` DATETIME NULL COMMENT '',
  PRIMARY KEY (`id`)  COMMENT '')
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `amizade`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `amizade` ;

CREATE TABLE IF NOT EXISTS `amizade` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `data` DATETIME NOT NULL COMMENT '',
  `id_mommy` INT NOT NULL COMMENT '',
  `id_amiga` INT NOT NULL COMMENT '',
  PRIMARY KEY (`id`)  COMMENT '',
  INDEX `fk_amizade_mommy1_idx` (`id_mommy` ASC)  COMMENT '',
  INDEX `fk_amizade_mommy2_idx` (`id_amiga` ASC)  COMMENT '',
  CONSTRAINT `fk_amizade_mommy1`
    FOREIGN KEY (`id_mommy`)
    REFERENCES `mommy` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_amizade_mommy2`
    FOREIGN KEY (`id_amiga`)
    REFERENCES `mommy` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `conversa`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `conversa` ;

CREATE TABLE IF NOT EXISTS `conversa` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `mensagem` VARCHAR(255) NOT NULL COMMENT '',
  `data` DATETIME NOT NULL COMMENT '',
  `visualizacao` DATETIME NULL COMMENT '',
  `id_mommy_from` INT NOT NULL COMMENT '',
  `id_momy_to` INT NOT NULL COMMENT '',
  PRIMARY KEY (`id`)  COMMENT '',
  INDEX `fk_conversa_mommy1_idx` (`id_mommy_from` ASC)  COMMENT '',
  INDEX `fk_conversa_mommy2_idx` (`id_momy_to` ASC)  COMMENT '',
  CONSTRAINT `fk_conversa_mommy1`
    FOREIGN KEY (`id_mommy_from`)
    REFERENCES `mommy` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_conversa_mommy2`
    FOREIGN KEY (`id_momy_to`)
    REFERENCES `mommy` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `localizacao`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `localizacao` ;

CREATE TABLE IF NOT EXISTS `localizacao` (
  `id` INT NOT NULL COMMENT '',
  `lat` DOUBLE(15,8) NOT NULL COMMENT '',
  `lon` DOUBLE(15,8) NOT NULL COMMENT '',
  `data` DATETIME NOT NULL COMMENT '',
  `publico` VARCHAR(1) NOT NULL COMMENT '',
  `id_mommy` INT NOT NULL COMMENT '',
  PRIMARY KEY (`id`)  COMMENT '',
  INDEX `fk_localizacao_mommy1_idx` (`id_mommy` ASC)  COMMENT '',
  CONSTRAINT `fk_localizacao_mommy1`
    FOREIGN KEY (`id_mommy`)
    REFERENCES `mommy` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `historico_localizacao`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `historico_localizacao` ;

CREATE TABLE IF NOT EXISTS `historico_localizacao` (
  `id` INT NOT NULL COMMENT '',
  `lat` DOUBLE(15,8) NOT NULL COMMENT '',
  `lon` DOUBLE(15,8) NOT NULL COMMENT '',
  `data` DATETIME NOT NULL COMMENT '',
  `publico` VARCHAR(1) NOT NULL COMMENT '',
  `id_mommy` INT NOT NULL COMMENT '',
  PRIMARY KEY (`id`)  COMMENT '',
  INDEX `fk_historico_localizacao_mommy1_idx` (`id_mommy` ASC)  COMMENT '',
  CONSTRAINT `fk_historico_localizacao_mommy1`
    FOREIGN KEY (`id_mommy`)
    REFERENCES `mommy` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
