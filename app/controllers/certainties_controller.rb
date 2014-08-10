class CertaintiesController < ApplicationController
  before_action :set_certainty, only: [:show, :edit, :update, :destroy]

  # GET /certainties
  # GET /certainties.json
  def index
    @certainties = Certainty.all
  end

  # GET /certainties/1
  # GET /certainties/1.json
  def show
  end

  # GET /certainties/new
  def new
    @certainty = Certainty.new
  end

  # GET /certainties/1/edit
  def edit
  end

  # POST /certainties
  # POST /certainties.json
  def create
    @certainty = Certainty.new(certainty_params)

    respond_to do |format|
      if @certainty.save
        format.html { redirect_to @certainty, notice: 'Certainty was successfully created.' }
        format.json { render :show, status: :created, location: @certainty }
      else
        format.html { render :new }
        format.json { render json: @certainty.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /certainties/1
  # PATCH/PUT /certainties/1.json
  def update
    respond_to do |format|
      if @certainty.update(certainty_params)
        format.html { redirect_to @certainty, notice: 'Certainty was successfully updated.' }
        format.json { render :show, status: :ok, location: @certainty }
      else
        format.html { render :edit }
        format.json { render json: @certainty.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /certainties/1
  # DELETE /certainties/1.json
  def destroy
    @certainty.destroy
    respond_to do |format|
      format.html { redirect_to certainties_url, notice: 'Certainty was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_certainty
      @certainty = Certainty.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def certainty_params
      params.require(:certainty).permit(:name)
    end
end
