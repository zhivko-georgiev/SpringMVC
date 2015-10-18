package com.ss.academy.java.service;

import java.util.List;

import com.ss.academy.java.model.Author;
import com.ss.academy.java.model.Book;

public interface BookService {

	Book findById(Long id);

	void saveBook(Book book);

	void updateBook(Book book);

	List<Author> findAllAuthors();

	List<Book> findAllBooks();

	void deleteBook(Book book);
}