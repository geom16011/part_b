
-- Thu Dec  3 23:05:50 2020
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

-- -----------------------------------------------------
-- Schema private_school
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema private_school
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `private_school` DEFAULT CHARACTER SET utf8 ;
USE `private_school` ;

-- -----------------------------------------------------
-- Table `private_school`.`Course`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `private_school`.`Course` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(45) NOT NULL,
  `stream` VARCHAR(45) NOT NULL,
  `type` VARCHAR(45) NOT NULL,
  `start_date` DATE NOT NULL,
  `end_date` DATE NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `private_school`.`Assignemnt`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `private_school`.`Assignemnt` (
  `assignment_id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(45) NOT NULL,
  `SubDateTime` DATE NOT NULL,
  `oralMark` DOUBLE NOT NULL,
  `totalMark` DOUBLE NOT NULL,
  PRIMARY KEY (`assignment_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `private_school`.`Student`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `private_school`.`Student` (
  `student_id` INT NOT NULL AUTO_INCREMENT,
  `firstName` VARCHAR(45) NOT NULL,
  `lastName` VARCHAR(45) NOT NULL,
  `dateofBirth` DATE NOT NULL,
  `tutitionFees` DOUBLE NOT NULL,
  PRIMARY KEY (`student_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `private_school`.`Trainer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `private_school`.`Trainer` (
  `trainer_id` INT NOT NULL AUTO_INCREMENT,
  `firstName` VARCHAR(45) NOT NULL,
  `LastName` VARCHAR(45) NOT NULL,
  `Subject` VARCHAR(45) NOT NULL,
  `Course_id` INT NOT NULL,
  PRIMARY KEY (`trainer_id`),
  INDEX `fk_Trainer_Course` (`Course_id` ASC) VISIBLE,
  CONSTRAINT `fk_Trainer_Course1`
    FOREIGN KEY (`Course_id`)
    REFERENCES `private_school`.`Course` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `private_school`.`Courses_have_Students`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `private_school`.`Courses_have_Students` (
  `enrollment_id` INT NOT NULL,
  `Course_id` INT NOT NULL,
  `student_id` INT NOT NULL,
  PRIMARY KEY (`enrollment_id`, `Course_id`, `student_id`),
  INDEX `fk_Course_has_Student_Student` (`student_id` ASC) VISIBLE,
  INDEX `fk_Course_has_Student_Course` (`Course_id` ASC) VISIBLE,
  CONSTRAINT `fk_Course_has_Student_Course1`
    FOREIGN KEY (`Course_id`)
    REFERENCES `private_school`.`Course` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Course_has_Student_Student1`
    FOREIGN KEY (`student_id`)
    REFERENCES `private_school`.`Student` (`student_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `private_school`.`Courses_have_Assignments`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `private_school`.`Courses_have_Assignments` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `Course_id` INT NOT NULL,
  `assignment_id` INT NOT NULL,
  PRIMARY KEY (`id`, `Course_id`, `assignment_id`),
  INDEX `fk_Course_has_Assignemnt_Assignemnt` (`assignment_id` ASC) VISIBLE,
  INDEX `fk_Course_has_Assignemnt_Course` (`Course_id` ASC) VISIBLE,
  CONSTRAINT `fk_Course_has_Assignemnt_Course1`
    FOREIGN KEY (`Course_id`)
    REFERENCES `private_school`.`Course` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Course_has_Assignemnt_Assignemnt1`
    FOREIGN KEY (`assignment_id`)
    REFERENCES `private_school`.`Assignemnt` (`assignment_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `private_school`.`CourseperStudentperAssignemnt`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `private_school`.`CourseperStudentperAssignemnt` (
  `id` INT NOT NULL,
  `enrollment_id` INT NOT NULL,
  `assignment_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_CourseperStudentperAssignemnt_Assignemnt` (`assignment_id` ASC) VISIBLE,
  INDEX `fk_CourseperStudentperAssignemnt_Course_has_Student` (`enrollment_id` ASC) VISIBLE,
  CONSTRAINT `fk_CourseperStudentperAssignemntt_Course_has_Student`
    FOREIGN KEY (`enrollment_id`)
    REFERENCES `private_school`.`Courses_have_Students` (`enrollment_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_CourseperStudentperAssignemnt_Assignemnt`
    FOREIGN KEY (`assignment_id`)
    REFERENCES `private_school`.`Assignemnt` (`assignment_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
