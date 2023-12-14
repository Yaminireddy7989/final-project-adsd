from bottle import Bottle, route, post, run, template, request, redirect
import sqlite3

app = Bottle()

# SQLite Database Initialization
conn = sqlite3.connect('dogs.db')
cursor = conn.cursor()

# Create dogs table
cursor.execute('''
    CREATE TABLE IF NOT EXISTS dogs (
        dog_id INTEGER PRIMARY KEY AUTOINCREMENT,
        dog_name TEXT NOT NULL,
        age INTEGER,
        breed_id INTEGER,
        FOREIGN KEY (breed_id) REFERENCES breeds(breed_id)
    )
''')

# Create breeds table
cursor.execute('''
    CREATE TABLE IF NOT EXISTS breeds (
        breed_id INTEGER PRIMARY KEY AUTOINCREMENT,
        breed_name TEXT NOT NULL
    )
''')

conn.commit()

# Routes

@app.route('/')
def index():
    return template('index')

# Dogs CRUD

@app.route('/dogs')
def dogs():
    cursor.execute("SELECT * FROM dogs")
    result = cursor.fetchall()
    return template('dogs', rows=result)

@app.route('/dogs/add', method='GET')
def add_dog_form():
    cursor.execute("SELECT * FROM breeds")
    breeds = cursor.fetchall()
    return template('add_dog', breeds=breeds)

@app.route('/dogs/add', method='POST')
def add_dog():
    dog_name = request.forms.get('dog_name')
    age = request.forms.get('age')
    breed_id = request.forms.get('breed_id')

    cursor.execute("INSERT INTO dogs (dog_name, age, breed_id) VALUES (?, ?, ?)", (dog_name, age, breed_id))
    conn.commit()

    redirect('/dogs')

@app.route('/dogs/edit/<dog_id:int>', method='GET')
def edit_dog_form(dog_id):
    cursor.execute("SELECT * FROM dogs WHERE dog_id=?", (dog_id,))
    dog = cursor.fetchone()

    cursor.execute("SELECT * FROM breeds")
    breeds = cursor.fetchall()

    return template('edit_dog', dog=dog, breeds=breeds)

@app.route('/dogs/edit/<dog_id:int>', method='POST')
def edit_dog(dog_id):
    dog_name = request.forms.get('dog_name')
    age = request.forms.get('age')
    breed_id = request.forms.get('breed_id')

    cursor.execute("UPDATE dogs SET dog_name=?, age=?, breed_id=? WHERE dog_id=?", (dog_name, age, breed_id, dog_id))
    conn.commit()

    redirect('/dogs')

@app.route('/dogs/delete/<dog_id:int>')
def delete_dog(dog_id):
    cursor.execute("DELETE FROM dogs WHERE dog_id=?", (dog_id,))
    conn.commit()

    redirect('/dogs')

# Breeds CRUD

@app.route('/breeds')
def breeds():
    cursor.execute("SELECT * FROM breeds")
    result = cursor.fetchall()
    return template('breeds', rows=result)

@app.route('/breeds/add', method='GET')
def add_breed_form():
    return template('add_breed')

@app.route('/breeds/add', method='POST')
def add_breed():
    breed_name = request.forms.get('breed_name')

    cursor.execute("INSERT INTO breeds (breed_name) VALUES (?)", (breed_name,))
    conn.commit()

    redirect('/breeds')

@app.route('/breeds/edit/<breed_id:int>', method='GET')
def edit_breed_form(breed_id):
    cursor.execute("SELECT * FROM breeds WHERE breed_id=?", (breed_id,))
    breed = cursor.fetchone()
    return template('edit_breed', breed=breed)

@app.route('/breeds/edit/<breed_id:int>', method='POST')
def edit_breed(breed_id):
    breed_name = request.forms.get('breed_name')

    cursor.execute("UPDATE breeds SET breed_name=? WHERE breed_id=?", (breed_name, breed_id))
    conn.commit()

    redirect('/breeds')

@app.route('/breeds/delete/<breed_id:int>')
def delete_breed(breed_id):
    cursor.execute("DELETE FROM breeds WHERE breed_id=?", (breed_id,))
    conn.commit()

    redirect('/breeds')

# Static Routes
@app.route('/static/<filename:path>')
def static(filename):
    return bottle.static_file(filename, root='./static')

# Run the application
if __name__ == '__main__':
    run(app, host='localhost', port=8080, debug=True)
