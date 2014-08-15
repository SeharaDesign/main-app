# Initial products for Sehara

hera = Product.create!(
  name: "Hera",
  description: "These uniquely stunning double tiered crowns are accented with Swarovski crystals, oval pearls, handcrafted calla lilies, and are joined with your choice of white ivory double faced satin ribboning and rhinestone accented bows.",
  price: 300,
  image_count: 20,
  showcase_image: "https://s3-us-west-2.amazonaws.com/sehara/hera/hera14.jpg"
)

selene = Product.create!(
  name: "Selene",
  description: "These shimmering gold crowns are embellished with hand wired pearls, Swarovski crystals, mercury glass beads, hand crafted calla lilies, and joined with your choice of white or ivory double faced satin ribboning and pearl accented bows.",
  price: 285,
  image_count: 27,
  showcase_image: "https://s3-us-west-2.amazonaws.com/sehara/selene/selene11.jpg"
)

rhea = Product.create!(
  name: "Rhea",
  description: "There is a traditional elegance to these pearled crowns accented with Swarovski crystals, rhinestone Edelweiss flowers, and joined with your choice of white or ivory double faced satin ribboning and rhinestone accented bows.",
  price: 235,
  image_count: 22,
  showcase_image: "https://s3-us-west-2.amazonaws.com/sehara/rhea/rhea10.jpg"
)

21.times do |i|
  Image.create!(
    source: "https://s3-us-west-2.amazonaws.com/sehara/hera/hera#{i + 1}.jpg",
    product_id: hera.id
  )
end

28.times do |i|
  Image.create!(
    source: "https://s3-us-west-2.amazonaws.com/sehara/selene/selene#{i + 1}.jpg",
    product_id: selene.id
  )
end

22.times do |i|
  Image.create!(
    source: "https://s3-us-west-2.amazonaws.com/sehara/rhea/rhea#{i + 1}.jpg",
    product_id: rhea.id
  )
end


