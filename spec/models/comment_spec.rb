require 'spec_helper'

describe Comment do
  before(:each) do
    @comment = Comment.new
  end
  
  it 'should have a valid email' do
    @comment.email = "email@add.com"
    @comment.should have(0).error_on(:email)
  end
  
  it 'should have a body.' do
    @comment.body = "........"
    @comment.should have(0).error_on(:body)
  end
end
