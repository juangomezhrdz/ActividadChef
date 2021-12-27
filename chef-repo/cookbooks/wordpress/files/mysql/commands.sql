CREATE USER IF NOT EXISTS 'username'@'localhost' IDENTIFIED BY 'anothersecurepassword';
CREATE DATABASE IF NOT EXISTS wordpress;
GRANT ALL ON *.* to 'username'@'localhost';