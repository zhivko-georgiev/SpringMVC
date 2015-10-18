package com.ss.academy.java.service;

import java.util.List;

import com.ss.academy.java.model.Author;
import com.ss.academy.java.model.Book;

public interface AuthorService {
	Author findById(Long id);

	void saveAuthor(Author author);

	void updateAuthor(Author author);

	List<Book> findAllBooks();

	List<Author> findAllAuthors();

	void deleteAuthor(Author author);
}
