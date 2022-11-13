CREATE USER 'javaTPUser'@'localhost' IDENTIFIED BY '12345';
GRANT SELECT, INSERT, UPDATE, DELETE ON ON javatp.* TO 'javaTPUser'@'localhost';
