class Admin::DashboardController < Admin::BaseController
  def show
    @total_products = Product.count
    @total_catagories = Category.count
  end
end
