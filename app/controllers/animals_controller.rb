class AnimalsController < ApplicationController
  before_action :current_admin?, only: [:new, :create, :update]

  def show
    @animal = Animal.find(params[:id])
  end

  def index
    @animals = Animal.all
  end

  def new
    @animal = Animal.new
    @categories = Category.all_names
    @animal_statuses = Animal.statuses.keys
  end

  def create
    category = Category.find(params[:category_id])
    animal = category.animals.new(animal_params)
    animal[:image_path] = animal.default_image if animal[:image_path].blank?
    if animal.save
      flash[:success] = "Successfully created #{animal_link(animal)}"
      redirect_to new_animal_path
    else
      flash.now[:danger] = "Invalid parameters"
      render :new
    end
  end

  def update
    animal = Animal.find(params[:id])
    if animal.update(animal_params)
      animal.update_attributes(category_id: params[:category_id])
      flash[:success] = "Successfully updated #{animal_link(animal)}!"
      redirect_to admin_animals_path
    else
      flash.now[:danger] = "Invalid parameters"
      render :new
    end
  end

  private

  def animal_params
    params.require(:animal).permit(:name, :description, :price, :image_path, :status)
  end
end
