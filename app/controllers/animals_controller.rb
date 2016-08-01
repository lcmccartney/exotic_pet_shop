class AnimalsController < ApplicationController
  before_action :current_admin?, only: [:new, :create]

  def show
    @animal = Animal.find(params[:id])
  end

  def index
    @animals = Animal.all
  end

  def new
    @animal = Animal.new
    @categories = Category.all_names
  end

  def create
    category = Category.find(params[:category_id])
    @animal = category.animals.new(animal_params)
    if @animal.save
      flash[:success] = "Successfully created #{@animal.name}"
      redirect_to new_animal_path
    else
      flash.now[:danger] = "Invalid parameters"
      render :new
    end
  end

  private

  def animal_params
    params.require(:animal).permit(:name, :description, :price, :image_path)
  end
end
