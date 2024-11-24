class BrandsController < ApplicationController
  before_action :set_brand, only: %i[ edit update destroy ]

  # GET /brands or /brands.json
  def index
    @brands = Brand.all
  end

  # GET /brands/new
  def new
    @brand = Brand.new
  end

  # GET /brands/1/edit
  def edit
  end

  # POST /brands
  def create
    @brand = Brand.new(brand_params)

    if @brand.save
      redirect_to edit_brand_path(@brand), notice: "Brand was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /brands/1
  def update
    if @brand.update(brand_params)
      redirect_to edit_brand_path(@brand), notice: "Brand was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /brands/1
  def destroy
    @brand.destroy!

    redirect_to brands_path, status: :see_other, notice: "Brand was successfully destroyed."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_brand
      @brand = Brand.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def brand_params
      params.expect(brand: [ :name, :website_url ])
    end
end
