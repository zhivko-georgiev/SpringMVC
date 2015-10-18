package com.ss.academy.java.dao;

import java.util.List;

import com.ss.academy.java.model.Author;
import com.ss.academy.java.model.Book;;

public interface AuthorDao {
 
    Author findById(Long id);
 
    void saveAuthor(Author author);
     
    void deleteAuthorById(Long id);
     
    List<Author> findAllAuthors();
    
    List<Book> findAllBooks();
}