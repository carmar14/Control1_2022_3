
//Se definen las variables que se usarán en el programa
// Contador de muestras
double Samples = 0;
// Tiempo de muestreo
double Ts = 0.01;
//---------------cantidad de muestras para hacer cambios de referencia---
double cambios = 8 / Ts;

//------------controlador algebraico a implementar------------

//----------ecuación en diferencia-------------
//-------u(k)= a*e(k-1)+b*e(k-2)+c*e(k-3)-d*u(k-1)-e*u(k-2)-f*u(k-3)
//-----parametros del controlador algebraico-------
double a = 1.268;//0.6384;
double b =-2.492;//-0.6165;
double c =1.225;//-0.6383;
//double d = 0.6166;
double d =-2.629;
double e = 2.306;
double f =-0.6771; 
//-----parametros del controlador algebraico-------

//-----parametros del controlador pid-------
double Kp=4.48;
double Ti=2.24;
double Td=0.1741;
//-----parametros del controlador pid-------
//accion de control u(k)
double uk = 0;
//accion de control pasada u(k-1)
double uk1 = 0;
//accion de control pasada u(k-2)
double uk2 = 0;
//accion de control pasada u(k-3)
double uk3 = 0;
//erro actual e(k)
double ek = 0;
//error pasado e(k-1)
double ek1 = 0;
//error pasado e(k-2)
double ek2 = 0;
//error pasado e(k-3)
double ek3 = 0;

//salida de la planta y(k)
double yk = 0;
double yk1= 0;
double yk2= 0;

//referencia
double rk = 0;


//-----------implementación del controlador algebraico-----------
void controlador_algebraico() {
  //----------referencia----------
  Samples = Samples + 1;

  // Si el contador de muestras es 1 (uno) se modifica la entrada al sistema generando un número randómico
  if (Samples == 1)
  {
    //Se genera un número randómico entre -5 y 5
    rk = random(-3, 3);
  }

  // Si el contador de muestras supera un valor se resetea el contador para que se vuelva a generar una nueva entrada
  if (Samples > cambios)
  {
    Samples = 0;
  }
  //rk=1;
  //-----------medir la variable del proceso-------
  //-------normalmente mediante un ADC-------------
  //----------aqui se recibirá por Serial-----------
  //------por efecto de emular la planta en matlab--
  while (Serial.available() > 0) {
    String str = Serial.readStringUntil('\n');
    yk = str.toFloat();
  }
  //-------calcular el error actual----
  ek = rk - yk;
  //---------calcular acción de control---
  
  uk= a*ek1+b*ek2+c*ek3-d*uk1-e*uk2-f*uk3;

  //-------garantizat limites----
  if ( uk>10) uk=10;
  if (uk<-10) uk=-10;

  //---------actualizo valores-----------
  uk3=uk2;
  uk2=uk1;
  uk1 = uk;
  ek3 = ek2;
  ek2 = ek1;
  ek1 = ek;
  //-----generar la salida hacia la planta---
  //-------normalmente mediante un DAC-------
  Serial.print(uk);
  Serial.print(',');
  Serial.print(rk);
  Serial.print('\n');


}

//-----------implementación del controlador pid-----------
void controlador_pid() {
  //----------referencia----------
  Samples = Samples + 1;

  // Si el contador de muestras es 1 (uno) se modifica la entrada al sistema generando un número randómico
  if (Samples == 1)
  {
    //Se genera un número randómico entre -5 y 5
    rk = random(-3, 3);
  }

  // Si el contador de muestras supera un valor se resetea el contador para que se vuelva a generar una nueva entrada
  if (Samples > cambios)
  {
    Samples = 0;
  }
  //rk=1;
  //-----------medir la variable del proceso-------
  //-------normalmente mediante un ADC-------------
  //----------aqui se recibirá por Serial-----------
  //------por efecto de emular la planta en matlab--
  while (Serial.available() > 0) {
    String str = Serial.readStringUntil('\n');
    yk = str.toFloat();
  }
  //-------calcular el error actual----
  ek = rk - yk;
  //---------calcular acción de control---
  
  uk= Kp*(ek-ek1+Td*(ek-2*ek1+ek2)/Ts+(Ts/Ti)*ek)+uk1;

  //-------garantizat limites----
  //if ( uk>10) uk=10;
  //if (uk<-10) uk=-10;

  //---------actualizo valores-----------
  
  uk1 = uk;
  ek2 = ek1;
  ek1 = ek;
  //-----generar la salida hacia la planta---
  //-------normalmente mediante un DAC-------
  Serial.print(uk,4);
  Serial.print(',');
  Serial.print(rk);
  Serial.print('\n');


}

void setup() {
  Serial.begin(115200);
  //Timer2.attachInterrupt(controlador);
  //Timer3.start(50000); // Calls every 50ms
  //Timer2.start(20000);
}

void loop() {

  while (1) {

    //controlador_algebraico();
    controlador_pid();
    delay(Ts*1000);
    //delay(Ts*1000);
  }


}
