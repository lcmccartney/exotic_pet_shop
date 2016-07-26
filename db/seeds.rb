Category.destroy_all
Animal.destroy_all

cats = Category.create(name: "Big Cats")
reptiles = Category.create(name: "Reptiles")

# Category.all.each do |category|
# category.update_attribute(:slug, category.name.parameterize)
# end

cats.animals.create(name: "Tiger", description: "Night predator", image_path: "http://wildaid.org/sites/default/files/photos/iStock_000008484745Large%20%20tiger%20-%20bengal.jpg", price: 4000)
cats.animals.create(name: "Lion", description: "Lazy predator", image_path: "http://www.timeslive.co.za/incoming/2015/10/31/lion-thinkstock.jpg/ALTERNATES/crop_630x400/lion+thinkstock.JPG", price: 3000)

reptiles.animals.create(name: "Alligator", description: "Water predator", image_path: "http://img2.timeinc.net/people/i/2015/news/150713/alligator-1024.jpg", price: 3500)
reptiles.animals.create(name: "Komodo Dragon", description: "Indonesian predator", image_path: "http://animals.sandiegozoo.org/sites/default/files/juicebox_slides/island_indonesia_komodo_03.jpg", price: 3200)
