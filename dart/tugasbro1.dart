// Class Vertice untuk kota dengan tetangga, jaraknya, dan status kunjungan
class Vertice {
  String name;
  Map<String, double> neighbors;
  bool visited; // Menandakan apakah kota telah dikunjungi

  Vertice(this.name, this.neighbors) : visited = false; // Inisialisasi visited dengan false
  
  @override
  String toString() => name;
}

// Brute-force TSP
class TSP {
  Map<String, Vertice> vertices;

  TSP(this.vertices);

  // Menghitung total jarak berdasarkan jalur yang diberikan
  double calculateTotalDistance(List<String> path) {
    double totalDistance = 0;
    for (int i = 0; i < path.length - 1; i++) {
      String currentCity = path[i];
      String nextCity = path[i + 1];

      if (vertices.containsKey(currentCity) &&
          vertices.containsKey(nextCity)) {
        double? distance = vertices[currentCity]?.neighbors[nextCity];

        if (distance != null) {
          totalDistance += distance;
        } else {
          print("Error: No connection between $currentCity and $nextCity.");
          return double.infinity; // Kembalikan infinity jika tidak ada koneksi
        }
      } else {
        print("Error: One of the cities $currentCity or $nextCity does not exist.");
        return double.infinity; // Kembalikan infinity jika salah satu kota tidak ada
      }
    }
    // Kembali ke kota asal (A)
    totalDistance += vertices[path.last]?.neighbors[path.first] ?? double.infinity;
    return totalDistance;
  }

  List<String> findShortestPath() {
    List<String> shortestPath = [];
    double shortestDistance = double.infinity;

    // Mendapatkan semua kota yang harus dikunjungi (kecuali A)
    List<String> citiesToVisit = vertices.keys.where((city) => city != 'A').toList();
    
    // Mendapatkan semua permutasi kota yang akan dikunjungi
    List<List<String>> allPermutations = _permutations(citiesToVisit);

    for (var path in allPermutations) {
      // Tambahkan A di awal dan di akhir path
      List<String> fullPath = ['A'] + path + ['A'];
      double distance = calculateTotalDistance(fullPath);
      
      if (distance < shortestDistance) {
        shortestDistance = distance;
        shortestPath = fullPath;
      }
    }

    print("Shortest Path: ${shortestPath}");
    print("Total Distance: $shortestDistance");

    return shortestPath;
  }

  // Helper untuk menghasilkan semua permutasi
  List<List<String>> _permutations(List<String> list) {
    if (list.isEmpty) return [[]];
    List<List<String>> result = [];
    for (int i = 0; i < list.length; i++) {
      var head = list[i];
      var tail = List.of(list)..removeAt(i);
      for (var perm in _permutations(tail)) {
        result.add([head] + perm);
      }
    }
    return result;
  }
}

void main() {
  // Bikin vertices dari input
  Map<String, Vertice> cities = {
    'A': Vertice('A', {'B': 8, 'C': 3, 'D': 4, 'E': 10}),
    'B': Vertice('B', {'A': 8, 'C': 5, 'D': 2, 'E': 7}),
    'C': Vertice('C', {'A': 3, 'B': 5, 'D': 1, 'E': 6}),
    'D': Vertice('D', {'A': 4, 'B': 2, 'C': 1, 'E': 3}),
    'E': Vertice('E', {'A': 10, 'B': 7, 'C': 6, 'D': 3}),
  };

  // Bikin TSP dan cari path terpendek
  TSP tsp = TSP(cities);
  tsp.findShortestPath();
}
