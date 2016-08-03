class Secret < ActiveRecord::Base
  def self.image_path
    response = Faraday.get("http://api.giphy.com/v1/gifs/random?api_key=dc6zaTOxFJmzC&tag=animals")
    raw_data = response.body
    parsed = JSON.parse(raw_data, object_class: OpenStruct)
    parsed.data.image_url
  end
end
