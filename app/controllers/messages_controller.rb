class MessagesController < ApplicationController
  
  before_filter :authenticate_user!
  
  def index
    if user_signed_in?
      @current_user = current_user
      @msgs = Message.order("created_at DESC").limit(10).reverse
      @message = Message.new
    end 
  end
  
  def create
    if user_signed_in?
      @current_user = current_user
      @message = Message.create(params[:message])
      render 'create.js.erb'
    end
  end
end
