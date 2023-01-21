require './nameable'

class Person < Nameable
  attr_accessor :name, :age, :rental_details
  attr_reader :id

  def initialize(age, name, parent_permission)
    super()
    @id = Random.rand(1..1000)
    @age = age
    @name = name
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
