class ProfitsController < ApplicationController
  before_action :set_profit, only: %i[ show edit update destroy ]
  load_and_authorize_resource
  # GET /profits or /profits.json
  def index
    @profits = Profit.all
  end

  # GET /profits/1 or /profits/1.json
  def show
  end

  # GET /profits/new
  def new
    @profit = Profit.new
  end

  # GET /profits/1/edit
  def edit
  end

  # POST /profits or /profits.json
  def create
    @profit = Profit.new(profit_params)

    respond_to do |format|
      if @profit.save
        format.html { redirect_to @profit, notice: "Profit was successfully created." }
        format.json { render :show, status: :created, location: @profit }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @profit.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /profits/1 or /profits/1.json
  def update
    respond_to do |format|
      if @profit.update(profit_params)
        format.html { redirect_to @profit, notice: "Profit was successfully updated." }
        format.json { render :show, status: :ok, location: @profit }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @profit.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /profits/1 or /profits/1.json
  def destroy
    @profit.destroy
    respond_to do |format|
      format.html { redirect_to profits_url, notice: "Profit was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_profit
      @profit = Profit.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def profit_params
      params.require(:profit).permit(:name)
    end
end
