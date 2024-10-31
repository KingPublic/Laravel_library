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
        double distance = vertices[path[i]]!.neighbors[path[i + 1]]!;
        totalDistance += distance;
        print("Distance from ${path[i]} to ${path[i + 1]}: $distance");
      } else {
        print("Error: No connection between ${path[i]} and ${path[i + 1]}.");
        return double.infinity; // Kembalikan infinity jika tidak ada koneksi
      }
    }
    // Kembali ke kota asal
    double returnDistance = vertices[path.last]!.neighbors[path.first]!;
    totalDistance += returnDistance;
    print("Distance from ${path.last} to ${path.first} (return): $returnDistance");
    
    return totalDistance;
  }

  List<String> findShortestPath() {
    List<String> shortestPath = [];
    double shortestDistance = double.infinity;

    List<List<String>> allPermutations = _permutations(vertices.keys.toList());

    for (var path in allPermutations) {
      // Reset visited status for each vertex
      _resetVisitedStatus();

      print("\nChecking path: $path");
      double distance = calculateTotalDistance(path);
      print("Total distance for this path: $distance");

      if (distance < shortestDistance) {
        shortestDistance = distance;
        shortestPath = path;
      }

      // Tandai kunjungan dan sambungkan ke vertex terdekat
      _markVisitsAndConnect(path); 
    }

    print("\nShortest Path: ${shortestPath}");
    print("Shortest Total Distance: $shortestDistance");

    return shortestPath;
  }

  void _markVisitsAndConnect(List<String> path) {
    for (var current in path) { // 'current' adalah kota yang sedang diproses
      if (!vertices[current]!.visited) { // Cek apakah kota sudah dikunjungi
        vertices[current]!.visited = true; // Tandai node yang sudah dikunjungi
        print("Current City: $current");
        print("Visited: $current");
        
        // Cek untuk menghubungkan ke vertex terdekat yang belum dikunjungi
        _connectToNearestUnvisited(current);
      }
    }
    print("Visited nodes: ${vertices.values.where((v) => v.visited).map((v) => v.name).toList()}");
  }

  void _connectToNearestUnvisited(String current) {
    double shortestDistance = double.infinity;
    String? nearestUnvisited;

    for (var neighbor in vertices[current]!.neighbors.keys) {
      if (!vertices[neighbor]!.visited && 
          vertices[current]!.neighbors[neighbor]! < shortestDistance) {
        shortestDistance = vertices[current]!.neighbors[neighbor]!;
        nearestUnvisited = neighbor;
      }
    }

    if (nearestUnvisited != null) {
      print("Connecting $current to nearest unvisited node: $nearestUnvisited");
    }
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
