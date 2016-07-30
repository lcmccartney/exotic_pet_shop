Animal.destroy_all
Category.destroy_all
Order.destroy_all
User.destroy_all

cats = Category.create(name: "Big Cats")
reptiles = Category.create(name: "Reptiles")

cats.animals.create(name: "Tiger", description: "Night predator", image_path: "http://wildaid.org/sites/default/files/photos/iStock_000008484745Large%20%20tiger%20-%20bengal.jpg", price: 4000)
cats.animals.create(name: "Lion", description: "Lazy predator", image_path: "http://www.timeslive.co.za/incoming/2015/10/31/lion-thinkstock.jpg/ALTERNATES/crop_630x400/lion+thinkstock.JPG", price: 3000)

reptiles.animals.create(name: "Alligator", description: "Water predator", image_path: "http://img2.timeinc.net/people/i/2015/news/150713/alligator-1024.jpg", price: 3500)
reptiles.animals.create(name: "Komodo Dragon", description: "Indonesian predator", image_path: "http://animals.sandiegozoo.org/sites/default/files/juicebox_slides/island_indonesia_komodo_03.jpg", price: 3200)
reptiles.animals.create(name: "Dodo Bird", status: 1, description: "They are dodos", image_path: "http://3.bp.blogspot.com/-X4eldaXoJbA/TWB2BT7yDaI/AAAAAAAAA5Q/roD99gExE74/s1600/dodo.jpg", price: 1000000)


andrew = User.create(username: "andrew", password: "password")
andrew.orders.create
andrew.orders.create
andrew.orders.create
andrew.orders.create
andrew.orders.create
