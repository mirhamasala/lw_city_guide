puts "Wiping out the city..."
City.destroy_all
Spot.destroy_all

puts "Building Romes in less than a day..."
city_attributes = [
  {
    name: "Barcelona",
    country: "Spain",
    photo_url: "https://images.unsplash.com/photo-1507619579562-f2e10da1ec86"
  },
  {
    name: "Canggu",
    country: "Indonesia",
    photo_url: "https://images.unsplash.com/photo-1518982380512-5a3c6d7118c4"
  }
]

City.create!(city_attributes)
puts "Put Barcelona & Canggu on the map..."

puts "Hunting hotspots..."
spot_attributes = [
  {
    name: "Le Wagon",
    category: "other",
    sub_category: "Coding Bootcamp · 🚀",
    description: "Change your life, learn to code.",
    address: "Carrer d'en Grassot 101",
    neighborhood: "Gràcia",
    phone_number: "+34 667 23 81 72",
    website: "https://www.lewagon.com/barcelona",
    photo_url: "https://secure.meetupstatic.com/photos/theme_body/5/a/2/c/full_7163084.jpeg",
    city_id: 1
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
    photo_url: "https://i.pinimg.com/originals/e8/d9/90/e8d990dbcfc32cf5563b7b006c3e0aa0.jpg",
    city_id: 1
  },
    {
    name: "Can Ros",
    category: "eat",
    sub_category: "Sandwiches · Spanish Carbs",
    description: "Set your teeth into the crunchiest sandwiches ever.",
    address: "Carrer de Luis Antúnez 18",
    neighborhood: "Gràcia",
    phone_number: "+34 667 23 81 72",
    website: "www.slowmov.com",
    photo_url: "https://media.timeout.com/images/100677963/630/472/image.jpg",
    city_id: 1
  }
]

Spot.create!(spot_attributes)
puts "Let\'s have a bite..."
