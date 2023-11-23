-- Create database if not already created
CREATE DATABASE IF NOT EXISTS `$(MYSQL_DATABASE)`;

-- Create user if not already created and set its password
CREATE USER IF NOT EXISTS `$(MYSQL_USER)`@`%` IDENTIFIED BY '$(MYSQL_PASSWORD)';

-- Gives this user all privileges on the database
GRANT ALL PRIVILEGES ON `$(MYSQL_DATABASE)`.* TO `$(MYSQL_USER)`@`%`;

-- Apply privileges
FLUSH PRIVILEGES;

-- Modify 'root'@'localhost' password
ALTER USER 'root'@'localhost' IDENTIFIED BY '$(MYSQL_ROOT_PASSWORD)';