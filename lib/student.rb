require_relative "../config/environment.rb"

class Student
  attr_reader :name, :grade, :id

  def initialize(name, grade)
    @name = name
    @grade = grade
  end

  def self.create_table
    sql = <<-SQL
      CREATE TABLE IF NOT EXISTS students (
        id INTEGER PRIMARY KEY,
        name TEXT,
        grade INTEGER
      );
    SQL

    DB[:conn].execute(sql)
  end

  def self.drop_table
    sql = <<-SQL
      DROP TABLE IF EXISTS students;
    SQL

    DB[:conn].execute(sql)
  end

  def save 
    sql = <<-SQL
      INSERT INTO students (name, grade) VALUE (?, ?);
    SQL

    bob = DB[:conn].execute(sql, name, grade)
    binding.pry
  end

  def self.create 
    
  end
end
