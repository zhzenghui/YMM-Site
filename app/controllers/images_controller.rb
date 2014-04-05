class ImagesController < ApplicationController
  def index
  end

  def new
    @image = Image.new
  end

  def show
  	@id = params[:id]
	  @image = Image.find(@id)
  end

  def create
  	@image = Image.new(params[:image])
  	if @image.save
  		redirect_to :action => :show, :id => @image.id
  	end
  end
end
