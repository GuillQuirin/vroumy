class VoituresController < ApplicationController
  load_and_authorize_resource

  def index
    @voitures = Voiture.includes(:utilisateur)
  end

  def show
  end

  def new
    @voiture = Voiture.new
  end

  def edit
  end

  def create
    @voiture = Voiture.new(voiture_params)
    @voiture.utilisateur_id = current_utilisateur.id 
    if @voiture.save
      flash[:notice] = "La voiture #{@voiture.name} a bien été créée."
      redirect_to @voiture
    else
      render 'new'
    end
  end

  def update
    if @voiture.update(voiture_params)
      flash[:notice] = "La voiture #{@voiture.name} a bien été mise à jour."
      redirect_to @voiture
    else
      render 'edit'
    end
  end

  def destroy
    flash[:notice] = "La voiture #{@voiture.name} a bien été supprimée."
    @voiture.destroy
    redirect_to voitures_path
  end

  private
  def voiture_params
    params.require(:voiture).permit(
      :name,
      :couleur, 
      :description,
      :modele_id,
      :utilisateur_id,
      :categorie_id,
      :avatar,
      :release
      )
  end
end
