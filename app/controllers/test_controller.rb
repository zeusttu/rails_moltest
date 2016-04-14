class TestController < ApplicationController
  def index
    if !candidate_signed_in?
      redirect_to action: :login
    end
  end
  
  def login
  end
end
