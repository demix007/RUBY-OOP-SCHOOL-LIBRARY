require './app'
class Main
  def main
    @app = App.new

    books = []
    rental_details = []
    people = []

    @app.options(books, people, rental_details)
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

start = Main.new
 
start.main
