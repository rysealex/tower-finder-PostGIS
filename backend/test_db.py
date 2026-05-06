import psycopg2
import os
from dotenv import load_dotenv

load_dotenv()
DB_NAME = os.getenv("DB_NAME")
USER = os.getenv("USER")
PASSWORD = os.getenv("PASSWORD")

try:
    # connect to postgresql database here
    conn = psycopg2.connect(
        dbname=DB_NAME,
        user=USER,
        password=PASSWORD,
        host="localhost",
        port="5432"
    )

    cur = conn.cursor()
    
    cur.execute("SELECT node_name, ip_address, ST_AsText(location) FROM cell_towers;")
    rows = cur.fetchall()

    print("--- Cell Towers Report ---")
    for row in rows:
        print(f"Name: {row[0]:<20} | IP: {row[1]:<12} | Location: {row[2]}")
    
    cur.close()
    conn.close()

except Exception as e:
    print(f"Error: {e}")