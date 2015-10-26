package com.ss.academy.java.model.author;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import com.ss.academy.java.model.book.Book;

@Entity
@Table(name = "AUTHOR")
public class Author {

	@Id
	@Column(name = "AUTHOR_ID")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	@Size(min = 3, max = 100)
	@Column(name = "NAME")
	@NotNull
	private String name;

	@Column(name = "COUNTRY")
	@Enumerated(EnumType.STRING)
	@NotNull
	private AuthorCountry country;

	@OneToMany(mappedBy = "author")
	private List<Book> books;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public AuthorCountry getCountry() {
		return country;
	}

	public void setCountry(AuthorCountry country) {
		this.country = country;
	}

	public List<Book> getBooks() {
		return books;
	}

	public void setBooks(List<Book> books) {
		this.books = books;
	}
}
