package com.ss.academy.java.dao;

import java.util.List;

import com.ss.academy.java.model.Author;

public interface AuthorDao {
 
    Author findById(Long id);
 
    void saveAuthor(Author author);
     
    void deleteAuthorById(Long id);
     
    List<Author> findAllAuthors();
}