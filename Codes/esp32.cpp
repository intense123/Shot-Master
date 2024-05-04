#include <WiFi.h>
#include <Wire.h>
#include <HTTPClient.h>

// WiFi credentials
const char *ssid = "your-ssid";
const char *password = "your-password";

// Flask server URL
const char *serverUrl = "http://your-flask-server-url/data";

// MPU9250 object
MPU9250 imu(Wire, 0x68); // Address 0x68 for MPU9250

void setup()
{
    Serial.begin(115200);

    // Connect to WiFi
    WiFi.begin(ssid, password);
    while (WiFi.status() != WL_CONNECTED)
    {
        delay(1000);
        Serial.println("Connecting to WiFi...");
    }
    Serial.println("Connected to WiFi");

    // Start the MPU9250 sensor
    Wire.begin();
    imu.begin();
}

void loop()
{
    // Read sensor data
    imu.readSensor();

    // Create JSON payload
    String payload = "{\"accel_x\": " + String(imu.getAccelX_mss()) + ",";
    payload += "\"accel_y\": " + String(imu.getAccelY_mss()) + ",";
    payload += "\"accel_z\": " + String(imu.getAccelZ_mss()) + ",";
    payload += "\"gyro_x\": " + String(imu.getGyroX_rads()) + ",";
    payload += "\"gyro_y\": " + String(imu.getGyroY_rads()) + ",";
    payload += "\"gyro_z\": " + String(imu.getGyroZ_rads()) + ",";
    payload += "\"mag_x\": " + String(imu.getMagX_uT()) + ",";
    payload += "\"mag_y\": " + String(imu.getMagY_uT()) + ",";
    payload += "\"mag_z\": " + String(imu.getMagZ_uT()) + "}";

    // Send POST request to Flask server
    HTTPClient http;
    http.begin(serverUrl);
    http.addHeader("Content-Type", "application/json");
    int httpResponseCode = http.POST(payload);
    if (httpResponseCode > 0)
    {
        Serial.print("HTTP POST request successful, response code: ");
        Serial.println(httpResponseCode);
    }
    else
    {
        Serial.print("HTTP POST request failed, error code: ");
        Serial.println(httpResponseCode);
    }
    http.end();

    delay(1000); // Adjust delay as needed
}