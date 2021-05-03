class ArticlesController < ApplicationController
  before_action :set_article, only: [:edit, :update, :show, :destroy]

  def new
    @article = Article.new
  end

  def create
    # render plain: params[:article].inspect
    @article = Article.new(article_params)
    if @article.save
      flash[:notice] = "Votre article a été crée avec succès !"
      redirect_to article_path(@article)
    else
      render 'new'
    end
  end

  def show
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

  def index
    @article = Article.all
  end

  def destroy
    @article.destroy
    flash[:notice] = "L'article a été supprimé"
    redirect_to articles_path
  end

  private

  def article_params
    params.require(:article).permit(:title, :description, :reading_time, :category)
  end

  def set_article
    @article = Article.find(params[:id])
  end
end
