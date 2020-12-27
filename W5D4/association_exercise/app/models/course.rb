# == Schema Information
#
# Table name: courses
#
#  id            :bigint           not null, primary key
#  name          :string
#  prereq_id     :integer
#  instructor_id :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
class Course < ApplicationRecord
  has_many :enrollments,
    primary_key: :id,
    foreign_key: :course_id,
    class_name: :Enrollment
  has_many :enrolled_students,
    through: :enrollments,
    source: :student

  has_many :prerequisite,
    class_name: :Course,
    primary_key: :id,
    foreign_key: :prereq_id

  belongs_to :prerequisite,
    class_name: :Course

  belongs_to :instructor,
    class_name: :User,
    primary_key: :id,
    foreign_key: :instructor_id
end