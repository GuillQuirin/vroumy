class VoituresController < ApplicationController
  before_action :set_voiture, only: [:show, :edit, :update, :destroy]

  def index
    @voitures = Voiture.all
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
    if @voiture.save
      redirect_to @voiture
    else
      render 'new'
    end
  end
  def update
    if @voiture.update(voiture_params)
      redirect_to @voiture
    else
      render 'edit'
    end
  end
  def destroy
    @voiture.destroy
    redirect_to voitures_path
  end

  private

  def set_voiture
    @voiture = Voiture.find(params[:id])
  end

  def voiture_params 
    params.require(:voiture).permit(:immatriculation, :couleur, :description)
  end 
end
