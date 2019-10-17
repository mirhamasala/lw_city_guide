class PhotoUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave

  process eager: true

  process resize_to_limit: [1800, 1800]

  version :thumb do
    resize_to_fit 256, 256
  end

  version :preview do
    resize_to_fit 192, 256
  end
end
