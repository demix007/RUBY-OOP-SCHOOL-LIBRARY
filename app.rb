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

    def create_a_book
        puts 'Title: '
        book_title = gets.chomp
        print 'Author: '
        book_author = gets.chomp
        puts 'New Book was successfully created'
        book = Book.new(book_title, book_author)
        @book_list.push(book)
        puts 'New Book was successfully created'
    end

    def create_a_rental
        puts 'Enter the date in this format (yyyy/dd/mm)'
        date = gets.chomp
        puts 'Select a book to rent from the list of books:'
        @book_list.each_with_index { |book, i| puts "#{i}) #{book.title} written by #{book.author}" }
        bookid = gets.chomp.to_i
        book = @book_list[bookid]
        puts 'Select a person making the rental from the list of people:'
        @people_list.each_with_index { |person, i| puts "#{i}) #{person.name}" }
        personid = gets.chomp.to_i
        person = @people_list[personid]
        rental = Rental.new(date, book, person)
        @rental_list.push(rental)    
    end

    def list_rentals_by_id
        if @list_rentals.empty?
          puts 'Please add a book.'
        else
          print 'ID of person: '
          id = gets.chomp.to_i
          puts 'Rentals: '
          @list_rentals.each do |n|
            if n.person.id == id
              puts "Date: #{n.date}, Book: \"#{n.book.title}\" by #{n.book.author} "
            else
              puts 'No rentals matched that id'
            end
        end
    end
end