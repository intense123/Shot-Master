from flask import Flask, request, jsonify
from flask_socketio import SocketIO, emit
from pymongo import MongoClient, PyMongo

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
    app.run(debug=True)
    socketio.run(app, debug=True)
