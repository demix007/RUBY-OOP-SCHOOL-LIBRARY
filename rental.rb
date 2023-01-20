class Rental
  attr_accessor :date, :book

  def initialize(date)
    @date = date
    @book = book
    book.rental_details << self
  end
end