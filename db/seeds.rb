# Initial products for Sehara

hera = Product.create!(
  name: "Hera",
  description: "This uniquely stunning double-tiered Rhinestone crown is accented with Swarvoski crystals, Oval pearls, and Calla Lillies and is hand wired with your choice of white or ivory double-faced Satin ribboning.",
  price: 300,
  image_count: 21
)

selene = Product.create!(
  name: "Selene",
  description: "These shimmering gold crowns are embellished with hand-wired pearls, Swarvoski crystals, mercury glass beads, handcrafted calla lillies, and joined together with your choice of white or ivory double-faced satin ribboning and pearl accented bows.",
  price: 285,
  image_count: 28
)

rhea = Product.create!(
  name: "Rhea",
  description: "There is a traditional elegance to this crown of two-pearl stamen with accents of Swarovski crystal and Rhinestone Edelweiss flowers delicately wired with Bicones and a white double-faced satin ribboning.",
  price: 235,
  image_count: 22
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


