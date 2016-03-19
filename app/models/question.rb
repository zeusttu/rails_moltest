class Question < ActiveRecord::Base
  belongs_to :mole_test
  belongs_to :answer
  has_many :answers
  accepts_nested_attributes_for :answers
end
