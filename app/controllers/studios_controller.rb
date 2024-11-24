class StudiosController < ApplicationController
  before_action :set_studio, only: %i[ edit update destroy ]

  # GET /studios or /studios.json
  def index
    @studios = Studio.all
  end

  # GET /studios/new
  def new
    @studio = Studio.new
  end

  # GET /studios/1/edit
  def edit
  end

  # POST /studios
  def create
    @studio = Studio.new(studio_params)

    if @studio.save
      redirect_to edit_studio_path(@studio), notice: "Studio was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /studios/1
  def update
    if @studio.update(studio_params)
      redirect_to edit_studio_path(@studio), notice: "Studio was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /studios/1
  def destroy
    @studio.destroy!

    redirect_to studios_path, status: :see_other, notice: "Studio was successfully destroyed."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_studio
      @studio = Studio.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def studio_params
      params.expect(studio: [ :name, :address, :website_url, :phone ])
    end
end
