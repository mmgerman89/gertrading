# == Schema Information
#
# Table name: rate_charts
#
#  id               :integer          not null, primary key
#  since            :date
#  until            :date
#  commission       :decimal(12, 2)
#  commission_iva   :decimal(12, 2)
#  market_right     :decimal(12, 2)
#  market_right_iva :decimal(12, 2)
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  user_id          :integer
#  type_stock       :integer
#  commission_min   :decimal(12, 2)
#

class RateChart < ActiveRecord::Base
  belongs_to :user
  
  def type_stock_description
    case type_stock
    when 1
      "Acciones"
    when 2
      "Bonos"
    else
      "Desconocido"
    end
  end

  def current (user = self.user, dateParam = DateTime.parse(params[:date]), type = params[:type].to_i, operation = params[:operation].to_s)
    @current_rate_chart = nil
    if dateParam == nil
      date = Date.today
    else
      date = dateParam
    end
    @operation = operation
    @rate_charts = user.rate_charts
    @current_rate_chart = @rate_charts.detect do |rc| 
      rc.since <= date && (rc.until != nil) ? date <= rc.until : false && rc.type_stock == type
    end
    if @current_rate_chart == nil
      @current_rate_chart = @rate_charts.detect{ |rc| rc.until == nil && rc.type_stock == type }
    end
    @current_rate_chart
  end
end
