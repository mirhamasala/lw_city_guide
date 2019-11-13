start_time = Time.now

puts "Wiping out civilizations..."
User.destroy_all
City.destroy_all
Category.destroy_all
Spot.destroy_all
puts "[1/5] 🚜 It's a clean slate..."

puts "Adding city builders..."
g = User.create!(email: "g@testing.com", password: "testing", github_handle: "DctrG")
mirha = User.create!(email: "mirha@testing.com", password: "testing", github_handle: "mirhamasala", admin: true)
puts "[2/5] 👷🏽‍♀️ Builders be building..."

puts "Building Spanish Romes in less than a day..."
barcelona = City.create!(name: "Barcelona", country: "Spain", keepers: [g, mirha], remote_cover_url: "https://res.cloudinary.com/hvrft8ujk/image/upload/v1572325925/cover_barcelona_tj454l.jpg")
madrid = City.create!(name: "Madrid", country: "Spain", keepers: [g, mirha], remote_cover_url: "https://res.cloudinary.com/hvrft8ujk/image/upload/v1572325929/cover_madrid_v3shdw.jpg")
puts "[3/5] 🦖 Pinned Barcelona & Madrid on the map..."

puts "Creating categories..."
eat = Category.create!(name: "eat")
drink = Category.create!(name: "drink")
play = Category.create!(name: "play")
see = Category.create!(name: "see")
shop = Category.create!(name: "shop")
stay = Category.create!(name: "stay")
wagon = Category.create!(name: "wagon")
other = Category.create!(name: "other")
puts "[4/5] 📦 All boxed up..."

puts "Hunting hotspots..."
spot_attributes = [
  {
    name: "Le Wagon Barcelona",
    sub_category: "Coding Bootcamp · 🚀",
    description: "Change your life, learn to code.",
    address: "Carrer d'en Grassot 101",
    neighborhood: "Gràcia",
    phone_number: "+34 667 23 81 72",
    website: "https://www.lewagon.com/barcelona",
    remote_photo_url: "https://res.cloudinary.com/hvrft8ujk/image/upload/v1572326350/IMG_3791_te4yds.jpg",
    category: wagon,
    city: barcelona,
    owner: mirha,
  },
  {
    name: "SlowMov",
    sub_category: "Coffee · Specialty Brews",
    description: "Take it slow, have a drip.",
    address: "Carrer de Luis Antúnez 18",
    neighborhood: "Gràcia",
    phone_number: "+34 936 67 27 15",
    website: "https://www.slowmov.com",
    remote_photo_url: "https://res.cloudinary.com/hvrft8ujk/image/upload/v1572326244/IMG_3728_yiierx.jpg",
    category: drink,
    city: barcelona,
    owner: mirha,
  },
  {
    name: "Casa Batlló",
    sub_category: "Building · Skull Balconies",
    description: "Some people say he was on mushrooms. I say he was a rock star.",
    address: "Passeig de Gràcia, 43, 08007 Barcelona, Spain",
    remote_photo_url: "https://res.cloudinary.com/hvrft8ujk/image/upload/v1572327219/IMG_3975_jrdcfp.jpg",
    category: see,
    city: barcelona,
    owner: mirha,
  },
  {
    name: "Can Pizza",
    sub_category: "Pizza · Sourdough Deal",
    description: "Neapolitan dough like it should be, but better.",
    address: "Carrer de l'Almirall Aixada 7, Barcelona, Catalunya, Spain",
    phone_number: "+34 932 21 45 79",
    website: "http://www.canros.cat",
    remote_photo_url: "https://res.cloudinary.com/hvrft8ujk/image/upload/v1572326208/IMG_3888_csgvkm.jpg",
    category: eat,
    city: barcelona,
    owner: mirha,
  },
  {
    name: "Boulangerie Mayer",
    sub_category: "Bakery · Bread and Butter",
    description: "Pick up some croissants and a pan de campo.",
    address: "Carrer del Diluvi, 11, 08012 Barcelona, Spain",
    phone_number: "+34 932 37 65 03",
    website: "https://www.boulangeriemayer.com/",
    remote_photo_url: "https://res.cloudinary.com/hvrft8ujk/image/upload/v1572327383/IMG_4104_gwgvkg.jpg",
    category: shop,
    city: barcelona,
    owner: mirha,
  },
  {
    name: "Asador de Aranda",
    sub_category: "Roasted Lamb · Decadent Gluttony",
    description: "Bring someone you love. Get a quarter of the baby lamb roasted in clay pot, a green salad, and a bottle of red wine. Call it life.",
    address: "Av. del Tibidabo, 31, 08022 Barcelona, Spain",
    phone_number: "+34 934 17 01 15",
    website: "http://www.asadordearanda.com/",
    remote_photo_url: "https://res.cloudinary.com/hvrft8ujk/image/upload/v1572327380/IMG_4242_2_fyivei.jpg",
    category: eat,
    city: barcelona,
    owner: mirha,
  },
  {
    name: "Le Wagon Madrid",
    sub_category: "Coding Bootcamp · 🚀",
    description: "Change your life, learn to code.",
    address: "Calle de Juan de Mariana 15",
    neighborhood: "Atocha",
    phone_number: "+34 646 85 03 58",
    website: "https://www.lewagon.com/madrid",
    remote_photo_url: "https://res.cloudinary.com/hvrft8ujk/image/upload/v1572325929/cover_madrid_v3shdw.jpg",
    category: wagon,
    city: madrid,
    owner: mirha,
  },
  {
    name: "Café Belén",
    sub_category: "Mojitos · Minty",
    description: "Square atmosphere and local hangs.",
    address: "Calle de Belén 5",
    neighborhood: "Chueca",
    phone_number: "+34 913 08 27 47",
    website: "http://www.elcafebelen.com/",
    remote_photo_url: "https://res.cloudinary.com/hvrft8ujk/image/upload/v1572326244/dsc01474_zk6c0z.jpg",
    category: drink,
    city: madrid,
    owner: mirha,
  },
  {
    name: "Chocolatería San Ginés",
    sub_category: "Porras · Better Donuts",
    description: "Life before keto: porras dunked in chocolate.",
    address: "Pasadizo de San Ginés 5",
    neighborhood: "Sol",
    phone_number: "+34 913 65 65 46",
    website: "https://www.chocolateriasangines.com/",
    remote_photo_url: "https://res.cloudinary.com/hvrft8ujk/image/upload/v1572326244/dsc01439_nvljdp.jpg",
    category: eat,
    city: madrid,
    owner: mirha,
  }
]

Spot.create!(spot_attributes)
puts "[5/5] 🦴 Let\'s have a bite..."

puts "✨ Done in #{(Time.now - start_time).to_f.round(2)}s."
