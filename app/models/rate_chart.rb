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
end
