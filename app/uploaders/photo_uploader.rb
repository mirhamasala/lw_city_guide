class PhotoUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave

  process resize_to_limit(1800, 1800)
  process eager  # Force version generation at upload time
  process_all_versions :cloudinary_transformation => {
                                                      :dpr => :auto,
                                                      :fetch_format => :auto,
                                                      :quality => :auto
                                                      }
  # And then this is also possible? - Syntax?
  # cloudinary_transformation :transformation => [
  #     {:width => 1000, :height => 1200, :crop => :limit},
  #     {:overlay => "my_watermark", :width => 30, :gravity => :south_east,
  #      :x => 5, :y => 5}
  #   ]

  version :card do
    resize_to_fill(256, 192)

    # What's the difference?
    # process :resize_to_fill => [164, 164, :fill]
    # And why is it liek this here?
    # cloudinary_transformation :quality => 80

    # Just on its own? No `process`?
    # eager

    # cloudinary_transformation :transformation => [
      # {:width => 150, :height => 200, :crop => :fill, :effect => "sepia"},
      # {:angle => 10}
    # ]

    # vs.

    # cloudinary_transformation effect: "brightness:30", radius: 20,
    # width: 150, height: 150, crop: :thumb, gravity: :face
  end

  version :header do
  end

  version :preview do
    # Landscape images are fitted so that the whole image is visible,
    # height is being adjusted to accomodate 192px width
    resize_to_fit(192, 256)

    # Landscape images are filled so that they are exactly 192px x 256px
    # resize_to_fill(192, 256)

    # I see no difference with fit
    # resize_to_limit(192, 256)
  end
end

# OTHER EXAMPLES

# version :bright_face do
#   cloudinary_transformation effect: "brightness:30", radius: 20,
#     width: 150, height: 150, crop: :thumb, gravity: :face
# end

# process :tags => ["photo_album_sample"]

# process :convert => "jpg"

# version :thumbnail do
#   eager
#   resize_to_fit(150, 150)
#   cloudinary_transformation :quality => 80
# end

# process :tags => ['post_picture']

# process :assign_tags

# def assign_tags
  #   return :tags => ['tag', model.name]
# end
