json.extract! utilisateur, :id, :firstName, :lastName, :email, :numAddress, :address, :city, :phone, :isActive, :created_at, :updated_at
json.url utilisateur_url(utilisateur, format: :json)
