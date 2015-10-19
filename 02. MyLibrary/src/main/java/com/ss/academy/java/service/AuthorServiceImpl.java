package com.ss.academy.java.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ss.academy.java.dao.AuthorDao;
import com.ss.academy.java.model.Author;

@Service("authorService")
@Transactional
public class AuthorServiceImpl implements AuthorService {

	@Autowired
	private AuthorDao dao;

	@Override
	public Author findById(Long id) {
		return dao.findById(id);
	}

	@Override
	public void saveAuthor(Author author) {
		dao.saveAuthor(author);
	}

	@Override
	public void updateAuthor(Author author) {
		Author entity = dao.findById(author.getId());

		if (entity != null) {
			entity.setName(author.getName());
			entity.setCountry(author.getCountry());
			// entity.setBooks(author.getBooks());
		}
	}

	@Override
	public void deleteAuthor(Author author) {
		dao.deleteAuthorById(author.getId());
	}

	@Override
	public List<Author> findAllAuthors() {
		return dao.findAllAuthors();
	}
}
