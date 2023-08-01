/*
   
   Fabrício Sousa
   Exemplo IBM Watson IoT Platform + Planta IoT
   Hardware: new NodeMCU LoLin V3 + Sensor umidade solo


   Logica:
   1. efetua conexao com a rede WiFi
   2. obtem a grandeza de umidade do solo
   3. conecta no servidor MQTT IBM Watson IoT Platform
   4. publica a JSON string para o topico 
   
   referencias Bluemix e IoTF:
   Autor: FilipeFlop
   https://www.filipeflop.com/blog/planta-iot-com-esp8266-nodemcu/
   
*/


#include <ESP8266WiFi.h>
#include <PubSubClient.h>


//atualize SSID e senha WiFi
const char* ssid = "HackaTruckVisitantes";
const char* password = "";




//Atualize os valores de Org, device type, device id e token
#define ORG "femusb"
#define DEVICE_TYPE "SensorBatimento"
#define DEVICE_ID "SensorBatimento"
#define TOKEN "12345678"


//broker messagesight server
char server[] = ORG ".messaging.internetofthings.ibmcloud.com";
char topic[] = "iot-2/evt/status/fmt/json";
char authMethod[] = "use-token-auth";
char token[] = TOKEN;
char clientId[] = "d:" ORG ":" DEVICE_TYPE ":" DEVICE_ID;

float batimento = 0.0;
char batimentostr[6];


WiFiClient wifiClient;
PubSubClient client(server, 1883, NULL, wifiClient);


void setup() {
  Serial.begin(115200);
  Serial.println();
  Serial.println("Iniciando...");


  Serial.print("Conectando na rede WiFi "); Serial.print(ssid);
  WiFi.begin(ssid, password);
  while (WiFi.status() != WL_CONNECTED) {
    delay(500);
    Serial.print(".");
  }
  Serial.println("");
  Serial.print("[INFO] Conectado WiFi IP: ");
  Serial.println(WiFi.localIP());


  pinMode(LED_BUILTIN, OUTPUT);
}


//Função: faz a leitura do nível de umidade
//Parâmetros: nenhum
//Retorno: umidade percentual (0-100)
//Observação: o ADC do NodeMCU permite até, no máximo, 3.3V. Dessa forma,
//            para 3.3V, obtem-se (empiricamente) 978 como leitura de ADC
float FazLeituraBatimento(void)
{
    int ValorADC;
    float batimentoPercentual;
     ValorADC = analogRead(0);   
     Serial.print("[Leitura ADC] ");
     Serial.println(ValorADC);
  

     return ValorADC;
}


void loop() {


  if (!!!client.connected()) {
    Serial.print("Reconnecting client to ");
    Serial.println(server);
    while (!!!client.connect(clientId, authMethod, token)) {
      Serial.print(".");
      delay(500);
    }
    Serial.println();
  }


  float batimento = FazLeituraBatimento();
  
  // Conversao Floats para Strings
  char TempString[32];  //  array de character temporario


  // dtostrf( [Float variable] , [Minimum SizeBeforePoint] , [sizeAfterPoint] , [WhereToStoreIt] )
  dtostrf(batimento, 2, 1, TempString);
  String batimentostr =  String(TempString);


  // Prepara JSON para IOT Platform
  int length = 0;


  String payload = "{\"d\":{\"BATIMENTOS\":\"" + batimentostr + "\"}}";


  length = payload.length();
  Serial.print(F("\nData length"));
  Serial.println(length);


  Serial.print("Sending payload: ");
  Serial.println(payload);


  if (client.publish(topic, (char*) payload.c_str())) {
    Serial.println("Publish ok");
    digitalWrite(LED_BUILTIN, LOW);
    delay(500);
    digitalWrite(LED_BUILTIN, HIGH);
    delay(500);
  } else {
    Serial.println("Publish failed");
    Serial.println(client.state());
  }

  delay(10);
}


