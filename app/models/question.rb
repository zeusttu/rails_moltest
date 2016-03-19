class Question < ActiveRecord::Base
  belongs_to :mole_test
  belongs_to :answer
end
