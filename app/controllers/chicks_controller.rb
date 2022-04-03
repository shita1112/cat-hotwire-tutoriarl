class ChicksController < ApplicationController
  before_action :set_chick, only: %i[ show edit update destroy ]

  # GET /chicks
  def index
    @chicks = Chick.all
  end

  # GET /chicks/1
  def show
  end

  # GET /chicks/new
  def new
    @chick = Chick.new
  end

  # GET /chicks/1/edit
  def edit
  end

  # POST /chicks
  def create
    @chick = Chick.new(chick_params)

    if @chick.save
      redirect_to @chick, notice: "Chick was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /chicks/1
  def update
    if @chick.update(chick_params)
      redirect_to @chick, notice: "Chick was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /chicks/1
  def destroy
    @chick.destroy
    redirect_to chicks_url, notice: "Chick was successfully destroyed."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_chick
      @chick = Chick.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def chick_params
      params.require(:chick).permit(:name, :age)
    end
end
