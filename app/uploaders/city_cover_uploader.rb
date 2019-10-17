class CityCoverUploader < PhotoUploader
  def public_id
    "city_guides/cities/#{model.name.parameterize.underscore}/cover/#{model.name.parameterize.underscore}"
  end

  def tags
    ["cover"]
  end
end
