-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema LittleLemonDB
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `LittleLemonDB` ;

-- -----------------------------------------------------
-- Schema LittleLemonDB
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `LittleLemonDB` ;
USE `LittleLemonDB` ;

-- -----------------------------------------------------
-- Table `LittleLemonDB`.`Customers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`Customers` (
  `CustomerID` INT NOT NULL,
  `FullName` VARCHAR(255) NOT NULL,
  `ContactNumber` VARCHAR(50) NOT NULL,
  `Email` VARCHAR(105) NOT NULL,
  PRIMARY KEY (`CustomerID`),
  UNIQUE INDEX `Email_UNIQUE` (`Email` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`Bookings`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`Bookings` (
  `BookingID` INT NOT NULL,
  `CustomerID` INT NOT NULL,
  `BookingDate` DATE NOT NULL,
  PRIMARY KEY (`BookingID`, `CustomerID`),
  INDEX `fk_customer_id_idx` (`CustomerID` ASC) VISIBLE,
  CONSTRAINT `fk_customer_id`
    FOREIGN KEY (`CustomerID`)
    REFERENCES `LittleLemonDB`.`Customers` (`CustomerID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`MenuItems`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`MenuItems` (
  `MenuItemsID` INT NOT NULL,
  `CourseName` VARCHAR(100) NOT NULL,
  `StarterName` VARCHAR(100) NOT NULL,
  `DesertName` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`MenuItemsID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`Menus`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`Menus` (
  `MenuID` INT NOT NULL,
  `MenuItemsID` INT NOT NULL,
  `MenuName` VARCHAR(105) NOT NULL,
  `Cuisine` VARCHAR(105) NOT NULL,
  PRIMARY KEY (`MenuID`, `MenuItemsID`),
  INDEX `fk_menu_items_id_idx` (`MenuItemsID` ASC) VISIBLE,
  CONSTRAINT `fk_menu_items_id`
    FOREIGN KEY (`MenuItemsID`)
    REFERENCES `LittleLemonDB`.`MenuItems` (`MenuItemsID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`Orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`Orders` (
  `OrderID` INT NOT NULL,
  `CustomerID` INT NOT NULL,
  `MenuID` INT NOT NULL,
  `Quantity` INT NOT NULL,
  `TotalCost` INT NOT NULL,
  PRIMARY KEY (`OrderID`, `CustomerID`, `MenuID`),
  INDEX `fk_menu_id_idx` (`MenuID` ASC) VISIBLE,
  INDEX `fk_customer_id_idx` (`CustomerID` ASC) VISIBLE,
  CONSTRAINT `fk_ord_menu_id`
    FOREIGN KEY (`MenuID`)
    REFERENCES `LittleLemonDB`.`Menus` (`MenuID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_ord_customer_id`
    FOREIGN KEY (`CustomerID`)
    REFERENCES `LittleLemonDB`.`Customers` (`CustomerID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
