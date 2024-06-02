require "test_helper"

class PriceLogsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @price_log = price_logs(:one)
  end

  test "should get index" do
    get price_logs_url
    assert_response :success
  end

  test "should get new" do
    get new_price_log_url
    assert_response :success
  end

  test "should create price_log" do
    assert_difference("PriceLog.count") do
      post price_logs_url, params: { price_log: { changed_at: @price_log.changed_at, new_price: @price_log.new_price, old_price: @price_log.old_price, product_id_id: @price_log.product_id_id } }
    end

    assert_redirected_to price_log_url(PriceLog.last)
  end

  test "should show price_log" do
    get price_log_url(@price_log)
    assert_response :success
  end

  test "should get edit" do
    get edit_price_log_url(@price_log)
    assert_response :success
  end

  test "should update price_log" do
    patch price_log_url(@price_log), params: { price_log: { changed_at: @price_log.changed_at, new_price: @price_log.new_price, old_price: @price_log.old_price, product_id_id: @price_log.product_id_id } }
    assert_redirected_to price_log_url(@price_log)
  end

  test "should destroy price_log" do
    assert_difference("PriceLog.count", -1) do
      delete price_log_url(@price_log)
    end

    assert_redirected_to price_logs_url
  end
end
