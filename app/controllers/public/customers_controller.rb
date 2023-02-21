class Public::CustomersController < ApplicationController
  def show
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      redirect_to customer_path(@customer),notice: "You have updated customer_info successfully."
    else
      render "edit"
    end
  end

  private

  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :kana_last_name, :kana_first_name, :postcode, :address, :phone_number, :email)
  end
end
