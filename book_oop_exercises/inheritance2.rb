# Student

class Student
  attr_accessor :name
  attr_writer :grade

  def initialize(name, grade)
    self.name = name
    self.grade = grade
  end

  def better_grade_than?(other_student)
    self.grade > other_student.grade
    # or
    # grade > other_student.grade
  end

  protected
  # if we use 'private' instead, we could not access other students' grade even
  # they belonged to the same class

  def grade
    @grade
  end
end

student1 = Student.new('John', 3.5)
stud2 = Student.new('Joe', 3.2)
puts student1.name

puts 'Well done!' if student1.better_grade_than?(stud2)
