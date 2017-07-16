class UtilisateursController < ApplicationController
  load_and_authorize_resource
  before_action :authenticate_utilisateur!, only: [:index, :show]

  def index
    @utilisateurs = Utilisateur.includes(:voitures)
  end

  def show
  end

  def new
    @utilisateur = Utilisateur.new
  end

  def edit
  end

  def create
    @utilisateur = Utilisateur.new(utilisateur_params)
    if @utilisateur.save
      flash[:notice] = "L'utilisateur '#{@utilisateur.pseudo}' a bien été créé."
      redirect_to @voiture
    else
      render 'new'
    end
  end

  def update
    if @utilisateur.update(utilisateur_params)
      flash[:notice] = "Le compte a bien été mis à jour."
      redirect_to @utilisateur
    else
      render 'edit'
    end
  end

  def destroy
    @utilisateur.destroy
    redirect_to utilisateurs_path
  end

  def change_role
    @utilisateur = Utilisateur.find(params[:id])
    if @utilisateur.has_role?(:admin)
      @utilisateur.remove_role :admin
    else
      @utilisateur.add_role :admin
    end
    if @utilisateur.save
      flash[:notice] = "Le rôle de l'utilisateur '#{@utilisateur.pseudo}' a été mis à jour."
      redirect_to utilisateurs_path
    end
  end

  private
    def set_utilisateur
      @utilisateur = Utilisateur.find(params[:id])
    end

    def utilisateur_params
      params.require(:utilisateur).permit(
        :pseudo,
        :firstName, 
        :lastName, 
        :email, 
        :numAddress, 
        :address, 
        :city, 
        :phone, 
        :avatar,
        :isActive
      )
    end
end