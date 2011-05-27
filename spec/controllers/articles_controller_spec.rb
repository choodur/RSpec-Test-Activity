require 'spec_helper'

describe ArticlesController do

  describe "POST 'create'" do
    let(:article) { mock_model(Article).as_null_object }

    before(:each) do
      Article.stub(:new).and_return(article)
   end
  
  
    it "creates a new article" do
      Article.should_receive(:new).with("body" => "ALoha!").and_return(article)
      post :create, :article => { "body" => "ALoha!"} 
    end
    
    it "saves the article" do
      article.should_receive(:save)
      post :create
    end
    
    it "redirects to Articles index" do
      post :create
      response.should redirect_to articles_path
    end
    
    
    context "when article is successfully saved" do
      
      before(:each) do
        article.stub(:save).and_return(true)
        post :create
      end
      
      it "sets a flash notice: 'Article successfully saved.'" do
        flash[:notice].should eql("Article successfully saved.")
      end
      
      it "redirects to Articles index" do
        response.should redirect_to articles_path
      end
      
    end
    
    context "when article is not saved" do
    
      before(:each) do
        article.stub(:save).and_return(false)
        post :create
      end
    
      it "assigns @article to be passed back to template" do
        assigns[:article].should eql(article)
      end
    
      it "generates the New Article template" do
        response.should render_template("new")
      end
 
    end
      
  end

##################################################################################################################

describe "GET 'update'" do
   let(:article) { mock_model(Article).as_null_object }

    before(:each) do
      Article.should_receive(:find).with(article.id).and_return(article)
    end
  
  
    it "finds an existing article" do
      get :update, :id => article.id  
    end
    
    it "updates the article" do
      article.stub(:update_attributes).with({ "title" => "Titulos", "body" => "..." })
      get :update, :id => article.id, :article => { "body" => "..." }
    end
      
    it "redirects to Article page" do
      post :update, :id => article.id
      response.should redirect_to article_path article.id
    end  
      
      
    context "when article is successfully updated" do
      
      before(:each) do
        article.stub(:update_attributes).with({ "body" => "..." }).and_return(true)
        get :update, :id => article.id, :article => { "body" => "..." }
      end
      
      it "sets a flash notice: 'Article successfully updated.'" do
        flash[:notice].should eql("Article successfully updated.")
      end
      
      it "redirects to edited Article page" do
        response.should redirect_to article_path article.id
      end
      
    end
    
    context "when article is not updated" do
    
      before(:each) do
        article.stub(:update_attributes).and_return(false)
        get :update, :id => article.id
      end
    
      it "assigns @article to be passed back to template" do
        assigns[:article].should eql(article)
      end
    
      it "generates the Edit Article template" do
        response.should render_template("edit")
      end
 
    end  
  end

##################################################################################################################


describe "DELETE 'destroy'" do
   let(:article) { mock_model(Article).as_null_object }

    before(:each) do
      Article.should_receive(:find).with(article.id).and_return(article)
      delete :destroy, :id => article.id 
    end
  
  
    it "finds an existing article" do
      #delete :destroy, :id => article.id  
    end
    
    it "deletes the article" do
      article.stub(:destroy)
     # delete :destroy, :id => article.id
    end
    
    it "sets a flash notice: 'Article successfully deleted.'" do
      flash[:notice] = 'Article successfully deleted.'
     # delete :destroy, :id => article.id
    end
    
    it "redirects to Article index" do
     # delete :destroy, :id => article.id
      response.should redirect_to articles_path
    end  
      
  end

##################################################################################################################

   describe "GET 'index'" do
    it "should be successful" do
      get 'index'
      response.should be_success
    end
  end

  describe "GET 'show'" do
    it "should be successful" do
      get 'show'
      response.should be_success
    end
  end

  describe "GET 'edit'" do
    it "should be successful" do
      get 'edit'
      response.should be_success
    end
  end

  describe "GET 'new'" do
    it "should be successful" do
      get 'new'
      response.should be_success
    end
  end
end
