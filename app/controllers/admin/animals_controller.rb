class Admin::AnimalsController < Admin::BaseController
  def index
    @animals = Animal.all
  end

  def edit
    @animal = Animal.find(params[:id])
  end
end
