class EventUtilisateur < ApplicationRecord
  belongs_to :event
  belongs_to :utilisateur
end
