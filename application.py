from bottle import Bottle, route, post, run, template, request, redirect
import sqlite3

app = Bottle()

# SQLite Database Initialization
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

# Routes

@app.route('/')
def index():
    return template('index')

# Movies CRUD

@app.route('/movies')  # Changed from '/movie' to '/movies'
def movies():
    cursor.execute("SELECT * FROM movies")
    result = cursor.fetchall()
    return template('movies', rows=result)

@app.route('/movies/add', method='GET')  # Changed from '/movie/add' to '/movies/add'
def add_movie():
    cursor.execute("SELECT * FROM genres")
    genres = cursor.fetchall()
    return template('add_movie', genres=genres)

@app.route('/movies/add', method='POST')  # Changed from '/movie/add' to '/movies/add'
def add_movie():
    movie_name = request.forms.get('movie_name')
    year = request.forms.get('year')
    genre_id = request.forms.get('genre_id')

    cursor.execute("INSERT INTO movies (movie_name, year, genre_id) VALUES (?, ?, ?)", (movie_name, year, genre_id))
    conn.commit()

    redirect('/movies')

# ... (other movie-related routes)

# Static Routes
@app.route('/static/<filename:path>')
def static(filename):
    return bottle.static_file(filename, root='./static')

# Run the application
if __name__ == '__main__':
    run(app, host='localhost', port=8080, debug=True)
