import sqlite3

def create_tables():
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
    conn.close()

if __name__ == "__main__":
    create_tables()
