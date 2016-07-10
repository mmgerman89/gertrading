# == Schema Information
#
# Table name: list_stocks
#
#  id         :integer          not null, primary key
#  name       :string
#  market     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class ListStock < ActiveRecord::Base
	validates :name, presence: true
	validates :market, presence: true
	validates :name, uniqueness: { scope: :market }

	def complete_name
		self.name.upcase + "." + self.market.upcase
	end
end
