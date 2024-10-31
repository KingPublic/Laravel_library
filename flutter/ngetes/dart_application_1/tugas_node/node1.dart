// Definisi kelas Node yang akan menyimpan data dan referensi ke node berikutnya
class Node {
  int nilai;  // Menyimpan data berupa angka
  Node? berikutnya; // Menyimpan referensi ke node berikutnya

  // Konstruktor untuk Node
  Node(this.nilai);  // Inisialisasi data
}

// Kelas LinkedList untuk mengelola kumpulan node
class LinkedList {
  Node? kepala; // Referensi ke node pertama (kepala) dalam linked list

  // Fungsi untuk menambahkan elemen baru di akhir linked list
  void tambah(int nilai) {
    // Membuat node baru dengan data yang diberikan
    Node nodeBaru = Node(nilai);
    
    // Jika linked list masih kosong, set kepala ke node baru
    if (kepala == null) {
      kepala = nodeBaru;
    } else {
      // Jika sudah ada node, cari node terakhir
      Node current = kepala!;
      while (current.berikutnya != null) {
        current = current.berikutnya!;
      }
      // Set node terakhir agar menunjuk ke node baru
      current.berikutnya = nodeBaru;
    }
  }

  // Fungsi untuk menampilkan semua elemen di linked list
  void tampilkan() {
    // Jika linked list kosong
    if (kepala == null) {
      print("Linked List kosong.");
      return;
    }

    // Mulai dari node pertama (kepala)
    Node? current = kepala; // Menggunakan Node? untuk menghindari null pointer
    while (current != null) {
      // Tampilkan data dari node saat ini
      print(current.nilai);
      // Lanjutkan ke node berikutnya
      current = current.berikutnya;
    }
  }

  // Fungsi untuk menghapus elemen pertama dalam linked list
  void hapusPertama() {
    // Jika linked list tidak kosong
    if (kepala != null) {
      kepala = kepala!.berikutnya; // Pindahkan kepala ke node berikutnya
    } else {
      print("Linked List kosong, tidak ada elemen untuk dihapus.");
    }
  }

  // Fungsi untuk menghapus node dengan nilai tertentu
  void hapus(int nilai) {
    if (kepala == null) {
      print("Linked List kosong, tidak bisa menghapus elemen."); // Pesan jika Linked List kosong
      return; 
    }

    // Jika node pertama adalah yang ingin dihapus
    if (kepala!.nilai == nilai) {
      kepala = kepala!.berikutnya; // Pindahkan kepala ke node berikutnya
      return;
    }

    // Cari node yang memiliki nilai tersebut
    Node? current = kepala;
    Node? sebelumnya;
    while (current != null && current.nilai != nilai) {
      sebelumnya = current;
      current = current.berikutnya;
    }

    // Jika ditemukan, hapus node tersebut
    if (current != null) {
      sebelumnya!.berikutnya = current.berikutnya;
    } else {
      print("Node dengan nilai $nilai tidak ditemukan."); // Jika nilai tidak ditemukan
    }
  }
}

void main() {
  // Membuat objek LinkedList
  LinkedList daftar = LinkedList();

  // Menambahkan beberapa elemen ke dalam linked list
  daftar.tambah(5);
  daftar.tambah(10);
  daftar.tambah(15);

  // Menampilkan semua elemen dalam linked list
  print("Isi LinkedList:");
  daftar.tampilkan();

  // Menghapus elemen dengan nilai tertentu
  print("\nMenghapus elemen dengan nilai 10:");
  daftar.hapus(10);
  daftar.tampilkan();
  
  // Menghapus elemen pertama
  print("\nMenghapus elemen pertama:");
  daftar.hapusPertama();
  daftar.tampilkan();
}
