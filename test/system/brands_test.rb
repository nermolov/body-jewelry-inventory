require "application_system_test_case"

class BrandsTest < ApplicationSystemTestCase
  setup do
    @brand = brands(:one)
  end

  test "visiting the index" do
    visit brands_url
    assert_selector "h1", text: "Brands"
  end

  test "should create brand" do
    visit brands_url
    click_on "New Brand"

    fill_in "Name", with: @brand.name
    fill_in "Website url", with: @brand.website_url
    click_on "Create Brand"

    assert_text "Brand was successfully created"
  end

  test "should update Brand" do
    visit edit_brand_url(@brand)

    fill_in "Name", with: @brand.name
    fill_in "Website url", with: @brand.website_url
    click_on "Update Brand"

    assert_text "Brand was successfully updated"
  end

  test "should destroy Brand" do
    visit edit_brand_url(@brand)
    accept_alert do
      click_on "Destroy", match: :first
    end

    assert_text "Brand was successfully destroyed"
  end
end
