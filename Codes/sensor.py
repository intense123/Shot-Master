import serial

class Sensor:
    def __init__(self):
        pass

    def readShotData(self, port, baudrate=9600, timeout=1):
        try:
            # Open serial port
            ser = serial.Serial(port, baudrate, timeout=timeout)
            print(f"Serial port {port} opened successfully.")
            
            # Read data from the serial port
            data = ser.readline().decode().strip()  # Assuming data is sent as ASCII strings
            
            # Close serial port
            ser.close()
            
            return data
        except Exception as e:
            print(f"Error: {e}")
            return None