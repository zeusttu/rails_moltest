class TestResult < ActiveRecord::Base
  belongs_to :candidate
  belongs_to :mole_test
  
  has_many :given_answers
end
