class CartAnimalsController < ApplicationController
  include ActionView::Helpers::TextHelper

  def create
    animal = Animal.find(params[:animal_id])
    @cart.add_animal(animal.id)
    session[:cart] = @cart.contents
    flash[:notice] = "#{pluralize(@cart.count_of(animal.id), animal.name)} in your cart"
    redirect_to animal_path(animal)
  end
end
