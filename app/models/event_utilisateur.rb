class EventUtilisateur < ApplicationRecord
  belongs_to :event
  belongs_to :utilisateur
  before_create :set_datetime_to_now
  def set_datetime_to_now
  	self.created_at = Time.now
  	self.updated_at = Time.now
  end
end
