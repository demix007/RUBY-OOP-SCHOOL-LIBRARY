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

    def create_a_student
        puts 'Name:'
        name = gets.chomp
        puts 'Age:'
        age = gets.chomp
        puts 'permission:'
        parent_permission = gets.chomp
        puts 'classroom:'
        clasroom = gets.chomp
        new_student = Student.new(name, age, parent_permission, classroom)
        @people_list.push(new_student)
        puts 'New student was successfully created'
    end

    def create_a_teacher
        puts 'Name:'
        name = gets.chomp
        puts 'Age:'
        age = gets.chomp
        puts 'specialization:'
        specialization = gets.chomp
        new_teacher = Teacher.new(name, age, specialization)
        @people_list.push(new_teacher)
        puts 'New teacher was successfully created'
    end

    def create_book
        puts 'Title: '
        book_title = gets.chomp
        print 'Author: '
        book_author = gets.chomp
        puts 'New Book was successfully created'
        book = Book.new(bookt_title, book_author)
        @list_books.push(book)
    end
end