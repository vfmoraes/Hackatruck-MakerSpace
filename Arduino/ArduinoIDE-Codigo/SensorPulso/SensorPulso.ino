/**
 * A simple IBM IoT example for testing Pulse Sensor monitor 
 * Onboard LED on pin 2 will blink with each heart beat detected
 * Pulse Sensor's data pin attached to pin 34
 * Serial monitor will give required output
 * Base code written by Abhishek Ghosh, https://thecustomizewindows.com/
 * Needs below 2 steps :
 * (1) On IBM IoT dashboard, go to Security > Connection Security > TLS Optional
 * (2) Install the required libraries such as PubSubClient library from Arduino IDE
 * Adding LED on pin 4 is optional
 * 
 * On IBM Watson IoT dashboard, create a new card to graph pulse
 */

uint32_t delayMS;
#include <ESP8266WiFi.h>
#include <WiFiClient.h>
#include <PubSubClient.h> 

//D4 only for Lolin board
#define LED_BUILTIN D4

//  Variables
int PulseSensorPurplePin = 0;        // Pulse Sensor PURPLE WIRE connected to ANALOG PIN 34
int LED13 = D4;   //  The on-board ESP32 LED
int Signal;                // holds the incoming raw data. Signal value can range from 0-1024
int Threshold = 2250;            // Determine which Signal to "count as a beat", and which to ingore. 
// 2550 is a value after trial & error. It can be 550 for your thing. 

// <------- CHANGE PARAMETERS BELOW THIS LINE ------------>

const char* ssid = "HackaTruckVisitantes";
const char* password = "";

#define ORG "s6o08l"
#define DEVICE_TYPE "PulseSensor"
#define DEVICE_ID "Pulsando"
#define TOKEN "senteapressaonenem"

// <------- CHANGE PARAMETERS ABOVE THIS LINE ------------>

char server[] = ORG ".messaging.internetofthings.ibmcloud.com";
char pubTopic[] = "iot-2/evt/status/fmt/json";
char subTopic[] = "iot-2/cmd/test/fmt/String";
char authMethod[] = "use-token-auth";
char token[] = TOKEN;
char clientId[] = "d:" ORG ":" DEVICE_TYPE ":" DEVICE_ID;

WiFiClient wifiClient;
PubSubClient client(server, 1883, NULL, wifiClient);

void receivedCallback(char* pubTopic, byte* payload, unsigned int length) {
  Serial.print("Message received: ");
  Serial.println(pubTopic);

  Serial.print("payload: ");
  for (int i = 0; i < length; i++) {
    Serial.print((char)payload[i]);
  }
  Serial.println();
  /* we got '1' -> on */
}

// The SetUp Function:
void setup() {
   pinMode(LED13,OUTPUT);         // pin that will blink to your heartbeat!
   Serial.begin(115200);         // Set's up Serial Communication at certain speed.
   Serial.println("IBM Watson IoT ESP32 Pulse Monitor Amped"); // just a funky text
   Serial.print("Connecting to "); 
    Serial.print(ssid);
    WiFi.begin(ssid, password);
    while (WiFi.status() != WL_CONNECTED) {
      delay(500);
      Serial.print(".");
    } 
    Serial.println("");
    
    Serial.print("WiFi connected, IP address: "); 
    Serial.println(WiFi.localIP());

    if (!client.connected()) {
        Serial.print("Reconnecting client to ");
        Serial.println(server);
        while (!client.connect(clientId, authMethod, token)) {
            Serial.print(".");
            delay(500);
        }
        client.setCallback(receivedCallback);
        if (client.subscribe(subTopic)) {
            Serial.println("subscribe to cmd OK");
        } else {
            Serial.println("subscribe to cmd FAILED");
        }
        Serial.println("IBM Watson IoT connected");
    }
}

long lastMsg = 0;
long pulse = 0;

// The Main Loop Function
void loop() {

  Signal = analogRead(PulseSensorPurplePin);  // Read the PulseSensor's value.
                                              // Assign this value to the "Signal" variable
   if(Signal > Threshold){                          // If the signal is above "2550", then "turn-on" ESP32's on-Board LED.
     digitalWrite(LED13,HIGH);
   } else {
     digitalWrite(LED13,LOW);                //  Else, the sigal must be below "2550", so "turn-off" this LED.
   }

    client.loop();
    long now = millis();
    if (now - lastMsg > 3000) {
        lastMsg = now;
        pulse = (Signal);
        
        String payload = "{\"d\":{\"Name\":\"" DEVICE_ID "\"";
               payload += ",\"pulse\":";
               payload += pulse;
               payload += "}}";
        Serial.print("Sending payload: ");
        Serial.println(payload);
  // Serial.println(Signal);                    // Send the Signal value to Serial Plotter for debug
        if (client.publish(pubTopic, (char*) payload.c_str())) {
            Serial.println("Publish ok");
        } else {
            Serial.println("Publish failed");
        }
    }



delay(10);


}