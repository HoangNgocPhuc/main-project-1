class StaticPagesController < ApplicationController
  def home
    @health = current_user.healths.build if logged_in?
  end

  def help
    
  end

  def about
    
  end

  def contact
    
  end
  
  def test
    
  end
end
