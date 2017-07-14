class VoituresController < ApplicationController
  load_and_authorize_resource
  before_action :authenticate_utilisateur!, only: [:index]

  # GET /voitures
  # GET /voitures.json
  def index
    @voitures = Voiture.includes(:utilisateur)
  end

  # GET /voitures/1
  # GET /voitures/1.json
  def show
  end

  # GET /voitures/new
  def new
    @voiture = Voiture.new
  end

  # GET /voitures/1/edit
  def edit
  end

  # POST /voitures
  # POST /voitures.json
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

  # PATCH/PUT /voitures/1
  # PATCH/PUT /voitures/1.json
  def update
    if @voiture.update(voiture_params)
      flash[:notice] = "La voiture #{@voiture.name} a bien été mise à jour."
      redirect_to @voiture
    else
      render 'edit'
    end
  end

  # DELETE /voitures/1
  # DELETE /voitures/1.json
  def destroy
    flash[:notice] = "La voiture #{@voiture.name} a bien été supprimée."
    @voiture.destroy
    redirect_to voitures_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_voiture
      @voiture = Voiture.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
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
