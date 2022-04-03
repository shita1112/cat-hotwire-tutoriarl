class OwlsController < ApplicationController
  before_action :set_owl, only: %i[ show edit update destroy ]

  # GET /owls
  def index
    @owls = Owl.all
  end

  # GET /owls/1
  def show
  end

  # GET /owls/new
  def new
    @owl = Owl.new
  end

  # GET /owls/1/edit
  def edit
  end

  # POST /owls
  def create
    @owl = Owl.new(owl_params)

    if @owl.save
      redirect_to @owl, notice: "Owl was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /owls/1
  def update
    if @owl.update(owl_params)
      redirect_to @owl, notice: "Owl was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /owls/1
  def destroy
    @owl.destroy
    redirect_to owls_url, notice: "Owl was successfully destroyed."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_owl
      @owl = Owl.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def owl_params
      params.require(:owl).permit(:name, :age)
    end
end
