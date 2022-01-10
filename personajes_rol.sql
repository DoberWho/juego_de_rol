CREATE SCHEMA juego_de_rol;

CREATE TABLE juego_de_rol.capitulos ( 
	id                   int UNSIGNED NOT NULL  AUTO_INCREMENT  PRIMARY KEY,
	titulo               varchar(150)  NOT NULL    ,
	description          text      ,
	cuando               varchar(100)      ,
	orden                tinyint UNSIGNED     
 );

CREATE TABLE juego_de_rol.caracteristicas_rol ( 
	id                   int UNSIGNED NOT NULL  AUTO_INCREMENT  PRIMARY KEY,
	fuerza               int UNSIGNED     ,
	destreza             int UNSIGNED     ,
	constitucion         int UNSIGNED     ,
	inteligencia         int UNSIGNED     ,
	sabiduria            int UNSIGNED     ,
	carisma              int UNSIGNED     
 ) engine=InnoDB;

CREATE TABLE juego_de_rol.carasteristicas_fisicas ( 
	id                   int UNSIGNED NOT NULL  AUTO_INCREMENT  PRIMARY KEY,
	altura               int UNSIGNED     ,
	peso                 int UNSIGNED     ,
	genero               tinyint UNSIGNED  DEFAULT 0
 ) engine=InnoDB;

ALTER TABLE juego_de_rol.carasteristicas_fisicas COMMENT 'gasgasf';

ALTER TABLE juego_de_rol.carasteristicas_fisicas MODIFY genero int UNSIGNED  DEFAULT 0  COMMENT '0 - masculino.\n1 - femenino.\n2 - otros';

CREATE TABLE juego_de_rol.habilidades ( 
	id                   int UNSIGNED NOT NULL  AUTO_INCREMENT  PRIMARY KEY,
	nombre               varchar(150)  NOT NULL    ,
	descripcion          varchar(250)      
 ) engine=InnoDB;

CREATE TABLE juego_de_rol.lugares ( 
	id                   int UNSIGNED NOT NULL  AUTO_INCREMENT  PRIMARY KEY,
	nonbre               varchar(150)  NOT NULL    ,
	descripcion          text      
 ) engine=InnoDB;

CREATE TABLE juego_de_rol.persona ( 
	id                   int UNSIGNED NOT NULL  AUTO_INCREMENT  PRIMARY KEY,
	nombre               varchar(150)  NOT NULL    ,
	apellidos            varchar(150)  NOT NULL    ,
	apodo                varchar(150)      
 ) engine=InnoDB;

CREATE TABLE juego_de_rol.raza ( 
	id                   int UNSIGNED NOT NULL  AUTO_INCREMENT  PRIMARY KEY,
	nombre               varchar(150)  NOT NULL    
 );

CREATE TABLE juego_de_rol.tipo_relacion ( 
	id                   int UNSIGNED NOT NULL  AUTO_INCREMENT  PRIMARY KEY,
	nombre               varchar(150)  NOT NULL    
 ) engine=InnoDB;

CREATE TABLE juego_de_rol.trabajo ( 
	id                   int UNSIGNED NOT NULL  AUTO_INCREMENT  PRIMARY KEY,
	nombre               varchar(150)  NOT NULL    
 ) engine=InnoDB;

CREATE TABLE juego_de_rol.anecdotas ( 
	id                   int UNSIGNED NOT NULL  AUTO_INCREMENT  PRIMARY KEY,
	titulo               varchar(150)  NOT NULL    ,
	description          text      ,
	id_persona           int UNSIGNED     ,
	cuando               varchar(150)      
 ) engine=InnoDB;

CREATE TABLE juego_de_rol.mn_anecdota_capitulo ( 
	id_anecdota          int UNSIGNED     ,
	id_capitulo          int UNSIGNED     
 );

CREATE TABLE juego_de_rol.mn_anecdotas_relacionadas ( 
	id_anecdota          int UNSIGNED     ,
	id_relacionada       int UNSIGNED     
 ) engine=InnoDB;

CREATE TABLE juego_de_rol.mn_lugares_anecdota ( 
	id_lugar             int UNSIGNED     ,
	id_anecdota          int UNSIGNED     
 ) engine=InnoDB;

CREATE TABLE juego_de_rol.personaje ( 
	id                   int UNSIGNED NOT NULL  AUTO_INCREMENT  PRIMARY KEY,
	nombre               varchar(150)  NOT NULL    ,
	apodo                varchar(100)      ,
	id_raza              int UNSIGNED     ,
	id_trabajo           int UNSIGNED     ,
	edad                 int UNSIGNED     ,
	id_persona           int UNSIGNED     ,
	descripcion          text      ,
	id_fisicas           int UNSIGNED     ,
	id_rol               int UNSIGNED     
 ) engine=InnoDB;

CREATE TABLE juego_de_rol.relacion ( 
	id_personaje         int UNSIGNED     ,
	id_relacionado       int UNSIGNED     ,
	id_tipo_relacion     int UNSIGNED     
 ) engine=InnoDB;

CREATE TABLE juego_de_rol.mn_habilidad_personaje ( 
	id_personaje         int UNSIGNED     ,
	id_habilidad         int UNSIGNED     
 ) engine=InnoDB;

CREATE TABLE juego_de_rol.mn_personaje_anectdota ( 
	id_anecdota          int UNSIGNED     ,
	id_personaje         int UNSIGNED     
 ) engine=InnoDB;

CREATE TABLE juego_de_rol.mn_personaje_capitulo ( 
	id_capitulo          int UNSIGNED     ,
	id_personaje         int UNSIGNED     
 );

ALTER TABLE juego_de_rol.anecdotas ADD CONSTRAINT fk_anecdotas_persona FOREIGN KEY ( id_persona ) REFERENCES juego_de_rol.persona( id ) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE juego_de_rol.mn_anecdota_capitulo ADD CONSTRAINT fk_mn_personaje_anectdota_anecdotas_0 FOREIGN KEY ( id_anecdota ) REFERENCES juego_de_rol.anecdotas( id ) ON DELETE CASCADE ON UPDATE NO ACTION;

ALTER TABLE juego_de_rol.mn_anecdota_capitulo ADD CONSTRAINT fk_mn_personaje_anectdota_0_capitulos FOREIGN KEY ( id_capitulo ) REFERENCES juego_de_rol.capitulos( id ) ON DELETE CASCADE ON UPDATE NO ACTION;

ALTER TABLE juego_de_rol.mn_anecdotas_relacionadas ADD CONSTRAINT fk_mn_anecdotas_relacionadas_anecdotas FOREIGN KEY ( id_anecdota ) REFERENCES juego_de_rol.anecdotas( id ) ON DELETE CASCADE ON UPDATE NO ACTION;

ALTER TABLE juego_de_rol.mn_anecdotas_relacionadas ADD CONSTRAINT fk_mn_anecdotas_relacionadas_anecdotas_0 FOREIGN KEY ( id_relacionada ) REFERENCES juego_de_rol.anecdotas( id ) ON DELETE CASCADE ON UPDATE NO ACTION;

ALTER TABLE juego_de_rol.mn_habilidad_personaje ADD CONSTRAINT fk_mn_habilidad_personaje_habilidades FOREIGN KEY ( id_habilidad ) REFERENCES juego_de_rol.habilidades( id ) ON DELETE CASCADE ON UPDATE NO ACTION;

ALTER TABLE juego_de_rol.mn_habilidad_personaje ADD CONSTRAINT fk_mn_habilidad_personaje_personaje FOREIGN KEY ( id_personaje ) REFERENCES juego_de_rol.personaje( id ) ON DELETE CASCADE ON UPDATE NO ACTION;

ALTER TABLE juego_de_rol.mn_lugares_anecdota ADD CONSTRAINT fk_mn_lugares_anecdota_lugares FOREIGN KEY ( id_lugar ) REFERENCES juego_de_rol.lugares( id ) ON DELETE CASCADE ON UPDATE NO ACTION;

ALTER TABLE juego_de_rol.mn_lugares_anecdota ADD CONSTRAINT fk_mn_lugares_anecdota_anecdotas FOREIGN KEY ( id_anecdota ) REFERENCES juego_de_rol.anecdotas( id ) ON DELETE CASCADE ON UPDATE NO ACTION;

ALTER TABLE juego_de_rol.mn_personaje_anectdota ADD CONSTRAINT fk_mn_personaje_anectdota_anecdotas FOREIGN KEY ( id_anecdota ) REFERENCES juego_de_rol.anecdotas( id ) ON DELETE CASCADE ON UPDATE NO ACTION;

ALTER TABLE juego_de_rol.mn_personaje_anectdota ADD CONSTRAINT fk_mn_personaje_anectdota_personaje FOREIGN KEY ( id_personaje ) REFERENCES juego_de_rol.personaje( id ) ON DELETE CASCADE ON UPDATE NO ACTION;

ALTER TABLE juego_de_rol.mn_personaje_capitulo ADD CONSTRAINT fk_mn_personaje_anectdota_personaje_0 FOREIGN KEY ( id_personaje ) REFERENCES juego_de_rol.personaje( id ) ON DELETE CASCADE ON UPDATE NO ACTION;

ALTER TABLE juego_de_rol.mn_personaje_capitulo ADD CONSTRAINT fk_mn_personaje_capitulo_capitulos FOREIGN KEY ( id_capitulo ) REFERENCES juego_de_rol.capitulos( id ) ON DELETE CASCADE ON UPDATE NO ACTION;

ALTER TABLE juego_de_rol.personaje ADD CONSTRAINT fk_personaje_trabajo FOREIGN KEY ( id_trabajo ) REFERENCES juego_de_rol.trabajo( id ) ON DELETE SET NULL ON UPDATE NO ACTION;

ALTER TABLE juego_de_rol.personaje ADD CONSTRAINT fk_personaje_raza FOREIGN KEY ( id_raza ) REFERENCES juego_de_rol.raza( id ) ON DELETE SET NULL ON UPDATE NO ACTION;

ALTER TABLE juego_de_rol.personaje ADD CONSTRAINT fk_personaje_persona FOREIGN KEY ( id_persona ) REFERENCES juego_de_rol.persona( id ) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE juego_de_rol.personaje ADD CONSTRAINT fk_personaje_caracteristicas_rol FOREIGN KEY ( id_rol ) REFERENCES juego_de_rol.caracteristicas_rol( id ) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE juego_de_rol.personaje ADD CONSTRAINT fk_personaje_carasteristicas_fisicas FOREIGN KEY ( id_fisicas ) REFERENCES juego_de_rol.carasteristicas_fisicas( id ) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE juego_de_rol.relacion ADD CONSTRAINT fk_mn_personaje_personaje_personaje FOREIGN KEY ( id_personaje ) REFERENCES juego_de_rol.personaje( id ) ON DELETE CASCADE ON UPDATE NO ACTION;

ALTER TABLE juego_de_rol.relacion ADD CONSTRAINT fk_mn_personaje_personaje_personaje_0 FOREIGN KEY ( id_relacionado ) REFERENCES juego_de_rol.personaje( id ) ON DELETE CASCADE ON UPDATE NO ACTION;

ALTER TABLE juego_de_rol.relacion ADD CONSTRAINT fk_relacion_tipo_relacion FOREIGN KEY ( id_tipo_relacion ) REFERENCES juego_de_rol.tipo_relacion( id ) ON DELETE CASCADE ON UPDATE NO ACTION;

