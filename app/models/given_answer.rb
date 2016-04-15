class GivenAnswer < ActiveRecord::Base
  belongs_to :test_result
  belongs_to :question
  belongs_to :answer
end
