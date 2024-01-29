require 'rails_helper'

RSpec.describe Book, type: :model do
  it "is valid with a title" do
    book = Book.new(title: "Test Title")
    expect(book).to be_valid
  end

  it "is not valid without a title" do
    book = Book.new(title: nil)
    expect(book).to_not be_valid
  end
end
RSpec.describe "BookCruds", type: :feature do
  before do
    driven_by(:rack_test)
  end

  it "creates a new book and redirects to the book's page" do
    visit "/books/new"

    fill_in "Title", with: "Blue Period"

    click_on "Create Book"

    expect(page).to have_text("Book was successfully created."), "Expected to have text 'Book was successfully created.' but didn't find it."
  end

  it "creates a new book with all attributes and redirects to the book's page" do
    visit "/books/new"

    fill_in "Title", with: "Blue Period"
    fill_in "Author", with: "Tsubasa Yamaguchi"
    fill_in "Price", with: "35.00"
    fill_in "Published date", with: "June 24, 2017"

    click_on "Create Book"

    expect(page).to have_text("Book was successfully created.")
    expect(Book.last.title).to eq("Blue Period"), "Expected the book's title to be 'Blue Period', but it was #{Book.last.title}"
    # expect(Book.last.author).to eq("Tsubasa Yamaguchi")
    # expect(Book.last.price).to eq(35.00)
    # expect(Book.last.published_date).to eq("June 24, 2017")

  end

  # it "does not create a book if it has no title" do
  #   visit "/books/new"

  #   fill_in "Title", with: ""

  #   click_on "Create Book"

  #   expect(page).to have_text("Title can't be blank")
  # end
end
