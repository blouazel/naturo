class SubcategoriesController < ApplicationController
  before_action :set_subcategory, only: [:edit, :update, :show, :destroy]

  def index
    @subcategory = Subcategory.all
  end

  def new
    @subcategory = Subcategory.new
    authorize @subcategory
  end

  def create
    @subcategory = Subcategory.new(subcategory_params)
    @subcategory.save
    #@subcategory.user = current_user
    authorize @subcategory
    if @subcategory.save
      flash[:notice] = "Votre sous-catégorie a été créée avec succès !"
      redirect_to subcategories_path
    else
      render 'new'
    end
  end

  def update
    if @subcategory.update(subcategory_params)
      flash[:notice] = "La sous-catégorie a été mise à jour"
      redirect_to subcategory_path(@subcategory)
    else
      flash[:notice] = "La sous-catégorie n'a pas été mise à jour"
      render 'edit'
    end
  end

  def show
  end

  def edit
  end

  def destroy
    @subcategory = Subcategory.find(params[:id])
    @subcategory.destroy
    redirect_to subcategories_path
  end

  private

  def subcategory_params
    params.require(:subcategory).permit(:name, :category_id)
  end

  def set_subcategory
    @subcategory = Subcategory.find(params[:id])
    authorize @subcategory
  end
end
