//soal10
void main() {
  List<String> customers = ['A', 'B', 'C', 'D', 'E'];
  int counter1 = 0;
  int counter2 = 0;
  int customerIndex = 0;

  while (customerIndex < customers.length) {
    if (counter1 <= counter2) {
      print("Loket 1: ${customers[customerIndex]}");
      counter1++;
    } else {
      print("Loket 2: ${customers[customerIndex]}");
      counter2++;
    }
    customerIndex++;
  }
}