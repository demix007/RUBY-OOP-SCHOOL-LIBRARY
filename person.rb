class Person
    attr_reader :id
    attr_accessor :name, :age
  
    def initialize(name = 'unknown', age, parent_permission: true)
      @id = Random.random(1...10000)
      @age = age
      @name = name
      @parent_permission = parent_permission
    end
end