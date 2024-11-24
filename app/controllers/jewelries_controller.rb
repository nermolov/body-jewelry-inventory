class JewelriesController < ApplicationController
  before_action :set_jewelry, only: %i[ edit update destroy ]

  # GET /jewelries or /jewelries.json
  def index
    @jewelries = Jewelry.all
  end

  # GET /jewelries/new
  def new
    @jewelry = Jewelry.new
  end

  # GET /jewelries/1/edit
  def edit
  end

  # POST /jewelries
  def create
    @jewelry = Jewelry.new(jewelry_params)

    if @jewelry.save
      redirect_to edit_jewelry_path(@jewelry), notice: "Jewelry was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /jewelries/1
  def update
    if @jewelry.update(jewelry_params)
      redirect_to edit_jewelry_path(@jewelry), notice: "Jewelry was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /jewelries/1
  def destroy
    @jewelry.destroy!

    redirect_to jewelries_path, status: :see_other, notice: "Jewelry was successfully destroyed."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_jewelry
      @jewelry = Jewelry.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def jewelry_params
      params.expect(jewelry: [ :name ])
    end
end
