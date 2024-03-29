-- MySQL Script generated by MySQL Workbench
-- Mon Mar  4 20:02:26 2024
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Pizzeria
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Pizzeria
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Pizzeria` DEFAULT CHARACTER SET utf8 ;
USE `Pizzeria` ;

-- -----------------------------------------------------
-- Table `Pizzeria`.`Provincia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Pizzeria`.`Provincia` (
  `id_provincia` INT NOT NULL AUTO_INCREMENT,
  `nombre_provincia` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_provincia`),
  UNIQUE INDEX `nombre_provincia_UNIQUE` (`nombre_provincia` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Pizzeria`.`Localidad`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Pizzeria`.`Localidad` (
  `id_localidad` INT NOT NULL AUTO_INCREMENT,
  `nombre_localidad` VARCHAR(45) NOT NULL,
  `provincia_id` INT NOT NULL,
  PRIMARY KEY (`id_localidad`),
  UNIQUE INDEX `nombre_localidad_UNIQUE` (`nombre_localidad` ASC) VISIBLE,
  INDEX `provincia_idx` (`provincia_id` ASC) VISIBLE,
  CONSTRAINT `provincia`
    FOREIGN KEY (`provincia_id`)
    REFERENCES `Pizzeria`.`Provincia` (`id_provincia`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Pizzeria`.`Cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Pizzeria`.`Cliente` (
  `id_cliente` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `apellidos` VARCHAR(45) NULL,
  `direccion` VARCHAR(45) NOT NULL,
  `localidad_id` INT NOT NULL,
  `provincia_id` INT NOT NULL,
  `num_telefono` VARCHAR(45) NULL,
  PRIMARY KEY (`id_cliente`),
  INDEX `localidad_idx` (`localidad_id` ASC) VISIBLE,
  INDEX `provincia_idx` (`provincia_id` ASC) VISIBLE,
  CONSTRAINT `localidad`
    FOREIGN KEY (`localidad_id`)
    REFERENCES `Pizzeria`.`Localidad` (`id_localidad`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT,
  CONSTRAINT `provincia`
    FOREIGN KEY (`provincia_id`)
    REFERENCES `Pizzeria`.`Provincia` (`id_provincia`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Pizzeria`.`Tienda`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Pizzeria`.`Tienda` (
  `id_tienda` INT NOT NULL AUTO_INCREMENT,
  `direccion` VARCHAR(45) NOT NULL,
  `codigo_postal` SMALLINT(10) NOT NULL,
  `localidad_id` INT NOT NULL,
  `provincia_id` INT NOT NULL,
  `pedido_id` INT NOT NULL,
  PRIMARY KEY (`id_tienda`),
  INDEX `localidad_idx` (`localidad_id` ASC) VISIBLE,
  INDEX `provincia_idx` (`provincia_id` ASC) VISIBLE,
  CONSTRAINT `localidad`
    FOREIGN KEY (`localidad_id`)
    REFERENCES `Pizzeria`.`Localidad` (`id_localidad`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT,
  CONSTRAINT `provincia`
    FOREIGN KEY (`provincia_id`)
    REFERENCES `Pizzeria`.`Provincia` (`id_provincia`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Pizzeria`.`Reparto_Domicilio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Pizzeria`.`Reparto_Domicilio` (
  `id_reparto` INT NOT NULL AUTO_INCREMENT,
  `repartidor_id` INT NOT NULL,
  `fecha_entrega` DATETIME NOT NULL,
  PRIMARY KEY (`id_reparto`),
  UNIQUE INDEX `repartidor_id_UNIQUE` (`repartidor_id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Pizzeria`.`Pedido`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Pizzeria`.`Pedido` (
  `id_pedido` INT NOT NULL AUTO_INCREMENT,
  `cliente_id` INT NOT NULL,
  `hora_pedido` DATETIME NOT NULL,
  `tipo_reparto_id` INT NOT NULL,
  `cantidad_productos_id` INT NOT NULL,
  `precio` DECIMAL(5,5) NOT NULL,
  `tienda_id` INT NOT NULL,
  PRIMARY KEY (`id_pedido`),
  INDEX `pedidos_idx` (`cliente_id` ASC) VISIBLE,
  INDEX `pedido_tienda_idx` (`tienda_id` ASC) VISIBLE,
  INDEX `tipoReparto_idx` (`tipo_reparto_id` ASC) VISIBLE,
  CONSTRAINT `pedidos`
    FOREIGN KEY (`cliente_id`)
    REFERENCES `Pizzeria`.`Cliente` (`id_cliente`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT,
  CONSTRAINT `pedido_tienda`
    FOREIGN KEY (`tienda_id`)
    REFERENCES `Pizzeria`.`Tienda` (`id_tienda`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT,
  CONSTRAINT `tipoReparto`
    FOREIGN KEY (`tipo_reparto_id`)
    REFERENCES `Pizzeria`.`Reparto_Domicilio` (`id_reparto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Pizzeria`.`Pedidos_producto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Pizzeria`.`Pedidos_producto` (
  `id_pedidos_producto` INT NOT NULL AUTO_INCREMENT,
  `pedido_id` INT NOT NULL,
  `producto_id` INT NOT NULL,
  `cantidad_producto` INT NOT NULL,
  PRIMARY KEY (`id_pedidos_producto`),
  INDEX `pedido_idx` (`pedido_id` ASC) VISIBLE,
  UNIQUE INDEX `producto_id_UNIQUE` (`producto_id` ASC) VISIBLE,
  CONSTRAINT `pedido`
    FOREIGN KEY (`pedido_id`)
    REFERENCES `Pizzeria`.`Pedido` (`id_pedido`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Pizzeria`.`Productos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Pizzeria`.`Productos` (
  `producto_id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `descripcion` VARCHAR(200) NULL,
  `imagen` VARCHAR(200) NULL,
  `precio` DECIMAL(6,5) NOT NULL,
  `tipo_producto` ENUM("Hamburguesa", "Pizza", "Bebida") NOT NULL,
  `categoria_id` INT NOT NULL,
  PRIMARY KEY (`producto_id`),
  UNIQUE INDEX `categoria_id_UNIQUE` (`categoria_id` ASC) VISIBLE,
  CONSTRAINT `pedido_produ`
    FOREIGN KEY (`producto_id`)
    REFERENCES `Pizzeria`.`Pedidos_producto` (`producto_id`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Pizzeria`.`Empleados`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Pizzeria`.`Empleados` (
  `id_empleados` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `apellidos` VARCHAR(45) NULL,
  `NIF` VARCHAR(45) NOT NULL,
  `telefono` VARCHAR(45) NOT NULL,
  `tipo_empleado` ENUM("Cocinero", "Repartidor") NULL,
  PRIMARY KEY (`id_empleados`),
  UNIQUE INDEX `NIF_UNIQUE` (`NIF` ASC) VISIBLE,
  CONSTRAINT `empleados`
    FOREIGN KEY (`id_empleados`)
    REFERENCES `Pizzeria`.`Reparto_Domicilio` (`repartidor_id`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Pizzeria`.`Categoria_pizza`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Pizzeria`.`Categoria_pizza` (
  `id_categoria` INT NOT NULL AUTO_INCREMENT,
  `nombre_categoria` VARCHAR(45) NULL,
  PRIMARY KEY (`id_categoria`),
  CONSTRAINT `produc`
    FOREIGN KEY (`id_categoria`)
    REFERENCES `Pizzeria`.`Productos` (`categoria_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
