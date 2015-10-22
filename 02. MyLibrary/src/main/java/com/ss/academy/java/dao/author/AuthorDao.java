package com.ss.academy.java.dao.author;

import java.util.List;

import com.ss.academy.java.model.author.Author;

public interface AuthorDao {
 
    Author findById(Long id);
 
    void saveAuthor(Author author);
     
    void deleteAuthorById(Long id);
     
    List<Author> findAllAuthors();
}