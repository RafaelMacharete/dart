import 'dart:io';

void main(){
  int? numero;

  while (numero == null) {
    stdout.write('Digite a');
    String? entrada = stdin.readLineSync();    

    try {
      numero = int.parse(entrada ?? '');
    } on FormatException {
      print('Formato inválido.');
    } 
  }
}