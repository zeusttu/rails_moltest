class TestController < ApplicationController
  def index
    if !candidate_signed_in?
      redirect_to action: :login
    elsif !current_candidate.current_test_id.blank?
      @test_result = TestResult.where(candidate_id: current_candidate.id, mole_test_id: current_candidate.current_test_id).first
    else
      highest_testnum_so_far = TestResult.where(candidate_id: current_candidate.id).collect { |r| r.mole_test.testnum }.max
      remaining_tests = highest_testnum_so_far.nil? ? MoleTest.all : MoleTest.where("testnum > ?", highest_testnum_so_far)
      new_test = remaining_tests.order(:testnum).first
      @test_result = TestResult.create(candidate: current_candidate, mole_test: new_test, started_at: Time.now())
      current_candidate.current_test_id = @test_result.mole_test_id
      current_candidate.update_attributes current_test_id: @test_result.mole_test_id, last_test_id: @test_result.mole_test_id
    end
  end
  
  def login
  end
end
