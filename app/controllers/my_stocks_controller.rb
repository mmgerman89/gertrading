class MyStocksController < ApplicationController
  before_action :owner, only: [:edit, :update]
  
  def index
    @my_stocks = current_user.my_stocks
  end
  
  def update
    if @stock.update(stock_params)
      redirect_to root_path
    else
      flash[:error] = "Error al actualizar"
      render :edit
    end
  end
  
  def new
    @stock = MyStock.new()
  end
  
  def create
    @stock = MyStock.new(stock_params)
    @stock.user = current_user
    
    if @stock.save
      redirect_to root_path
    else
      flash[:error] = "Error al guardar"
      render :new
    end
  end
  
  protected
  
  def owner
    @stock = MyStock.find(params[:id])
    if @stock.user != current_user
      flash[:error] = "No podes hacer eso!"
      redirect_to root_path
    end
  end
  
  def stock_params
    params.require(:my_stock).permit(:symbol, :quantity, :purchase_date, :purchase_price, :purchase_commission,
      :purchase_market_right, :purchase_commission_iva, :purchase_market_right_iva, :sale_date, :sale_price, 
      :sale_commission, :sale_market_right, :sale_commission_iva, :sale_market_right_iva, :user_id, :type_stock )
  end
  
end
