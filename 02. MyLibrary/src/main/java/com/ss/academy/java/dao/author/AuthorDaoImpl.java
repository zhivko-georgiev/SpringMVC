package com.ss.academy.java.dao.author;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Hibernate;
import org.hibernate.Query;
import org.hibernate.criterion.Order;
import org.springframework.stereotype.Repository;

import com.ss.academy.java.dao.AbstractDao;
import com.ss.academy.java.model.author.Author;

@Repository("authorDao")
public class AuthorDaoImpl extends AbstractDao<Long, Author> implements AuthorDao {

	public Author findById(Long id) {
		Author author = getByKey(id);
        if(author!=null){
            Hibernate.initialize(author.getBooks());
        }
        return author;
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
		Criteria criteria = createEntityCriteria().addOrder(Order.asc("name"));
        criteria.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY);//To avoid duplicates.
        List<Author> authors = (List<Author>) criteria.list();
         
        // No need to fetch userProfiles since we are not showing them on list page. Let them lazy load. 
        // Uncomment below lines for eagerly fetching of userProfiles if you want.
        
        for(Author author : authors){
            Hibernate.initialize(author.getBooks());
        }
        return authors;
	}
}