class JewelriesController < ApplicationController
  before_action :set_jewelry, only: %i[ edit update destroy ]
  before_action :set_jewelry_attribute_types, only: %i[ index new edit ]

  # GET /jewelries or /jewelries.json
  def index
    @jewelries = Jewelry.all
  end

  # GET /jewelries/new
  def new
    new_attributes_type_name = request.query_parameters[:attributes]
    if @jewelry_attribute_types.include? new_attributes_type_name
      @jewelry = Jewelry.new(jewelry_attributes: new_attributes_type_name.constantize.new)
    else
      render :new, status: :unprocessable_entity
    end
  end

  # GET /jewelries/1/edit
  def edit
  end

  # POST /jewelries
  def create
    # debugger
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

    def set_jewelry_attribute_types
      # ["AttributesCaptiveBeadRing", ...]
      @jewelry_attribute_types = Jewelry.jewelry_attributes_types
      # prettify class names e.g. AttributesCaptiveBeadRing => "Captive Bead Ring"
      @jewelry_attribute_type_names = @jewelry_attribute_types.to_h { |type| [ type, type[10, 100].split(/(?=[A-Z])/).join(" ") ] }
    end

    # Only allow a list of trusted parameters through.
    def jewelry_params
      jewelry_base_params.merge({
        jewelry_attributes_attributes: jewelry_attribute_params
      })
    end

    def jewelry_base_params
      params.expect(jewelry: [ :name, :brand_id, :studio_id, :location_id, :material_id, :jewelry_attributes_type, jewelry_attributes_attributes: {} ])
    end

    def jewelry_attribute_params
      case jewelry_base_params[:jewelry_attributes_type]
      when "AttributesCaptiveBeadRing"
        jewelry_base_params.expect(jewelry_attributes_attributes: [ :id, :gauge, :ring_diameter, :bead_diameter ])
      end
    end
end
