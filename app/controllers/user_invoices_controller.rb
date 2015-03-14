class UserInvoicesController < ApplicationController
  before_action :set_user_invoice, only: [:show, :edit, :update, :destroy]

  # GET /user_invoices
  # GET /user_invoices.json
  def index
    @user_invoices = UserInvoice.all
  end

  # GET /user_invoices/1
  # GET /user_invoices/1.json
  def show
  end

  # GET /user_invoices/new
  def new
    @user_invoice = UserInvoice.new
  end

  # GET /user_invoices/1/edit
  def edit
  end

  # POST /user_invoices
  # POST /user_invoices.json
  def create
    @user_invoice = UserInvoice.new(user_invoice_params)

    respond_to do |format|
      if @user_invoice.save
        format.html { redirect_to @user_invoice, notice: 'User invoice was successfully created.' }
        format.json { render :show, status: :created, location: @user_invoice }
      else
        format.html { render :new }
        format.json { render json: @user_invoice.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_invoices/1
  # PATCH/PUT /user_invoices/1.json
  def update
    respond_to do |format|
      if @user_invoice.update(user_invoice_params)
        format.html { redirect_to @user_invoice, notice: 'User invoice was successfully updated.' }
        format.json { render :show, status: :ok, location: @user_invoice }
      else
        format.html { render :edit }
        format.json { render json: @user_invoice.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_invoices/1
  # DELETE /user_invoices/1.json
  def destroy
    @user_invoice.destroy
    respond_to do |format|
      format.html { redirect_to user_invoices_url, notice: 'User invoice was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_invoice
      @user_invoice = UserInvoice.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_invoice_params
      params.require(:user_invoice).permit(:invoice_id, :user_id, :rent, :trash, :heating, :upkeep, :power, :power_price, :power_usage, :water, :hot_water_price, :hot_water_usage, :cold_water_price, :cold_water_usage, :other_name, :other_sum)
    end
end
