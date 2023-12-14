import sqlite3

def create_tables():
    conn = sqlite3.connect('movies.db')
    cursor = conn.cursor()

    # Create movies table
    cursor.execute('''
        CREATE TABLE IF NOT EXISTS movies (
            movie_id INTEGER PRIMARY KEY AUTOINCREMENT,
            movie_name TEXT NOT NULL,
            year INTEGER,
            genre_id INTEGER,
            FOREIGN KEY (genre_id) REFERENCES genres(genre_id)
        )
    ''')

    # Create genres table
    cursor.execute('''
        CREATE TABLE IF NOT EXISTS genres (
            genre_id INTEGER PRIMARY KEY AUTOINCREMENT,
            genre_name TEXT NOT NULL
        )
    ''')

    conn.commit()
    conn.close()

def add_movie(movie_name, year, genre_id):
    conn = sqlite3.connect('movies.db')
    cursor = conn.cursor()

    cursor.execute("INSERT INTO movies (movie_name, year, genre_id) VALUES (?, ?, ?)", (movie_name, year, genre_id))
    conn.commit()

    conn.close()

def get_all_movies():
    conn = sqlite3.connect('movies.db')
    cursor = conn.cursor()

    cursor.execute("SELECT * FROM movies")
    movies = cursor.fetchall()

    conn.close()
    return movies

def add_genre(genre_name):
    conn = sqlite3.connect('movies.db')
    cursor = conn.cursor()

    cursor.execute("INSERT INTO genres (genre_name) VALUES (?)", (genre_name,))
    conn.commit()

    conn.close()

def get_all_genres():
    conn = sqlite3.connect('movies.db')
    cursor = conn.cursor()

    cursor.execute("SELECT * FROM genres")
    genres = cursor.fetchall()

    conn.close()
    return genres
