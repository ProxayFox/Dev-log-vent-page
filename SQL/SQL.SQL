-- Database name / creation
CREATE DATABASE log_vent;

-- CPID   = Client Profile Identification
-- LID    = Login Identification
-- fName  = First Name
-- lName  = Last Name
-- UIMG   = User Image
CREATE TABLE clientProfile (
	CPID                INT(11)      	NOT NULL AUTO_INCREMENT,
	email               VARCHAR(150)  NOT NULL UNIQUE,
	PRIMARY KEY (CPID)
);

-- LID    = Login Identification
-- PWD    = Password, going to be using SHA-512
-- CPID   = Client Profile Identification
CREATE TABLE login (
	LID                 INT(11)      	NOT NULL AUTO_INCREMENT,
	CPID                INT(11)     	NOT NULL,
	UName               VARCHAR(100)  NOT NULL UNIQUE,
	PWD                 VARCHAR(200)  NOT NULL,
	PRIMARY KEY (LID),
	FOREIGN KEY (CPID) 	REFERENCES clientProfile(CPID)
);

CREATE TABLE log (
  logID               INT(11)       NOT NULL AUTO_INCREMENT,
  CPID                INT(11)       NOT NULL,
  date                TIMESTAMP     NOT NULL,
  title               VARCHAR(255)  NOT NULL,
  info                TEXT(1000)    NOT NULL,
  PRIMARY KEY (logID),
  FOREIGN KEY (CPID) REFERENCES clientProfile(CPID)
);

INSERT INTO `clientProfile` (`CPID`, `email`) VALUES
(1, 'admin1@proxwebdev.com'),
(2,'admin@proxwebdev.com');


INSERT INTO `login` (`LID`, `CPID`, `UName`, `PWD`) VALUES
(1, 1, 'atcav', 'e6c83b282aeb2e022844595721cc00bbda47cb24537c1779f9bb84f04039e1676e6ba8573e588da1052510e3aa0a32a9e55879ae22b0c2d62136fc0a3e85f8bb'),
(2, 2, 'admin', 'e6c83b282aeb2e022844595721cc00bbda47cb24537c1779f9bb84f04039e1676e6ba8573e588da1052510e3aa0a32a9e55879ae22b0c2d62136fc0a3e85f8bb');