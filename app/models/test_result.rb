class TestResult < ActiveRecord::Base
  belongs_to :user
  belongs_to :mole_test
end
