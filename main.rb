require './app'

def main
  @app = App.new

  books = []
  rental_details = []
  people = []

  options(books, people, rental_details)
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
      @app.list_of_people
    when 2
      @app.list_of_books
    when 3
      @app.create_a_person
    when 4
      @app.create_a_book
    when 5
      @app.create_a_rental
    when 6
      @app.list_rental_by_id
    else
      break
    end
  end
end

main
