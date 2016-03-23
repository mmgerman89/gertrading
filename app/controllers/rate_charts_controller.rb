class RateChartsController < ApplicationController
  before_filter :get_rate_chart, only: [:edit, :destroy]
  before_filter :correct_user!, only: [:edit, :update, :destroy]
  before_action :get_rate_charts_user, only: [:index, :current]
  
  def index
    
  end

  def show
  end

  def edit
  end

  def update
    if @rate_chart.update(rate_chart_params)
      redirect_to rate_charts_path
    else
      flash[:error] = "Error al actualizar"
      render :edit
    end
  end

  def new
    @rate_chart = RateChart.new
  end

  def create
    @rate_chart = RateChart.new(rate_chart_params)
    @rate_chart.user = current_user
    
    if @rate_chart.save
      redirect_to rate_charts_path
    else
      flash[:error] = "Error al guardar"
      render :new
    end
  end
  
  def current
    puts "$$ def current $$"
    
    date = params[:date]
    date = DateTime.parse(date)
    type = params[:type]
    type = type.to_i
    @current_rate_chart = @rate_charts.detect{ |rc| rc.since <= date && date <= rc.until && rc.type_stock = type }
    puts "%% Desde: #{@current_rate_chart.since} -- Hasta: #{@current_rate_chart.until} -- Tipo: #{@current_rate_chart.type_stock} %%"
  end
  
  protected
  
  def get_rate_chart
    @rate_chart = RateChart.find(params[:id])
  end
  
  def correct_user!
    @rate_chart = RateChart.find(params[:id])
    if @rate_chart.user != current_user
      flash[:error] = "No podes hacer eso!"
      redirect_to root_path
    end
  end
  
  def rate_chart_params
    params.require(:rate_chart).permit(:since, :until, :commission, :commission_iva, 
        :commission_min, :market_right, :market_right_iva, :user_id, :type_stock)
  end
  
  def get_rate_charts_user
    @rate_charts = current_user.rate_charts
  end
end
