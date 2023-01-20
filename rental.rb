class Rental
  attr_accessor :date, :book, :person

  def initialize(date)
    @date = date
    @book = book
    book.rental_details << self
    @person = person
    person.rental_details << self
  end
end
