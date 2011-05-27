require 'spec_helper'

describe "An Article" do
  before(:each) do
    @article = Article.new
  end 
  
  it "title should not be empty." do 
    @article.title = "Titulo"
    @article.should have(0).error_on(:title)
  end
  
  it "title that is empty should not be saved." do 
    @article.title = nil
    @article.should have(1).error_on(:title)
  end
  
  it "should not save if body is empty." do
    @article.body = "fail"
    @article.should have(0).error_on(:body)
  end
  
  it "should not save if status is not 'posted' or 'draft' (case-sensitive)." do
    @article.status = "posted"
    @article.should have(0).error_on(:status)
  end
  
  
  it "should have date posted if status is 'posted'." do
    @article.status = "posted"
    set_article_title_and_body
    @article.date_posted.should_not be_nil
  end
  
  it "should have no date posted assigned if status is 'draft'." do
    @article.status = "draft"
    set_article_title_and_body
    @article.date_posted.should be_nil
  end
  
  def set_article_title_and_body
    @article.title, @article.body = "Titulo", "..."
    @article.save
  end
end
