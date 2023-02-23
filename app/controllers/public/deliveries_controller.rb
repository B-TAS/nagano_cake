class Public::DeliveriesController < ApplicationController
  before_action :authenticate_customer!

  def index
    @deliveries = Delivery.where(customer:current_customer)
    @delivery = Delivery.new
  end

  def edit
    @delivery = Delivery.find(params[:id])
  end

  def create
    @delivery = Delivery.new(delivery_params)
    @delivery.customer_id = current_customer.id
   if @delivery.save
    flash[:notice] = "配送先の登録が完了しました。"
    redirect_to deliveries_path(@customer)
   else
    render :index
   end
  end

  def update
    @delivery = Delivery.find(params[:id])
    @delivery.update(delivery_params)
    if  @delivery.save
     flash[:notice] = "配送先の編集が完了しました。"
     redirect_to deliveries_path(@customer)
    else
     render :edit
    end
  end

  def destroy
    @delivery = Delivery.find(params[:id])
    @delivery.destroy
    redirect_to deliveries_path
  end

  private
  def delivery_params
    params.require(:delivery).permit(:customer_id, :name, :address, :postcode)
  end
end


