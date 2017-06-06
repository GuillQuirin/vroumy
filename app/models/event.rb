class Event < ApplicationRecord
	has_many :event_utilisateurs
	has_many :utilisateurs, through: :event_utilisateurs
end
