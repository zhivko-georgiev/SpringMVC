package com.ss.academy.java.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.springframework.stereotype.Repository;

import com.ss.academy.java.model.Author;

@Repository("authorDao")
public class AuthorDaoImpl extends AbstractDao<Long, Author> implements AuthorDao {

	public Author findById(Long id) {
		return getByKey(id);
	}

	public void saveAuthor(Author author) {
		persist(author);
	}

	public void deleteAuthorById(Long id) {
		Query query = getSession().createSQLQuery("delete from author where author_id = :id");
		query.setLong("id", id);
		query.executeUpdate();
	}

	@SuppressWarnings("unchecked")
	public List<Author> findAllAuthors() {
		Criteria criteria = createEntityCriteria();

		return (List<Author>) criteria.list();
	}
}