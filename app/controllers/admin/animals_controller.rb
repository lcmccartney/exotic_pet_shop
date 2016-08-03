class Admin::AnimalsController < Admin::BaseController
  def index
    @animals = Animal.all
  end

  def edit
    @animal = Animal.find(params[:id])
    @categories = Category.all_names
    @animal_statuses = Animal.statuses.keys
  end
end
