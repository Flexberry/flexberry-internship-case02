



CREATE TABLE Студент (

 primaryKey UUID NOT NULL,

 ФИО VARCHAR(255) NULL,

 ДатаРождения TIMESTAMP(3) NULL,

 Организация UUID NOT NULL,

 PRIMARY KEY (primaryKey));


CREATE TABLE Модуль (

 primaryKey UUID NOT NULL,

 Название VARCHAR(255) NULL,

 Описание VARCHAR(255) NULL,

 Организация UUID NOT NULL,

 PRIMARY KEY (primaryKey));


CREATE TABLE Договор (

 primaryKey UUID NOT NULL,

 ДатаЗаключения TIMESTAMP(3) NULL,

 ДатаОкончания TIMESTAMP(3) NULL,

 ВтораяОрганизация UUID NOT NULL,

 ПерваяОрганизация UUID NOT NULL,

 PRIMARY KEY (primaryKey));


CREATE TABLE Организация (

 primaryKey UUID NOT NULL,

 ТипФирмы VARCHAR(255) NULL,

 Название VARCHAR(255) NULL,

 Адрес VARCHAR(255) NULL,

 ДатаОснования TIMESTAMP(3) NULL,

 Глава VARCHAR(255) NULL,

 PRIMARY KEY (primaryKey));


CREATE TABLE Предпочтения (

 primaryKey UUID NOT NULL,

 Приоритет VARCHAR(255) NULL,

 Модуль UUID NOT NULL,

 Студент UUID NOT NULL,

 PRIMARY KEY (primaryKey));


CREATE TABLE adw (

 primaryKey UUID NOT NULL,

 PRIMARY KEY (primaryKey));


CREATE TABLE STORMNETLOCKDATA (

 LockKey VARCHAR(300) NOT NULL,

 UserName VARCHAR(300) NOT NULL,

 LockDate TIMESTAMP(3) NULL,

 PRIMARY KEY (LockKey));


CREATE TABLE STORMSETTINGS (

 primaryKey UUID NOT NULL,

 Module VARCHAR(1000) NULL,

 Name VARCHAR(255) NULL,

 Value TEXT NULL,

 "User" VARCHAR(255) NULL,

 PRIMARY KEY (primaryKey));


CREATE TABLE STORMAdvLimit (

 primaryKey UUID NOT NULL,

 "User" VARCHAR(255) NULL,

 Published BOOLEAN NULL,

 Module VARCHAR(255) NULL,

 Name VARCHAR(255) NULL,

 Value TEXT NULL,

 HotKeyData INT NULL,

 PRIMARY KEY (primaryKey));


CREATE TABLE STORMFILTERSETTING (

 primaryKey UUID NOT NULL,

 Name VARCHAR(255) NOT NULL,

 DataObjectView VARCHAR(255) NOT NULL,

 PRIMARY KEY (primaryKey));


CREATE TABLE STORMWEBSEARCH (

 primaryKey UUID NOT NULL,

 Name VARCHAR(255) NOT NULL,

 "Order" INT NOT NULL,

 PresentView VARCHAR(255) NOT NULL,

 DetailedView VARCHAR(255) NOT NULL,

 FilterSetting_m0 UUID NOT NULL,

 PRIMARY KEY (primaryKey));


CREATE TABLE STORMFILTERDETAIL (

 primaryKey UUID NOT NULL,

 Caption VARCHAR(255) NOT NULL,

 DataObjectView VARCHAR(255) NOT NULL,

 ConnectMasterProp VARCHAR(255) NOT NULL,

 OwnerConnectProp VARCHAR(255) NULL,

 FilterSetting_m0 UUID NOT NULL,

 PRIMARY KEY (primaryKey));


CREATE TABLE STORMFILTERLOOKUP (

 primaryKey UUID NOT NULL,

 DataObjectType VARCHAR(255) NOT NULL,

 Container VARCHAR(255) NULL,

 ContainerTag VARCHAR(255) NULL,

 FieldsToView VARCHAR(255) NULL,

 FilterSetting_m0 UUID NOT NULL,

 PRIMARY KEY (primaryKey));


CREATE TABLE UserSetting (

 primaryKey UUID NOT NULL,

 AppName VARCHAR(256) NULL,

 UserName VARCHAR(512) NULL,

 UserGuid UUID NULL,

 ModuleName VARCHAR(1024) NULL,

 ModuleGuid UUID NULL,

 SettName VARCHAR(256) NULL,

 SettGuid UUID NULL,

 SettLastAccessTime TIMESTAMP(3) NULL,

 StrVal VARCHAR(256) NULL,

 TxtVal TEXT NULL,

 IntVal INT NULL,

 BoolVal BOOLEAN NULL,

 GuidVal UUID NULL,

 DecimalVal DECIMAL(20,10) NULL,

 DateTimeVal TIMESTAMP(3) NULL,

 PRIMARY KEY (primaryKey));


CREATE TABLE ApplicationLog (

 primaryKey UUID NOT NULL,

 Category VARCHAR(64) NULL,

 EventId INT NULL,

 Priority INT NULL,

 Severity VARCHAR(32) NULL,

 Title VARCHAR(256) NULL,

 Timestamp TIMESTAMP(3) NULL,

 MachineName VARCHAR(32) NULL,

 AppDomainName VARCHAR(512) NULL,

 ProcessId VARCHAR(256) NULL,

 ProcessName VARCHAR(512) NULL,

 ThreadName VARCHAR(512) NULL,

 Win32ThreadId VARCHAR(128) NULL,

 Message VARCHAR(2500) NULL,

 FormattedMessage TEXT NULL,

 PRIMARY KEY (primaryKey));




 ALTER TABLE Студент ADD CONSTRAINT FK79bcdabeea554b7e9e98c047b7f89539 FOREIGN KEY (Организация) REFERENCES Организация; 
CREATE INDEX Indexac4ffc0291494258b59a36e3531dc6e5 on Студент (Организация); 

 ALTER TABLE Модуль ADD CONSTRAINT FK77f5269b248d478191028bc81d0090f9 FOREIGN KEY (Организация) REFERENCES Организация; 
CREATE INDEX Index8107a959d9be4d6a8cf030236bd0e43e on Модуль (Организация); 

 ALTER TABLE Договор ADD CONSTRAINT FK6040ce425a65450d94df33141a66e3d5 FOREIGN KEY (ВтораяОрганизация) REFERENCES Организация; 
CREATE INDEX Indexf4fa69afe83e41cb818f6c32f6d9c188 on Договор (ВтораяОрганизация); 

 ALTER TABLE Договор ADD CONSTRAINT FKb6aad04e1fc045ab932b719c79d1054f FOREIGN KEY (ПерваяОрганизация) REFERENCES Организация; 
CREATE INDEX Index690fc0c058ce4025888ba0fd9e49a1ec on Договор (ПерваяОрганизация); 

 ALTER TABLE Предпочтения ADD CONSTRAINT FK39d5d482ae674e7d83968d4e9b15ea5f FOREIGN KEY (Модуль) REFERENCES Модуль; 
CREATE INDEX Indexf58f888748b5485aa1b38fb4ab1e9a7c on Предпочтения (Модуль); 

 ALTER TABLE Предпочтения ADD CONSTRAINT FKe15149291b64452a925a4064552f6cd9 FOREIGN KEY (Студент) REFERENCES Студент; 
CREATE INDEX Indexfe84177542c047bbbcab04388f977fd9 on Предпочтения (Студент); 

 ALTER TABLE STORMWEBSEARCH ADD CONSTRAINT FKfad0f16e5ca54167ba12743353bc02f1 FOREIGN KEY (FilterSetting_m0) REFERENCES STORMFILTERSETTING; 

 ALTER TABLE STORMFILTERDETAIL ADD CONSTRAINT FK9f682f655676450a83804519b3b0891f FOREIGN KEY (FilterSetting_m0) REFERENCES STORMFILTERSETTING; 

 ALTER TABLE STORMFILTERLOOKUP ADD CONSTRAINT FK8cda3ca5701f46e18a191c0b2e54144a FOREIGN KEY (FilterSetting_m0) REFERENCES STORMFILTERSETTING; 

