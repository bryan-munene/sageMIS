CREATE USER sage IDENTIFIED BY '!sage';

CREATE DATABASE pharm_engine_test CHARACTER SET utf8 COLLATE utf8_general_ci;
CREATE DATABASE pharm_engine_development CHARACTER SET utf8 COLLATE utf8_general_ci;
CREATE DATABASE pharm_engine_production CHARACTER SET utf8 COLLATE utf8_general_ci;

GRANT all privileges ON pharm_engine_development.* TO 'sage'@'localhost' IDENTIFIED BY '!sage';
GRANT all privileges ON pharm_engine_production.* TO 'sage'@'localhost' IDENTIFIED BY '!sage';
GRANT all privileges ON pharm_engine_test.* TO 'sage'@'localhost' IDENTIFIED BY '!sage';
