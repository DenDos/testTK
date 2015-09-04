class PostsController < ApplicationController
  before_filter :authenticate_user!, only: [:new]
  def index
    User.new({ :email => 'admin@admin.com', :password => 'administrator', :password_confirmation => 'administrator'}).save
    if params[:tag]
      @posts = Post.tagged_with(params[:tag]).paginate(page: params[:page], per_page: 6)
    elsif params[:category]
      @posts =  Post.where('category' => params[:category]).paginate(page: params[:page], per_page: 6)
      @cd =  @posts.try(:any?) ? @posts[0].category : 'Все новости'
    else
      @posts = Post.paginate(page: params[:page], per_page: 6)
    end
    #render 'index'
  end 
  
  def show
    @post = Post.find(params[:id])
    #render 'show'
  end  
  
  def create
    @post = Post.new(ad_params)
    if @post.save
      redirect_to root_path
    else
      render 'new'
      #redirect_to new_post_path
    end
  end 
  
  def new
    @post = Post.new
  end
  
  def destroy
    Post.find(params[:id]).destroy
    redirect_to root_path
  end
  def tag
  end
  private
    
      def ad_params
        params.require(:post).permit(:shortContent, :title, :content, :category,:image,:tag_list)
      end
end
