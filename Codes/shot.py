import sensor

class Shot:
    def __init__(self, type, impactSpeed, backliftAngle, downswingAngle, batFaceAngle, backliftDirection) -> None:
        self.__type = type
        self.__impactSpeed = impactSpeed
        self.__backliftAngle = backliftAngle
        self.__downswingAngle = downswingAngle
        self.__batFaceAngle = batFaceAngle
        self.__backliftDirection = backliftDirection

    def recordShotData(self):
         # Specify the serial port where the sensor is connected
        sensor_port = "/dev/ttyUSB0"  # Change this to match your sensor's port
        
        sensor = sensor.Sensor()

        # Read data from the sensor
        sensor_data = sensor.readSensorData(sensor_port)