require 'spec_helper'

describe AuthorsController do

  describe "POST 'create'" do
    let(:author) { mock_model(Author).as_null_object }

    before(:each) do
      Author.stub(:new).and_return(author)
   end
  
  
    it "creates a new author" do
      Author.should_receive(:new).with("first_name" => "Test", "last_name" => "Timony").and_return(author)
      post :create, :author => { "first_name" => "Test", "last_name" => "Timony" } 
    end
    
    it "saves the author" do
      author.should_receive(:save)
      post :create
    end
    
    it "redirects to authors index" do
      post :create
      response.should redirect_to authors_path
    end
    
    
    context "when author is successfully saved" do
      
      before(:each) do
        author.stub(:save).and_return(true)
        post :create
      end
      
      it "sets a flash notice: 'Author successfully added.'" do
        flash[:notice].should eql("Author successfully added.")
      end
      
      it "redirects to authors index" do
        response.should redirect_to authors_path
      end
      
    end
    
    context "when author is not saved" do
    
      before(:each) do
        author.stub(:save).and_return(false)
        post :create
      end
    
      it "assigns @author to be passed back to template" do
        assigns[:author].should eql(author)
      end
    
      it "generates the New author template" do
        response.should render_template("new")
      end
 
    end
      
  end

##################################################################################################################

describe "GET 'update'" do
   let(:author) { mock_model(Author).as_null_object }

    before(:each) do
      Author.should_receive(:find).with(author.id).and_return(author)
    end
  
  
    it "finds an existing author" do
      get :update, :id => author.id  
    end
    
    it "updates the author" do
      author.stub(:update_attributes).with({ "first_name" => "Test", "last_name" => "Timony" })
      get :update, :id => author.id, :author => { "first_name" => "Best", "last_name" => "Test" }
    end
      
    it "redirects to author page" do
      post :update, :id => author.id
      response.should redirect_to author_path author.id
    end  
      
      
    context "when Author is successfully updated" do
      
      before(:each) do
        author.stub(:update_attributes).with({ "remarks" => "..." }).and_return(true)
        get :update, :id => author.id, :author => { "remarks" => "..." }
      end
      
      it "sets a flash notice: 'Author successfully updated.'" do
        flash[:notice].should eql("Author successfully updated.")
      end
      
      it "redirects to edited Author page" do
        response.should redirect_to author_path author.id
      end
      
    end
    
    context "when Author is not updated" do
    
      before(:each) do
        author.stub(:update_attributes).and_return(false)
        get :update, :id => author.id
      end
    
      it "assigns @author to be passed back to template" do
        assigns[:author].should eql(author)
      end
    
      it "generates the Edit Author template" do
        response.should render_template("edit")
      end
 
    end  
  end

##################################################################################################################


describe "DELETE 'destroy'" do
   let(:author) { mock_model(Author).as_null_object }

    before(:each) do
      Author.should_receive(:find).with(author.id).and_return(author)
      delete :destroy, :id => author.id 
    end
  
  
    it "finds an existing author" do
      #delete :destroy, :id => author.id  
    end
    
    it "deletes the author" do
      author.stub(:destroy)
     # delete :destroy, :id => author.id
    end
    
    it "sets a flash notice: 'Author successfully deleted.'" do
      flash[:notice] = 'Author successfully deleted.'
     # delete :destroy, :id => author.id
    end
    
    it "redirects to author index" do
     # delete :destroy, :id => author.id
      response.should redirect_to authors_path
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
