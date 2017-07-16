class Constructeur < ApplicationRecord
	has_many :voitures
	has_many :modeles

	validates :name, presence: true, uniqueness: true
	validates_associated :modeles
end
