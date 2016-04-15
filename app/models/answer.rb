class Answer < ActiveRecord::Base
  belongs_to :question
  
  has_many :given_answers
end
