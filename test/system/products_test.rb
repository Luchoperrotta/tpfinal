require "application_system_test_case"

class ProductsTest < ApplicationSystemTestCase
  setup do
    @product = products(:one)
  end

  test "visiting the index" do
    visit products_url
    assert_selector "h1", text: "Products"
  end

  test "creating a Product" do
    visit products_url
    click_on "New Product"

    check "Active" if @product.active
    fill_in "Bank", with: @product.bank_id
    fill_in "Category", with: @product.category_id
    fill_in "Delivery", with: @product.delivery_id
    fill_in "Description", with: @product.description
    fill_in "Discountpercentage", with: @product.discountPercentage
    fill_in "Interest", with: @product.interest
    fill_in "Name", with: @product.name
    check "Onsale" if @product.onsale
    fill_in "Price", with: @product.price
    fill_in "Quota", with: @product.quota
    fill_in "Stock", with: @product.stock
    click_on "Create Product"

    assert_text "Product was successfully created"
    click_on "Back"
  end

  test "updating a Product" do
    visit products_url
    click_on "Edit", match: :first

    check "Active" if @product.active
    fill_in "Bank", with: @product.bank_id
    fill_in "Category", with: @product.category_id
    fill_in "Delivery", with: @product.delivery_id
    fill_in "Description", with: @product.description
    fill_in "Discountpercentage", with: @product.discountPercentage
    fill_in "Interest", with: @product.interest
    fill_in "Name", with: @product.name
    check "Onsale" if @product.onsale
    fill_in "Price", with: @product.price
    fill_in "Quota", with: @product.quota
    fill_in "Stock", with: @product.stock
    click_on "Update Product"

    assert_text "Product was successfully updated"
    click_on "Back"
  end

  test "destroying a Product" do
    visit products_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Product was successfully destroyed"
  end
end
