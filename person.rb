require './nameable'

class Person < Nameable
  attr_accessor :name, :age, :rental_details
  attr_reader :id

  def initialize(name, age, parent_permission)
    super()
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rental_details = []
  end

  def of_age?
    @age >= 18
  end

  def can_use_service?
    @age >= 18 || @parent_permission
  end

  def correct_name
    @name
  end

  def add_rental_details(date, book)
    Rental.new(date, book, self)
  end
end
