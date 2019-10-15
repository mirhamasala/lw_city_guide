class PhotoUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave

  process resize_to_limit: [1800, 1800]

  version :preview do
    resize_to_fit 192, 256
  end
end
