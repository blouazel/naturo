class ArticlesController < ApplicationController
  before_action :set_article, only: [:edit, :update, :show, :destroy]
  skip_before_action :authenticate_user!, only: [:home, :index, :show]

  def index
    @categories = Category.all
    @subcategories = Subcategory.all

    cate = params[:cate]
    subcate = params[:subcate]

    if !cate.nil?
      @article = Article.where(:category_id => cate).order('updated_at DESC')
    elsif !subcate.nil?
      @article = Article.where(:subcategory_id => subcate).order('updated_at DESC')
    else
      @article = Article.all.order('updated_at DESC')
    end
  end

  def show
  end

  def new
    @article = Article.new
    authorize @article
  end

  def create
    @article = Article.new(article_params)
    @article.user = current_user
    authorize @article
    if @article.save
      flash[:notice] = "Votre article a été crée avec succès !"
      redirect_to article_path(@article)
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @article.update(article_params)
      flash[:notice] = "L'article a été mis à jour"
      redirect_to article_path(@article)
    else
      flash[:notice] = "L'article n'a pas été mis à jour"
      render 'edit'
    end
  end

  def destroy
    @article.destroy
    flash[:notice] = "L'article a été supprimé"
    redirect_to articles_path
  end

  private

  def article_params
    params.require(:article).permit(:title, :photo, :description, :reading_time, :category_id, :subcategory_id, :user_id, :rich_body)
  end

  def set_article
    @article = Article.find(params[:id])
    authorize @article
  end
end
