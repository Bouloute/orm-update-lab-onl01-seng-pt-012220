require_relative "../config/environment.rb"

class Student
  attr_reader :name, :grade, :id

  def initialize(name, grade)
    @name = name
    @grade = grade
  end

  def self.create_table
    sql = <<-SQL
      CREATE TABLE students (
        id INTEGER PRIMARY KEY,
        name TEXT,
        grade INTEGER
      );
    SQL

    DB[:conn].execute(sql)
  end

end
