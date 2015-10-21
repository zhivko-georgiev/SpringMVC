package com.ss.academy.java.dao.book;

import java.util.List;

import com.ss.academy.java.model.Book;

public interface BookDao {
	
	Book findById(Long id);

	void saveBook(Book book);

	void deleteBookById(Long id);

	List<Book> findAllBooks();
}
