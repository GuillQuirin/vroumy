class Voiture < ApplicationRecord
	extend FriendlyId

	belongs_to :constructeur
	belongs_to :modele
	belongs_to :utilisateur
	belongs_to :categorie

	validates :name, presence: true, uniqueness: true
	validates :couleur, presence: true
	validates :description, presence: true
	validates :modele_id, presence: true
	validates :categorie_id, presence: true
	validates_date :release, presence: true, on_or_before: lambda { Date.current }

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
