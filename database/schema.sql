CREATE DATABASE IF NOT EXISTS music_db;
USE music_db;

-- USERS
CREATE TABLE users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL,
    email VARCHAR(100)
);

-- ARTISTS
CREATE TABLE artists (
    artist_id INT AUTO_INCREMENT PRIMARY KEY,
    artist_name VARCHAR(100) NOT NULL
);

-- GENRES
CREATE TABLE genres (
    genre_id INT AUTO_INCREMENT PRIMARY KEY,
    genre_name VARCHAR(50) NOT NULL
);

-- SONGS
CREATE TABLE songs (
    song_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    artist_id INT,
    genre_id INT,
    duration TIME,
    file_path VARCHAR(255),

    FOREIGN KEY (artist_id) REFERENCES artists(artist_id),
    FOREIGN KEY (genre_id) REFERENCES genres(genre_id)
);

-- PLAYLISTS
CREATE TABLE playlists (
    playlist_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    playlist_name VARCHAR(100),

    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

-- PLAYLIST SONG RELATION
CREATE TABLE playlist_songs (
    playlist_id INT,
    song_id INT,

    PRIMARY KEY (playlist_id, song_id),

    FOREIGN KEY (playlist_id) REFERENCES playlists(playlist_id),
    FOREIGN KEY (song_id) REFERENCES songs(song_id)
);

-- LIKED SONGS
CREATE TABLE liked_songs (
    user_id INT,
    song_id INT,

    PRIMARY KEY (user_id, song_id),

    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (song_id) REFERENCES songs(song_id)
);

-- LISTENING HISTORY
CREATE TABLE listening_history (
    history_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    song_id INT,
    listened_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (song_id) REFERENCES songs(song_id)
);
