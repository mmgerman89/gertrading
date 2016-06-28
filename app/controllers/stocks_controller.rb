class StocksController < ApplicationController
  before_action :set_stock, only: [:show, :edit, :update, :destroy]

  # GET /stocks
  # GET /stocks.json
  def index
    list_stocks = Stock.uniq.pluck(:symbol)
    list_stocks.sort()
    @stocks = []
    list_stocks.each do |stock|
      @stocks << Stock.where(symbol: stock).order("date DESC").first
    end
  end

  # GET /stocks/1
  # GET /stocks/1.json
  def show
    symbol = Stock.where(id: params[:id]).first.symbol
    @data_stock = Stock.where(symbol: symbol).order("date DESC").take(20)
  end

  # GET /stocks/new
  def new
    @stock = Stock.new
  end

  # GET /stocks/1/edit
  def edit
  end

  # POST /stocks
  # POST /stocks.json
  def create
    @stock = Stock.new(stock_params)

    respond_to do |format|
      if @stock.save
        format.html { redirect_to @stock, notice: 'Stock was successfully created.' }
        format.json { render :show, status: :created, location: @stock }
      else
        format.html { render :new }
        format.json { render json: @stock.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /stocks/1
  # PATCH/PUT /stocks/1.json
  def update
    respond_to do |format|
      if @stock.update(stock_params)
        format.html { redirect_to @stock, notice: 'Stock was successfully updated.' }
        format.json { render :show, status: :ok, location: @stock }
      else
        format.html { render :edit }
        format.json { render json: @stock.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stocks/1
  # DELETE /stocks/1.json
  def destroy
    @stock.destroy
    respond_to do |format|
      format.html { redirect_to stocks_url, notice: 'Stock was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def update_stock_list
    @stock_list = ["YPFD.BA", "GGAL.BA", "PAMP.BA", "SAMI.BA", "EDN.BA", "ALUA.BA", "TS.BA"]

    yahoo_client = YahooFinance::Client.new
    
    @stock_list.each do |stock|
      the_stock = Stock.where(symbol: stock).order("date DESC").first
      if the_stock
        since_date = the_stock.date
      else
        since_date = DateTime.parse("2016-06-01")
      end

      data = yahoo_client.historical_quotes(stock, { start_date: since_date, end_date: Time::now })

      data.each do |day_data|
        stockSaved = Stock.exists?(symbol: stock, date: day_data.trade_date)
        if !stockSaved
          newStock = Stock.new(symbol: stock, date: day_data.trade_date, open_price: day_data.open, close_price: day_data.close, 
                                day_low: day_data.low, day_high: day_data.high, volume: day_data.volume)
          if newStock.valid?
            newStock.save!
            puts "Grabado"
          else
            puts "No aplica"
          end          
        else
          puts "No grabado"
        end
      end
    end
    flash[:notice] = "Base de datos actualizada"
    redirect_to :back
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_stock
      @stock = Stock.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def stock_params
      params.require(:stock).permit(:symbol, :price, :date, :low_day, :high_day, :volume)
    end
end
