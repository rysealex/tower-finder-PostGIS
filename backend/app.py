from flask import Flask, jsonify
from flask_cors import CORS
import psycopg2
from psycopg2.extras import RealDictCursor
import os
from dotenv import load_dotenv

app = Flask(__name__)
CORS(app)

load_dotenv()
DB_NAME = os.getenv("DB_NAME")
USER = os.getenv("USER")
PASSWORD = os.getenv("PASSWORD")

def get_db_connection():
    # connect to postgresql database here
    return psycopg2.connect(
        dbname=DB_NAME,
        user=USER,
        password=PASSWORD,
        host="localhost",
        port="5432"
    )

@app.route('/api/towers', methods=['GET'])
def get_towers():
    conn = get_db_connection()
    cur = conn.cursor(cursor_factory=RealDictCursor)
    # fetching the cell towers (converted geometry to GeoJSON-friendly format)
    cur.execute("SELECT node_name, ip_address, ST_AsText(location) FROM cell_towers;")
    towers = cur.fetchall()
    cur.close()
    conn.close()
    return jsonify(towers)

if __name__ == '__main__':
    app.run(debug=True, port=5000)