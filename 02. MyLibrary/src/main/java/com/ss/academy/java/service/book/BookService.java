package com.ss.academy.java.service.book;

import java.util.List;
import java.util.Set;

import com.ss.academy.java.model.book.Book;

public interface BookService {

	Book findById(Long id);

	void saveBook(Book book);

	void updateBook(Book book);

	Set<Book> findAllBooks();

	void deleteBook(Book book);
}