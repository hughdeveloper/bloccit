class PostsController < ApplicationController

  before_action :require_sign_in, except: :show

  before_action :authorize_user_admin, except: [:index, :show, :update, :edit]

  before_action :authorize_user, except: [:show, :new, :create]


  def index
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
    @topic = Topic.find(params[:topic_id])
    @post = Post.new
  end

  def create
    #we call post.new to create a new instance of post or a new object to store the new post in

    @topic = Topic.find(params[:topic_id])
    @post = @topic.posts.build(post_params)
    @post.user = current_user

    #here is were we alert the user weather we were successful with the upload of the new post
    if @post.save
      flash[:notice] = "Post was saved."
      #if the post was good then we will send the user to the post that they have just created
      redirect_to [@topic, @post]

    #if the upload was not successful then we alert the user about it and display the new view again
    else
      flash.now[:alert] = "There was an error saving the post. Please try again."
      render :new
    end

  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.assign_attributes(post_params)

    if @post.save
      flash[:notice] = "Post was updated."
      redirect_to [@post.topic, @post]
    else
      flash.now[:alert] = "There was an error saving the post. Please try agin."
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])

    if @post.destroy
      flash[:notice] = "\"#{@post.title}\" was deleted successfully."
      redirect_to @post.topic

    else
      flash.now[:alert] = "There was an error deleting the post."
      render :show
    end
  end

  # always have private code at the end since anything under it will be private code
  private

  def post_params
    params.require(:post).permit(:title, :body)
  end

  def authorize_user
    post = Post.find(params[:id])
    unless current_user == post.user || current_user.admin? || current_user.moderator?
      flash[:alert] = "You must be an admin/moderator to do that."
      redirect_to [post.topic, post]
    end
  end

    def authorize_user_admin
      post = Post.find(params[:id])
      unless current_user == post.user || current_user.admin?
        flash[:alert] = "You must be an admin to do that."
        redirect_to [post.topic, post]
      end
  end

end
