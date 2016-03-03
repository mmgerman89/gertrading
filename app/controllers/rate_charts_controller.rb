class RateChartsController < ApplicationController
  def index
    @rate_charts = current_user.rate_charts
  end

  def show
  end

  def edit
  end

  def update
  end

  def new
  end

  def create
  end
end
