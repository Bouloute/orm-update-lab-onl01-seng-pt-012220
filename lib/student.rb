require_relative "../config/environment.rb"

class Student
  attr_reader :name, :grade, :id

  def initialize(name, grade)
    @name = name
    @grade = grade
  end



end
