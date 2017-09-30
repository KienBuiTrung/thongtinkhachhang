class DeniedCustomersController < ApplicationController
	before_action :logged_in_user, except: [:index, :show]

  def index
  	@denied_customers = DeniedCustomer.all
  end

  def new
  	@denied_customer = DeniedCustomer.new
  end
  
  def create
    new_params = denied_customer_params
    new_params[:amount] = new_params[:amount].gsub(",", "").to_i
    @denied_customer = current_user.denied_customers.build(new_params)

    if @denied_customer.save
      flash[:success] = "Nhập khách hàng thành công !!!"
      redirect_to denied_customers_path
    else
      render 'new'
    end
  end

  def edit
  	@denied_customer = DeniedCustomer.find(params[:id])
  end

  def update
  	 @denied_customer = DeniedCustomer.find(params[:id])
     new_params = denied_customer_params
     new_params[:amount] = new_params[:amount].gsub(",", "").to_i
    if @denied_customer.update_attributes(new_params)
      flash[:success] = "Cập nhật thành công !!!"
      redirect_to @denied_customer
    else
      render 'edit'
    end
  end

  def show
    @denied_customer = DeniedCustomer.find(params[:id])
  end

  def destroy
  	DeniedCustomer.find(params[:id]).destroy
	flash[:success] = "Xóa KH thành công !!!"
	redirect_to denied_customers_path
  end

  private

    def denied_customer_params
      params.require(:denied_customer).permit(:name, :id_no, :cif, :amount, :purpose, :explaination, :user_id)
      # params[:denied_customer][:amount] = params[:denied_customer][:amount].gsub(",", "").to_i
      # params
    end

    def logged_in_user
      unless logged_in?
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end
end
