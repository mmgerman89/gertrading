class ListStocksController < ApplicationController
  before_action :set_stock, only: [:edit, :update, :show, :destroy]
  def index
    @saved_stocks = ListStock.all
  end

  def show
  end

  def new
    @stock = ListStock.new
  end

  def create
    @stock = ListStock.new(list_stock_params)

    respond_to do |format|
      if @stock.save
        format.html { redirect_to list_stocks_path, notice: 'Activo agregado correctamente.' }
        format.json { render :index, status: :created, location: @stock }
      else
        format.html { render :new }
        format.json { render json: @stock.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @stock.update(list_stock_params)
        format.html { redirect_to list_stocks_path, notice: 'Activo actualizado correctamente.' }
        format.json { render :index, status: :ok, location: @stock }
      else
        format.html { render :edit }
        format.json { render json: @stock.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @stock.destroy
    respond_to do |format|
      format.html { redirect_to list_stocks_path, notice: 'Activo eliminado correctamente.' }
      format.json { head :no_content }
    end
  end

  private

    def set_stock
      @stock = ListStock.find(params[:id])
    end

    def list_stock_params
      params.require(:list_stock).permit(:name, :market)
    end
end
