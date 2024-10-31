import 'dart:io';

void main (){
  var uang = 5000;
  
  do{
  print("Berapa hari kamu menabung? / exit");
  String? inputan = stdin.readLineSync();
  int? i = int.tryParse(inputan ?? '');
  int a = i!*uang;
  print("Kamu menabung selama $i, maka kamu menampung uang sebanyak $a");
  if (inputan == "exit"){
    break;
  }
  }while(true);
}