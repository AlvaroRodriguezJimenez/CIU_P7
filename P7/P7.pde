//Basado en el ejemplo de Minim CreateAnInstrument
import ddf.minim.*;
import ddf.minim.ugens.*;

Minim minim;
AudioOutput out;

int tecla;

//Notas musicales en notación anglosajona
String [] notas={"C4", "C#4", "D4", "D#4", "E4", "F4", "F#4", "G4", "G#4", "A4", "A#4", "B4", "0juytr"};

// Clase que describe la interfaz del instrumento, idéntica al ejemplo
//Modifcar para nuevos instrumentos
class SineInstrument implements Instrument
{
  Oscil wave;
  Line  ampEnv;

  SineInstrument( float frequency )
  {
    // Oscilador sinusoidal con envolvente
    wave   = new Oscil( frequency, 0, Waves.SINE );
    ampEnv = new Line();
    ampEnv.patch( wave.amplitude );
  }

  // Secuenciador de notas
  void noteOn( float duration )
  {
    // Amplitud de la envolvente
    ampEnv.activate( duration, 0.5f, 0 );
    // asocia el oscilador a la salida
    wave.patch( out );
  }

  // Final de la nota
  void noteOff()
  {
    wave.unpatch( out );
  }
}

void setup()
{
  size(500, 300);

  minim = new Minim(this);

  // Línea de salida
  out = minim.getLineOut();
}

void draw() {
  //Dibujamos las celdas/teclas
  for (int i = 0; i < 7; i++){
    rect(i * 70, 0, 80, 300);
  }
  
 
  fill(0);
  rect(35, 0, 50, 160);
  fill(255);
  
  fill(0);
  rect(125, 0, 50, 160);
  fill(255);
  
  fill(0);
  rect(245, 0, 50, 160);
  fill(255);
  
  fill(0);
  rect(325, 0, 50, 160);
  fill(255);
  
  fill(0);
  rect(405, 0, 50, 160);
  fill(255);
  
  fill(0);
  rect(525, 0, 50, 160);
  fill(255);
  
  fill(0);
  rect(615, 0, 50, 160);
  fill(255);
  
  fill(0);
  rect(735, 0, 50, 160);
  fill(255);
  
  fill(0);
  rect(815, 0, 50, 160);
  fill(255);
  
  fill(0);
  rect(895, 0, 50, 160);
  fill(255);
  
  

}

void keyPressed() {
  //Nota en función del valor de mouseX
  
  switch(key){
      case 'q':
        tecla = 0;
        break;
        
      case '2':
        tecla = 1;
        break;
        
      case 'w':
        tecla = 2;
        break;
      
      case '3':
        tecla = 3;
        break;
        
      case 'e':
        tecla = 4;
        break;
        
      case 'r':
        tecla = 5;
        break;
        
      case '5':
        tecla = 6;
        break;
      
      case 't':
        tecla = 7;
        break;
      
      case '6':
        tecla = 8;
        break;
        
      case 'y':
        tecla = 9;
        break;
      
      case '7':
        tecla = 10;
        break;
      
      case 'u':
        tecla = 11;
        break;
      
      default:
        tecla = 12;
        break;
      
  
  }
  

  //Primeros dos parámetros, tiempo y duración
  out.playNote( 0.0, 0.9, new SineInstrument( Frequency.ofPitch( notas[tecla] ).asHz() ) );  
}
