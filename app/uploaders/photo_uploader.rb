class PhotoUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave

  process resize_to_limit(1800, 1800)

  process :cloudinary_transformation => {
                                          :dpr => :auto,
                                          :fetch_format => :auto,
                                          :quality => :auto
                                        }

  process_all_versions :cloudinary_transformation => {
                                                        :dpr => :auto,
                                                        :fetch_format => :auto,
                                                        :quality => :auto
                                                      }
  version :card do
    eager
    resize_to_fill(640, 480)
  end

  version :preview do
    eager
    resize_to_fit(192, 256)
  end

  def default_url(*args)
    ActionController::Base.helpers.asset_path("fallback/" + [version_name, "city_and_spot_placeholder.jpeg"].compact.join('_'))
  end
end
