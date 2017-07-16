class ConstructeursController < ApplicationController
  load_and_authorize_resource
  before_action :authenticate_utilisateur!, only: [:new, :create]
  #before_action :set_constructeur, only: [:show, :edit, :update, :destroy]

  def index
    @constructeurs = Constructeur.paginate(page: params[:page], per_page: 5).includes(:modeles)
  end

  def show
  end

  def new
    @constructeur = Constructeur.new
  end

  def edit
  end

  def create
    @constructeur = Constructeur.new(constructeur_params)
    if @constructeur.save
      flash[:notice] = "Le constructeur #{@constructeur.name} a bien été créé."
      redirect_to @constructeur  
    else
      render 'new'
    end
  end

  def update
    if @constructeur.update(constructeur_params)
      flash[:notice] = "Le constructeur #{@constructeur.name} a bien été mis à jour."
      redirect_to @constructeur
    else
      render 'edit'
    end
  end

  def destroy
    @constructeur.destroy
    flash[:notice] = "Le constructeur #{@constructeur.name} a bien été supprimé."
    redirect_to constructeurs_path
  end

  private
    #def set_constructeur
    # @constructeur = Constructeur.find(params[:id])
    #end

    def constructeur_params
      params.require(:constructeur).permit(:name)
    end
  end
