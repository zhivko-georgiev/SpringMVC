package com.ss.academy.java.service;

import java.util.List;

import com.ss.academy.java.model.Author;

public interface AuthorService {
	
	Author findById(Long id);

	void saveAuthor(Author author);

	void updateAuthor(Author author);

	List<Author> findAllAuthors();

	void deleteAuthor(Author author);
}
