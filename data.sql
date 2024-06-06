CREATE TABLE `accounts` (
	`id_account` INT NOT NULL AUTO_INCREMENT UNIQUE,
	`firstname` VARCHAR(50) NOT NULL,
	`lastname` VARCHAR(50) NOT NULL,
	`birth` DATE NOT NULL,
	`gender` ENUM("men", "women", "other"),
	`id_country` INT NOT NULL,
	`email` VARCHAR(100) NOT NULL,
	`billing` VARCHAR(100) NOT NULL,
	`password` VARCHAR(50) NOT NULL,
	PRIMARY KEY(`id_account`)
);
CREATE INDEX `index_0`
ON `accounts` (`id_account`);

CREATE TABLE `profils` (
	`id_profil` INT NOT NULL AUTO_INCREMENT UNIQUE,
	`id_account` INT NOT NULL,
	`avatar` VARCHAR(100) NOT NULL,
	`creation` DATE,
	`pseudo` VARCHAR(30) NOT NULL,
	`type` ENUM("child", "adult") NOT NULL,
	`id_language` INT,
	PRIMARY KEY(`id_profil`)
);
CREATE INDEX `index_1`
ON `profils` (`id_profil`);

CREATE TABLE `video_file` (
	`id_video_file` INT NOT NULL AUTO_INCREMENT UNIQUE,
	`file_name` VARCHAR(30) NOT NULL,
	`id_shop` INT,
	`id_file_transcription` INT NOT NULL,
	`id_obj` INT NOT NULL,
	PRIMARY KEY(`id_video_file`)
);
CREATE INDEX `index_2`
ON `video_file` (`id_video_file`);

CREATE TABLE `countries` (
	`id_country` INT NOT NULL,
	`name` VARCHAR(50) NOT NULL UNIQUE,
	`code` VARCHAR(2) NOT NULL,
	PRIMARY KEY(`id_country`)
);
CREATE INDEX `index_3`
ON `countries` (`id_country`);

CREATE TABLE `productions` (
	`id_production` INT NOT NULL AUTO_INCREMENT UNIQUE,
	`name` VARCHAR(255) NOT NULL,
	`id_country` INT NOT NULL,
	`id_obj` INT NOT NULL,
	PRIMARY KEY(`id_production`)
);
CREATE INDEX `index_4`
ON `productions` (`id_production`);

CREATE TABLE `songs` (
	`id_song` INT NOT NULL AUTO_INCREMENT UNIQUE,
	`songtitle` VARCHAR(255) NOT NULL,
	`year` INT NOT NULL,
	PRIMARY KEY(`id_song`)
);
CREATE INDEX `index_5`
ON `songs` (`id_song`);

CREATE TABLE `shops` (
	`id_shop` INT NOT NULL AUTO_INCREMENT UNIQUE,
	`url` VARCHAR(255) NOT NULL,
	PRIMARY KEY(`id_shop`)
);
CREATE INDEX `index_6`
ON `shops` (`id_shop`);

CREATE TABLE `types_objet` (
	`id_type_obj` INT NOT NULL AUTO_INCREMENT UNIQUE,
	`name` VARCHAR(255) NOT NULL,
	PRIMARY KEY(`id_type_obj`)
);
CREATE INDEX `index_7`
ON `types_objet` (`id_type_obj`);

CREATE TABLE `objects` (
	`id_obj` INT NOT NULL AUTO_INCREMENT UNIQUE,
	`id_type_obj` INT NOT NULL,
	`id_genre` INT,
	`name` VARCHAR(255) NOT NULL,
	PRIMARY KEY(`id_obj`)
);
CREATE INDEX `index_8`
ON `objects` (`id_obj`);

CREATE TABLE `asso_objects` (
	`id_asso_obj` INT NOT NULL AUTO_INCREMENT UNIQUE,
	`id_obj_parent` INT NOT NULL,
	`id_obj_enfant` INT NOT NULL,
	PRIMARY KEY(`id_asso_obj`)
);
CREATE INDEX `index_9`
ON `asso_objects` (`id_asso_obj`);

CREATE TABLE `type_roles` (
	`id_role` INT NOT NULL AUTO_INCREMENT UNIQUE,
	`name` VARCHAR(255) NOT NULL,
	PRIMARY KEY(`id_role`)
);
CREATE INDEX `index_10`
ON `type_roles` (`id_role`);

CREATE TABLE `people` (
	`id_people` INT NOT NULL AUTO_INCREMENT UNIQUE,
	`name` VARCHAR(255) NOT NULL,
	`id_country` INT NOT NULL,
	PRIMARY KEY(`id_people`)
);
CREATE INDEX `index_11`
ON `people` (`id_people`);

CREATE TABLE `asso_objects_participants_roles` (
	`id_asso` INT NOT NULL AUTO_INCREMENT UNIQUE,
	`id_obj` INT,
	`id_role` INT,
	`id_people` INT,
	PRIMARY KEY(`id_asso`)
);
CREATE INDEX `index_12`
ON `asso_objects_participants_roles` (`id_asso`);

CREATE TABLE `genres` (
	`id_genre` INT NOT NULL AUTO_INCREMENT UNIQUE,
	`name` VARCHAR(255),
	PRIMARY KEY(`id_genre`)
);
CREATE INDEX `index_13`
ON `genres` (`id_genre`);

CREATE TABLE `asso_genres_objects` (
	`id_asso` INT NOT NULL AUTO_INCREMENT UNIQUE,
	`id_genre` INT NOT NULL,
	`id_obj` INT NOT NULL,
	PRIMARY KEY(`id_asso`)
);
CREATE INDEX `index_14`
ON `asso_genres_objects` (`id_asso`);

CREATE TABLE `types_transcriptions` (
	`id_type_transcription` INT NOT NULL AUTO_INCREMENT UNIQUE,
	`name` VARCHAR(255) NOT NULL,
	PRIMARY KEY(`id_type_transcription`)
);
CREATE INDEX `index_15`
ON `types_transcriptions` (`id_type_transcription`);

CREATE TABLE `tech_languages` (
	`id_tech_language` INT NOT NULL AUTO_INCREMENT UNIQUE,
	`id_type_transcription` INT NOT NULL,
	`id_language` INT NOT NULL,
	PRIMARY KEY(`id_tech_language`)
);
CREATE INDEX `index_16`
ON `tech_languages` (`id_tech_language`);

CREATE TABLE `languages` (
	`id_language` INT NOT NULL AUTO_INCREMENT UNIQUE,
	`name` VARCHAR(255),
	PRIMARY KEY(`id_language`)
);
CREATE INDEX `index_17`
ON `languages` (`id_language`);

CREATE TABLE `qualities` (
	`id_quality` INT NOT NULL AUTO_INCREMENT UNIQUE,
	`name` VARCHAR(255) NOT NULL,
	PRIMARY KEY(`id_quality`)
);
CREATE INDEX `index_18`
ON `qualities` (`id_quality`);

CREATE TABLE `tech_qualities` (
	`id_tech_quality` INT NOT NULL AUTO_INCREMENT UNIQUE,
	`id_quality` INT,
	`id_type_transcription` INT,
	PRIMARY KEY(`id_tech_quality`)
);
CREATE INDEX `index_19`
ON `tech_qualities` (`id_tech_quality`);

CREATE TABLE `files_transcriptions` (
	`id_file_transcription` INT NOT NULL AUTO_INCREMENT UNIQUE,
	`id_tech_quality` INT NOT NULL,
	`id_tech_language` INT NOT NULL,
	PRIMARY KEY(`id_file_transcription`)
);
CREATE INDEX `index_20`
ON `files_transcriptions` (`id_file_transcription`);

CREATE TABLE `asso_objects_songs` (
	`id_asso` INT NOT NULL AUTO_INCREMENT UNIQUE,
	`id_obj` INT NOT NULL,
	`id_song` INT,
	PRIMARY KEY(`id_asso`)
);
CREATE INDEX `index_21`
ON `asso_objects_songs` (`id_asso`);

CREATE TABLE `asso_people_songs` (
	`id_asso` INT NOT NULL AUTO_INCREMENT UNIQUE,
	`id_people` INT,
	`id_song` INT,
	PRIMARY KEY(`id_asso`)
);
CREATE INDEX `index_22`
ON `asso_people_songs` (`id_asso`);

CREATE TABLE `asso_productions_people` (
	`id_asso` INT NOT NULL AUTO_INCREMENT UNIQUE,
	`id_production` INT NOT NULL,
	`id_people` INT NOT NULL,
	PRIMARY KEY(`id_asso`)
);
CREATE INDEX `index_23`
ON `asso_productions_people` (`id_asso`);

ALTER TABLE `profils`
ADD FOREIGN KEY(`id_account`) REFERENCES `accounts`(`id_account`)
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE `accounts`
ADD FOREIGN KEY(`id_country`) REFERENCES `countries`(`id_country`)
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE `objects`
ADD FOREIGN KEY(`id_type_obj`) REFERENCES `types_objet`(`id_type_obj`)
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE `asso_objects`
ADD FOREIGN KEY(`id_obj_parent`) REFERENCES `objects`(`id_type_obj`)
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE `asso_objects`
ADD FOREIGN KEY(`id_obj_enfant`) REFERENCES `objects`(`id_type_obj`)
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE `asso_objects_participants_roles`
ADD FOREIGN KEY(`id_obj`) REFERENCES `objects`(`id_obj`)
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE `asso_objects_participants_roles`
ADD FOREIGN KEY(`id_role`) REFERENCES `type_roles`(`id_role`)
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE `asso_objects_participants_roles`
ADD FOREIGN KEY(`id_people`) REFERENCES `people`(`id_people`)
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE `asso_genres_objects`
ADD FOREIGN KEY(`id_obj`) REFERENCES `objects`(`id_obj`)
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE `asso_genres_objects`
ADD FOREIGN KEY(`id_genre`) REFERENCES `genres`(`id_genre`)
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE `tech_languages`
ADD FOREIGN KEY(`id_language`) REFERENCES `languages`(`id_language`)
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE `tech_languages`
ADD FOREIGN KEY(`id_type_transcription`) REFERENCES `types_transcriptions`(`id_type_transcription`)
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE `tech_qualities`
ADD FOREIGN KEY(`id_type_transcription`) REFERENCES `types_transcriptions`(`id_type_transcription`)
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE `tech_qualities`
ADD FOREIGN KEY(`id_quality`) REFERENCES `qualities`(`id_quality`)
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE `video_file`
ADD FOREIGN KEY(`id_shop`) REFERENCES `shops`(`id_shop`)
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE `files_transcriptions`
ADD FOREIGN KEY(`id_tech_language`) REFERENCES `tech_languages`(`id_tech_language`)
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE `files_transcriptions`
ADD FOREIGN KEY(`id_tech_quality`) REFERENCES `tech_qualities`(`id_tech_quality`)
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE `video_file`
ADD FOREIGN KEY(`id_file_transcription`) REFERENCES `files_transcriptions`(`id_file_transcription`)
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE `video_file`
ADD FOREIGN KEY(`id_obj`) REFERENCES `objects`(`id_obj`)
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE `asso_objects_songs`
ADD FOREIGN KEY(`id_song`) REFERENCES `songs`(`id_song`)
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE `asso_objects_songs`
ADD FOREIGN KEY(`id_obj`) REFERENCES `objects`(`id_obj`)
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE `asso_people_songs`
ADD FOREIGN KEY(`id_people`) REFERENCES `people`(`id_people`)
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE `asso_people_songs`
ADD FOREIGN KEY(`id_song`) REFERENCES `songs`(`id_song`)
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE `profils`
ADD FOREIGN KEY(`id_language`) REFERENCES `languages`(`id_language`)
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE `asso_productions_people`
ADD FOREIGN KEY(`id_production`) REFERENCES `productions`(`id_production`)
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE `asso_productions_people`
ADD FOREIGN KEY(`id_people`) REFERENCES `people`(`id_people`)
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE `productions`
ADD FOREIGN KEY(`id_country`) REFERENCES `countries`(`id_country`)
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE `productions`
ADD FOREIGN KEY(`id_obj`) REFERENCES `objects`(`id_obj`)
ON UPDATE NO ACTION ON DELETE NO ACTION;