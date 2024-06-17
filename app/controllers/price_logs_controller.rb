class PriceLogsController < ApplicationController
  before_action :set_price_log, only: %i[ show edit update destroy ]

  # GET /price_logs or /price_logs.json
  def index
    @price_logs = PriceLog.all
    render json: @price_logs
  end

  # GET /price_logs/1 or /price_logs/1.json
  def show
    render json: @price_log
  end

  # POST /price_logs or /price_logs.json
  def create
    @price_log = PriceLog.new(price_log_params)

    if @price_log.save
      render :show, status: :created, location: @price_log
    else
      render json: @price_log.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /price_logs/1 or /price_logs/1.json
  def update
    if @price_log.update(price_log_params)
      render :show, status: :ok, location: @price_log
    else
      render json: @price_log.errors, status: :unprocessable_entity
    end
  end

  # DELETE /price_logs/1 or /price_logs/1.json
  def destroy
    @price_log.destroy
    head :no_content
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_price_log
      @price_log = PriceLog.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def price_log_params
      params.require(:price_log).permit(:product_id, :old_price, :new_price, :changed_at)
    end
end
