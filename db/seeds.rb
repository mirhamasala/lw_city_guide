start_time = Time.now

puts "Wiping out civilizations..."
User.destroy_all
City.destroy_all
Category.destroy_all
Spot.destroy_all
puts "[1/6] 🚜 It's a clean slate."

puts "Adding city keepers and dwellers..."
# Mirha is the admin
mirha = User.create!(
                      email: "mirha@testing.com",
                      password: "testing",
                      username: "mirhamasala",
                      avatar: "https://avatars0.githubusercontent.com/u/26620750?v=4",
                      name: "Mirha Masala",
                      github_profile: "https://github.com/mirhamasala",
                      location: "Singapore",
                      bio: "Web developer, blogger",
                      admin: true
                    )

# Ellyn is the city keeper of two cities, Madrid and Barcelona (and not an admin)
ellyn = User.create!(
                      email: "ellyn@testing.com",
                      password: "testing",
                      username: "ellynbsc",
                      avatar: "https://avatars2.githubusercontent.com/u/25570813?v=4",
                      name: "Ellyn",
                      github_profile: "https://github.com/EllynBsc",
                      location: "",
                      bio: "Teaching code to creative people."
                    )

# Inou is the city keeper of one city, Barcelona (and not an admin)
inou = User.create!(
                      email: "inou@testing.com",
                      password: "testing",
                      username: "inouridder",
                      avatar: "https://avatars1.githubusercontent.com/u/22443485?v=4",
                      name: "Inou Ridder",
                      github_profile: "https://github.com/inouridder",
                      location: "",
                      bio: "teacher @lewagon freelance rails - vue"
                  )

# G is a user (and not a city keeper nor an admin)
g = User.create!(
                  email: "g@testing.com",
                  password: "testing",
                  username: "dctrg",
                  avatar: "https://avatars3.githubusercontent.com/u/23130911?v=4",
                  name: "G",
                  github_profile: "https://github.com/dctrg",
                  location: "",
                  bio: "",
                )
puts "[2/6] 🦖 Keepers be keeping, dwellers be dwelling."

puts "Building Spain..."
spain = Country.create!(name: "Spain")
puts "[3/6] 🇪🇸  Hola!..."

puts "Building Spanish Romes in less than a day..."
barcelona = City.create!(name: "Barcelona", country: spain, keepers: [ellyn, inou], remote_cover_url: "https://res-4.cloudinary.com/mirhamasala/image/upload/v1577873305/city_guides/cities/barcelona/cover/barcelona.jpg")
madrid = City.create!(name: "Madrid", country: spain, keepers: [ellyn], remote_cover_url: "https://res-3.cloudinary.com/mirhamasala/image/upload/v1577873324/city_guides/cities/madrid/cover/madrid.jpg")
puts "[4/6] 📌 Pinned Barcelona & Madrid on the map."

puts "Creating categories..."
eat = Category.create!(name: "eat")
drink = Category.create!(name: "drink")
play = Category.create!(name: "dance")
see = Category.create!(name: "see")
shop = Category.create!(name: "shop")
stay = Category.create!(name: "stay")
wagon = Category.create!(name: "wagon")
other = Category.create!(name: "other")
puts "[5/6] 📦 All boxed up."

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
    remote_photo_url: "https://res-3.cloudinary.com/mirhamasala/image/upload/city_guides/cities/barcelona/spots/le_wagon_barcelona.jpg",
    category: wagon,
    city: barcelona,
    owner: ellyn,
    status: "published"
  },
  {
    name: "SlowMov",
    sub_category: "Coffee · Specialty Brews",
    description: "Take it slow, have a drip.",
    address: "Carrer de Luis Antúnez 18",
    neighborhood: "Gràcia",
    phone_number: "+34 936 67 27 15",
    website: "https://www.slowmov.com",
    remote_photo_url: "https://res-1.cloudinary.com/mirhamasala/image/upload/city_guides/cities/barcelona/spots/slowmov.jpg",
    category: drink,
    city: barcelona,
    owner: ellyn,
    status: "published"
  },
  {
    name: "Casa Batlló",
    sub_category: "Building · Skull Balconies",
    description: "Some people say he was on mushrooms. I say he was a rock star.",
    address: "Passeig de Gràcia, 43, 08007 Barcelona, Spain",
    remote_photo_url: "https://res-5.cloudinary.com/mirhamasala/image/upload/city_guides/cities/barcelona/spots/casa_batllo.jpg",
    category: see,
    city: barcelona,
    owner: inou,
    status: "published"
  },
  {
    name: "Can Pizza",
    sub_category: "Pizza · Sourdough Deal",
    description: "Neapolitan dough like it should be, but better.",
    address: "Carrer de l'Almirall Aixada 7, Barcelona, Catalunya, Spain",
    phone_number: "+34 932 21 45 79",
    website: "http://www.canros.cat",
    remote_photo_url: "https://res-4.cloudinary.com/mirhamasala/image/upload/city_guides/cities/barcelona/spots/can_pizza.jpg",
    category: eat,
    city: barcelona,
    owner: inou,
    status: "published"
  },
  {
    name: "Boulangerie Mayer",
    sub_category: "Bakery · Bread and Butter",
    description: "Pick up some croissants and a pan de campo.",
    address: "Carrer del Diluvi, 11, 08012 Barcelona, Spain",
    phone_number: "+34 932 37 65 03",
    website: "https://www.boulangeriemayer.com/",
    remote_photo_url: "https://res-3.cloudinary.com/mirhamasala/image/upload/city_guides/cities/barcelona/spots/boulangerie_mayer.jpg",
    category: shop,
    city: barcelona,
    owner: mirha,
    status: "draft"
  },
  {
    name: "Asador de Aranda",
    sub_category: "Roasted Lamb · Decadent Gluttony",
    description: "Bring someone you love. Get a quarter of the baby lamb roasted in clay pot, a green salad, and a bottle of red wine. Call it life.",
    address: "Av. del Tibidabo, 31, 08022 Barcelona, Spain",
    phone_number: "+34 934 17 01 15",
    website: "http://www.asadordearanda.com/",
    remote_photo_url: "https://res-1.cloudinary.com/mirhamasala/image/upload/city_guides/cities/barcelona/spots/asador_de_aranda.jpg",
    category: eat,
    city: barcelona,
    owner: mirha,
    status: "draft"
  },
  {
    name: "Le Wagon Madrid",
    sub_category: "Coding Bootcamp · 🚀",
    description: "Change your life, learn to code.",
    address: "Calle de Juan de Mariana 15",
    neighborhood: "Atocha",
    phone_number: "+34 646 85 03 58",
    website: "https://www.lewagon.com/madrid",
    remote_photo_url: "https://res-2.cloudinary.com/mirhamasala/image/upload/v1577873717/city_guides/cities/madrid/spots/le_wagon_madrid.jpg",
    category: wagon,
    city: madrid,
    owner: ellyn,
    status: "published"
  },
  {
    name: "Café Belén",
    sub_category: "Mojitos · Minty",
    description: "Square atmosphere and local hangs.",
    address: "Calle de Belén 5",
    neighborhood: "Chueca",
    phone_number: "+34 913 08 27 47",
    website: "http://www.elcafebelen.com/",
    remote_photo_url: "https://res-1.cloudinary.com/mirhamasala/image/upload/city_guides/cities/madrid/spots/cafe_belen.jpg",
    category: drink,
    city: madrid,
    owner: g,
    status: "published"
  },
  {
    name: "Chocolatería San Ginés",
    sub_category: "Porras · Better Donuts",
    description: "Life before keto: porras dunked in chocolate.",
    address: "Pasadizo de San Ginés 5",
    neighborhood: "Sol",
    phone_number: "+34 913 65 65 46",
    website: "https://www.chocolateriasangines.com/",
    remote_photo_url: "https://res-5.cloudinary.com/mirhamasala/image/upload/city_guides/cities/madrid/spots/chocolateria_san_gines.jpg",
    category: eat,
    city: madrid,
    owner: mirha,
    status: "published"
  }
]

Spot.create!(spot_attributes)
puts "[6/6] 🦴 Let\'s have a bite."

puts "✨ Done in #{(Time.now - start_time).to_f.round(2)}s."
