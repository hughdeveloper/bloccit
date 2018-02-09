class PostsController < ApplicationController
  def index
    @posts = Post.all

    @posts.each_with_index do |post, index|
      if index %5 == 0
        post.title = "SPAM!!!! #{post.title}"
      end
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    #we call post.new to create a new instance of post or a new object to store the new post in
    @post = Post.new
    @post.title = params[:post][:title]
    @post.body = params[:post][:body]

    #here is were we alert the user weather we were successful with the upload of the new post
    if @post.save
      flash[:notice] = "Post was saved."
      #if the post was good then we will send the user to the post that they have just created
      redirect_to @post

    #if the upload was not successful then we alert the user about it and display the new view again
    else
      flash.now[:alert] = "There was an error saving the post. Please try again."
      render :new
    end

  end

  def edit
  end
end
