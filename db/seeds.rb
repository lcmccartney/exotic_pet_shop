Animal.destroy_all
Category.destroy_all
Order.destroy_all
User.destroy_all

cats = Category.create(name: "Big Cats")
reptiles = Category.create(name: "Reptiles")
primates = Category.create(name: "Primates")

cats.animals.create(name: "Tiger", description: "A very large solitary cat with a yellow-brown coat striped with black, native to the forests of Asia but becoming increasingly rare.", image_path: "https://s-media-cache-ak0.pinimg.com/564x/a3/64/ba/a364bab68f56745bc8833771622cc99b.jpg", price: 11000)
cats.animals.create(name: "Lion", description: "The lion (Panthera leo) is one of the big cats in the genus Panthera and a member of the family Felidae.", image_path: "https://s-media-cache-ak0.pinimg.com/474x/8c/4e/40/8c4e405b87cbb4e75defe5509dc02093.jpg", price: 9000)
cats.animals.create(name: "Pallas's Cat", description: "The Pallas's cat (Otocolobus manul), also called the manul, is a small wild cat with a broad but fragmented distribution in the grasslands and montane steppes of Central Asia.", image_path: "https://s-media-cache-ak0.pinimg.com/474x/91/61/9e/91619eac279f60002d8663350aaba5a2.jpg", price: 4000)
cats.animals.create(name: "Lynx", description: "A lynx is any of the four species within the Lynx genus of medium-sized wild cats, which includes the bobcat.", image_path: "https://upload.wikimedia.org/wikipedia/commons/6/68/Lynx_lynx_poing.jpg", price: 3000)
cats.animals.create(name: "Jaguar", description: "The jaguar is a large, heavily built cat that has a yellowish-brown coat with black spots, found mainly in the dense forests of Central and South America.", image_path: "http://66.media.tumblr.com/0b9951823ae6c0d50ed23a47a159d3c5/tumblr_n737vsTuxn1tbf5q6o1_500.jpg", price: 6000)

primates.animals.create(name: "Chimpanzee", description: "Chimpanzees (sometimes called chimps) are one of two exclusively African species of great ape that are currently extant.", image_path: "https://s-media-cache-ak0.pinimg.com/564x/d6/bd/e7/d6bde7e51595b308dc4b859d7736f20f.jpg", price: 7000)
primates.animals.create(name: "Snub-nosed Monkey", description: "Snub-nosed monkeys get their name from the short stump of a nose on their round faces, with nostrils arranged forward.", image_path: "https://s-media-cache-ak0.pinimg.com/564x/67/5f/8d/675f8d9762754d5c7375281443ee517b.jpg", price: 2500)
primates.animals.create(name: "Pygmy Marmoset", description: "The pygmy marmoset (Cebuella pygmaea) is a small New World monkey native to rainforests of the western Amazon Basin in South America", image_path: "http://1.bp.blogspot.com/-Tg8JmFWEvmA/UIQ92L4WZEI/AAAAAAAADac/WT9zvHXO8jY/s1600/pigmy+marmoset.jpg", price: 2000)

reptiles.animals.create(name: "Alligator", description: "A large semiaquatic reptile similar to a crocodile but with a broader and shorter head, native to the Americas and China", image_path: "https://s-media-cache-ak0.pinimg.com/474x/cc/e5/20/cce52057693a95aea21020cf7d71de88.jpg", price: 3500)
reptiles.animals.create(name: "Komodo Dragon", description: "A heavily built monitor lizard that captures large prey such as pigs by ambush. Occurring only on Komodo and neighboring Indonesian islands, it is the largest living lizard.", image_path: "https://s-media-cache-ak0.pinimg.com/564x/97/ff/39/97ff393a1324411ee4e2c95acc25c61b.jpg", price: 3200)
reptiles.animals.create(name: "Chinese Water Dragon", description: "Chinese water dragon (Physignathus cocincinus) is a species of agamid lizard native to China and mainland Southeast Asia. It is also known as Asian water dragon, Thai water dragon, and green water dragon.", image_path: "https://s-media-cache-ak0.pinimg.com/originals/d7/cc/1b/d7cc1b01e80f0d698a12b90af7d2af11.jpg", price: 900)
reptiles.animals.create(name: "Dodo Bird", status: 1, description: "They are dodos", image_path: "http://3.bp.blogspot.com/-X4eldaXoJbA/TWB2BT7yDaI/AAAAAAAAA5Q/roD99gExE74/s1600/dodo.jpg", price: 1000000)

andrew = User.create(username: "andrew", password: "password")
admin = User.create(username: "admin", password: "admin")

5.times do
  andrew.orders.create
end
