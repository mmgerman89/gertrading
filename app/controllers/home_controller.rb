class HomeController < ApplicationController
  before_filter :authenticate_user!, only: [:index]
  
  def index
    @my_stocks = current_user.my_stocks.order(sale_date: :asc)
    #@my_stocks = @my_stocks.sort_by{ |a, b| a.symbol > b.symbol }
  end
end
