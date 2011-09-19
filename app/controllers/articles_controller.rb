class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end
  def new
    @article = Article.new
  end  
  def create
    @article = Article.new(params[:article])
    flash[:message] = "Article '#{@article.title}' was created."
    @article.save!
    redirect_to articles_path
  end
  def show
    @article = Article.find(params[:id])
    @comment = @article.comments.new
  end
  def edit
    @article = Article.find(params[:id])
  end
  def update 
    @article = Article.find(params[:id])
    @article.update_attributes(params[:article])
    @article.save!
    flash[:message] = "Article '#{@article.title}' was updated."
    redirect_to articles_path(@article)
  end
  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    flash[:message] = "Article '#{@article.title}' was removed."
    redirect_to articles_path
  end
end
