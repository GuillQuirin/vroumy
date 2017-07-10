class Event < ApplicationRecord
	extend FriendlyId

	validates :rate, :numericality => { :greater_than_or_equal_to => 0 }
	has_many :event_utilisateurs
	has_many :utilisateurs, through: :event_utilisateurs

	has_attached_file :avatar, styles: {
		medium: '360x250>',
		thumb: '100x100>'
	}

	validates_attachment_content_type :avatar, 
		content_type: /\Aimage/
	validates_attachment_file_name :avatar,
		matches: [/png\Z/, /jpe?g\Z/, /gif\Z/]
	validates_with AttachmentSizeValidator,
		attributes: :avatar,
		less_than: 1.megabytes

	friendly_id :slug_candidates, use: [:slugged, :finders]

  	def slug_candidates
  		[ :name, [:id, :name]]
  	end

  	def should_generate_new_friendly_id?
  		name_changed? || super
  	end
end
