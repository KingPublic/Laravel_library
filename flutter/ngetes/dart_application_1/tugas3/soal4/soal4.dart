import 'dart:io';

class Book {
  String _title;
  String _author;
  int _year;

  Book({required String title, required String author, required int year})
      : _title = title,
        _author = author,
        _year = year;

  String get title => _title;
  set title(String value) => _title = value;

  String get author => _author;
  set author(String value) => _author = value;

  int get year => _year;
  set year(int value) => _year = value;

  @override
  String toString() {
    return '$_title by $_author ($_year)';
  }
}

class Library {
  List<Book> _books = [];

  List<Book> get books => _books;

  void addBook() {
    print('Enter the title of the book:');
    String title = stdin.readLineSync()!;
    print('Enter the author of the book:');
    String author = stdin.readLineSync()!;
    print('Enter the year of the book:');
    int year = int.parse(stdin.readLineSync()!);

    Book book = Book(title: title, author: author, year: year);
    _books.add(book);
    print('Book added: $book');
  }

  void removeBook() {
    print('Enter the title of the book to remove:');
    String title = stdin.readLineSync()!;
    print('Enter the author of the book to remove:');
    String author = stdin.readLineSync()!;
    print('Enter the year of the book to remove:');
    int year = int.parse(stdin.readLineSync()!);

    Book book = Book(title: title, author: author, year: year);
    if (_books.contains(book)) {
      _books.remove(book);
      print('Book removed: $book');
    } else {
      print('Book not found in library.');
    }
  }

  void displayBooks() {
    if (_books.isEmpty) {
      print('Library is empty.');
    } else {
      print('Books in library:');
      for (var book in _books) {
        print(book);
      }
    }
  }
}