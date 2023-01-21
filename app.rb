require './book'
require './teacher'
require './student'
require './rental'

class App
    def initialize
        @book_list = []
        @people_list = []
        @rental_list = []
    end

    def list_of_books
        if @book_list.empty?
          puts 'There are currently no books available'
        else
          @book_list.each do |book|
            puts "#{book.title} written by #{book.author}"
          end
        end
    end

end