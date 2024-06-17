require 'rails_helper'

RSpec.describe ProductsController, type: :controller do
  let(:valid_attributes) {
    {
      name: "Test Product",
      category: "Test Category",
      default_price: 100.0,
      qty: 10,
      price: 100.0,
      demand: 10.0,
      stock: 5,
      competitor_price: 50.0
    }
  }

  let(:invalid_attributes) {
    { name: nil }
  }

  describe "GET #index" do
    it "returns a success response" do
      Product.create! valid_attributes
      get :index
      expect(response).to be_successful
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      product = Product.create! valid_attributes
      get :show, params: { id: product.to_param }
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Product" do
        expect {
          post :create, params: { product: valid_attributes }
        }.to change(Product, :count).by(1)
      end

      it "renders a JSON response with the new product" do
        post :create, params: { product: valid_attributes }
        expect(response).to have_http_status(:created)
        expect(response.content_type).to eq('application/json; charset=utf-8')
      end
    end

    context "with invalid params" do
      it "renders a JSON response with errors for the new product" do
        post :create, params: { product: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json; charset=utf-8')
      end
    end
  end

  # Add more tests for update and destroy actions
end
