import 'dart:io';

void main(){
  stdout.write("Enter a °C temperature (e.g., 26.5): ");
  double? celsiusTemperature = double.parse(stdin.readLineSync()!); 
  
  print('$celsiusTemperature°C to Fahrenheit: ${celsiusToFahrenheit(celsiusTemperature)}°F');
}

double celsiusToFahrenheit(double celsiusTemperature){
  // Base calculation to convert celsius to fahrenheit.
  return celsiusTemperature * (9/5) + 32;
}