class Message < ActiveRecord::Base
  belongs_to :user
  belongs_to :parent, :class_name => "Message"
  has_many :messages, :foreign_key => "parent_id"
  
  acts_as_taggable
end
