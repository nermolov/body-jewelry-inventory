class MaterialsController < ApplicationController
  before_action :set_material, only: %i[ edit update destroy ]

  # GET /materials or /materials.json
  def index
    @materials = Material.all
  end

  # GET /materials/new
  def new
    @material = Material.new
  end

  # GET /materials/1/edit
  def edit
  end

  # POST /materials
  def create
    @material = Material.new(material_params)

    if @material.save
      redirect_to edit_material_path(@material), notice: "Material was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /materials/1
  def update
    if @material.update(material_params)
      redirect_to edit_material_path(@material), notice: "Material was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /materials/1
  def destroy
    @material.destroy!

    redirect_to materials_path, status: :see_other, notice: "Material was successfully destroyed."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_material
      @material = Material.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def material_params
      params.expect(material: [ :name ])
    end
end
