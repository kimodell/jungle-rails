class Admin::DashboardController < Admin::BaseController
  def show
    @total_products = Product.count
    @total_categories = Category.count
  end
end
