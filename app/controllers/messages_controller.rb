class MessagesController < ApplicationController
     # 表示
  def index
    #@search = Message.order(:created_at => :desc, :id => :desc).search(params[:q])
    #@pages = @search.result.page(params[:page])

    @pages = Rails.cache.fetch('hkey') do
      @search  = Message.order(:created_at => :desc, :id => :desc).search(params[:q])
      @search.result.page(params[:page])
    end
    @message = Message.new
  end

  # 書き込み
  def create
    @message = Message.new(params.require(:message).permit(:title, :mail, :comment))
    session[:name] = @message.title
    session[:mail] = @message.mail
    if @message.save
      redirect_to :action => :index
    else
      @pages = Rails.cache.fetch('hkey') do
        @search  = Message.order(:created_at => :desc, :id => :desc).search(params[:q])
        @search.result.page(params[:page])
      end
      render :index
    end
  end
end
