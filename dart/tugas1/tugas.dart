// Class Vertice untuk kota dengan tetangga dan jaraknya
class Vertice {
  String name;
  Map<String, double> neighbors;

  Vertice(this.name, this.neighbors);

  @override
  String toString() => name;
}

// Brute-force TSP dengan cek vertex yang sudah dikunjungi
class TSP {
  Map<String, Vertice> vertices;

  TSP(this.vertices);

  // Hitung total jarak berdasarkan path
  double calculateTotalDistance(List<String> path) {
    double totalDistance = 0;
    for (int i = 0; i < path.length - 1; i++) {
      // Pastikan kedua vertex ada dan neighbors tidak null
      if (vertices.containsKey(path[i]) &&
          vertices.containsKey(path[i + 1]) &&
          vertices[path[i]]!.neighbors.containsKey(path[i + 1])) {
        totalDistance += vertices[path[i]]!.neighbors[path[i + 1]]!;
      } else {
        print("Error: No connection between ${path[i]} and ${path[i + 1]}.");
        return double.infinity; // Jika tidak ada koneksi, kembalikan infinity
      }
    }
    return totalDistance;
  }

  List<String> findShortestPath() {
    List<String> shortestPath = [];
    double shortestDistance = double.infinity;

    List<List<String>> allPaths = _findAllPaths(vertices.keys.toList(), [], {});

    for (var path in allPaths) {
      // Hitung jarak total hanya jika kembalinya ke kota asal
      if (path.length > 1) {
        double distance = calculateTotalDistance(path);
        if (distance < shortestDistance) {
          shortestDistance = distance;
          shortestPath = path;
        }
      }
    }

    if (shortestPath.isNotEmpty) {
      // Tambahkan koneksi kembali ke kota asal
      shortestPath.add(shortestPath.first);
    }
    print("Rizzest Path: $shortestPath");
    print("Total Distance: $shortestDistance");

    return shortestPath;
  }

  // Helper untuk menemukan semua path dengan cek kunjungan
  List<List<String>> _findAllPaths(List<String> cities, List<String> currentPath, Set<String> visited) {
    // Jika sudah mengunjungi semua kota
    if (currentPath.length == cities.length) {
      // Kembalikan ke kota awal
      return [List.from(currentPath)..add(currentPath.first)]; // Return a copy of the current path with return to start
    }

    List<List<String>> paths = [];
    for (String city in cities) {
      if (!visited.contains(city)) {
        visited.add(city);
        currentPath.add(city);

        // Recursive call to find paths
        paths.addAll(_findAllPaths(cities, currentPath, visited));

        // Backtrack
        currentPath.removeLast();
        visited.remove(city);
      }
    }
    return paths;
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
