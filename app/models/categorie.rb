class Categorie < ApplicationRecord
	validates :name, presence: true, uniqueness: true
end
