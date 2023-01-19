require './nameable'

class Person
  attr_accessor :name, :age, :id

  def initialize(id, age, name = 'unknown', parent_permission: true)
    super()
    @id = id
    @age = age
    @name = name
    @parent_permission = parent_permission
  end

  private

  def of_age?
    @age >= 18
  end

  def can_use_service?
    @age >= 18 || parent_permission == true
  end

  def correct_name
    @name
  end 
end
