class Book
    attr_accessor :title, :author, :rental_details
  
    def initialize(title, author)
      @title = title
      @author = author
      @rental_details = []
    end
  
    def add_rental_details(date, person)
      Rental.new(date, self, person)
    end
end