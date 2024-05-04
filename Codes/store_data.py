from flask import Flask, request, jsonify
from flask_socketio import SocketIO, emit
from flask_pymongo import PyMongo
from pymongo import MongoClient
import csv
import os

csv_file_path = os.path.join(os.getcwd(), 'F:\\ShotMaster\\codes\\shots.csv')

app = Flask(__name__)
app.config['MONGO_URI'] = 'mongodb://localhost:27017/sensor_data'
mongo = PyMongo(app)
socketio = SocketIO(app)

# MongoDB connection
client = MongoClient('mongodb://localhost:27017/')
db = client['sensor_data']
collection = db['data']

@app.route('/data', methods=['POST'])
def receive_data():
    data = request.json
    mongo.db.sensor_data.insert_one(data)
    return jsonify({"message": "Data received and stored successfully"})

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

@socketio.on('connect')
def handle_connect():
    print('Client connected')

@socketio.on('disconnect')
def handle_disconnect():
    print('Client disconnected')

@socketio.on('sensor_data')
def handle_sensor_data(data):
    print('Received sensor data:', data)
    # Insert data into MongoDB
    collection.insert_one(data)
    emit('sensor_data', data, broadcast=True)

if __name__ == '__main__':
    app.run(debug=True, port=5001)
    socketio.run(app, debug=True)
