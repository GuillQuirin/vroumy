class Utilisateur < ApplicationRecord
  rolify
  	# Include default devise modules. Others available are:
  	# :confirmable, :lockable, :timeoutable and :omniauthable
  	validates :pseudo, presence: true, uniqueness: true
  	devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
	has_many :event_utilisateurs
	has_many :events, through: :event_utilisateurs
end
