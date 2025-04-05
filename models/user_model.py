# models/user_model.py
from .database import get_db_connection

class UserModel:
    @staticmethod
    def create_user(username, password, email):
        conn = get_db_connection()
        cursor = conn.cursor()
        try:
            cursor.execute('INSERT INTO users (username, password, email) VALUES (?, ?, ?)', 
                          (username, password, email))
            conn.commit()
            return True
        except sqlite3.IntegrityError:
            return False  # Username or email already exists
        finally:
            conn.close()

    @staticmethod
    def get_user_by_username(username):
        conn = get_db_connection()
        cursor = conn.cursor()
        cursor.execute('SELECT * FROM users WHERE username = ?', (username,))
        user = cursor.fetchone()
        conn.close()
        return user

    @staticmethod
    def update_password(username, new_password):
        conn = get_db_connection()
        cursor = conn.cursor()
        cursor.execute('UPDATE users SET password = ? WHERE username = ?', 
                      (new_password, username))
        conn.commit()
        conn.close()