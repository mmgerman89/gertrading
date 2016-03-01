class HomeController < ApplicationController
  before_filter :authenticate_user!, only: [:index]
  
  def index
    @my_stocks = current_user.my_stocks
  end
end
