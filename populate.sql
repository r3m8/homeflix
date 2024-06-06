-- Populate countries table
INSERT INTO `countries` (`id_country`, `name`, `code`) VALUES
(1, 'United States', 'US'),
(2, 'Canada', 'CA'),
(3, 'United Kingdom', 'UK'),
(4, 'Australia', 'AU'),
(5, 'Germany', 'DE');

-- Populate accounts table
INSERT INTO `accounts` (`firstname`, `lastname`, `birth`, `gender`, `id_country`, `email`, `billing`, `password`) VALUES
('Kaci', 'Dupont', '1985-06-15', 'women', 1, 'kaci@homeflix', '123 Main St, Anytown, USA', 'motdepasse'),
('Dylan', 'Michel', '1990-08-20', 'women', 2, 'dylan@homeflix', '456 Elm St, Othertown, Canada', 'pouetpouet69'),
('Hicham', 'Cloud', '1975-12-05', 'men', 3, 'hicham@homeflix', '789 Oak St, Sometown, UK', 'motdepasse2');

-- Populate languages table
INSERT INTO `languages` (`name`) VALUES
('English'),
('French'),
('German'),
('Spanish');

-- Populate profiles table
INSERT INTO `profils` (`id_account`, `avatar`, `creation`, `pseudo`, `type`, `id_language`) VALUES
(1, 'https://100k-faces.glitch.me/random-image', '2023-01-01', 'Kaci', 'adult', 1),
(2, 'https://100k-faces.glitch.me/random-image', '2023-02-01', 'janey', 'adult', 2),
(3, 'https://100k-faces.glitch.me/random-image', '2023-03-01', 'alice', 'adult', 1);

-- Populate types_objet table
INSERT INTO `types_objet` (`name`) VALUES
('Movie'),
('TV Show'),
('Documentary');

-- Populate objects table
INSERT INTO `objects` (`id_type_obj`, `id_genre`, `name`) VALUES
(1, NULL, 'Inception'),
(2, NULL, 'Breaking Bad'),
(3, NULL, 'Planet Earth');

-- Populate genres table
INSERT INTO `genres` (`name`) VALUES
('Action'),
('Drama'),
('Sci-Fi'),
('Nature');

-- Populate asso_genres_objects table
INSERT INTO `asso_genres_objects` (`id_genre`, `id_obj`) VALUES
(1, 1),
(3, 1),
(2, 2),
(4, 3);

-- Populate type_roles table
INSERT INTO `type_roles` (`name`) VALUES
('Director'),
('Actor'),
('Producer');

-- Populate people table
INSERT INTO `people` (`name`, `id_country`) VALUES
('Christopher Nolan', 1),
('Bryan Cranston', 2),
('David Attenborough', 3);

-- Populate asso_objects_participants_roles table
INSERT INTO `asso_objects_participants_roles` (`id_obj`, `id_role`, `id_people`) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3);

-- Populate productions table
INSERT INTO `productions` (`name`, `id_country`, `id_obj`) VALUES
('Warner Bros', 1, 1),
('AMC', 2, 2),
('BBC', 3, 3);

-- Populate asso_productions_people table
INSERT INTO `asso_productions_people` (`id_production`, `id_people`) VALUES
(1, 1),
(2, 2),
(3, 3);

-- Populate shops table
INSERT INTO `shops` (`url`) VALUES
('https://example.com/shop1'),
('https://example.com/shop2');

-- Populate songs table
INSERT INTO `songs` (`songtitle`, `year`) VALUES
('Song A', 2010),
('Song B', 2015);

-- Populate asso_objects_songs table
INSERT INTO `asso_objects_songs` (`id_obj`, `id_song`) VALUES
(1, 1),
(2, 2);

-- Populate asso_people_songs table
INSERT INTO `asso_people_songs` (`id_people`, `id_song`) VALUES
(1, 1),
(2, 2);

-- Populate qualities table
INSERT INTO `qualities` (`name`) VALUES
('HD'),
('SD');

-- Populate types_transcriptions table
INSERT INTO `types_transcriptions` (`name`) VALUES
('Subtitle'),
('Dub');

-- Populate tech_languages table
INSERT INTO `tech_languages` (`id_type_transcription`, `id_language`) VALUES
(1, 1),
(2, 2);

-- Populate tech_qualities table
INSERT INTO `tech_qualities` (`id_quality`, `id_type_transcription`) VALUES
(1, 1),
(2, 2);

-- Populate files_transcriptions table
INSERT INTO `files_transcriptions` (`id_tech_language`, `id_tech_quality`) VALUES
(1, 1),
(2, 2);

-- Populate video_file table
INSERT INTO `video_file` (`file_name`, `id_shop`, `id_file_transcription`, `id_obj`) VALUES
('video1.mp4', 1, 1, 1),
('video2.mp4', 2, 2, 2);

-- Populate asso_objects table
INSERT INTO `asso_objects` (`id_obj_parent`, `id_obj_enfant`) VALUES
(1, 2),
(2, 3);

-- Insert two new movies
INSERT INTO `objects` (`id_type_obj`, `id_genre`, `name`) VALUES
(1, NULL, 'The Matrix'),
(1, NULL, 'Interstellar');

-- Insert genres for the new movies
INSERT INTO `asso_genres_objects` (`id_genre`, `id_obj`) VALUES
(1, (SELECT id_obj FROM objects WHERE name='The Matrix')),
(2, (SELECT id_obj FROM objects WHERE name='Interstellar'));

-- Insert productions for the new movies
INSERT INTO `productions` (`name`, `id_country`, `id_obj`) VALUES
('Warner Bros', 1, (SELECT id_obj FROM objects WHERE name='The Matrix')),
('Paramount Pictures', 1, (SELECT id_obj FROM objects WHERE name='Interstellar'));

-- Insert video files for the new movies
INSERT INTO `video_file` (`file_name`, `id_shop`, `id_file_transcription`, `id_obj`) VALUES
('matrix.mp4', 1, 1, (SELECT id_obj FROM objects WHERE name='The Matrix')),
('interstellar.mp4', 1, 1, (SELECT id_obj FROM objects WHERE name='Interstellar'));

-- Insert One Piece episode
INSERT INTO `objects` (`id_type_obj`, `id_genre`, `name`) VALUES
(2, NULL, 'One Piece Episode 1');

-- Insert genres for One Piece episode
INSERT INTO `asso_genres_objects` (`id_genre`, `id_obj`) VALUES
(2, (SELECT id_obj FROM objects WHERE name='One Piece Episode 1'));

-- Insert productions for One Piece episode
INSERT INTO `productions` (`name`, `id_country`, `id_obj`) VALUES
('Toei Animation', 1, (SELECT id_obj FROM objects WHERE name='One Piece Episode 1'));

-- Insert video file for One Piece episode
INSERT INTO `video_file` (`file_name`, `id_shop`, `id_file_transcription`, `id_obj`) VALUES
('one_piece_ep1.mp4', 1, 1, (SELECT id_obj FROM objects WHERE name='One Piece Episode 1'));

-- Insert Naruto episode
INSERT INTO `objects` (`id_type_obj`, `id_genre`, `name`) VALUES
(2, NULL, 'Naruto: The Cross Roads');

-- Insert genres for Naruto episode
INSERT INTO `asso_genres_objects` (`id_genre`, `id_obj`) VALUES
(2, (SELECT id_obj FROM objects WHERE name='Naruto: The Cross Roads'));

-- Insert productions for Naruto episode
INSERT INTO `productions` (`name`, `id_country`, `id_obj`) VALUES
('Pierrot', 1, (SELECT id_obj FROM objects WHERE name='Naruto: The Cross Roads'));

-- Insert video file for Naruto episode
INSERT INTO `video_file` (`file_name`, `id_shop`, `id_file_transcription`, `id_obj`) VALUES
('naruto_ep1.mp4', 1, 1, (SELECT id_obj FROM objects WHERE name='Naruto: The Cross Roads'));
