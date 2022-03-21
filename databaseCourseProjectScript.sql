-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema database_course_project
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema database_course_project
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `database_course_project` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `database_course_project` ;

-- -----------------------------------------------------
-- Table `database_course_project`.`Vendors`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `database_course_project`.`Vendors` (
  `id` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `desc` VARCHAR(45) NULL,
  `phone_number` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `database_course_project`.`Products`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `database_course_project`.`Products` (
  `id` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `price` DOUBLE NOT NULL,
  `quantity` INT NOT NULL,
  `is_allergen` TINYINT NOT NULL,
  `Vendors_id` INT NOT NULL,
  PRIMARY KEY (`id`, `Vendors_id`),
  INDEX `fk_Products_Vendors1_idx` (`Vendors_id` ASC) VISIBLE,
  CONSTRAINT `fk_Products_Vendors1`
    FOREIGN KEY (`Vendors_id`)
    REFERENCES `database_course_project`.`Vendors` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `database_course_project`.`Invoices`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `database_course_project`.`Invoices` (
  `id` INT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `database_course_project`.`Employees`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `database_course_project`.`Employees` (
  `id` INT NOT NULL,
  `first_name` VARCHAR(45) NOT NULL,
  `last_name` VARCHAR(45) NOT NULL,
  `shirt_size` INT NULL,
  `pants_size` INT NULL,
  `shoe_size` DOUBLE NULL,
  `is_full_time` TINYINT NOT NULL,
  `is_adult` TINYINT NOT NULL,
  `birthdate` DATE NOT NULL,
  `hiredate` DATE NOT NULL,
  `is_manager` TINYINT NOT NULL,
  `salary` DOUBLE NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `database_course_project`.`Vendor_Invoices`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `database_course_project`.`Vendor_Invoices` (
  `id` INT NOT NULL,
  `date` DATE NOT NULL,
  `total_price` DOUBLE NOT NULL,
  `Vendors_id` INT NOT NULL,
  `Invoices_id` INT NOT NULL,
  PRIMARY KEY (`id`, `Vendors_id`, `Invoices_id`),
  INDEX `fk_Vendor_Invoices_Vendors1_idx` (`Vendors_id` ASC) VISIBLE,
  INDEX `fk_Vendor_Invoices_Invoices1_idx` (`Invoices_id` ASC) VISIBLE,
  CONSTRAINT `fk_Vendor_Invoices_Vendors1`
    FOREIGN KEY (`Vendors_id`)
    REFERENCES `database_course_project`.`Vendors` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Vendor_Invoices_Invoices1`
    FOREIGN KEY (`Invoices_id`)
    REFERENCES `database_course_project`.`Invoices` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `database_course_project`.`Food_Items`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `database_course_project`.`Food_Items` (
  `id` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `desc` VARCHAR(45) NULL,
  `price` DOUBLE NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `database_course_project`.`Contractors`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `database_course_project`.`Contractors` (
  `id` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `desc` VARCHAR(45) NULL,
  `phone_number` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `database_course_project`.`Contractor_Invoices`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `database_course_project`.`Contractor_Invoices` (
  `id` INT NOT NULL,
  `date` DATE NOT NULL,
  `total_price` DOUBLE NOT NULL,
  `Contractors_id` INT NOT NULL,
  `Invoices_id` INT NOT NULL,
  PRIMARY KEY (`id`, `Contractors_id`, `Invoices_id`),
  INDEX `fk_Contractor_Invoices_Contractors_idx` (`Contractors_id` ASC) VISIBLE,
  INDEX `fk_Contractor_Invoices_Invoices1_idx` (`Invoices_id` ASC) VISIBLE,
  CONSTRAINT `fk_Contractor_Invoices_Contractors`
    FOREIGN KEY (`Contractors_id`)
    REFERENCES `database_course_project`.`Contractors` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Contractor_Invoices_Invoices1`
    FOREIGN KEY (`Invoices_id`)
    REFERENCES `database_course_project`.`Invoices` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `database_course_project`.`Features`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `database_course_project`.`Features` (
  `id` INT NOT NULL,
  `day_of_the_week` VARCHAR(45) NOT NULL,
  `Food_Items_id` INT NOT NULL,
  PRIMARY KEY (`id`, `Food_Items_id`),
  INDEX `fk_Features_Food_Items1_idx` (`Food_Items_id` ASC) VISIBLE,
  CONSTRAINT `fk_Features_Food_Items1`
    FOREIGN KEY (`Food_Items_id`)
    REFERENCES `database_course_project`.`Food_Items` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `database_course_project`.`Customers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `database_course_project`.`Customers` (
  `id` INT NOT NULL,
  `first_name` VARCHAR(45) NOT NULL,
  `last_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `database_course_project`.`Lines`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `database_course_project`.`Lines` (
  `id` INT NOT NULL,
  `quantity` INT NOT NULL,
  `Invoices_id` INT NOT NULL,
  `Products_id` INT NOT NULL,
  PRIMARY KEY (`id`, `Invoices_id`, `Products_id`),
  INDEX `fk_Lines_Invoices1_idx` (`Invoices_id` ASC) VISIBLE,
  INDEX `fk_Lines_Products1_idx` (`Products_id` ASC) VISIBLE,
  CONSTRAINT `fk_Lines_Invoices1`
    FOREIGN KEY (`Invoices_id`)
    REFERENCES `database_course_project`.`Invoices` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Lines_Products1`
    FOREIGN KEY (`Products_id`)
    REFERENCES `database_course_project`.`Products` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `database_course_project`.`Products_has_Food_Items`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `database_course_project`.`Products_has_Food_Items` (
  `Products_id` INT NOT NULL,
  `Products_Vendors_id` INT NOT NULL,
  `Food_Items_id` INT NOT NULL,
  PRIMARY KEY (`Products_id`, `Products_Vendors_id`, `Food_Items_id`),
  INDEX `fk_Products_has_Food_Items_Food_Items1_idx` (`Food_Items_id` ASC) VISIBLE,
  INDEX `fk_Products_has_Food_Items_Products1_idx` (`Products_id` ASC, `Products_Vendors_id` ASC) VISIBLE,
  CONSTRAINT `fk_Products_has_Food_Items_Products1`
    FOREIGN KEY (`Products_id` , `Products_Vendors_id`)
    REFERENCES `database_course_project`.`Products` (`id` , `Vendors_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Products_has_Food_Items_Food_Items1`
    FOREIGN KEY (`Food_Items_id`)
    REFERENCES `database_course_project`.`Food_Items` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
