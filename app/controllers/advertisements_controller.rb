class AdvertisementsController < ApplicationController
  def index
    @advertisements = Advertisement.all
  end

  def show
    @advertisement = Advertisement.find(params[:id])
  end

  def new
    @advertisement = Advertisement.new
  end

  def create
    @advertisement = Advertisement.new
    @advertisement.title = params[:advertisement][:title]
    @advertisement.body = params[:advertisement][:body]
    @advertisement.price = params[:advertisement][:price]

    if @advertisement.save
      flash[:notice] = "Advertisement was saved."
      #if the post was good then we will send the user to the post that they have just created
      redirect_to @advertisement

    #if the upload was not successful then we alert the user about it and display the new view again
    else
      flash.now[:alert] = "There was an error saving the advertisement. Please try again."
      render :new
    end
  end
end
