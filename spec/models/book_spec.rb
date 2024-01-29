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

  it "creates a book with all attributes" do
    book = Book.new(title: "Test Title", author: "Test Author", price: "35.00", published_date: "June 17, 2017")
    expect(book).to be_valid
  end
end
