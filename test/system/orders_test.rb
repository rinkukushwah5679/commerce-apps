require "application_system_test_case"

class OrdersTest < ApplicationSystemTestCase
  setup do
    @order = orders(:one)
  end

  test "visiting the index" do
    visit orders_url
    assert_selector "h1", text: "Orders"
  end

  test "creating a Order" do
    visit orders_url
    click_on "New Order"

    fill_in "Address", with: @order.address
    fill_in "Cart", with: @order.cart_id
    fill_in "Country", with: @order.country
    fill_in "Email", with: @order.email
    fill_in "First name", with: @order.first_name
    check "Is active" if @order.is_active
    fill_in "Last name", with: @order.last_name
    fill_in "Phone", with: @order.phone
    fill_in "Postal code", with: @order.postal_code
    fill_in "Price", with: @order.price
    fill_in "Product", with: @order.product_id
    fill_in "Quantity", with: @order.quantity
    fill_in "Status", with: @order.status
    fill_in "Town", with: @order.town
    fill_in "User", with: @order.user_id
    click_on "Create Order"

    assert_text "Order was successfully created"
    click_on "Back"
  end

  test "updating a Order" do
    visit orders_url
    click_on "Edit", match: :first

    fill_in "Address", with: @order.address
    fill_in "Cart", with: @order.cart_id
    fill_in "Country", with: @order.country
    fill_in "Email", with: @order.email
    fill_in "First name", with: @order.first_name
    check "Is active" if @order.is_active
    fill_in "Last name", with: @order.last_name
    fill_in "Phone", with: @order.phone
    fill_in "Postal code", with: @order.postal_code
    fill_in "Price", with: @order.price
    fill_in "Product", with: @order.product_id
    fill_in "Quantity", with: @order.quantity
    fill_in "Status", with: @order.status
    fill_in "Town", with: @order.town
    fill_in "User", with: @order.user_id
    click_on "Update Order"

    assert_text "Order was successfully updated"
    click_on "Back"
  end

  test "destroying a Order" do
    visit orders_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Order was successfully destroyed"
  end
end
