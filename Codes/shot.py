import pandas as pd

import sensor

class Shot:
    def __init__(self) -> None:
        pass

    def __init__(self, type, impactSpeed, backliftAngle, downswingAngle, batFaceAngle, backliftDirection) -> None:
        self.__type = type
        self.__impactSpeed = impactSpeed
        self.__backliftAngle = backliftAngle
        self.__downswingAngle = downswingAngle
        self.__batFaceAngle = batFaceAngle
        self.__backliftDirection = backliftDirection

    def get_type(self):
        return self.__type

    def get_impactSpeed(self):
        return self.__impactSpeed

    def get_backliftAngle(self):
        return self.__backliftAngle

    def get_downswingAngle(self):
        return self.__downswingAngle

    def get_batFaceAngle(self):
        return self.__batFaceAngle

    def get_backliftDirection(self):
        return self.__backliftDirection

    def __recordShotData(self):
         # Specify the serial port where the sensor is connected
        sensor_port = "/dev/ttyUSB0"  # Change this to match your sensor's port
        
        sensor = sensor.Sensor()

        # Read data from the sensor
        sensor_data = sensor.readSensorData(sensor_port)
        return sensor_data
    
    def __processSensorData(self, sensor_data):
        shot_details = {}

        # extract the sensor data

        return shot_details
    
    def __assignShotDetails(self, shot_details):
        self.__type = shot_details.get('type')
        self.__impactSpeed = shot_details.get('impactSpeed')
        self.__backliftAngle = shot_details.get('backliftAngle')
        self.__downswingAngle = shot_details.get('downswingAgle')
        self.__batFaceAngle = shot_details.get('batfaceAngle')
        self.__backliftDirection = shot_details.get('backliftDirection')

    def conductAShot(self):
        shot_details = self.__processSensorData(self.__recordShotData())
        self.__assignShotDetails(shot_details)
