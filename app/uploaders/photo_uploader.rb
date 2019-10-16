class PhotoUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave

  process resize_to_limit: [1800, 1800]

  version :preview do
    resize_to_fit 192, 256
  end

  def public_id
    if model.class == Spot
      "city_guides/#{model.city.name.downcase}/" + model.name.parameterize.underscore
    elsif model.class == City
      "city_guides/cities/" + model.name.parameterize.underscore
    end
  end

  def tags
    if model.class == Spot
      [model.city.name, model.category.name]
    elsif model.class == City
      [model.country]
    end
  end
end
