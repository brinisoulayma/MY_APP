from Models.database import Database

class UserModel:
    def __init__(self):
        self.db = Database()
        self._create_table()

    def get_user(self, username):
        return self.db.fetch_one(
            "SELECT * FROM users WHERE username = ?",
            (username,)
        )

    def _create_table(self):
        query = '''CREATE TABLE IF NOT EXISTS users (
            username TEXT PRIMARY KEY,
            password TEXT NOT NULL,
            question1 TEXT,
            answer1 TEXT,
            question2 TEXT,
            answer2 TEXT
        )'''
        self.db.execute(query)

    def create_user(self, username, password, q1, a1, q2, a2):
        if self.user_exists(username):
            return False  # Already checked in controller, but double verification
        try:
            self.db.execute('''INSERT INTO users VALUES (?,?,?,?,?,?)''',
                           (username, password, q1, a1, q2, a2))
            return True
        except Exception as e:
            print(f"DB Error: {str(e)}")
            return False

    def user_exists(self, username):
        return bool(self.db.fetch_one("SELECT 1 FROM users WHERE username=?", (username,)))

    def verify_user(self, username, password):
        return bool(self.db.fetch_one(
            "SELECT 1 FROM users WHERE username=? AND password=?",
            (username, password)
        ))