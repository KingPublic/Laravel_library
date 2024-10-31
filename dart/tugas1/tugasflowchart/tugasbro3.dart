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
      if (vertices.containsKey(path[i]) &&
          vertices.containsKey(path[i + 1]) &&
          vertices[path[i]]!.neighbors.containsKey(path[i + 1])) {
        totalDistance += vertices[path[i]]!.neighbors[path[i + 1]]!;
      } else {
        print("Error: No connection between ${path[i]} and ${path[i + 1]}.");
        return double.infinity; // Kembalikan infinity jika tidak ada koneksi
      }
    }
    totalDistance += vertices[path.last]!.neighbors[path.first]!; // Kembali ke kota asal
    return totalDistance;
  }

  // Fungsi untuk menemukan jalur terpendek
  List<String> findShortestPath(String start) {
    List<String> shortestPath = [];
    double shortestDistance = double.infinity;

    // Ambil semua kota sebagai daftar dan buat permutasi
    List<String> cities = vertices.keys.toList();
    cities.remove(start); // Hapus kota awal dari permutasi

    List<List<String>> allPermutations = _permutations(cities);

    // Tambahkan kota awal ke setiap jalur permutasi dan hitung jarak
    for (var path in allPermutations) {
      var fullPath = [start] + path; // Tambahkan kota awal di depan
      double distance = calculateTotalDistance(fullPath);

      // Periksa apakah jalur ini lebih pendek dari jalur sebelumnya
      if (distance < shortestDistance) {
        shortestDistance = distance;
        shortestPath = fullPath;
      }
    }

    print("\nShortest Path: ${shortestPath.join(' -> ')}");
    print("Shortest Total Distance: $shortestDistance");

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
  // Membuat vertices dari input
  Map<String, Vertice> cities = {
    'A': Vertice('A', {'B': 8, 'C': 3, 'D': 4, 'E': 10}),
    'B': Vertice('B', {'A': 8, 'C': 5, 'D': 2, 'E': 7}),
    'C': Vertice('C', {'A': 3, 'B': 5, 'D': 1, 'E': 6}),
    'D': Vertice('D', {'A': 4, 'B': 2, 'C': 1, 'E': 3}),
    'E': Vertice('E', {'A': 10, 'B': 7, 'C': 6, 'D': 3}),
  };

  // Membuat TSP dan cari jalur terpendek dari kota A
  TSP tsp = TSP(cities);
  tsp.findShortestPath('A');
}
