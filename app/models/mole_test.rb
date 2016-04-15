class MoleTest < ActiveRecord::Base
  has_many :questions
  has_many :test_results
  accepts_nested_attributes_for :questions
end
