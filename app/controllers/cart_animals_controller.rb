class CartAnimalsController < ApplicationController
  include ActionView::Helpers::TextHelper
  before_action :set_animal, only: [:create, :increment, :destroy]

  def index
  end

  def create
    @cart.increase_animal(@animal.id)
    session[:cart] = @cart.contents
    flash[:success] = "#{pluralize(@cart.count_of(@animal.id), @animal.name)} in your cart"
    redirect_to animal_path(@animal)
  end

  def increment
    if params[:increment] == "decrease"
      @cart.decrease_animal(@animal.id) if params[:increment] == "decrease"
      flash[:success] = "Successfully removed #{animal_link} from your cart."
    elsif params[:increment] == "increase"
      @cart.increase_animal(@animal.id)
      flash[:success] = "Successfully added #{@animal.name}!"
    end
    redirect_to cart_path
  end

  def destroy
    @cart.remove_animal(@animal.id)
    flash[:success] = "Successfully removed #{animal_link} from your cart."
    redirect_to cart_path
  end

  def set_animal
    @animal = Animal.find(params[:id])
  end

  def animal_link
    %Q[<a href="/animals/#{@animal.id}">#{@animal.name}</a>]
  end
end
