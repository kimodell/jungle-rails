class Admin::CatagoriesController < Admin::BaseController

  def index
    @catagories = Catagory.order(id: :desc).all
  end

  def new
    @catagory = Catagory.new
  end

  def create
    @category = Category.new(name: params[:category][:name])

    if @category.save
      redirect_to [:admin, :categories], notice: 'Category created!'
    else
      render :new
    end
  end

end
