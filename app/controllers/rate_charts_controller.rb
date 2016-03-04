class RateChartsController < ApplicationController
  before_filter :get_rate_chart, only: [:edit, :destroy]
  before_filter :correct_user!, only: [:edit, :update, :destroy]
  
  def index
    @rate_charts = current_user.rate_charts
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
end
