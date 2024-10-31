class Vertice {
  String name;
  Map<String, double> neighbors;
  bool visited; // Menandakan apakah kota telah dikunjungi

  Vertice(this.name, this.neighbors) : visited = false; // Inisialisasi visited dengan false
  
  @override
  String toString() => name;
}

// Brute-force TSP yang memeriksa kota yang sudah dikunjungi
class TSP {
  Map<String, Vertice> vertices;

  TSP(this.vertices);

  // Menghitung total jarak berdasarkan jalur yang diberikan, pastikan tidak mengunjungi kota yang sama dua kali
  double calculateTotalDistance(List<String> path) {
    double totalDistance = 0;
    _resetVisitedStatus(); // Reset semua status kunjungan sebelum memulai perhitungan jalur
    
    for (int i = 0; i < path.length - 1; i++) {
      String currentCity = path[i];
      String nextCity = path[i + 1];
      
      // Jika kota sudah dikunjungi, kembalikan infinity sebagai tanda jalur tidak valid
      if (vertices[currentCity]!.visited) {
        return double.infinity;
      }

      vertices[currentCity]!.visited = true; // Tandai kota sebagai telah dikunjungi

      // Cek apakah ada koneksi antara kota saat ini dan kota berikutnya
      if (vertices[currentCity]!.neighbors.containsKey(nextCity)) {
        totalDistance += vertices[currentCity]!.neighbors[nextCity]!;
      } else {
        print("Error: No connection between $currentCity and $nextCity.");
        return double.infinity; // Kembalikan infinity jika tidak ada koneksi
      }
    }
    
    // Cek koneksi dari kota terakhir kembali ke kota pertama
    String lastCity = path.last;
    String firstCity = path.first;
    if (vertices[lastCity]!.neighbors.containsKey(firstCity)) {
      totalDistance += vertices[lastCity]!.neighbors[firstCity]!;
    } else {
      print("Error: No connection between $lastCity and $firstCity.");
      return double.infinity;
    }

    return totalDistance;
  }

  List<String> findShortestPath() {
    List<String> shortestPath = [];
    double shortestDistance = double.infinity;

    List<List<String>> allPermutations = _permutations(vertices.keys.toList());

    for (var path in allPermutations) {
      _resetVisitedStatus(); // Reset setiap kali mencoba permutasi baru
      double distance = calculateTotalDistance(path);
      if (distance < shortestDistance) {
        shortestDistance = distance;
        shortestPath = path;
      }
    }

    print("Rizzest Path: ${shortestPath}");
    print("Total Distance: $shortestDistance");

    return shortestPath;
  }

  // Goon helper untuk menghasilkan semua permutasi
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

  // Mengatur ulang status kunjungan semua vertices
  void _resetVisitedStatus() {
    for (var vertex in vertices.values) {
      vertex.visited = false; // Setiap vertex belum dikunjungi
    }
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
