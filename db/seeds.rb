# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Categories
[
  "Caps",
  "T-Shirts",
  "Memorabilia"
].each {|category| Category.create!(name: category) }

# Sizes
[
  { name: "Extra Small", code: "XS"  },
  { name: "Small", code: "S"  },
  { name: "Medium", code: "M"  },
  { name: "Large", code: "L"  },
  { name: "Extra Large", code: "XL"  },
  { name: "One Size Fits-All", code: "OSFA"}
].each {|size| Size.create!(name: size[:name], code: size[:code]) }

# Colors
[
  "Blue",
  "Red",
  "Green",
  "Black",
  "White",
  "Navy",
  "Gray",
  "Yellow"
].each {|color| Color.create!(name: color) }

# Products
[
  { name: "San Diego Padres Cap",
    description: "San Diego Padres Official Merchandise",
    category: Category.find_by(name: "Caps"),
    code: "SANP-C",
    enabled: true,
    featured: true
  },
  { name: "Chicago Cubs Cap",
    description: "Chicago Cubs Official Merchandise",
    category: Category.find_by(name: "Caps"),
    code: "CHIC-C",
    enabled: true,
    featured: true
  },
  { name: "Chicago Bears Cap",
    description: "Chicago Bears Official Merchandise",
    category: Category.find_by(name: "Caps"),
    code: "CHIB-C",
    enabled: true,
    featured: true
  },
  { name: "Generic T-Shirt",
    description: "A generic but high-quality fabric t-shirt",
    category: Category.find_by(name: "T-Shirts"),
    code: "GENT-T",
    enabled: true
  },
  { name: "Los Angeles Lakers Tank",
    description: "Los Angeles Lakers Man Top Tank",
    category: Category.find_by(name: "T-Shirts"),
    code: "LAXL-T",
    enabled: false
  },  
  { name: "Los Angeles Dodgers Card Deck",
    description: "A must have for all fans",
    category: Category.find_by(name: "Memorabilia"),
    code: "LAXD-D",
    enabled: true
  }  

].each {|product| Product.create!(name: product[:name], code: product[:code], description: product[:description], category: product[:category], enabled: product[:enabled], featured: product[:featured]) }

# Product Variants
[
  { product: Product.find_by(code: "GENT-T"), sku: "GEN-T-001", size: Size.find_by(code: "L"), color: Color.find_by(name: "Yellow"), stock: 2, price: 19.99, discount: 0, picture: File.open(Rails.root.join("test/fixtures/t-shirt-yellow.jpg")) },
  { product: Product.find_by(code: "GENT-T"), sku: "GEN-T-002", size: Size.find_by(code: "S"), color: Color.find_by(name: "Blue"), stock: 3, price: 19.99, discount: 20, picture: File.open(Rails.root.join("test/fixtures/t-shirt-blue.jpg")) },
  { product: Product.find_by(code: "GENT-T"), sku: "GEN-T-003", size: Size.find_by(code: "S"), color: Color.find_by(name: "Yellow"), stock: 1, price: 19.99, discount: 0, picture: File.open(Rails.root.join("test/fixtures/t-shirt-yellow.jpg")) },
  { product: Product.find_by(code: "CHIC-C"), sku: "CHIC-C-001", size: Size.find_by(code: "OSFA"), stock: 5, price: 29.99, discount: 0, picture: File.open(Rails.root.join("test/fixtures/cap-cubs.jpg")) },
  { product: Product.find_by(code: "SANP-C"), sku: "SANP-C-001", size: Size.find_by(code: "OSFA"), stock: 3, price: 29.99, discount: 0, picture: File.open(Rails.root.join("test/fixtures/cap-padres.jpg")) },
  { product: Product.find_by(code: "CHIB-C"), sku: "CHIB-C-001", size: Size.find_by(code: "OSFA"), stock: 1, price: 29.99, discount: 40, picture: File.open(Rails.root.join("test/fixtures/cap-bears.jpg")) },
  { product: Product.find_by(code: "LAXD-D"), sku: "LAXD-D-001", color: Color.find_by(name: "Blue"), stock: 10, price: 9.99, discount: 0, picture: File.open(Rails.root.join("test/fixtures/deck-dodgers.jpg")) }
].each do |variant| 
  ProductVariant.create!({
    product: variant[:product], 
    sku: variant[:sku], 
    size: variant[:size], 
    color: variant[:color], 
    stock: variant[:stock], 
    discount: variant[:discount], 
    price: variant[:price],
    picture: variant[:picture]
  })
end