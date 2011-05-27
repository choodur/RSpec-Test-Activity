class Comment < ActiveRecord::Base
  validates :email, :presence => true, :format => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[\w]{2,})\Z/i
  validates :body, :presence => true
end
