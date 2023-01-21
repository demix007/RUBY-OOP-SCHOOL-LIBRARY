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

    def list_of_people
        if @people_list.empty?
          puts 'The list of people is empty'
        else
          @people_list.each do |person|
            puts "#{person.name} is a #{person.age} year old person, with an ID of #{person.id}"
          end
        end
    end

    def create_a_person
        puts 'Enter (1) to create a student || Enter (2) to create a teacher'
        user_input = gets.chomp.to_i
        case user_input
        when 1
          create_a_student
        when 2
          create_a_teacher
        end
    end
end