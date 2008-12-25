class MessagesController < ApplicationController
  before_filter :find_parent, :only => [:new, :create]
  before_filter :find_message, :except => [:new, :create, :index]  
  
  def index
    @messages = Message.find_all_by_parent_id(nil)
  end
  
  def new
    @message = current_user.messages.build
  end
  
  def create
    @message = current_user.messages.build(params[:message])
    @message.parent = @parent
    @message.save!

    redirect_to @message
  end
  
  def edit
  end
  
  def update
    @message.update_attributes(params[:message])
    redirect_to @message
  end
  
  def show
    @message = Message.find params[:id]
  end
  
  private
  
  def find_parent
    @parent = Message.find(params[:message_id]) if params[:message_id]
  end
  
  def find_message
    @message = Message.find(params[:id]) if params[:id]    
  end
  
end
