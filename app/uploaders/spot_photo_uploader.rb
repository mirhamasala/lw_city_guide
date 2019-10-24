class SpotPhotoUploader < PhotoUploader
  def public_id
    "city_guides/cities/#{model.city.name.parameterize.underscore}/spots/#{model.name.parameterize.underscore}"
  end

  def tags
    [model.city.country, model.city.name, model.category.name]
  end
end
