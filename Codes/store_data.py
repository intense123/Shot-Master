from flask import Flask, request
from flask_socketio import SocketIO, emit
from pymongo import MongoClient

app = Flask(__name__)
socketio = SocketIO(app)

# MongoDB connection
client = MongoClient('mongodb://localhost:27017/')
db = client['sensor_data']
collection = db['data']

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
    socketio.run(app, debug=True)
