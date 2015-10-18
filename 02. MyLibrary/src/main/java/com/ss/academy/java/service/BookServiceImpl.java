package com.ss.academy.java.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ss.academy.java.dao.BookDao;
import com.ss.academy.java.model.Book;

@Service("bookService")
@Transactional
public class BookServiceImpl implements BookService {

	@Autowired
	private BookDao dao;

	@Override
	public Book findById(Long id) {
		return dao.findById(id);
	}

	@Override
	public void saveBook(Book book) {
		dao.saveBook(book);
	}

	@Override
	public void updateBook(Book book) {
		Book entity = dao.findById(book.getId());

		if (entity != null) {
			entity.setName(book.getName());
			entity.setStatus(book.getStatus());
		}
	}

	// @Override
	// public List<Author> findAllAuthors() {
	// return dao.findAllAuthors();
	// }

	@Override
	public List<Book> findAllBooks() {
		return dao.findAllBooks();
	};

	@Override
	public void deleteBook(Book book) {
		dao.deleteBookById(book.getId());
	}
}