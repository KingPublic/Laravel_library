// Class Vertice buat kota dengan tetangga dan jaraknya
class Vertice {
  String name;
  Map<String, double> neighbors;

  Vertice(this.name, this.neighbors);
  
  @override
  String toString() => name;
}

// Brute-force TSP brainrot nih
class TSP {
  Map<String, Vertice> vertices;

  TSP(this.vertices);

  // Sigma move brute-force TSP
  double calculateTotalDistance(List<String> path) {
    double totalDistance = 0;
    for (int i = 0; i < path.length - 1; i++) {
      totalDistance += vertices[path[i]]!.neighbors[path[i + 1]]!;
    }
    totalDistance += vertices[path.last]!.neighbors[path.first]!; // Balik ke kota asal
    return totalDistance;
  }

  List<String> findShortestPath() {
    List<String> shortestPath = [];
    double shortestDistance = double.infinity;

    List<List<String>> allPermutations = _permutations(vertices.keys.toList());

    for (var path in allPermutations) {
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

  // Goon helper buat generate semua permutasi
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
  // Bikin vertices dari input lu bro
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