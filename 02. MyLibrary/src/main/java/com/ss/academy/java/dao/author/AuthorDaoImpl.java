package com.ss.academy.java.dao.author;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.criterion.Order;
import org.springframework.stereotype.Repository;

import com.ss.academy.java.dao.AbstractDao;
import com.ss.academy.java.model.author.Author;

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
		Criteria criteria = createEntityCriteria().addOrder(Order.asc("name")); // Order
																				// ascending
																				// by
																				// name
		criteria.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY);   // To avoid
																		// duplicates.
		List<Author> authors = (List<Author>) criteria.list();

		return authors;
	}
}