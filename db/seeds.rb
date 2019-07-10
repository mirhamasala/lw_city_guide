puts "Wiping out civilizations..."
City.destroy_all
Spot.destroy_all
User.destroy_all

puts "Adding city builders..."
g = User.create!(email: "g@testing.com", password: "testing", github_handle: "DctrG", admin: true)
lars = User.create!(email: "lars@testing.com", password: "testing", github_handle: "datene", admin: true)
laura = User.create!(email: "laura@testing.com", password: "testing", github_handle: "lozdesign", admin: true)
mirha = User.create!(email: "mirha@testing.com", password: "testing", github_handle: "mirhamasala", admin: true)
gm = User.create!(email: "gm@testing.com", password: "testing")

puts "Building Spanish Romes in less than a day..."
city_attributes = [
  {
    name: "Barcelona",
    country: "Spain"
    # remote_photo_url: "https://images.unsplash.com/photo-1507619579562-f2e10da1ec86"
  },
  {
    name: "Madrid",
    country: "Spain"
  }
]

City.create!(city_attributes)
puts "Pinned Barcelona & Madrid on the map..."

puts "Adding runners to cities..."
g.cities << City.find_by(name: "Madrid")

lars.cities << City.find_by(name: "Barcelona")
lars.cities << City.find_by(name: "Madrid")

laura.cities << City.find_by(name: "Barcelona")
laura.cities << City.find_by(name: "Madrid")

mirha.cities << City.find_by(name: "Barcelona")
mirha.cities << City.find_by(name: "Madrid")
puts "Cities attached to runners..."

puts "Hunting hotspots..."
spot_attributes = [
  {
    name: "Le Wagon Barcelona",
    category: "other",
    sub_category: "Coding Bootcamp · 🚀",
    description: "Change your life, learn to code.",
    address: "Carrer d'en Grassot 101",
    neighborhood: "Gràcia",
    phone_number: "+34 667 23 81 72",
    website: "https://www.lewagon.com/barcelona",
    # remote_photo_url: "https://secure.meetupstatic.com/photos/theme_body/5/a/2/c/full_7163084.jpeg",
    city_id: 1,
    user_id: 1
  },
  {
    name: "SlowMov",
    category: "drink",
    sub_category: "Coffee · Specialty Brews",
    description: "Take it slow, have a drip.",
    address: "Carrer de Luis Antúnez 18",
    neighborhood: "Gràcia",
    phone_number: "+34 936 67 27 15",
    website: "https://www.slowmov.com",
    # remote_photo_url: "https://i.pinimg.com/originals/e8/d9/90/e8d990dbcfc32cf5563b7b006c3e0aa0.jpg",
    city_id: 1,
    user_id: 1
  },
    {
    name: "Can Ros",
    category: "eat",
    sub_category: "Sandwiches · Spanish Carbs",
    description: "Set your teeth into the crunchiest sandwiches ever.",
    address: "Almirall Aixada 7",
    neighborhood: "Gràcia",
    phone_number: "+34 667 23 81 72",
    # remote_photo_url: "https://media.timeout.com/images/100677963/630/472/image.jpg",
    city_id: 1,
    user_id: 1
  },
    {
    name: "NAP Antic",
    category: "eat",
    sub_category: "Pizza · Real Deal",
    description: "Neapolitan dough like it should be.",
    address: "Avinguda de Francesc Cambó 30",
    neighborhood: "Ciutat Vella",
    phone_number: "+34 686 19 26 90",
    website: "https://www.facebook.com/nap.pizzeria/",
    city_id: 1,
    user_id: 1
  },
    {
    name: "Dry Martini",
    category: "drink",
    sub_category: "Cocktails · Shaken & Stirred",
    description: "No guns allowed.",
    address: "Carrer d'Aribau 162",
    neighborhood: "Eixample",
    phone_number: "+34 932 17 50 72",
    website: "http://www.drymartiniorg.com/",
    # remote_photo_url: "",
    city_id: 1,
    user_id: 1
  },
    {
    name: "Boqueria Market",
    category: "shop",
    sub_category: "Market · Veggies & More",
    description: "Nothing like filling your picnic basket at Boqueria.",
    address: "La Rambla 89",
    neighborhood: "Ciutat Vella",
    phone_number: "+34 933 18 25 84",
    website: "http://www.boqueria.info",
    # remote_photo_url: "",
    city_id: 1,
    user_id: 1
  },
  {
    name: "Le Wagon Madrid",
    category: "other",
    sub_category: "Coding Bootcamp · 🚀",
    description: "Change your life, learn to code.",
    address: "Calle de Juan de Mariana 15",
    neighborhood: "Atocha",
    phone_number: "+34 646 85 03 58",
    website: "https://www.lewagon.com/madrid",
    # remote_photo_url: "",
    city_id: 2,
    user_id: 2
  },
  {
    name: "Café Belén",
    category: "drink",
    sub_category: "Mojitos · Minty",
    description: "Square atmosphere and local hangs.",
    address: "Calle de Belén 5",
    neighborhood: "Chueca",
    phone_number: "+34 913 08 27 47",
    website: "http://www.elcafebelen.com/",
    # remote_photo_url: "",
    city_id: 2,
    user_id: 2
  },
    {
    name: "Chocolatería San Ginés",
    category: "eat",
    sub_category: "Porras · Better Donuts",
    description: "Life before keto: porras dunked in chocolate.",
    address: "Pasadizo de San Ginés 5",
    neighborhood: "Sol",
    phone_number: "+34 913 65 65 46",
    website: "https://www.chocolateriasangines.com/",
    # remote_photo_url: "",
    city_id: 2,
    user_id: 2
  },
    {
    name: "Mercado De San Miguel",
    category: "shop",
    sub_category: "Market · Vintage Deal",
    description: "The Boqueria never stood a chance.",
    address: "Plaza de San Miguel 5",
    neighborhood: "Centro",
    phone_number: "+34 915 42 49 36",
    website: "http://www.mercadodesanmiguel.es/",
    # remote_photo_url: "",
    city_id: 2,
    user_id: 2
  }
]

Spot.create!(spot_attributes)
puts "Let\'s have a bite..."
