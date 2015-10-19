package com.ss.academy.java.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.springframework.stereotype.Repository;

import com.ss.academy.java.model.Author;

@Repository("authorDao")
public class AuthorDaoImpl extends AbstractDao<Long, Author> implements AuthorDao {

	@Override
	public Author findById(Long id) {
		return getByKey(id);
	}

	@Override
	public void saveAuthor(Author author) {
		persist(author);
	}

	@Override
	public void deleteAuthorById(Long id) {
		Query query = getSession().createSQLQuery("delete from author where id = :id");
		query.setLong("id", id);
		query.executeUpdate();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Author> findAllAuthors() {
		Criteria criteria = createEntityCriteria();

		return (List<Author>) criteria.list();
	}
}