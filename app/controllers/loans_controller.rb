class LoansController < ApplicationController
  before_action :set_loan, only: [:show, :edit, :update, :destroy]

  # GET /loans
  def index
    @loans = policy_scope(Loan).order(:date)
    @other_users = User.all_except(current_user)
    @loans_taken = @loans.where(taker: current_user).sum(:value)
    @loans_provided =  @loans.where(provider: current_user).sum(:value)
    @saldo_total = @loans_provided - @loans_taken
  end

  # GET /loans/1
  def show
  end

  # GET /loans/new
  def new
    @loan = Loan.new
    authorize @loan
  end

  # GET /loans/1/edit
  def edit
  end

  # POST /loans
  def create
    @loan = Loan.new(loan_params)
    authorize @loan
    if @loan.save
      redirect_to @loan, notice: 'Loan was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /loans/1
  def update
    if @loan.update(loan_params)
      redirect_to @loan, notice: 'Loan was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /loans/1
  def destroy
    @loan.destroy
    redirect_to loans_url, notice: 'Loan was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_loan
      @loan = Loan.find(params[:id])
      authorize @loan
    end

    # Only allow a trusted parameter "white list" through.
    def loan_params
      params.require(:loan).permit(:description, :value, :date, :taker_id, :provider_id)
    end
end
