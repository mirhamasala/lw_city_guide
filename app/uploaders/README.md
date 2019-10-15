# Photo Uploader

## Uploader with versions

```Ruby
process eager: true  # Force version generation at upload time.

process convert: 'jpg'

version :thumnail do
  resize_to_fit 256, 256
end

version :bright_face do
  cloudinary_transformation effect: "brightness:30", radius: 20,
    width: 150, height: 150, crop: :thumb, gravity: :face
end
```

## Resources

- [Cloudinary Image Transformations](https://cloudinary.com/documentation/image_transformations#transformations_reference)
