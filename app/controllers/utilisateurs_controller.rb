class UtilisateursController < ApplicationController
  before_action :set_utilisateur, only: [:show, :edit, :update, :destroy]

  # GET /utilisateurs
  def index
    @utilisateurs = Utilisateur.all
  end

  # GET /utilisateurs/1
  def show
  end

  # GET /utilisateurs/new
  def new
    @utilisateur = Utilisateur.new
  end

  # GET /utilisateurs/1/edit
  def edit
  end

  # POST /utilisateurs
  def create
    @utilisateur = Utilisateur.new(utilisateur_params)
    if @utilisateur.save
      flash[:notice] = "L'utilisateur #{@utilisateur.firstName} a bien été créé."
      redirect_to @voiture
    else
      render 'new'
    end
  end

  def update
    if @utilisateur.update(utilisateur_params)
      flash[:notice] = "L'utilisateur #{@utilisateur.firstName} a bien été mis à jour."
      redirect_to @utilisateur
    else
      render 'edit'
    end
  end

  # DELETE /utilisateurs/1
  def destroy
    @utilisateur.destroy
    redirect_to utilisateurs_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_utilisateur
      @utilisateur = Utilisateur.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
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
        :isActive
      )
    end
end