puts "Wiping out civilizations..."
User.destroy_all
City.destroy_all
Category.destroy_all
Spot.destroy_all

# 💥
puts "Adding city builders..."
g = User.create!(email: "g@testing.com", password: "testing", github_handle: "DctrG")
mirha = User.create!(email: "mirha@testing.com", password: "testing", github_handle: "mirhamasala", admin: true)
puts "Builders be building..."

# 💥
puts "Building Spanish Romes in less than a day..."
bali = City.create!(name: "Bali", country: "Indonesia")
barcelona = City.create!(name: "Barcelona", country: "Spain")
madrid = City.create!(name: "Madrid", country: "Spain")
singapore = City.create!(name: "Singapore", country: "Singapore")
puts "Pinned Barcelona & Madrid on the map..."

# 💥
puts "Adding runners to cities..."
g.cities << madrid
mirha.cities << barcelona
mirha.cities << madrid
puts "Cities attached to runners..."

# 💥
puts "Creating categories..."
eat = Category.create!(name: "eat")
drink = Category.create!(name: "drink")
see = Category.create!(name: "see")
shop = Category.create!(name: "shop")
sleep = Category.create!(name: "sleep")
wagon = Category.create!(name: "wagon")
other = Category.create!(name: "other")
puts "All boxed up..."

# 💥
puts "Hunting hotspots..."
# category == category_id, city == city_id, user == user_id
spot_attributes = [
  {
    name: "Le Wagon Barcelona",
    sub_category: "Coding Bootcamp · 🚀",
    description: "Change your life, learn to code.",
    address: "Carrer d'en Grassot 101",
    neighborhood: "Gràcia",
    phone_number: "+34 667 23 81 72",
    website: "https://www.lewagon.com/barcelona",
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
    category: drink,
    city: barcelona,
    owner: mirha,
  },
  {
    name: "Can Ros",
    sub_category: "Sandwiches · Spanish Carbs",
    description: "Set your teeth into the crunchiest sandwiches ever.",
    address: "Carrer de l'Almirall Aixada 7",
    neighborhood: "Gràcia",
    phone_number: "+34 667 23 81 72",
    category: eat,
    city: barcelona,
    owner: mirha,
  },
  {
    name: "NAP Antic",
    sub_category: "Pizza · Real Deal",
    description: "Neapolitan dough like it should be.",
    address: "Av. de Francesc Cambó 30",
    neighborhood: "Ciutat Vella",
    phone_number: "+34 686 19 26 90",
    website: "https://www.facebook.com/nap.pizzeria/",
    category: eat,
    city: barcelona,
    owner: mirha,
  },
  {
    name: "Dry Martini",
    sub_category: "Cocktails · Shaken & Stirred",
    description: "No guns allowed.",
    address: "Carrer d'Aribau 162",
    neighborhood: "Eixample",
    phone_number: "+34 932 17 50 72",
    website: "http://www.drymartiniorg.com/",
    category: drink,
    city: barcelona,
    owner: mirha,
  },
  {
    name: "Mercado de La Boqueria",
    sub_category: "Market · Veggies & More",
    description: "Nothing like filling your picnic basket at Boqueria.",
    address: "La Rambla 91, 08001 Barcelona",
    neighborhood: "Ciutat Vella",
    phone_number: "+34 933 18 25 84",
    website: "http://www.boqueria.info",
    category: shop,
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
    category: eat,
    city: madrid,
    owner: mirha,
  },
  {
    name: "Mercado De San Miguel",
    sub_category: "Market · Vintage Deal",
    description: "The Boqueria never stood a chance.",
    address: "Plaza de San Miguel 5",
    latitude: 40.41537,
    longitude: 3.70899,
    neighborhood: "Centro",
    phone_number: "+34 915 42 49 36",
    website: "http://www.mercadodesanmiguel.es/",
    category: shop,
    city: madrid,
    owner: mirha,
  }
]

Spot.create!(spot_attributes)
puts "Let\'s have a bite..."
