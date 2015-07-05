class InvoicesController < ApplicationController
  before_action :set_invoice, only: [:show, :edit, :update, :destroy]

  # GET /invoices
  # GET /invoices.json
  def index
    defaults = {:filter => {:rentable_id => nil, :include_paid => 1, :include_non_paid => 1},
                :date => {:month => Date.today.month, :year => Date.today.year}}
    params.replace(defaults.merge(params))

    queryParams = {}
    if params[:filter][:include_paid] != params[:filter][:include_non_paid]
      queryParams[:paid]=params[:filter][:include_paid].to_i == 1 ? TRUE : FALSE
    end
    if params[:filter][:rentable_id].to_i != 0
      queryParams[:rentable_id]=params[:filter][:rentable_id].to_i
    end

    @invoices = Invoice.where(queryParams).where('extract(month from due) = ? AND extract(year from due) = ?', params[:date][:month], params[:date][:year])
  end

  # GET /invoices/1
  # GET /invoices/1.json
  def show
    render :edit
  end

  # GET /invoices/new
  def new
    @invoice = Invoice.new
    @invoice.rentable_id = params[:rentable_id]
    @invoice.user_invoices = Rentable.find(params[:rentable_id]).users.map { |u| UserInvoice.new(:user_id => u.id) }
  end

  # GET /invoices/1/edit
  def edit
  end

  # POST /invoices
  # POST /invoices.json
  def create
    @invoice = Invoice.new(invoice_params)

    respond_to do |format|
      if @invoice.save
        format.html { redirect_to @invoice, notice: 'Invoice was successfully created.' } #todo
        format.json { render :show, status: :created, location: @invoice }
      else
        format.html { render :new }
        format.json { render json: @invoice.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /invoices/1
  # PATCH/PUT /invoices/1.json
  def update
    respond_to do |format|
      if @invoice.update(invoice_params)
        format.html { redirect_to @invoice, notice: 'Invoice was successfully updated.' }
        format.json { render :show, status: :ok, location: @invoice }
      else
        format.html { render :edit }
        format.json { render json: @invoice.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /invoices/1
  # DELETE /invoices/1.json
  def destroy
    @invoice.destroy
    respond_to do |format|
      format.html { redirect_to invoices_url, notice: 'Invoice was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_invoice
    @invoice = Invoice.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def invoice_params
    params.require(:invoice).permit(
        :rentable_id, :due, :paid,
        user_invoices_attributes: [:id, :invoice_id, :user_id, :rent, :trash, :heating, :upkeep, :power, :power_price, :power_usage, :water, :hot_water_price, :hot_water_usage, :cold_water_price, :cold_water_usage, :other_name, :other_sum]
    )
  end
end
