require 'rails_helper'

RSpec.describe PriceLogsController, type: :controller do
  let(:valid_attributes) {
    {
      product_id: 1,
      old_price: 50.0,
      new_price: 100.0,
      changed_at: Time.now
    }
  }

  let(:invalid_attributes) {
    { product_id: nil }
  }

  describe "POST #create" do
    context "with invalid params" do
      it "renders a JSON response with errors for the new price_log" do
        post :create, params: { price_log: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json; charset=utf-8')
      end
    end
  end
end
