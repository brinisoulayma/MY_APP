import sqlite3
from pathlib import Path

class Database:
    _instance = None
    
    def __new__(cls):
        if cls._instance is None:
            cls._instance = super().__new__(cls)
            db_path = Path(__file__).parent.parent / "data" / "app.db"
            cls._instance.conn = sqlite3.connect(db_path)
            cls._instance.cursor = cls._instance.conn.cursor()
        return cls._instance
    
    def execute(self, query, params=()):
        self.cursor.execute(query, params)
        self.conn.commit()
    
    def fetch_one(self, query, params=()):
        self.cursor.execute(query, params)
        return self.cursor.fetchone()
    
    def __del__(self):
        self.conn.close()