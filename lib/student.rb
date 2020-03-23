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
      INSERT INTO students (name, grade) VALUES (?, ?);
    SQL

    DB[:conn].execute(sql, @name, @grade)

    sql = <<-SQL
      SELECT id FROM students WHERE name = ?;
    SQL

    DB[:conn].execute(sql, @name)[0][0]
  end

  def self.create

  end
end
