require 'rails_helper'

RSpec.describe "BookCruds", type: :feature do

  it "creates a new book and redirects to the book's page" do
    visit "/books/new"

    fill_in "Title", with: "Blue Period"

    click_on "Create Book"

    expect(page).to have_text("Book was successfully created.")
  end

  it "creates a new book with all attributes and redirects to the book's page" do
    visit "/books/new"

    fill_in "Title", with: "Blue Period"
    fill_in "Author", with: "Tsubasa Yamaguchi"
    fill_in "Price", with: "35.00"
    fill_in "Published date", with: "Sat, 24 Jun 2017"

    click_on "Create Book"

    expect(page).to have_text("Book was successfully created.")
    expect(Book.last.title).to eq("Blue Period")
    expect(Book.last.author).to eq("Tsubasa Yamaguchi")
    expect(Book.last.price).to eq(35.00)
    # expect(Book.last.published_date).to eq("Sat, 24 Jun 2017")
    expect(Book.last.published_date.strftime('%a, %d %b %Y')).to eq("Sat, 24 Jun 2017")


  end

  it "shows a book's attributes on its show page" do
    book = Book.create(title: "Blue Period", author: "Tsubasa Yamaguchi", price: 35.00, published_date: "June 24, 2017")

    visit "/books/#{book.id}"

    expect(page).to have_text("Blue Period")
    expect(page).to have_text("Tsubasa Yamaguchi")
    expect(page).to have_text(35.00)
    # expect(page).to have_text("Sat, 24 Jun 2017")
    expect(Book.last.published_date.strftime('%a, %d %b %Y')).to eq("Sat, 24 Jun 2017")

  end

  it "does not create a book if it has no title" do
    visit "/books/new"

    fill_in "Title", with: ""

    click_on "Create Book"

    expect(page).to have_text("Title can't be blank")
  end
end
