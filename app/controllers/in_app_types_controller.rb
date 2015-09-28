class InAppTypesController < ApplicationController
  before_action :set_in_app_type, only: [:show, :edit, :update, :destroy]

  # GET /in_app_types
  # GET /in_app_types.json
  def index
    @in_app_types = InAppType.all
  end

  # GET /in_app_types/1
  # GET /in_app_types/1.json
  def show
  end

  # GET /in_app_types/new
  def new
    @in_app_type = InAppType.new
  end

  # GET /in_app_types/1/edit
  def edit
  end

  # POST /in_app_types
  # POST /in_app_types.json
  def create
    @in_app_type = InAppType.new(in_app_type_params)

    respond_to do |format|
      if @in_app_type.save
        format.html { redirect_to @in_app_type, notice: 'In app type was successfully created.' }
        format.json { render action: 'show', status: :created, location: @in_app_type }
      else
        format.html { render action: 'new' }
        format.json { render json: @in_app_type.errors, status: :200 }
      end
    end
  end

  # PATCH/PUT /in_app_types/1
  # PATCH/PUT /in_app_types/1.json
  def update
    respond_to do |format|
      if @in_app_type.update(in_app_type_params)
        format.html { redirect_to @in_app_type, notice: 'In app type was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @in_app_type.errors, status: :200 }
      end
    end
  end

  # DELETE /in_app_types/1
  # DELETE /in_app_types/1.json
  def destroy
    @in_app_type.destroy
    respond_to do |format|
      format.html { redirect_to in_app_types_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_in_app_type
      @in_app_type = InAppType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def in_app_type_params
      params.require(:in_app_type).permit(:display_name, :in_app_type, :description, :apple_id, :apple_bundle_id, :apple_type, :price)
    end
end
