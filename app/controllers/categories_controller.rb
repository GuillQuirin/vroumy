class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update, :destroy]

  def index
    @categories = Categorie.includes(:voitures)
  end

  def show
  end

  def new
    @category = Categorie.new
  end

  def edit
  end

  def create
    @category = Categorie.new(category_params)
    if @category.save
      flash[:notice] = "La catégorie #{@category.name} a bien été créée."
      redirect_to @category
    else
      render 'new'
    end
  end

  def update
    if @category.update(category_params)
      flash[:notice] = "La catégorie #{@category.name} a bien été modifiée."
      redirect_to @category
    else
      render 'edit'
    end
  end

  def destroy
    flash[:notice] = "La catégorie #{@category.name} a bien été supprimée."
    @category.destroy
    redirect_to categories_path
  end

  private
  def set_category
    @category = Categorie.find(params[:id])
  end

  def category_params
    params.require(:categorie).permit(:name)
  end
end
