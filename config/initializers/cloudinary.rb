Cloudinary.config do |config|
  config.cloud_name    = ENV.fetch('CLOUDINARY_CLOUD_NAME')
  config.api_key       = ENV.fetch('CLOUDINARY_API_KEY')
  config.api_secret    = ENV.fetch('CLOUDINARY_API_SECRET')
  config.secure        = true
  config.cdn_subdomain = true

  config.enhance_image_tag = true
  config.static_image_support = Rails.env.production?
end
