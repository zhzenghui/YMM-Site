class AblumsController < ApplicationController
  before_action :set_ablum, only: [:show, :edit, :update, :destroy]

  # GET /ablums
  # GET /ablums.json
  def index
    @ablums = Ablum.all
  end

  # GET /ablums/1
  # GET /ablums/1.json
  def show
  end

  # GET /ablums/new
  def new
    @ablum = Ablum.new
  end

  # GET /ablums/1/edit
  def edit
  end

  # POST /ablums
  # POST /ablums.json
  def create
    @ablum = Ablum.new(ablum_params)

    respond_to do |format|
      if @ablum.save
        format.html { redirect_to @ablum, notice: 'Ablum was successfully created.' }
        format.json { render action: 'show', status: :created, location: @ablum }
      else
        format.html { render action: 'new' }
        format.json { render json: @ablum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ablums/1
  # PATCH/PUT /ablums/1.json
  def update
    respond_to do |format|
      if @ablum.update(ablum_params)
        format.html { redirect_to @ablum, notice: 'Ablum was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @ablum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ablums/1
  # DELETE /ablums/1.json
  def destroy
    @ablum.destroy
    respond_to do |format|
      format.html { redirect_to ablums_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ablum
      @ablum = Ablum.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ablum_params
      params.require(:ablum).permit(:title, :text, :publish, :avatar,:free, :user_id, :url)
    end
end
