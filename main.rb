require './app'
class Main
  def main
    @app = App.new

    books = []
    rental_details = []
    people = []

    @app.options(books, people, rental_details)
  end
end

start = Main.new
 
start.main
