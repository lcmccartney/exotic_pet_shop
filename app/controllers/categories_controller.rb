class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def show
    @category = Category.find_by(slug: params[:category_slug])
    if @category
      render :show
    else
      render(:status => 500)
    end
  end
end
