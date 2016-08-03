class SecretsController < ApplicationController
  def index
    @image_path = Secret.image_path
  end
end
