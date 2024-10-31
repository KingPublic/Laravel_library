
// Class Vertice untuk kota dengan tetangga, jaraknya, dan status kunjungan
class Vertice {
  String name;
  Map<String, double> neighbors;
  bool visited; // Menandakan apakah kota telah dikunjungi

  Vertice(this.name, this.neighbors) : visited = false; // Inisialisasi visited dengan false
  
  @override
  String toString() => name;
}

// Algoritma TSP Greedy
class TSP {
  Map<String, Vertice> vertices;

  TSP(this.vertices);

  // Fungsi untuk menemukan jalur terdekat
  void findShortestPath(String start) {
    String currentCity = start;
    List<String> visitedCities = [currentCity];
    double totalDistance = 0;

    print("Starting at city: $currentCity");

    // Loop sampai semua kota sudah dikunjungi
    while (visitedCities.length < vertices.length) {
      vertices[currentCity]!.visited = true;

      String? nearestCity;
      double nearestDistance = double.infinity;

      // Cari kota terdekat yang belum dikunjungi
      for (var neighbor in vertices[currentCity]!.neighbors.entries) {
        if (!vertices[neighbor.key]!.visited && neighbor.value < nearestDistance) {
          nearestCity = neighbor.key;
          nearestDistance = neighbor.value;
        }
      }

      // Jika kota terdekat ditemukan, pindah ke kota itu
      if (nearestCity != null) {
        print("Going from $currentCity to $nearestCity, Distance: $nearestDistance");
        totalDistance += nearestDistance;
        visitedCities.add(nearestCity);
        currentCity = nearestCity;
      } else {
        print("Error: No unvisited city found.");
        break;
      }
    }

    // Setelah semua kota dikunjungi, kembali ke kota asal
    double returnDistance = vertices[currentCity]!.neighbors[start]!;
    totalDistance += returnDistance;
    print("Returning from $currentCity to $start, Distance: $returnDistance");

    // Tampilkan hasil akhir
    print("\nVisited Cities: ${visitedCities.join(' -> ')}");
    print("Total Distance: $totalDistance");
  }

  // Fungsi untuk mereset status kota (jika ingin dijalankan ulang)
  void resetVisitedStatus() {
    for (var vertex in vertices.values) {
      vertex.visited = false;
    }
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
