<?php

require_once 'ebook.php';
require_once 'printedbook.php';

$books = [];


if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $n = intval($_POST['number_of_books']);

    for ($i = 0; $i < $n; $i++) {
        $type = $_POST['type'][$i];
        $title = $_POST['title'][$i];
        $author = $_POST['author'][$i];
        $publicationYear = intval($_POST['publication_year'][$i]);

        if ($type === "EBook") {
            $fileSize = intval($_POST['file_size'][$i]);
            $books[] = new EBook($title, $author, $publicationYear, $fileSize);
        } elseif ($type === "PrintedBook") {
            $numberOfPages = intval($_POST['number_of_pages'][$i]);
            $books[] = new PrintedBook($title, $author, $publicationYear, $numberOfPages);
        }
    }
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Library System </title>
    <link rel="stylesheet" href="index.css">
</head>
<body>
    <div class="container"> 
        <h1>Library System</h1>
        <form method="POST" action="">
            <label for="number_of_books">Number of book you want to insert:</label>
            <input type="number" id="number_of_books" name="number_of_books" required min="1" max="100">
            <div id="books-container"></div>
            <button type="button" id="add-book">Add Book</button>
            <button type="submit">Submit</button>
        </form>

        <?php if (!empty($books)): ?>
            <h2>Book Details:</h2>
            <ul>
                <?php foreach ($books as $book): ?>
                    <li><?php echo $book->getDetails(); ?></li>
                <?php endforeach; ?>
            </ul>
        <?php endif; ?>
    </div>

    <script>
        const booksContainer = document.getElementById('books-container');
        const addBookButton = document.getElementById('add-book');

        addBookButton.addEventListener('click', () => {
            const index = booksContainer.children.length;
            const bookHTML = `
                <div class="book-entry">
                    <h3>Book ${index + 1}</h3>
                    <label for="type_${index}">Type:</label>
                    <select name="type[]" id="type_${index}" required>
                        <option value="Default">Default</option>
                        <option value="EBook">EBook</option>
                        <option value="PrintedBook">PrintedBook</option>
                    </select>
                    <label for="title_${index}" >Title:</label>
                    <input type="text" name="title[]" id="title_${index}" required>
                    <label for="author_${index}">Author:</label>
                    <input type="text" name="author[]" id="author_${index}" required>
                    <label for="publication_year_${index}">Publication Year:</label>
                    <input type="number" name="publication_year[]" id="publication_year_${index}" required min="1500" max="2024">
                    <div id="ebook-fields_${index}" style="display: none;">
                        <label for="file_size_${index}">File Size (MB):</label>
                        <input type="number" name="file_size[]" id="file_size_${index}" min="1" max="100">
                    </div>
                    <div id="printedbook-fields_${index}" style="display: none;">
                        <label for="number_of_pages_${index}">Number of Pages:</label>
                        <input type="number" name="number_of_pages[]" id="number_of_pages_${index}" min="1">
                    </div>
                </div>
            `;
            booksContainer.insertAdjacentHTML('beforeend', bookHTML);
        });

        booksContainer.addEventListener('change', (event) => {
            if (event.target.name === 'type[]') {
                const index = event.target.id.split('_')[1];
                const ebookFields = document.getElementById(`ebook-fields_${index}`);
                const printedbookFields = document.getElementById(`printedbook-fields_${index}`);
                const fileSizeInput = document.getElementById(`file_size_${index}`);
                const numberOfPagesInput = document.getElementById(`number_of_pages_${index}`);

                if (event.target.value === 'EBook') {
                    ebookFields.style.display = 'block';
                    fileSizeInput.required = true;
                    printedbookFields.style.display = 'none';
                    numberOfPagesInput.required = false;
                } else if (event.target.value === 'PrintedBook') {
                    printedbookFields.style.display = 'block';
                    numberOfPagesInput.required = true;
                    ebookFields.style.display = 'none';
                    fileSizeInput.required = false;
                } else {
                    ebookFields.style.display = 'none';
                    printedbookFields.style.display = 'none';
                    fileSizeInput.required = false;
                    numberOfPagesInput.required = false;
                }
            }
        });
    </script>
</body>
</html>
