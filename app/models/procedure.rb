class Procedure < ActiveRecord::Base

	belongs_to :clinic

	validates :name, presence: true, length: { in: 4..42 }
	validates :cost, numericality: true, length: { in: 1..5 }
	
end
