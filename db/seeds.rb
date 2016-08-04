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
cats.animals.create(name: "Snow Leopard", description: "A rare large cat that has pale gray fur patterned with dark blotches and rings, living in the Altai mountains, Hindu Kush, and Himalayas.", image_path: "https://s-media-cache-ak0.pinimg.com/564x/8d/0b/d6/8d0bd68319a4ab656ea85fb3d1a49e6f.jpg", price: 3000)
cats.animals.create(name: "Black Panther", description: "A black panther is the melanistic color variant of any Panthera species. Black panthers in Asia and Africa are leopards (Panthera pardus) and black panthers in the Americas are black jaguars (Panthera onca).", image_path: "http://66.media.tumblr.com/237eb35a8717c80f5eca0517e8f7b007/tumblr_myg7fvCLaw1qb4wy7o1_500.jpg", price: 17000)

primates.animals.create(name: "Chimpanzee", description: "Chimpanzees (sometimes called chimps) are one of two exclusively African species of great ape that are currently extant.", image_path: "https://s-media-cache-ak0.pinimg.com/564x/d6/bd/e7/d6bde7e51595b308dc4b859d7736f20f.jpg", price: 7000)
primates.animals.create(name: "Snub-nosed Monkey", description: "Snub-nosed monkeys get their name from the short stump of a nose on their round faces, with nostrils arranged forward.", image_path: "https://s-media-cache-ak0.pinimg.com/236x/fb/5b/d3/fb5bd3f06a87ffc84aaea41de703f459.jpg", price: 2500)
primates.animals.create(name: "Pygmy Marmoset", description: "The pygmy marmoset (Cebuella pygmaea) is a small New World monkey native to rainforests of the western Amazon Basin in South America", image_path: "http://www.factzoo.com/sites/all/img/blog/monkeys/full-grown-pygmy-marmoset.jpg", price: 2000)
primates.animals.create(name: "Red-shanked Douc Langur", description: "This festively dressed monkey is often called the costumed ape for its extravagant appearance.", image_path: "https://s-media-cache-ak0.pinimg.com/564x/6c/24/95/6c249515fcefde4225f90d598fabe9c3.jpg", price: 5000)
primates.animals.create(name: "Mandrill", description: "A large West African baboon with a brightly colored red and blue face, the male having a blue rump.", image_path: "https://s-media-cache-ak0.pinimg.com/564x/71/cb/38/71cb38c667a7ebb298bd4a15db314080.jpg", price: 8000)
primates.animals.create(name: "Probosic Monkey", description: "A leaf-eating monkey native to the forests of Borneo, the male of which is twice the weight of the female and has a large pendulous nose.", image_path: "http://www.cruzine.com/wp-content/uploads/2011/05/055-wild-animals.jpg", price: 4500)
primates.animals.create(name: "Wolf's Mona", description: "The Wolf's mona monkey, also called Wolf's guenon, is a colourful Old World monkey in the family Cercopithecidae. It is found in central Africa, primarily between the Democratic Republic of the Congo and Uganda.", image_path: "http://i.telegraph.co.uk/multimedia/archive/03444/animals-monkey_3444818k.jpg", price: 10000)
primates.animals.create(name: "Golden Lion Tamarin", description: "Golden Lion Tamarin (Leontopithecus rosalia) is native to the Atlantic coastal forests of Brazil, it is Endangered, due to habitat loss, deforestation, and habitat fragmentation.", image_path: "https://s-media-cache-ak0.pinimg.com/564x/9a/21/f4/9a21f45579c03c99a0f9377ab439e869.jpg", price: 3200)

reptiles.animals.create(name: "Alligator", description: "A large semiaquatic reptile similar to a crocodile but with a broader and shorter head, native to the Americas and China", image_path: "https://s-media-cache-ak0.pinimg.com/474x/cc/e5/20/cce52057693a95aea21020cf7d71de88.jpg", price: 3500)
reptiles.animals.create(name: "Komodo Dragon", description: "A heavily built monitor lizard that captures large prey such as pigs by ambush. Occurring only on Komodo and neighboring Indonesian islands, it is the largest living lizard.", image_path: "https://s-media-cache-ak0.pinimg.com/564x/97/ff/39/97ff393a1324411ee4e2c95acc25c61b.jpg", price: 3200)
reptiles.animals.create(name: "Chinese Water Dragon", description: "Chinese water dragon (Physignathus cocincinus) is a species of agamid lizard native to China and mainland Southeast Asia. It is also known as Asian water dragon, Thai water dragon, and green water dragon.", image_path: "https://s-media-cache-ak0.pinimg.com/originals/d7/cc/1b/d7cc1b01e80f0d698a12b90af7d2af11.jpg", price: 900)
reptiles.animals.create(name: "Dodo Bird", status: 1, description: "They are dodos", image_path: "http://3.bp.blogspot.com/-X4eldaXoJbA/TWB2BT7yDaI/AAAAAAAAA5Q/roD99gExE74/s1600/dodo.jpg", price: 1000000)
reptiles.animals.create(name: "Brown Basilisk", description: "Brown Basilisk or Striped Basilisk is one species of basilisk lizard. They are native to Mexico, Central America and adjacent northwestern Colombia, but have been introduced into the U.S. state of Florida as a feral species.", image_path: "https://scontent.xx.fbcdn.net/v/t1.0-9/1897806_754290287916624_1579598898_n.jpg?oh=5d29692d9b34b9f9f67752f60b6df56a&oe=581F1ADA", price: 3000)
reptiles.animals.create(name: "Solomon Islands Skink", description: "Solomon Islands skink (Corucia zebrata zebrata) - the largest of all living skinks. These lizards are herbivorous, nocturnal and arboreal", image_path: "https://s-media-cache-ak0.pinimg.com/originals/71/7c/64/717c64162ffc456dbe519691f601641f.jpg", price: 4400)
reptiles.animals.create(name: "Sea Turtle", description: "A slow-moving reptile, enclosed in a scaly or leathery domed shell into which it can retract its head and thick legs.", image_path: "https://s-media-cache-ak0.pinimg.com/564x/3f/37/d3/3f37d320438b3e0260a969dff6a95791.jpg", price: 6000)
reptiles.animals.create(name: "Smooth Green Snake", description: "The smooth greensnake is a nonvenomous North American colubrid. It is also referred to as the grass snake. It is a slender, small medium snake that measures 36–51 cm as an adult.", image_path: "https://s-media-cache-ak0.pinimg.com/564x/a3/20/bb/a320bb0b994f9ed019e19329b1fd5437.jpg", price: 8000)
reptiles.animals.create(name: "Carpet Chameleon", description: "Furcifer lateralis, also known as the carpet chameleon or the white-lined chameleon, is a species of chameleon that is endemic to Madagascar. It was described in 1831 by John Edward Gray.", image_path: "https://s-media-cache-ak0.pinimg.com/564x/45/4f/6e/454f6e65f64e3610aab24054239b74be.jpg", price: 7400)
reptiles.animals.create(name: "Blue Iguana", description: "The blue iguana, also known as the Grand Cayman iguana, Grand Cayman blue iguana or Cayman Island blue iguana, is an endangered species of lizard endemic to the island of Grand Cayman.", image_path: "https://s-media-cache-ak0.pinimg.com/564x/9f/81/1a/9f811a7e302b78ee6e9e31546c360b12.jpg", price: 6060)

andrew = User.create(username: "andrew", password: "password")
admin = User.create(role: 1, username: "admin", password: "admin")

5.times do
  andrew.orders.create
end
