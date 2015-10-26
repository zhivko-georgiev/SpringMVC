package com.ss.academy.java.dao.book;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.criterion.Order;
import org.springframework.stereotype.Repository;

import com.ss.academy.java.dao.AbstractDao;
import com.ss.academy.java.model.book.Book;

@Repository("bookDao")
public class BookDaoImpl extends AbstractDao<Long, Book> implements BookDao {

	public Book findById(Long id) {
		return getByKey(id);
	}

	public void saveBook(Book book) {
		persist(book);
	}

	public void deleteBookById(Long id) {
		Query query = getSession().createSQLQuery("delete from author_book where book_id = :id");
		query.setLong("id", id);
		query.executeUpdate();
	}

	@SuppressWarnings("unchecked")
	public List<Book> findAllBooks() {
		Criteria criteria = createEntityCriteria().addOrder(Order.asc("title"));    // Order
																					// ascending
																					// by
																					// title
		criteria.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY);   // To avoid
																		// duplicates.
		List<Book> books = (List<Book>) criteria.list();

		return books;
	}
}
