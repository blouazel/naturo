class CategoriesController < ApplicationController
  before_action :set_category, only: [:edit, :update, :show, :destroy]

  def index
    @category = Category.all
    @subcategory = Subcategory.all
  end

  def new
    @category = Category.new
    authorize @category
  end

  def create
    @category = Category.new(category_params)
    @category.save
    authorize @category
    if @category.save
      flash[:notice] = "Votre catégorie a été créée avec succès !"
      redirect_to categories_path
    else
      render 'new'
    end
  end

  def update
    if @category.update(category_params)
      flash[:notice] = "La catégorie a été mise à jour"
      redirect_to category_path(@category)
    else
      flash[:notice] = "La catégorie n'a pas été mise à jour"
      render 'edit'
    end
  end

  def show
  end

  def edit
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    redirect_to categories_path
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end

  def set_category
    @category = Category.find(params[:id])
    authorize @category
  end
end
