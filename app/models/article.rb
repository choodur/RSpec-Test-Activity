class Article < ActiveRecord::Base
  validates :title, :presence => true
  validates :body, :presence => true
  
  @valid_statuses = ["draft", "posted"]
  validates_inclusion_of :status, :in => @valid_statuses
  
  before_save :set_status
  
  def set_status
    self.date_posted = self.status == "posted" ? Time.now : nil
  end
end
