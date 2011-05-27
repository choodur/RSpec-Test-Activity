require 'spec_helper'

describe Author do
  before(:each) do
    @author = Author.new
  end
  
  it "should have a first name." do
    @author.first_name = "Hi"
    @author.should have(0).error_on(:first_name)
  end
  
  it "should have a last name." do
    @author.last_name = "There"
    @author.should have(0).error_on(:last_name)
  end
end
