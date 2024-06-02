class PriceLogsController < ApplicationController
  before_action :set_price_log, only: %i[ show edit update destroy ]

  # GET /price_logs or /price_logs.json
  def index
    @price_logs = PriceLog.all
  end

  # GET /price_logs/1 or /price_logs/1.json
  def show
  end

  # GET /price_logs/new
  def new
    @price_log = PriceLog.new
  end

  # GET /price_logs/1/edit
  def edit
  end

  # POST /price_logs or /price_logs.json
  def create
    @price_log = PriceLog.new(price_log_params)

    respond_to do |format|
      if @price_log.save
        format.html { redirect_to price_log_url(@price_log), notice: "Price log was successfully created." }
        format.json { render :show, status: :created, location: @price_log }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @price_log.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /price_logs/1 or /price_logs/1.json
  def update
    respond_to do |format|
      if @price_log.update(price_log_params)
        format.html { redirect_to price_log_url(@price_log), notice: "Price log was successfully updated." }
        format.json { render :show, status: :ok, location: @price_log }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @price_log.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /price_logs/1 or /price_logs/1.json
  def destroy
    @price_log.destroy!

    respond_to do |format|
      format.html { redirect_to price_logs_url, notice: "Price log was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_price_log
      @price_log = PriceLog.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def price_log_params
      params.require(:price_log).permit(:product_id_id, :old_price, :new_price, :changed_at)
    end
end
