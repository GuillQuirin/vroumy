class Categorie < ApplicationRecord
	has_many :voitures
	validates :name, presence: true, uniqueness: true
end
