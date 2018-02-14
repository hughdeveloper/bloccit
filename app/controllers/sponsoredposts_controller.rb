class SponsoredpostsController < ApplicationController
  def show
    @sponsoredpost = Sponsoredpost.find(params[:id])
  end

  def new
    @topic = Topic.find(params[:topic_id])
    @sponsoredpost= Sponsoredpost.new
  end

  def create
    @sponsoredpost = Sponsoredpost.new
    @sponsoredpost.title = params[:sponsoredpost][:title]
    @sponsoredpost.body = params[:sponsoredpost][:body]
    @sponsoredpost.price = params[:sponsoredpost][:price]
    @topic = Topic.find(params[:topic_id])

    @sponsoredpost.topic = @topic

    if @sponsoredpost.save
      flash[:notice] = "Sponsoredpost was saved."
      #if the post was good then we will send the user to the post that they have just created
      redirect_to [@topic, @sponsoredpost]

    #if the upload was not successful then we alert the user about it and display the new view again
    else
      flash.now[:alert] = "There was an error saving the sponsoredpost. Please try again."
      render :new
    end
  end

  def update
    @sponsoredpost = Sponsoredpost.find(params[:id])
    @sponsoredpost.title = params[:sponsoredpost][:title]
    @sponsoredpost.body = params[:sponsoredpost][:body]
    @sponsoredpost.price = params[:sponsoredpost][:price]

    if @sponsoredpost.save
      flash[:notice] = "Sponsoredpost was updated."
      redirect_to [@sponsoredpost.topic, @sponsoredpost]
    else
      flash.now[:alert] = "There was an error saving the sponsoredpost. Please try agin."
      render :edit
    end
  end

  def edit
    @sponsoredpost = Sponsoredpost.find(params[:id])
  end

  def destroy
    @Sponsoredpost = Sponsoredpost.find(params[:id])

    if @Sponsoredpost.destroy
      flash[:notice] = "\"#{@Sponsoredpost.title}\" was deleted successfully."
      redirect_to @Sponsoredpost.topic

    else
      flash.now[:alert] = "There was an error deleting the post."
      render :show
    end
  end


end
