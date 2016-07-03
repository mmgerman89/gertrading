class MyStocksController < ApplicationController
  before_action :owner, only: [:show, :edit, :update]

  def show

  end
  
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

  def current_assets
    my_stocks = current_user.my_stocks

    total = 0
    my_stocks.each do |stock|
      if stock.sale_date == nil
        total = stock.total_sale
      end
    end

    if total = 0
      total = 1
    end

    symbols = []
    prices = []
    my_stocks.each do |stock|
      if stock.sale_date == nil
        symbols << [stock.symbol, stock.total_sale / total]
      end
    end

    if symbols.size == 0
      symbols << ["Ninguno", 1]
    end

    result = symbols.map do |sym, price|
      { label: sym, data: price }
    end

    result = result.to_json

    respond_to do |format|
      format.json { render json: result}
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
