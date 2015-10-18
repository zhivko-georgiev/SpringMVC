package com.ss.academy.java.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.springframework.stereotype.Repository;

import com.ss.academy.java.model.Book;

@Repository("bookDao")
public class BookDaoImpl extends AbstractDao<Long, Book> implements BookDao {

	@Override
	public Book findById(Long id) {
		return getByKey(id);
	}

	@Override
	public void saveBook(Book book) {
		persist(book);
	}

	@Override
	public void deleteBookById(Long id) {
        Query query = getSession().createSQLQuery("delete from books where id = :id");
        query.setLong("id", id);
        query.executeUpdate();
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Book> findAllBooks() {
		Criteria criteria = createEntityCriteria();
		
        return (List<Book>) criteria.list();
	}

//	@SuppressWarnings("unchecked")
//	@Override
//	public List<Author> findAllAuthors() {
//		Criteria criteria = createEntityCriteria();
//		
//        return (List<Author>) criteria.list();
//	}
}
