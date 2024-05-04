from flask import Flask, jsonify
from flask_pymongo import PyMongo
import csv
import os

csv_file_path = os.path.join(os.getcwd(), 'F:\\ShotMaster\\codes\\shots.csv')

app = Flask(__name__)

# MongoDB configurations
app.config['MONGO_URI'] = 'mongodb://localhost:27017/mydatabase'
mongo = PyMongo(app)

@app.route('/')
def index():
    return 'Welcome to the MongoDB Flask API!'

@app.route('/create_db_from_csv')
def create_db_from_csv():
    # Drop existing database if it exists
    mongo.db.client.drop_database('myDatabase')
    
    # Read CSV file and insert data into MongoDB
    with open(csv_file_path, 'r') as file:
        reader = csv.DictReader(file)
        for row in reader:
            # Insert each row into MongoDB
            mongo.db.shots.insert_one(row)
    return 'Data inserted into MongoDB from CSV successfully!'

app.run(debug=True, port=5001)
