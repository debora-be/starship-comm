require "application_system_test_case"

class PriceLogsTest < ApplicationSystemTestCase
  setup do
    @price_log = price_logs(:one)
  end

  test "visiting the index" do
    visit price_logs_url
    assert_selector "h1", text: "Price logs"
  end

  test "should create price log" do
    visit price_logs_url
    click_on "New price log"

    fill_in "Changed at", with: @price_log.changed_at
    fill_in "New price", with: @price_log.new_price
    fill_in "Old price", with: @price_log.old_price
    fill_in "Product id", with: @price_log.product_id_id
    click_on "Create Price log"

    assert_text "Price log was successfully created"
    click_on "Back"
  end

  test "should update Price log" do
    visit price_log_url(@price_log)
    click_on "Edit this price log", match: :first

    fill_in "Changed at", with: @price_log.changed_at
    fill_in "New price", with: @price_log.new_price
    fill_in "Old price", with: @price_log.old_price
    fill_in "Product id", with: @price_log.product_id_id
    click_on "Update Price log"

    assert_text "Price log was successfully updated"
    click_on "Back"
  end

  test "should destroy Price log" do
    visit price_log_url(@price_log)
    click_on "Destroy this price log", match: :first

    assert_text "Price log was successfully destroyed"
  end
end
