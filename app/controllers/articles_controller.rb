class ArticlesController < ApplicationController
  def index
  end

  def show
  end

  def edit
  end

  def new
  end

  def create
    @article = Article.new params[:article]
    
    if @article.save
      flash[:notice] = "Article successfully saved."
      redirect_to articles_path
    else
      render 'new'
    end  
      
  end
  
  def update
    @article = Article.find params[:id]
    
    if @article.updated_attributes params[:article]
      flash[:notice] = "Article successfully updated."
      redirect_to article_path @article
    else
      render 'edit'
    end
  end
  
  def destroy
    article = Article.find params[:id]
    article.destroy
    flash[:notice] = 'Article successfully deleted.'
  
    redirect_to articles_path
  end
  
end
