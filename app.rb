require './book'
require './teacher'
require './student'
require './rental'
require './classroom'
require './nameable'
require './person'

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
    puts 'classroom:'
    classroom = gets.chomp
    puts 'Name:'
    name = gets.chomp
    puts 'Age:'
    age = gets.chomp
    puts 'permission:'
    parent_permission = gets.chomp
    new_student = Student.new(name, age, classroom, parent_permission)
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
    person_id = gets.chomp.to_i
    person = @people_list[person_id]
    rental = Rental.new(date, book, person)
    @rental_list.push(rental)
  end

  def list_rental_by_id
    if @rental_list.empty?
      puts 'Please add a book.'
    else
      print 'ID of person: '
      id = gets.chomp.to_i
      puts 'Rentals: '
      @rental_list.each do |n|
        if n.person.id == id
          puts "Date: #{n.date}, Book: \"#{n.book.title}\" by #{n.book.author} "
        else
          puts 'No rentals matched that id'
        end
      end
    end
  end

  def display_all
    puts 'Welcome To The School Library Application'
    puts ' Please choose an action you want to perform'
    puts "
      1: List all books.
      2: List all people.
      3: Create a person(Teacher or Student)
      4: Create a book
      5: Create a rental
      6: List all rentals for a given person ID
      7: Exit School Library Application
      "
  end

  def options(*)
    loop do
      display_all
      option = gets.chomp.to_i
      case option
      when 1
        list_of_people
      when 2
        list_of_books
      when 3
        create_a_person
      when 4
        create_a_book
      when 5
        create_a_rental
      when 6
        list_rental_by_id
      else
        break
      end
    end
  end
end
