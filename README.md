# Unused code

In `app/views/cities/show.html.erb`

**Use images from Cloudinary for background image**

```
<div class="city-spots__header" style="background-image: linear-gradient(rgba(0,0,0,0.3), rgba(0,0,0,0.2)), url('<%= cl_image_path "city_guide/barcelona.jpg", height: 300, width: 400, crop: :fill %>')">
```

or

```
<div class="city-spots__header" style="background-image: linear-gradient(rgba(0,0,0,0.3), rgba(0,0,0,0.2)), url('<%= cl_image_path @city.photo, height: 300, width: 400, crop: :fill %>')">
```

---

