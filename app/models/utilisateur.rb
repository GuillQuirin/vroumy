class Utilisateur < ApplicationRecord
	has_many :event_utilisateurs
	has_many :events, through: :event_utilisateurs
end
