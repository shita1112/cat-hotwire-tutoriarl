class HedgehogsController < ApplicationController
  before_action :set_hedgehog, only: %i[ show edit update destroy ]

  # GET /hedgehogs
  def index
    @hedgehogs = Hedgehog.all
  end

  # GET /hedgehogs/1
  def show
  end

  # GET /hedgehogs/new
  def new
    @hedgehog = Hedgehog.new
  end

  # GET /hedgehogs/1/edit
  def edit
  end

  # POST /hedgehogs
  def create
    @hedgehog = Hedgehog.new(hedgehog_params)

    if @hedgehog.save
      redirect_to @hedgehog, notice: "Hedgehog was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /hedgehogs/1
  def update
    if @hedgehog.update(hedgehog_params)
      redirect_to @hedgehog, notice: "Hedgehog was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /hedgehogs/1
  def destroy
    @hedgehog.destroy
    redirect_to hedgehogs_url, notice: "Hedgehog was successfully destroyed."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hedgehog
      @hedgehog = Hedgehog.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def hedgehog_params
      params.require(:hedgehog).permit(:name, :age)
    end
end
