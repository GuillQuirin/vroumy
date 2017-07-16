class Utilisateur < ApplicationRecord
	extend FriendlyId
	rolify

	has_many :event_utilisateurs
	has_many :events, through: :event_utilisateurs
	has_many :voitures

	has_attached_file :avatar, styles: {
		medium: '360x250>',
		thumb: '100x100>'
	}

  	validates :pseudo, presence: true, uniqueness: true
  	validates :firstName, format: { with: /\A[a-zA-Z]+\z/, message: "Seules les lettres sont autorisées" }, allow_blank: true
  	validates :lastName, format: { with: /\A[a-zA-Z]+\z/, message: "Seules les lettres sont autorisées" }, allow_blank: true
  	validates :numAddress, :numericality => { :greater_than_or_equal_to => 1 }, allow_blank: true
  	validates :city, format: { with: /\A[a-zA-Z]+\z/, message: "Seules les lettres sont autorisées" }, allow_blank: true
  	validates :phone, :numericality => true, allow_blank: true
  	validates :email, presence: true, email: true

  	devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

	validates_attachment_content_type :avatar, 
		content_type: /\Aimage/
	validates_attachment_file_name :avatar,
		matches: [/png\Z/, /jpe?g\Z/, /gif\Z/]
	validates_with AttachmentSizeValidator,
		attributes: :avatar,
		less_than: 1.megabytes

	friendly_id :slug_candidates, use: [:slugged, :finders]

  	def slug_candidates
  		[ :pseudo, [:id, :pseudo]]
  	end

  	def should_generate_new_friendly_id?
  		pseudo_changed? || super
  	end
end
