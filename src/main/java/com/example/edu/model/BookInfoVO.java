package com.example.edu.model;

public class BookInfoVO {
	
	private String image;
	private String author;
	private String isbn;
	private String link;
	private String discount;
	private String publisher;
	private String description;
	private String title;
	private String pubdate;	
	
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public String getIsbn() {
		return isbn;
	}
	public void setIsbn(String isbn) {
		this.isbn = isbn;
	}
	public String getLink() {
		return link;
	}
	public void setLink(String link) {
		this.link = link;
	}
	public String getDiscount() {
		return discount;
	}
	public void setDiscount(String discount) {
		this.discount = discount;
	}
	public String getPublisher() {
		return publisher;
	}
	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getPubdate() {
		return pubdate;
	}
	public void setPubdate(String pubdate) {
		this.pubdate = pubdate;
	}
	
	public String toString() {
		return "BookInfoVO [image=" + image + ", author=" + author + ", isbn=" + isbn + ", link=" + link + ", discount="
				+ discount + ", publisher=" + publisher + ", description=" + description + ", title=" + title
				+ ", pubdate=" + pubdate + ", getImage()=" + getImage() + ", getAuthor()=" + getAuthor()
				+ ", getIsbn()=" + getIsbn() + ", getLink()=" + getLink() + ", getDiscount()=" + getDiscount()
				+ ", getPublisher()=" + getPublisher() + ", getDescription()=" + getDescription() + ", getTitle()="
				+ getTitle() + ", getPubdate()=" + getPubdate() + ", getClass()=" + getClass() + ", hashCode()="
				+ hashCode() + ", toString()=" + super.toString() + "]";
	}
}
