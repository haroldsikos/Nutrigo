create database dbNutrigo

use dbNutrigo
-- Physic Model-NutriGo!
-- tables
-- Table: Categoria

CREATE TABLE Categoria (
    idCategoria int  NOT NULL,
    nombreCategoria varchar(50)  NOT NULL,
    descripcion varchar(50)  NOT NULL,
    CONSTRAINT Categoria_pk PRIMARY KEY  (idCategoria)
);

-- Table: Localizacion
CREATE TABLE Localizacion (
    idLocalizacion int  NOT NULL,
    país varchar(50)  NOT NULL,
    region varchar(50)  NOT NULL,
    distrito varchar(50)  NOT NULL,
    codigoPostal int  NOT NULL,
    nombreCalle varchar(50)  NOT NULL,
    numCalle int  NOT NULL,
    CONSTRAINT Localizacion_pk PRIMARY KEY  (idLocalizacion)
);

-- Table: Orden
CREATE TABLE Orden (
    idOrden int  NOT NULL,
    idConsumidor int  NOT NULL,
    idRepartidor int  NOT NULL,
    fechaOrden datetime  NOT NULL,
    medioDePago varchar(50)  NOT NULL,
    CONSTRAINT Orden_pk PRIMARY KEY  (idOrden)
);

-- Table: OrdenDetalles
CREATE TABLE OrdenDetalles (
    idOrden int  NOT NULL,
    idProducto int  NOT NULL,
    descuento int  NOT NULL,
    cantidadProducto int  NOT NULL,
    precioTotal money  NOT NULL,
    CONSTRAINT OrdenDetalles_pk PRIMARY KEY  (idOrden,idProducto)
);

-- Table: Producto
CREATE TABLE Producto (
    idProducto int  NOT NULL,
    idCategoria int  NOT NULL,
    idEmpresa int  NOT NULL,
    idValorNutricional int  NOT NULL,
    nombreProducto varchar(50)  NOT NULL,
    precioUnitario money  NOT NULL,
    stock int  NOT NULL,
    CONSTRAINT Producto_pk PRIMARY KEY  (idProducto)
);

-- Table: Repartidor
CREATE TABLE Repartidor (
    idRepartidor int  NOT NULL,
    idTransporte int  NOT NULL,
    nombreRepartidor varchar(50)  NOT NULL,
    telefonoRepartidor int  NOT NULL,
    promedioValoracion int  NOT NULL,
    CONSTRAINT Repartidor_pk PRIMARY KEY  (idRepartidor)
);

-- Table: Sucursal
CREATE TABLE Sucursal (
    idLocalizacion int  NOT NULL,
    idEmpresa int  NOT NULL,
    CONSTRAINT Sucursal_pk PRIMARY KEY  (idLocalizacion,idEmpresa)
);

-- Table: Transporte
CREATE TABLE Transporte (
    idTransporte int  NOT NULL,
    tipoTransporte varchar(50)  NOT NULL,
    estado varchar(50)  NOT NULL,
    capacidad int  NOT NULL,
    CONSTRAINT Transporte_pk PRIMARY KEY  (idTransporte)
);

-- Table: UsuarioConsumidor
CREATE TABLE UsuarioConsumidor (
    idConsumidor int  NOT NULL,
    idLocalizacion int  NOT NULL,
    nombreConsumidor varchar(50)  NOT NULL,
    telefonoConsumidor int  NOT NULL,
    añoNacimiento date  NOT NULL,
    email nvarchar(55)  NOT NULL,
    contraseña nvarchar(50)  NOT NULL,
    CONSTRAINT UsuarioConsumidor_pk PRIMARY KEY  (idConsumidor)
);

-- Table: UsuarioEmpresa
CREATE TABLE UsuarioEmpresa (
    idEmpresa int  NOT NULL,
    nombreEmpresa varchar(50)  NOT NULL,
    razonSocial varchar(50)  NOT NULL,
    telefonoEmpresa int  NOT NULL,
    email varchar(50)  NOT NULL,
    contraseña nvarchar(50)  NOT NULL,
    CONSTRAINT UsuarioEmpresa_pk PRIMARY KEY  (idEmpresa)
);

-- Table: ValorNutricional
CREATE TABLE ValorNutricional (
    idValorNutricional int  NOT NULL,
    calorias int  NOT NULL,
    proteinas int  NOT NULL,
    carbohidratos int  NOT NULL,
    grasas int  NOT NULL,
    vitaminas nvarchar(100)  NOT NULL,
    minerales nvarchar(100)  NOT NULL,
    CONSTRAINT ValorNutricional_pk PRIMARY KEY  (idValorNutricional)
);

-- foreign keys
-- Reference: Orden_Motorizados (table: Orden)
ALTER TABLE Orden ADD CONSTRAINT Orden_Motorizados
    FOREIGN KEY (idRepartidor)
    REFERENCES Repartidor (idRepartidor);

-- Reference: Orden_Productos_Orden (table: OrdenDetalles)
ALTER TABLE OrdenDetalles ADD CONSTRAINT Orden_Productos_Orden
    FOREIGN KEY (idOrden)
    REFERENCES Orden (idOrden);

-- Reference: Orden_Productos_Producto (table: OrdenDetalles)
ALTER TABLE OrdenDetalles ADD CONSTRAINT Orden_Productos_Producto
    FOREIGN KEY (idProducto)
    REFERENCES Producto (idProducto);

-- Reference: Orden_Usuario_Cliente (table: Orden)
ALTER TABLE Orden ADD CONSTRAINT Orden_Usuario_Cliente
    FOREIGN KEY (idConsumidor)
    REFERENCES UsuarioConsumidor (idConsumidor);

-- Reference: Producto_Categoria (table: Producto)
ALTER TABLE Producto ADD CONSTRAINT Producto_Categoria
    FOREIGN KEY (idCategoria)
    REFERENCES Categoria (idCategoria);

-- Reference: Producto_UsuarioEmpresa (table: Producto)
ALTER TABLE Producto ADD CONSTRAINT Producto_UsuarioEmpresa
    FOREIGN KEY (idEmpresa)
    REFERENCES UsuarioEmpresa (idEmpresa);

-- Reference: Producto_ValorNutricional (table: Producto)
ALTER TABLE Producto ADD CONSTRAINT Producto_ValorNutricional
    FOREIGN KEY (idValorNutricional)
    REFERENCES ValorNutricional (idValorNutricional);

-- Reference: Repartidor_Transporte (table: Repartidor)
ALTER TABLE Repartidor ADD CONSTRAINT Repartidor_Transporte
    FOREIGN KEY (idTransporte)
    REFERENCES Transporte (idTransporte);

-- Reference: Sucursal_Localizacion (table: Sucursal)
ALTER TABLE Sucursal ADD CONSTRAINT Sucursal_Localizacion
    FOREIGN KEY (idLocalizacion)
    REFERENCES Localizacion (idLocalizacion);

-- Reference: Sucursal_UsuarioEmpresa (table: Sucursal)
ALTER TABLE Sucursal ADD CONSTRAINT Sucursal_UsuarioEmpresa
    FOREIGN KEY (idEmpresa)
    REFERENCES UsuarioEmpresa (idEmpresa);

-- Reference: UsuarioCliente_Localizacion (table: UsuarioConsumidor)
ALTER TABLE UsuarioConsumidor ADD CONSTRAINT UsuarioCliente_Localizacion
    FOREIGN KEY (idLocalizacion)
    REFERENCES Localizacion (idLocalizacion);

-- End of file.

INSERT INTO Localizacion (idLocalizacion,país,region,distrito,codigoPostal,nombreCalle,numCalle) VALUES (1,'Peru','Lima metropolitana','Surco',3485,'4852 Rockefeller Junction',8);
INSERT INTO Localizacion (idLocalizacion,país,region,distrito,codigoPostal,nombreCalle,numCalle) VALUES (2,'Peru','Lima metropolitana','Breña',1204,'662 Derek Avenue',1328);
INSERT INTO Localizacion (idLocalizacion,país,region,distrito,codigoPostal,nombreCalle,numCalle) VALUES (3,'Peru','Lima','Cañete',1260,'73 Scoville Drive',10);
INSERT INTO Localizacion (idLocalizacion,país,region,distrito,codigoPostal,nombreCalle,numCalle) VALUES (4,'Peru','Lima metropolitana','San Borja',3280,'7 Nova Terrace',64);
INSERT INTO Localizacion (idLocalizacion,país,region,distrito,codigoPostal,nombreCalle,numCalle) VALUES (5,'Peru','Lima metropolitana','San Isidro',2355,'7548 Evergreen Court',199);
INSERT INTO Localizacion (idLocalizacion,país,region,distrito,codigoPostal,nombreCalle,numCalle) VALUES (6,'Peru','Lima metropolitana','Ate',3974,'0943 Portage Court',714);
INSERT INTO Localizacion (idLocalizacion,país,region,distrito,codigoPostal,nombreCalle,numCalle) VALUES (7,'Peru','Lima metropolitana','Chorillos',1864,'89061 Pierstorff Point',291);
INSERT INTO Localizacion (idLocalizacion,país,region,distrito,codigoPostal,nombreCalle,numCalle) VALUES (8,'Peru','Lima metropolitana','Comas',9434,'050 Dorton Court',9208);
INSERT INTO Localizacion (idLocalizacion,país,region,distrito,codigoPostal,nombreCalle,numCalle) VALUES (9,'Peru','Lima metropolitana','La Molina',7918,'571 Mitchell Plaza',9201);
INSERT INTO Localizacion (idLocalizacion,país,region,distrito,codigoPostal,nombreCalle,numCalle) VALUES (10,'Peru','Lima','Huaral',1490,'7085 4th Park',7245);
INSERT INTO Localizacion (idLocalizacion,país,region,distrito,codigoPostal,nombreCalle,numCalle) VALUES (11,'Peru','Lima metropolitana','Pueblo Libre',3234,'90 Eliot Circle',1839);
INSERT INTO Localizacion (idLocalizacion,país,region,distrito,codigoPostal,nombreCalle,numCalle) VALUES (12,'Peru','Lima metropolitana','Santa Anita',3533,'2 Oak Valley Avenue',22674);
INSERT INTO Localizacion (idLocalizacion,país,region,distrito,codigoPostal,nombreCalle,numCalle) VALUES (13,'Peru','Lima metropolitana','Surco',8124,'4 Moulton Terrace',6);
INSERT INTO Localizacion (idLocalizacion,país,region,distrito,codigoPostal,nombreCalle,numCalle) VALUES (14,'Peru','Lima','Yauyos',9596,'3 Forster Circle',558);
INSERT INTO Localizacion (idLocalizacion,país,region,distrito,codigoPostal,nombreCalle,numCalle) VALUES (15,'Peru','Lima metropolitana','Jesús María',5245,'48 Brickson Park Center',2);
INSERT INTO Localizacion (idLocalizacion,país,region,distrito,codigoPostal,nombreCalle,numCalle) VALUES (16,'Peru','Lima metropolitana','San Borja',8460,'53018 Gateway Plaza',1);
INSERT INTO Localizacion (idLocalizacion,país,region,distrito,codigoPostal,nombreCalle,numCalle) VALUES (17,'Peru','Lima metropolitana','San Isidro',1550,'01758 Welch Way',732);
INSERT INTO Localizacion (idLocalizacion,país,region,distrito,codigoPostal,nombreCalle,numCalle) VALUES (18,'Peru','Lima metropolitana','Ate',8947,'105 Carberry Terrace',83876);
INSERT INTO Localizacion (idLocalizacion,país,region,distrito,codigoPostal,nombreCalle,numCalle) VALUES (19,'Peru','Lima metropolitana','Chorillos',6767,'04 Arapahoe Lane',6);
INSERT INTO Localizacion (idLocalizacion,país,region,distrito,codigoPostal,nombreCalle,numCalle) VALUES (20,'Peru','Lima','Huarochirí',7834,'89 Dovetail Junction',35119);
INSERT INTO Localizacion (idLocalizacion,país,region,distrito,codigoPostal,nombreCalle,numCalle) VALUES (21,'Peru','Lima metropolitana','San Juan de Miraflores',1505,'Av. Los heroes',5);
INSERT INTO Localizacion (idLocalizacion,país,region,distrito,codigoPostal,nombreCalle,numCalle) VALUES (22,'Peru','Lima metropolitana','Breña',1204,'0153 Harbort Pass',1328);
INSERT INTO Localizacion (idLocalizacion,país,region,distrito,codigoPostal,nombreCalle,numCalle) VALUES (23,'Peru','Lima metropolitana','Jesús María',1260,'12775 Brickson Park Alley',10);
INSERT INTO Localizacion (idLocalizacion,país,region,distrito,codigoPostal,nombreCalle,numCalle) VALUES (24,'Peru','Lima metropolitana','San Borja',3280,'50540 Morrow Point',64);
INSERT INTO Localizacion (idLocalizacion,país,region,distrito,codigoPostal,nombreCalle,numCalle) VALUES (25,'Peru','Lima metropolitana','San Isidro',2355,'1 Barnett Drive',199);
INSERT INTO Localizacion (idLocalizacion,país,region,distrito,codigoPostal,nombreCalle,numCalle) VALUES (26,'Peru','Lima metropolitana','Ate',3974,'816 Hallows Center',714);
INSERT INTO Localizacion (idLocalizacion,país,region,distrito,codigoPostal,nombreCalle,numCalle) VALUES (27,'Peru','Lima metropolitana','Chorillos',1864,'851 Golf View Street',291);
INSERT INTO Localizacion (idLocalizacion,país,region,distrito,codigoPostal,nombreCalle,numCalle) VALUES (28,'Peru','Lima metropolitana','Comas',9434,'3 Gale Avenue',9208);
INSERT INTO Localizacion (idLocalizacion,país,region,distrito,codigoPostal,nombreCalle,numCalle) VALUES (29,'Peru','Lima metropolitana','La Molina',7918,'6 Westport Place',9201);
INSERT INTO Localizacion (idLocalizacion,país,region,distrito,codigoPostal,nombreCalle,numCalle) VALUES (30,'Peru','Lima metropolitana','Rímac',1490,'14363 Mifflin Way',7245);
INSERT INTO Localizacion (idLocalizacion,país,region,distrito,codigoPostal,nombreCalle,numCalle) VALUES (31,'Peru','Lima metropolitana','Pueblo Libre',3234,'6535 Bultman Crossing',1839);
INSERT INTO Localizacion (idLocalizacion,país,region,distrito,codigoPostal,nombreCalle,numCalle) VALUES (32,'Peru','Lima metropolitana','San Juan de Miraflores',3533,'42 Linden Plaza',22674);
INSERT INTO Localizacion (idLocalizacion,país,region,distrito,codigoPostal,nombreCalle,numCalle) VALUES (33,'Peru','Lima metropolitana','Breña',8124,'9297 Goodland Way',6);
INSERT INTO Localizacion (idLocalizacion,país,region,distrito,codigoPostal,nombreCalle,numCalle) VALUES (34,'Peru','Lima metropolitana','Jesús María',9596,'95908 Anhalt Terrace',558);
INSERT INTO Localizacion (idLocalizacion,país,region,distrito,codigoPostal,nombreCalle,numCalle) VALUES (35,'Peru','Lima metropolitana','San Borja',5245,'62407 Lawn Lane',2);
INSERT INTO Localizacion (idLocalizacion,país,region,distrito,codigoPostal,nombreCalle,numCalle) VALUES (36,'Peru','Lima metropolitana','San Isidro',8460,'26259 4th Crossing',1);
INSERT INTO Localizacion (idLocalizacion,país,region,distrito,codigoPostal,nombreCalle,numCalle) VALUES (37,'Peru','Lima','Huaral',1550,'241 South Place',732);
INSERT INTO Localizacion (idLocalizacion,país,region,distrito,codigoPostal,nombreCalle,numCalle) VALUES (38,'Peru','Lima','Cañete',8947,'78 Farragut Terrace',83876);
INSERT INTO Localizacion (idLocalizacion,país,region,distrito,codigoPostal,nombreCalle,numCalle) VALUES (39,'Peru','Lima','Huarochirí',6767,'5768 Steensland Terrace',6);
INSERT INTO Localizacion (idLocalizacion,país,region,distrito,codigoPostal,nombreCalle,numCalle) VALUES (40,'Peru','Lima','Canta',7834,'7 Schlimgen Crossing',35119);



INSERT INTO UsuarioEmpresa (idEmpresa,nombreEmpresa,razonSocial,telefonoEmpresa,email,contraseña) VALUES (1,'Pablito food','SAC',980421763,'ipsum.suspendisse.non@aol.net','NYZ27EHN7WM');
INSERT INTO UsuarioEmpresa (idEmpresa,nombreEmpresa,razonSocial,telefonoEmpresa,email,contraseña) VALUES (2,'Divape','SAA',980913480,'asneden0@elegantthemes.com','qYfFnRrI');
INSERT INTO UsuarioEmpresa (idEmpresa,nombreEmpresa,razonSocial,telefonoEmpresa,email,contraseña) VALUES (3,'Realbuzz','SRL',978987902,'yogaven1@sitemeter.com','jzNi2sR');
INSERT INTO UsuarioEmpresa (idEmpresa,nombreEmpresa,razonSocial,telefonoEmpresa,email,contraseña) VALUES (4,'Oyoyo','SAC',913497379,'pkohler2@tripod.com','TrlNkf2KjI');
INSERT INTO UsuarioEmpresa (idEmpresa,nombreEmpresa,razonSocial,telefonoEmpresa,email,contraseña) VALUES (5,'Trupe','EIRL',952374971,'mniesegen3@simplemachines.org','i2w5eM');
INSERT INTO UsuarioEmpresa (idEmpresa,nombreEmpresa,razonSocial,telefonoEmpresa,email,contraseña) VALUES (6,'Thoughtstorm','SAC',937138604,'bsamweyes4@goodreads.com','XqxlO9Me9j');
INSERT INTO UsuarioEmpresa (idEmpresa,nombreEmpresa,razonSocial,telefonoEmpresa,email,contraseña) VALUES (7,'Realblab','SAC',997982272,'vbramwich5@360.cn','jUOBKaspxnh');
INSERT INTO UsuarioEmpresa (idEmpresa,nombreEmpresa,razonSocial,telefonoEmpresa,email,contraseña) VALUES (8,'Blogspan','SAA',937918552,'agomersall6@state.gov','PN6JsKS7DWOK');
INSERT INTO UsuarioEmpresa (idEmpresa,nombreEmpresa,razonSocial,telefonoEmpresa,email,contraseña) VALUES (9,'Eire','SRL',917028961,'cvedeneev7@goo.ne.jp','qg4xe6wq');
INSERT INTO UsuarioEmpresa (idEmpresa,nombreEmpresa,razonSocial,telefonoEmpresa,email,contraseña) VALUES (10,'Trilia','SAC',966852952,'jcolgan8@independent.co.uk','iaFa7IWR8Ck');
INSERT INTO UsuarioEmpresa (idEmpresa,nombreEmpresa,razonSocial,telefonoEmpresa,email,contraseña) VALUES (11,'Layo','EIRL',949438170,'acreevy9@mozilla.com','tLzhtU7');
INSERT INTO UsuarioEmpresa (idEmpresa,nombreEmpresa,razonSocial,telefonoEmpresa,email,contraseña) VALUES (12,'Vimbo','SAA',977169505,'rbottrilla@dyndns.org','At3P4PyZ');
INSERT INTO UsuarioEmpresa (idEmpresa,nombreEmpresa,razonSocial,telefonoEmpresa,email,contraseña) VALUES (13,'Edgeblab','SAC',995475310,'rschirakb@mac.com','32InAqk');
INSERT INTO UsuarioEmpresa (idEmpresa,nombreEmpresa,razonSocial,telefonoEmpresa,email,contraseña) VALUES (14,'Chatterbridge','EIRL',997557359,'gminihanec@discuz.net','lFv7b0qb');
INSERT INTO UsuarioEmpresa (idEmpresa,nombreEmpresa,razonSocial,telefonoEmpresa,email,contraseña) VALUES (15,'Brightbean','SAC',988457915,'enorledged@flickr.com','VhcnjgAW');
INSERT INTO UsuarioEmpresa (idEmpresa,nombreEmpresa,razonSocial,telefonoEmpresa,email,contraseña) VALUES (16,'Abatz','SAA',961483187,'ndorete@bluehost.com','7BmjiRQtx');
INSERT INTO UsuarioEmpresa (idEmpresa,nombreEmpresa,razonSocial,telefonoEmpresa,email,contraseña) VALUES (17,'Quimm','SAC',909479193,'jkilohf@google.cn','VRbN9sj7SY');
INSERT INTO UsuarioEmpresa (idEmpresa,nombreEmpresa,razonSocial,telefonoEmpresa,email,contraseña) VALUES (18,'Skalith','SAA',938880559,'shallattg@mapy.cz','X5qh7kcr');
INSERT INTO UsuarioEmpresa (idEmpresa,nombreEmpresa,razonSocial,telefonoEmpresa,email,contraseña) VALUES (19,'Mynte','SAC',969530002,'tcarlosh@facebook.com','4HpRQnwqD7Rt');
INSERT INTO UsuarioEmpresa (idEmpresa,nombreEmpresa,razonSocial,telefonoEmpresa,email,contraseña) VALUES (20,'Wordtune','SAA',961483157,'ccardosoi@altervista.org','HznCEi');



INSERT INTO Sucursal (idLocalizacion,idEmpresa) VALUES (21,1);
INSERT INTO Sucursal (idLocalizacion,idEmpresa) VALUES (22,2);
INSERT INTO Sucursal (idLocalizacion,idEmpresa) VALUES (23,3);
INSERT INTO Sucursal (idLocalizacion,idEmpresa) VALUES (24,4);
INSERT INTO Sucursal (idLocalizacion,idEmpresa) VALUES (25,5);
INSERT INTO Sucursal (idLocalizacion,idEmpresa) VALUES (26,6);
INSERT INTO Sucursal (idLocalizacion,idEmpresa) VALUES (27,7);
INSERT INTO Sucursal (idLocalizacion,idEmpresa) VALUES (28,8);
INSERT INTO Sucursal (idLocalizacion,idEmpresa) VALUES (29,9);
INSERT INTO Sucursal (idLocalizacion,idEmpresa) VALUES (30,10);
INSERT INTO Sucursal (idLocalizacion,idEmpresa) VALUES (31,11);
INSERT INTO Sucursal (idLocalizacion,idEmpresa) VALUES (32,12);
INSERT INTO Sucursal (idLocalizacion,idEmpresa) VALUES (33,13);
INSERT INTO Sucursal (idLocalizacion,idEmpresa) VALUES (34,14);
INSERT INTO Sucursal (idLocalizacion,idEmpresa) VALUES (35,15);
INSERT INTO Sucursal (idLocalizacion,idEmpresa) VALUES (36,16);
INSERT INTO Sucursal (idLocalizacion,idEmpresa) VALUES (37,17);
INSERT INTO Sucursal (idLocalizacion,idEmpresa) VALUES (38,18);
INSERT INTO Sucursal (idLocalizacion,idEmpresa) VALUES (39,19);
INSERT INTO Sucursal (idLocalizacion,idEmpresa) VALUES (40,20);


INSERT INTO UsuarioConsumidor (idConsumidor,idLocalizacion,nombreConsumidor,telefonoConsumidor,añoNacimiento,email,contraseña) VALUES (1,1,'Juan Carlos Smith','953517289','2003-11-19','bevenden5@soundcloud.com	','50Q5d12BRf');
INSERT INTO UsuarioConsumidor (idConsumidor,idLocalizacion,nombreConsumidor,telefonoConsumidor,añoNacimiento,email,contraseña) VALUES (2,2,'Diandra Biggans','921572059','2002-02-06','drodger0@tumblr.com','ixq8ydTCVI7');
INSERT INTO UsuarioConsumidor (idConsumidor,idLocalizacion,nombreConsumidor,telefonoConsumidor,añoNacimiento,email,contraseña) VALUES (3,3,'Saudra Sivess','935764839','2000-04-26','emessham1@hexun.com','fxSWAqx');
INSERT INTO UsuarioConsumidor (idConsumidor,idLocalizacion,nombreConsumidor,telefonoConsumidor,añoNacimiento,email,contraseña) VALUES (4,4,'Allissa Messager','973591429','1998-07-15','cpetranek2@plala.or.jp','GhBMGPt');
INSERT INTO UsuarioConsumidor (idConsumidor,idLocalizacion,nombreConsumidor,telefonoConsumidor,añoNacimiento,email,contraseña) VALUES (5,5,'Tildi OKieran','989652047','1996-10-02','olapthorne3@hc360.com','JYDpqx7xpu');
INSERT INTO UsuarioConsumidor (idConsumidor,idLocalizacion,nombreConsumidor,telefonoConsumidor,añoNacimiento,email,contraseña) VALUES (6,6,'Mark Fenge','993388715','1994-12-21','btessington4@wsj.com','u7r4UoSvT');
INSERT INTO UsuarioConsumidor (idConsumidor,idLocalizacion,nombreConsumidor,telefonoConsumidor,añoNacimiento,email,contraseña) VALUES (7,7,'Arty Denyagin','989408174','2001-05-05','kstoakes5@ted.com','a4wUJlKl2Ofw');
INSERT INTO UsuarioConsumidor (idConsumidor,idLocalizacion,nombreConsumidor,telefonoConsumidor,añoNacimiento,email,contraseña) VALUES (8,8,'Gabi Challinor','954397716','2004-01-24','kmcrinn6@naver.com','ogu8Dl');
INSERT INTO UsuarioConsumidor (idConsumidor,idLocalizacion,nombreConsumidor,telefonoConsumidor,añoNacimiento,email,contraseña) VALUES (9,9,'Dulcea Arnold','949184754','2001-12-31','kfellgate7@privacy.gov.au','II8Ux0QR');
INSERT INTO UsuarioConsumidor (idConsumidor,idLocalizacion,nombreConsumidor,telefonoConsumidor,añoNacimiento,email,contraseña) VALUES (10,10,'Garrott Platfoot','934996671','2000-11-16','shuntingford8@imageshack.us','DzSFXUQrvk');
INSERT INTO UsuarioConsumidor (idConsumidor,idLocalizacion,nombreConsumidor,telefonoConsumidor,añoNacimiento,email,contraseña) VALUES (11,11,'Ragnar Antoniades','970224245','1998-10-31','edobel9@arstechnica.com','ByHhl0Nn');
INSERT INTO UsuarioConsumidor (idConsumidor,idLocalizacion,nombreConsumidor,telefonoConsumidor,añoNacimiento,email,contraseña) VALUES (12,12,'Andre Orgee','914038714','1995-11-16','ltattersa@uiuc.edu','aBwjzw6');
INSERT INTO UsuarioConsumidor (idConsumidor,idLocalizacion,nombreConsumidor,telefonoConsumidor,añoNacimiento,email,contraseña) VALUES (13,13,'Balduin Affuso','912297738','1994-09-29','rhaselwoodb@ebay.com','8uQkgxTudI9z');
INSERT INTO UsuarioConsumidor (idConsumidor,idLocalizacion,nombreConsumidor,telefonoConsumidor,añoNacimiento,email,contraseña) VALUES (14,14,'Clarette Haysom','995584651','1992-09-11','eanfossoc@yandex.ru','Q3KdX2R');
INSERT INTO UsuarioConsumidor (idConsumidor,idLocalizacion,nombreConsumidor,telefonoConsumidor,añoNacimiento,email,contraseña) VALUES (15,15,'Ailene Brabant','999067301','1990-04-26','epancoustd@amazonaws.com','ai8dFm');
INSERT INTO UsuarioConsumidor (idConsumidor,idLocalizacion,nombreConsumidor,telefonoConsumidor,añoNacimiento,email,contraseña) VALUES (16,16,'Darcy Foxworthy','960017372','1988-03-10','ggrimselle@wsj.com','fT3VYd');
INSERT INTO UsuarioConsumidor (idConsumidor,idLocalizacion,nombreConsumidor,telefonoConsumidor,añoNacimiento,email,contraseña) VALUES (17,17,'Leonid Redholes','995133325','1987-02-13','khayfordf@lulu.com','eWdBA8');
INSERT INTO UsuarioConsumidor (idConsumidor,idLocalizacion,nombreConsumidor,telefonoConsumidor,añoNacimiento,email,contraseña) VALUES (18,18,'Vanny de Banke','937859777','1985-01-12','bmacleang@networksolutions.com','6ZxGFJnaEhna');
INSERT INTO UsuarioConsumidor (idConsumidor,idLocalizacion,nombreConsumidor,telefonoConsumidor,añoNacimiento,email,contraseña) VALUES (19,19,'Maighdiln Petrolli','977680917','1982-08-14','jpeerh@forbes.com','ibuk8tvyB');
INSERT INTO UsuarioConsumidor (idConsumidor,idLocalizacion,nombreConsumidor,telefonoConsumidor,añoNacimiento,email,contraseña) VALUES (20,20,'Adelheid Perri','987213080','1979-11-13','dnervali@bing.com','ciBzmPAC');


INSERT INTO ValorNutricional (idValorNutricional,calorias,proteinas,carbohidratos,grasas,vitaminas,minerales) VALUES (1,15,45,18,50,'A','Ca');
INSERT INTO ValorNutricional (idValorNutricional,calorias,proteinas,carbohidratos,grasas,vitaminas,minerales) VALUES (2,304,1,76,1,'B','P');
INSERT INTO ValorNutricional (idValorNutricional,calorias,proteinas,carbohidratos,grasas,vitaminas,minerales) VALUES (3,73,2,13,11,'A','P');
INSERT INTO ValorNutricional (idValorNutricional,calorias,proteinas,carbohidratos,grasas,vitaminas,minerales) VALUES (4,163,6,5,14.2,'A','Fe');
INSERT INTO ValorNutricional (idValorNutricional,calorias,proteinas,carbohidratos,grasas,vitaminas,minerales) VALUES (5,48,2,3,0,'B','S');
INSERT INTO ValorNutricional (idValorNutricional,calorias,proteinas,carbohidratos,grasas,vitaminas,minerales) VALUES (6,155,11,18,4,'C','F');
INSERT INTO ValorNutricional (idValorNutricional,calorias,proteinas,carbohidratos,grasas,vitaminas,minerales) VALUES (7,400,26,53,10,'A','Mn');
INSERT INTO ValorNutricional (idValorNutricional,calorias,proteinas,carbohidratos,grasas,vitaminas,minerales) VALUES (8,180,2,80,4,'B','Zn');
INSERT INTO ValorNutricional (idValorNutricional,calorias,proteinas,carbohidratos,grasas,vitaminas,minerales) VALUES (9,418,10,76,8,'C','Y');
INSERT INTO ValorNutricional (idValorNutricional,calorias,proteinas,carbohidratos,grasas,vitaminas,minerales) VALUES (10,119,1,2,13,'A','C');
INSERT INTO ValorNutricional (idValorNutricional,calorias,proteinas,carbohidratos,grasas,vitaminas,minerales) VALUES (11,318,20,59,1,'B','Y');
INSERT INTO ValorNutricional (idValorNutricional,calorias,proteinas,carbohidratos,grasas,vitaminas,minerales) VALUES (12,171,2,38,1,'C','P');
INSERT INTO ValorNutricional (idValorNutricional,calorias,proteinas,carbohidratos,grasas,vitaminas,minerales) VALUES (13,150,4,10,10,'A','Mn');
INSERT INTO ValorNutricional (idValorNutricional,calorias,proteinas,carbohidratos,grasas,vitaminas,minerales) VALUES (14,12,1,2,1,'B','Au');
INSERT INTO ValorNutricional (idValorNutricional,calorias,proteinas,carbohidratos,grasas,vitaminas,minerales) VALUES (15,344,11,65,5,'C','P');
INSERT INTO ValorNutricional (idValorNutricional,calorias,proteinas,carbohidratos,grasas,vitaminas,minerales) VALUES (16,124,0,0,14,'A','Ca');
INSERT INTO ValorNutricional (idValorNutricional,calorias,proteinas,carbohidratos,grasas,vitaminas,minerales) VALUES (17,56,2,3,3,'B','F');
INSERT INTO ValorNutricional (idValorNutricional,calorias,proteinas,carbohidratos,grasas,vitaminas,minerales) VALUES (18,88,0,0,10,'C','Ca');
INSERT INTO ValorNutricional (idValorNutricional,calorias,proteinas,carbohidratos,grasas,vitaminas,minerales) VALUES (19,163,0,12,2,'A','P');
INSERT INTO ValorNutricional (idValorNutricional,calorias,proteinas,carbohidratos,grasas,vitaminas,minerales) VALUES (20,324,21,4,24,'B','P');



INSERT INTO Categoria(idCategoria,nombreCategoria,descripcion) VALUES (1,'Lacteos','Leche deslactosada');
INSERT INTO Categoria (idCategoria,nombreCategoria,descripcion) VALUES (2,'Endulzantes','Miel orgánica de abeja 500 grs');
INSERT INTO Categoria (idCategoria,nombreCategoria,descripcion) VALUES (3,'Cereales','Cereal organico de quinua, kiwicha y arroz');
INSERT INTO Categoria (idCategoria,nombreCategoria,descripcion) VALUES (4,'Harinas','Harina de almendras libre de gluten 250 grs');
INSERT INTO Categoria (idCategoria,nombreCategoria,descripcion) VALUES (5,'Mermeladas','Mermelada de arandanos 280 ML');
INSERT INTO Categoria (idCategoria,nombreCategoria,descripcion) VALUES (6,'Yogures','Yogurt griego natural 800 g');
INSERT INTO Categoria (idCategoria,nombreCategoria,descripcion) VALUES (7,'Chocolates','Cacao en polvo orgánico 150 grs');
INSERT INTO Categoria (idCategoria,nombreCategoria,descripcion) VALUES (8,'Endulzantes','Miel de panela con mix de frutas 400 grs');
INSERT INTO Categoria (idCategoria,nombreCategoria,descripcion) VALUES (9,'Cafés','Café tostado medio 250 grs');
INSERT INTO Categoria (idCategoria,nombreCategoria,descripcion) VALUES (10,'Mantequillas','Mantequillana vegana 100 grs');
INSERT INTO Categoria (idCategoria,nombreCategoria,descripcion) VALUES (11,'Cafés','Café premium - Alta montaña 250 grs');
INSERT INTO Categoria (idCategoria,nombreCategoria,descripcion) VALUES (12,'Snacks','Piña deshidratada 50 grs');
INSERT INTO Categoria (idCategoria,nombreCategoria,descripcion) VALUES (13,'Snacks','Maní con pasas 75 grs');
INSERT INTO Categoria (idCategoria,nombreCategoria,descripcion) VALUES (14,'Harinas','Cúrcuma en polvo, sin glúten 227 grs');
INSERT INTO Categoria (idCategoria,nombreCategoria,descripcion) VALUES (15,'Cereales','Quinua instantanea 300 grs');
INSERT INTO Categoria (idCategoria,nombreCategoria,descripcion) VALUES (16,'Aceites','Aceite de oliva extra virgen orgánico x 225 ML');
INSERT INTO Categoria (idCategoria,nombreCategoria,descripcion) VALUES (17,'Mantequillas','Mantequilla e maní x 200 grs');
INSERT INTO Categoria (idCategoria,nombreCategoria,descripcion) VALUES (18,'Aceites','Aceite de ajonjoli x 500 ML');
INSERT INTO Categoria (idCategoria,nombreCategoria,descripcion) VALUES (19,'Bebidas','Bebida de almendras x 1 LT');
INSERT INTO Categoria (idCategoria,nombreCategoria,descripcion) VALUES (20,'Quesos','Queso fresco x 500 grs');



INSERT INTO Producto (idProducto,idCategoria,idEmpresa,idValorNutricional,nombreProducto,precioUnitario,stock) VALUES (1,1,1,1,'Leche deslactosada',4.99,25);
INSERT INTO Producto (idProducto,idCategoria,idEmpresa,idValorNutricional,nombreProducto,precioUnitario,stock) VALUES (2,2,1,2,'Miel orgánica',30.99,15);
INSERT INTO Producto (idProducto,idCategoria,idEmpresa,idValorNutricional,nombreProducto,precioUnitario,stock) VALUES (3,3,3,3,'Cereal orgánico andino',17.99,23);
INSERT INTO Producto (idProducto,idCategoria,idEmpresa,idValorNutricional,nombreProducto,precioUnitario,stock) VALUES (4,4,4,4,'Harina de almendras',25.99,11);
INSERT INTO Producto (idProducto,idCategoria,idEmpresa,idValorNutricional,nombreProducto,precioUnitario,stock) VALUES (5,5,5,5,'Mermelada de arandanos',20.99,17);
INSERT INTO Producto (idProducto,idCategoria,idEmpresa,idValorNutricional,nombreProducto,precioUnitario,stock) VALUES (6,6,6,6,'Yogurt griego',6.99,20);
INSERT INTO Producto (idProducto,idCategoria,idEmpresa,idValorNutricional,nombreProducto,precioUnitario,stock) VALUES (7,7,10,7,'Cacao en polvo',15.99,5);
INSERT INTO Producto (idProducto,idCategoria,idEmpresa,idValorNutricional,nombreProducto,precioUnitario,stock) VALUES (8,8,8,8,'Miel de panela',22.99,12);
INSERT INTO Producto (idProducto,idCategoria,idEmpresa,idValorNutricional,nombreProducto,precioUnitario,stock) VALUES (9,9,5,9,'CaféLink',26.99,10);
INSERT INTO Producto (idProducto,idCategoria,idEmpresa,idValorNutricional,nombreProducto,precioUnitario,stock) VALUES (10,10,2,10,'Mantequilla vegana',15.99,8);
INSERT INTO Producto (idProducto,idCategoria,idEmpresa,idValorNutricional,nombreProducto,precioUnitario,stock) VALUES (11,11,2,11,'Café Premium',28.99,13);
INSERT INTO Producto (idProducto,idCategoria,idEmpresa,idValorNutricional,nombreProducto,precioUnitario,stock) VALUES (12,12,1,12,'Piña deshidratada',8.99,20);
INSERT INTO Producto (idProducto,idCategoria,idEmpresa,idValorNutricional,nombreProducto,precioUnitario,stock) VALUES (13,13,11,13,'Maní con pasas',3.99,35);
INSERT INTO Producto (idProducto,idCategoria,idEmpresa,idValorNutricional,nombreProducto,precioUnitario,stock) VALUES (14,14,7,14,'Curcuma en polvo',20.99,17);
INSERT INTO Producto (idProducto,idCategoria,idEmpresa,idValorNutricional,nombreProducto,precioUnitario,stock) VALUES (15,15,9,15,'Quinua instantanea',23.99,10);
INSERT INTO Producto (idProducto,idCategoria,idEmpresa,idValorNutricional,nombreProducto,precioUnitario,stock) VALUES (16,16,8,16,'Aceite de oliva ',29.99,18);
INSERT INTO Producto (idProducto,idCategoria,idEmpresa,idValorNutricional,nombreProducto,precioUnitario,stock) VALUES (17,17,11,17,'Mantequilla de maní',17.99,15);
INSERT INTO Producto (idProducto,idCategoria,idEmpresa,idValorNutricional,nombreProducto,precioUnitario,stock) VALUES (18,18,18,18,'Aceite de ajonjoli',41.99,18);
INSERT INTO Producto (idProducto,idCategoria,idEmpresa,idValorNutricional,nombreProducto,precioUnitario,stock) VALUES (19,19,18,19,'Bebida de almendras',21.99,16);
INSERT INTO Producto (idProducto,idCategoria,idEmpresa,idValorNutricional,nombreProducto,precioUnitario,stock) VALUES (20,20,3,20,'Queso fresco',34.99,11);



INSERT INTO Transporte (idTransporte,tipoTransporte,estado,capacidad) VALUES (1,'Bicicleta','Listo',3);
INSERT INTO Transporte (idTransporte,tipoTransporte,estado,capacidad) VALUES (2,'Bicicleta','Listo',3);
INSERT INTO Transporte (idTransporte,tipoTransporte,estado,capacidad) VALUES (3,'Motocicleta','Listo',5);
INSERT INTO Transporte (idTransporte,tipoTransporte,estado,capacidad) VALUES (4,'Motocicleta','Deshabilitado',5);
INSERT INTO Transporte (idTransporte,tipoTransporte,estado,capacidad) VALUES (5,'Motocicleta','Deshabilitado',5);
INSERT INTO Transporte (idTransporte,tipoTransporte,estado,capacidad) VALUES (6,'Motocicleta','Deshabilitado',5);
INSERT INTO Transporte (idTransporte,tipoTransporte,estado,capacidad) VALUES (7,'Motocicleta','Deshabilitado',5);
INSERT INTO Transporte (idTransporte,tipoTransporte,estado,capacidad) VALUES (8,'Motocicleta','Deshabilitado',5);
INSERT INTO Transporte (idTransporte,tipoTransporte,estado,capacidad) VALUES (9,'Motocicleta','En transito',5);
INSERT INTO Transporte (idTransporte,tipoTransporte,estado,capacidad) VALUES (10,'Motocicleta','En transito',5);
INSERT INTO Transporte (idTransporte,tipoTransporte,estado,capacidad) VALUES (11,'Bicicleta','En transito',3);
INSERT INTO Transporte (idTransporte,tipoTransporte,estado,capacidad) VALUES (12,'Bicicleta','En transito',3);
INSERT INTO Transporte (idTransporte,tipoTransporte,estado,capacidad) VALUES (13,'Motocicleta','En transito',5);
INSERT INTO Transporte (idTransporte,tipoTransporte,estado,capacidad) VALUES (14,'Motocicleta','En transito',5);
INSERT INTO Transporte (idTransporte,tipoTransporte,estado,capacidad) VALUES (15,'Bicicleta','Listo',3);
INSERT INTO Transporte (idTransporte,tipoTransporte,estado,capacidad) VALUES (16,'Bicicleta','Listo',3);
INSERT INTO Transporte (idTransporte,tipoTransporte,estado,capacidad) VALUES (17,'Bicicleta','Listo',3);
INSERT INTO Transporte (idTransporte,tipoTransporte,estado,capacidad) VALUES (18,'Bicicleta','Listo',3);
INSERT INTO Transporte (idTransporte,tipoTransporte,estado,capacidad) VALUES (19,'Motocicleta','Listo',5);
INSERT INTO Transporte (idTransporte,tipoTransporte,estado,capacidad) VALUES (20,'Motocicleta','Listo',5);



INSERT INTO Repartidor (idRepartidor,idTransporte,nombreRepartidor,telefonoRepartidor,promedioValoracion) VALUES (1,1,'Julio Perez',948949494,3.5);
INSERT INTO Repartidor (idRepartidor,idTransporte,nombreRepartidor,telefonoRepartidor,promedioValoracion) VALUES (2,2,'Noami Denyer',983268660,2.5);
INSERT INTO Repartidor (idRepartidor,idTransporte,nombreRepartidor,telefonoRepartidor,promedioValoracion) VALUES (3,3,'Natalya Early',967333924,4.7);
INSERT INTO Repartidor (idRepartidor,idTransporte,nombreRepartidor,telefonoRepartidor,promedioValoracion) VALUES (4,4,'Georgine Lounds',932987032,5);
INSERT INTO Repartidor (idRepartidor,idTransporte,nombreRepartidor,telefonoRepartidor,promedioValoracion) VALUES (5,5,'Rafael Ginnane',980289069,1.9);
INSERT INTO Repartidor (idRepartidor,idTransporte,nombreRepartidor,telefonoRepartidor,promedioValoracion) VALUES (6,6,'Maje Braddock',967314237,3);
INSERT INTO Repartidor (idRepartidor,idTransporte,nombreRepartidor,telefonoRepartidor,promedioValoracion) VALUES (7,7,'Sonni Rodell',940513979,3.5);
INSERT INTO Repartidor (idRepartidor,idTransporte,nombreRepartidor,telefonoRepartidor,promedioValoracion) VALUES (8,8,'Nita Capron',918685464,4.9);
INSERT INTO Repartidor (idRepartidor,idTransporte,nombreRepartidor,telefonoRepartidor,promedioValoracion) VALUES (9,9,'Giraldo Jerg',930902520,4.2);
INSERT INTO Repartidor (idRepartidor,idTransporte,nombreRepartidor,telefonoRepartidor,promedioValoracion) VALUES (10,10,'Inessa Walkden',947871134,4);
INSERT INTO Repartidor (idRepartidor,idTransporte,nombreRepartidor,telefonoRepartidor,promedioValoracion) VALUES (11,11,'Fergus Ranshaw',980185037,2.9);
INSERT INTO Repartidor (idRepartidor,idTransporte,nombreRepartidor,telefonoRepartidor,promedioValoracion) VALUES (12,12,'Cletis Moro',916984269,3.1);
INSERT INTO Repartidor (idRepartidor,idTransporte,nombreRepartidor,telefonoRepartidor,promedioValoracion) VALUES (13,13,'Cicily Alexander',999101254,3);
INSERT INTO Repartidor (idRepartidor,idTransporte,nombreRepartidor,telefonoRepartidor,promedioValoracion) VALUES (14,14,'Dominic Beever',974224473,4.1);
INSERT INTO Repartidor (idRepartidor,idTransporte,nombreRepartidor,telefonoRepartidor,promedioValoracion) VALUES (15,15,'Ilysa Dougher',962269697,4.5);
INSERT INTO Repartidor (idRepartidor,idTransporte,nombreRepartidor,telefonoRepartidor,promedioValoracion) VALUES (16,16,'Woodman Abson',945906320,2.7);
INSERT INTO Repartidor (idRepartidor,idTransporte,nombreRepartidor,telefonoRepartidor,promedioValoracion) VALUES (17,17,'Salmon Lehrian',970595167,2.9);
INSERT INTO Repartidor (idRepartidor,idTransporte,nombreRepartidor,telefonoRepartidor,promedioValoracion) VALUES (18,18,'Stephanie Pouck',988549735,3.1);
INSERT INTO Repartidor (idRepartidor,idTransporte,nombreRepartidor,telefonoRepartidor,promedioValoracion) VALUES (19,19,'Sisile Coogan',976571661,3.9);
INSERT INTO Repartidor (idRepartidor,idTransporte,nombreRepartidor,telefonoRepartidor,promedioValoracion) VALUES (20,20,'Marnia Gummery',986577757,2.7);



INSERT INTO Orden (idOrden,idConsumidor,idRepartidor,fechaOrden,medioDePago) VALUES (1,1,1,'2022-11-19','Tarjeta');
INSERT INTO Orden (idOrden,idConsumidor,idRepartidor,fechaOrden,medioDePago) VALUES (2,1,1,'2022-10-26','Efectivo');
INSERT INTO Orden (idOrden,idConsumidor,idRepartidor,fechaOrden,medioDePago) VALUES (3,1,1,'2022-01-12','Transferencia');
INSERT INTO Orden (idOrden,idConsumidor,idRepartidor,fechaOrden,medioDePago) VALUES (4,4,1,'2022-02-22','Tarjeta');
INSERT INTO Orden (idOrden,idConsumidor,idRepartidor,fechaOrden,medioDePago) VALUES (5,5,4,'2022-04-20','Efectivo');
INSERT INTO Orden (idOrden,idConsumidor,idRepartidor,fechaOrden,medioDePago) VALUES (6,5,4,'2022-06-30','Transferencia');
INSERT INTO Orden (idOrden,idConsumidor,idRepartidor,fechaOrden,medioDePago) VALUES (7,5,4,'2022-06-11','Tarjeta');
INSERT INTO Orden (idOrden,idConsumidor,idRepartidor,fechaOrden,medioDePago) VALUES (8,8,2,'2022-09-13','Efectivo');
INSERT INTO Orden (idOrden,idConsumidor,idRepartidor,fechaOrden,medioDePago) VALUES (9,8,2,'2022-05-13','Transferencia');
INSERT INTO Orden (idOrden,idConsumidor,idRepartidor,fechaOrden,medioDePago) VALUES (10,10,2,'2022-06-21','Tarjeta');
INSERT INTO Orden (idOrden,idConsumidor,idRepartidor,fechaOrden,medioDePago) VALUES (11,11,10,'2022-05-20','Efectivo');
INSERT INTO Orden (idOrden,idConsumidor,idRepartidor,fechaOrden,medioDePago) VALUES (12,12,10,'2022-04-27','Transferencia');
INSERT INTO Orden (idOrden,idConsumidor,idRepartidor,fechaOrden,medioDePago) VALUES (13,12,10,'2022-03-11','Tarjeta');
INSERT INTO Orden (idOrden,idConsumidor,idRepartidor,fechaOrden,medioDePago) VALUES (14,12,14,'2022-03-12','Efectivo');
INSERT INTO Orden (idOrden,idConsumidor,idRepartidor,fechaOrden,medioDePago) VALUES (15,15,15,'2022-03-13','Transferencia');
INSERT INTO Orden (idOrden,idConsumidor,idRepartidor,fechaOrden,medioDePago) VALUES (16,16,15,'2022-03-14','Tarjeta');
INSERT INTO Orden (idOrden,idConsumidor,idRepartidor,fechaOrden,medioDePago) VALUES (17,2,17,'2022-03-15','Efectivo');
INSERT INTO Orden (idOrden,idConsumidor,idRepartidor,fechaOrden,medioDePago) VALUES (18,2,18,'2022-03-16','Transferencia');
INSERT INTO Orden (idOrden,idConsumidor,idRepartidor,fechaOrden,medioDePago) VALUES (19,20,19,'2022-03-17','Tarjeta');
INSERT INTO Orden (idOrden,idConsumidor,idRepartidor,fechaOrden,medioDePago) VALUES (20,20,20,'2022-03-18','Efectivo');




INSERT INTO OrdenDetalles (idOrden,idProducto,descuento,cantidadProducto,precioTotal) VALUES (1,1,9,3,5.97);
INSERT INTO OrdenDetalles (idOrden,idProducto,descuento,cantidadProducto,precioTotal) VALUES (1,20,2,1,32.99);
INSERT INTO OrdenDetalles (idOrden,idProducto,descuento,cantidadProducto,precioTotal) VALUES (1,8,2,4,89.96);
INSERT INTO OrdenDetalles (idOrden,idProducto,descuento,cantidadProducto,precioTotal) VALUES (2,2,10,2,51.98);
INSERT INTO OrdenDetalles (idOrden,idProducto,descuento,cantidadProducto,precioTotal) VALUES (2,19,8,3,57.97);
INSERT INTO OrdenDetalles (idOrden,idProducto,descuento,cantidadProducto,precioTotal) VALUES (3,3,8,3,45.97);
INSERT INTO OrdenDetalles (idOrden,idProducto,descuento,cantidadProducto,precioTotal) VALUES (3,13,3,3,8.97);
INSERT INTO OrdenDetalles (idOrden,idProducto,descuento,cantidadProducto,precioTotal) VALUES (4,4,8,2,43.98);
INSERT INTO OrdenDetalles (idOrden,idProducto,descuento,cantidadProducto,precioTotal) VALUES (4,17,2,1,15.99);
INSERT INTO OrdenDetalles (idOrden,idProducto,descuento,cantidadProducto,precioTotal) VALUES (5,5,4,3,58.97);
INSERT INTO OrdenDetalles (idOrden,idProducto,descuento,cantidadProducto,precioTotal) VALUES (5,16,8,4,111.96);
INSERT INTO OrdenDetalles (idOrden,idProducto,descuento,cantidadProducto,precioTotal) VALUES (5,6,4,3,16.97);
INSERT INTO OrdenDetalles (idOrden,idProducto,descuento,cantidadProducto,precioTotal) VALUES (6,6,9,5,25.95);
INSERT INTO OrdenDetalles (idOrden,idProducto,descuento,cantidadProducto,precioTotal) VALUES (6,15,8,4,87.96);
INSERT INTO OrdenDetalles (idOrden,idProducto,descuento,cantidadProducto,precioTotal) VALUES (6,12,5,5,39.95);
INSERT INTO OrdenDetalles (idOrden,idProducto,descuento,cantidadProducto,precioTotal) VALUES (7,7,4,2,27.98);
INSERT INTO OrdenDetalles (idOrden,idProducto,descuento,cantidadProducto,precioTotal) VALUES (8,8,9,2,36.98);
INSERT INTO OrdenDetalles (idOrden,idProducto,descuento,cantidadProducto,precioTotal) VALUES (8,13,2,2,5.98);
INSERT INTO OrdenDetalles (idOrden,idProducto,descuento,cantidadProducto,precioTotal) VALUES (9,9,7,5,127.95);
INSERT INTO OrdenDetalles (idOrden,idProducto,descuento,cantidadProducto,precioTotal) VALUES (9,4,6,3,71.97);
INSERT INTO OrdenDetalles (idOrden,idProducto,descuento,cantidadProducto,precioTotal) VALUES (10,10,10,1,5.99);
INSERT INTO OrdenDetalles (idOrden,idProducto,descuento,cantidadProducto,precioTotal) VALUES (10,7,6,3,41.97);
INSERT INTO OrdenDetalles (idOrden,idProducto,descuento,cantidadProducto,precioTotal) VALUES (11,11,5,4,110.96);
INSERT INTO OrdenDetalles (idOrden,idProducto,descuento,cantidadProducto,precioTotal) VALUES (11,10,10,2,21.98);
INSERT INTO OrdenDetalles (idOrden,idProducto,descuento,cantidadProducto,precioTotal) VALUES (11,17,7,2,28.98);
INSERT INTO OrdenDetalles (idOrden,idProducto,descuento,cantidadProducto,precioTotal) VALUES (12,12,4,2,13.98);
INSERT INTO OrdenDetalles (idOrden,idProducto,descuento,cantidadProducto,precioTotal) VALUES (12,9,8,3,72.97);
INSERT INTO OrdenDetalles (idOrden,idProducto,descuento,cantidadProducto,precioTotal) VALUES (13,13,2,5,17.95);
INSERT INTO OrdenDetalles (idOrden,idProducto,descuento,cantidadProducto,precioTotal) VALUES (13,8,3,1,19.99);
INSERT INTO OrdenDetalles (idOrden,idProducto,descuento,cantidadProducto,precioTotal) VALUES (13,2,8,2,53.98);
INSERT INTO OrdenDetalles (idOrden,idProducto,descuento,cantidadProducto,precioTotal) VALUES (14,14,8,3,54.97);
INSERT INTO OrdenDetalles (idOrden,idProducto,descuento,cantidadProducto,precioTotal) VALUES (14,7,4,1,11.99);
INSERT INTO OrdenDetalles (idOrden,idProducto,descuento,cantidadProducto,precioTotal) VALUES (14,11,8,5,136.95);
INSERT INTO OrdenDetalles (idOrden,idProducto,descuento,cantidadProducto,precioTotal) VALUES (15,15,3,4,92.96);
INSERT INTO OrdenDetalles (idOrden,idProducto,descuento,cantidadProducto,precioTotal) VALUES (15,6,8,2,5.98);
INSERT INTO OrdenDetalles (idOrden,idProducto,descuento,cantidadProducto,precioTotal) VALUES (15,10,9,2,22.98);
INSERT INTO OrdenDetalles (idOrden,idProducto,descuento,cantidadProducto,precioTotal) VALUES (16,16,8,1,21.99);
INSERT INTO OrdenDetalles (idOrden,idProducto,descuento,cantidadProducto,precioTotal) VALUES (16,5,8,4,75.96);
INSERT INTO OrdenDetalles (idOrden,idProducto,descuento,cantidadProducto,precioTotal) VALUES (16,14,9,4,74.96);
INSERT INTO OrdenDetalles (idOrden,idProducto,descuento,cantidadProducto,precioTotal) VALUES (17,17,2,2,33.98);
INSERT INTO OrdenDetalles (idOrden,idProducto,descuento,cantidadProducto,precioTotal) VALUES (18,18,9,5,200.95);
INSERT INTO OrdenDetalles (idOrden,idProducto,descuento,cantidadProducto,precioTotal) VALUES (18,3,6,4,65.96);
INSERT INTO OrdenDetalles (idOrden,idProducto,descuento,cantidadProducto,precioTotal) VALUES (18,19,9,3,56.97);
INSERT INTO OrdenDetalles (idOrden,idProducto,descuento,cantidadProducto,precioTotal) VALUES (19,19,2,5,107.95);
INSERT INTO OrdenDetalles (idOrden,idProducto,descuento,cantidadProducto,precioTotal) VALUES (19,2,2,1,28.99);
INSERT INTO OrdenDetalles (idOrden,idProducto,descuento,cantidadProducto,precioTotal) VALUES (19,20,9,3,95.97);
INSERT INTO OrdenDetalles (idOrden,idProducto,descuento,cantidadProducto,precioTotal) VALUES (20,20,4,5,170.95);
INSERT INTO OrdenDetalles (idOrden,idProducto,descuento,cantidadProducto,precioTotal) VALUES (20,9,10,3,70.97);


