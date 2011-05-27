class AuthorsController < ApplicationController
  def index
  end

  def show
  end

  def edit
  end

  def new
  end

  def create
    @author = Author.new params[:author]
    
    if @author.save
      flash[:notice] = "Author successfully added."
      redirect_to authors_path
    else
      render 'new'
    end  
      
  end
  
  def update
    @author = Author.find params[:id]
    
    if @author.updated_attributes params[:article]
      flash[:notice] = "Author successfully updated."
      redirect_to author_path @author
    else
      render 'edit'
    end
  end
  
  def destroy
    author = Author.find params[:id]
    author.destroy
    flash[:notice] = 'Author successfully deleted.'
  
    redirect_to authors_path
  end
  
end
