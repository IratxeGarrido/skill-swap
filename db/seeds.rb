require "open-uri"

# Destroy all Users, Offers, Profiles, Matches and Messages
Message.destroy_all
Match.destroy_all
Offer.destroy_all
Profile.destroy_all
User.destroy_all

# template = User.create(email: 'template@skillswap.com', password: '123456')
# file = URI.open("https://res.cloudinary.com/dbd4uen7z/image/upload/v1701203113/skill-swap/template.jpg")
# template_profile = Profile.new(
#   first_name: 'FirstName',
#   last_name: 'LastName',
#   bio: "",
#   age: 31,
#   gender: '',
#   address: '',
#   user_id: template.id
# )
# template_profile.photo.attach(io: file, filename: "template.png", content_type: "image/png")
# template_profile.save!

# Adam - polish, speaking fast
# Emma Rünzel - sexy dashboards
# Pedro - footvolley, ugly css styling
# Joshua - brownie baking
# Olivier Girardot
# Lucas Grüner - dog training
# Elisabeth Messmer
# Emre Ebeturk
# Sebastian Remm
# Karl von der Eltz
# Stella Raab
# Maximilian Eich - jenga master, beer stacking
# Eduardo Roldan Isaac -
# Michelle Rodriguez - dancing
# Rodrigo Hoffmann

# Woodworking
# Photography
# Knitting
# Climbing
# Sawing machine
# Jewllery making

adam = User.create(email: 'adam@skillswap.com', password: '123456')
file = URI.open("https://res.cloudinary.com/dbd4uen7z/image/upload/v1701690159/skill-swap/adam.png")
adam_profile = Profile.new(
  first_name: 'Adam',
  last_name: 'Tomczyk',
  bio: "Creative fullstack web developer based in Berlin. It all started with ms-dos in the 90's. 👾👾👾",
  age: 34,
  gender: 'Male',
  address: 'Hauptstraße 13, Berlin',
  user_id: adam.id
)
adam_profile.photo.attach(io: file, filename: "adam.png", content_type: "image/png")
adam_profile.save!

emma = User.create(email: 'emma@skillswap.com', password: '123456')
file = URI.open("https://res.cloudinary.com/dbd4uen7z/image/upload/v1701203113/skill-swap/emma.jpg")
emma_profile = Profile.new(
  first_name: 'Emma',
  last_name: 'Rünzel',
  bio: "Hey everyone! I'm Emma, and initially, I studied linguistics and literature, but I have been working in full-stack development & communications within languages and beekeeping (don't ask haha) for some time now.",
  age: 23,
  gender: 'Female',
  address: 'Seydelstraße 2, Berlin',
  user_id: emma.id
)
emma_profile.photo.attach(io: file, filename: "emma.png", content_type: "image/png")
emma_profile.save!

pedro = User.create(email: 'pedro@skillswap.com', password: '123456')
file = URI.open("https://res.cloudinary.com/dbd4uen7z/image/upload/v1701696520/skill-swap/pedro.jpg")
pedro_profile = Profile.new(
  first_name: 'Pedro',
  last_name: 'Miranda',
  bio: 'B.S in Economics, Masters in Public Policy. Interests range from data analysis and data science, public administration, public policy , urban resilience, sustainable development, smart cities, and complex systems.',
  age: 32,
  gender: 'Male',
  address: 'Mollstraße 31, Berlin',
  user_id: pedro.id
)
pedro_profile.photo.attach(io: file, filename: "pedro.png", content_type: "image/png")
pedro_profile.save!

max = User.create(email: 'max@skillswap.com', password: '123456')
file = URI.open("https://res.cloudinary.com/dbd4uen7z/image/upload/v1701696696/skill-swap/max.jpg")
max_profile = Profile.new(
  first_name: 'Maximilian',
  last_name: 'Eich',
  bio: 'Italian/German. Born in Milan, live in Berlin since two years now. Used to be a Cook. Currently working as a Set-Designer. Wanted to get myself into a new challenge, possibly expanding my options for the future.',
  age: 27,
  gender: 'Male',
  address: 'Holzmarktstraße 25, Berlin',
  user_id: max.id
)
max_profile.photo.attach(io: file, filename: "max.png", content_type: "image/png")
max_profile.save!

lucas = User.create(email: 'lucas@skillswap.com', password: '123456')
file = URI.open("https://res.cloudinary.com/dbd4uen7z/image/upload/v1701697486/skill-swap/lucas.jpg")
lucas_profile = Profile.new(
  first_name: 'Lucas',
  last_name: 'Grüner',
  bio: "Hi, I'm Lucas. I'm from France and my background's in economics. In the past, I've worked both at an investment bank and at a pastry shop. Now embracing my inner geek as a web developer.",
  age: 31,
  gender: 'Male',
  address: 'Rosenthaler Str. 39, Berlin',
  user_id: lucas.id
)
lucas_profile.photo.attach(io: file, filename: "lucas.png", content_type: "image/png")
lucas_profile.save!


joshua = User.create(email: 'joshua@skillswap.com', password: '123456')
file = URI.open("https://res.cloudinary.com/dbd4uen7z/image/upload/v1701697762/skill-swap/joshua.jpg")
joshua_profile = Profile.new(
  first_name: 'Joshua',
  last_name: 'Smith',
  bio: "I studied Music Business/Songwriting at BIMM Berlin where I graduated with my Bachelor in 2022. Looking for a new challenge I decide to try coding and I loved it. Now hoping to land a job as a Full Stack Developer.",
  age: 24,
  gender: 'Male',
  address: 'Thomasiusstraße 23, Berlin',
  user_id: joshua.id
)
joshua_profile.photo.attach(io: file, filename: "joshua.png", content_type: "image/png")
joshua_profile.save!

michelle = User.create(email: 'michelle@skillswap.com', password: '123456')
file = URI.open("https://res.cloudinary.com/dbd4uen7z/image/upload/v1701697865/skill-swap/michelle.jpg")
michelle_profile = Profile.new(
  first_name: 'Michelle',
  last_name: 'Rodriguez',
  bio: "I am excited to learn to code and my goal is to be able to work remotely and continue to travel.",
  age: 31,
  gender: 'Female',
  address: 'Lützowstraße 73, Berlin',
  user_id: michelle.id
)
michelle_profile.photo.attach(io: file, filename: "michelle.png", content_type: "image/png")
michelle_profile.save!

iratxe = User.create(email: 'iratxe@skillswap.com', password: '123456')
file = URI.open("https://res.cloudinary.com/dbd4uen7z/image/upload/v1701203113/skill-swap/iratxe.jpg")
iratxe_profile = Profile.new(
  first_name: 'Iratxe',
  last_name: 'Garrido',
  bio: "I've been working as a security engineer and penetration tester for the last 7 years, securing systems and breaking into them. I wanna learn how to build things and not just break them.",
  age: 31,
  gender: 'Female',
  address: 'Thiemannstraße 1, Berlin',
  user_id: iratxe.id
)
iratxe_profile.photo.attach(io: file, filename: "iratxe.png", content_type: "image/png")
iratxe_profile.save!

zoe = User.create(email: 'zoe@skillswap.com', password: '123456')
file = URI.open("https://res.cloudinary.com/dbd4uen7z/image/upload/v1701203113/skill-swap/zoe.jpg")
zoe_profile = Profile.new(
  first_name: 'Zoe',
  last_name: 'Mawby Smart',
  bio: "Im from Australia and i have lived in Berlin for 5 years now. I was studying Biochemistry at FU but after taking a year off I decided to discontinue. Now I'm looking for a more creative career change and I am super excited to get into the tech world!  ",
  age: 28,
  gender: 'Female',
  address: 'Ohlauer Str. 38, Berlin',
  user_id: zoe.id
)
zoe_profile.photo.attach(io: file, filename: "zoe.png", content_type: "image/png")
zoe_profile.save!

jamie = User.create(email: 'jamie@skillswap.com', password: '123456')
file = URI.open("https://res.cloudinary.com/dbd4uen7z/image/upload/v1701203113/skill-swap/jamie.jpg")
jamie_profile = Profile.new(
  first_name: 'Jamie',
  last_name: 'Borg',
  bio: "Originally from Sweden but have lived abroad most of my life and and been working in customer service since arriving in Berlin 11 years ago. Super ready for the career change!",
  age: 31,
  gender: 'Female',
  address: 'Revaler Str. 99, Berlin"',
  user_id: jamie.id
)
jamie_profile.photo.attach(io: file, filename: "jamie.png", content_type: "image/png")
jamie_profile.save!

mustafa = User.create(email: 'mustafa@skillswap.com', password: '123456')
file = URI.open("https://res.cloudinary.com/dbd4uen7z/image/upload/v1701203113/skill-swap/mustafa.jpg")
mustafa_profile = Profile.new(
  first_name: 'Mohammad',
  last_name: 'Mustafa Hakimi',
  bio: "I was in charge of sales and bookkeeping in a wholesale drugstore. Now I am learning german, and want to start university at TU Berlin next year. By attending this bootcamp I want to have a job in the tech industry, and be a full-stack web developer.",
  age: 25,
  gender: 'Male',
  address: 'Stresemannstraße 72, Berlin',
  user_id: mustafa.id
)
mustafa_profile.photo.attach(io: file, filename: "mustafa.png", content_type: "image/png")
mustafa_profile.save!

iratxe_profile = Profile.find_by(first_name: "Iratxe")
zoe_profile = Profile.find_by(first_name: "Zoe")
pedro_profile = Profile.find_by(first_name: "Pedro")
lucas_profile = Profile.find_by(first_name: "Lucas")
jamie_profile = Profile.find_by(first_name: "Jamie")
joshua_profile = Profile.find_by(first_name: "Joshua")
emma_profile = Profile.find_by(first_name: "Emma")
mustafa_profile = Profile.find_by(first_name: "Mohammad")

# file = URI.open("https://res.cloudinary.com/dbd4uen7z/image/upload/v1701592191/skill-swap/bouldering-iratxe.jpg")
# offer = Offer.new(description: "I've been bouldering since the pandemic and I would be very happy to show you a couple techniques. Also, I have a crushpad I would like to get rid off since I boulder mostly indoors now.",
# category: "Bouldering",
# profile_id: iratxe_profile.id)
# offer.photo.attach(io: file, filename: "bouldering-iratxe.png", content_type: "image/png")
# offer.save!

# file = URI.open("https://res.cloudinary.com/dbd4uen7z/image/upload/v1701679797/skill-swap/coding-1.jpg")
# offer = Offer.new(description: "I've been coding for a few years and I just finished a webdev coding bootcamp. I can teach you ruby!",
# category: "Coding",
# profile_id: iratxe_profile.id)
# offer.photo.attach(io: file, filename: "coding-1.png", content_type: "image/png")
# offer.save!

# file = URI.open("https://res.cloudinary.com/dbd4uen7z/image/upload/v1701679662/skill-swap/photography-1.jpg")
# offer = Offer.new(description: "I can teach you to take pretty pictures with my very cool analog camera.",
# category: "Photography",
# profile_id: zoe_profile.id)
# offer.photo.attach(io: file, filename: "photography-1.png", content_type: "image/png")
# offer.save!

# file = URI.open("https://res.cloudinary.com/dbd4uen7z/image/upload/v1701679797/skill-swap/painting-1.jpg")
# offer = Offer.new(description: "I love painting with watercolour and have loads of material id be happy to swap!",
# category: "Painting",
# profile_id: zoe_profile.id)
# offer.photo.attach(io: file, filename: "painting-1.png", content_type: "image/png")
# offer.save!

# file = URI.open("https://res.cloudinary.com/dbd4uen7z/image/upload/v1701704321/skill-swap/photography-2.avif")
# offer = Offer.new(description: "I've was into photography some years ago, but not anymore. I have a couple of cameras and a bunch of gear I wanna swap for something cool",
# category: "Photography",
# profile_id: pedro_profile.id)
# offer.photo.attach(io: file, filename: "photography-2.png", content_type: "image/png")
# offer.save!

# file = URI.open("https://res.cloudinary.com/dbd4uen7z/image/upload/v1701704652/skill-swap/3d-printing.jpg")
# offer = Offer.new(description: "I just bought a new 3D printer and I dom't use this one anymore so I'm giving it away.",
# category: "3D Printing",
# profile_id: pedro_profile.id)
# offer.photo.attach(io: file, filename: "3d-printing-1.png", content_type: "image/png")
# offer.save!

# file = URI.open("https://res.cloudinary.com/dbd4uen7z/image/upload/v1701699077/skill-swap/ginny.jpg")
# offer = Offer.new(description: "I'll teach you how to whisper french commands to your dog.",
# category: "Dog training",
# profile_id: lucas_profile.id)
# offer.photo.attach(io: file, filename: "dog-training.png", content_type: "image/png")
# offer.save!

# file = URI.open("https://res.cloudinary.com/dbd4uen7z/image/upload/v1701700773/skill-swap/tatto.jpg")
# offer = Offer.new(description: "I have it all. The machine, the fake skin and the ink. I can teach you how to do tattos.",
# category: "Tattooing",
# profile_id: jamie_profile.id)
# offer.photo.attach(io: file, filename: "tattooing.png", content_type: "image/png")
# offer.save!

# file = URI.open("https://res.cloudinary.com/dbd4uen7z/image/upload/v1701701075/skill-swap/plane.jpg")
# offer = Offer.new(description: "I've been a licensed pilot for a few years and I'll be happy to take you for a ride.",
# category: "Plane flying",
# profile_id: joshua_profile.id)
# offer.photo.attach(io: file, filename: "plane.png", content_type: "image/png")
# offer.save!

# file = URI.open("https://res.cloudinary.com/dbd4uen7z/image/upload/c_crop,g_west,h_800,w_800/skill-swap/blazer.png")
# offer = Offer.new(description: "Are you a fun of dashboards as much as me? I can teach you how to create sexy dashboards in rails!",
# category: "Sexy dashboards",
# profile_id: emma_profile.id)
# offer.photo.attach(io: file, filename: "dashboard.png", content_type: "image/png")
# offer.save!


match = Match.new(status: "pending", initiator_id: jamie_profile.id, creator_id: iratxe_profile.id)
match.save!
match = Match.new(status: "pending", initiator_id: zoe_profile.id, creator_id: iratxe_profile.id)
match.save!
match = Match.new(status: "pending", initiator_id: mustafa_profile.id, creator_id: iratxe_profile.id)
match.save!
match = Match.new(status: "pending", initiator_id: joshua_profile.id, creator_id: iratxe_profile.id)
match.save!
match = Match.new(status: "pending", initiator_id: emma_profile.id, creator_id: iratxe_profile.id)
match.save!
match = Match.new(status: "pending", initiator_id: lucas_profile.id, creator_id: iratxe_profile.id)
match.save!
match = Match.new(status: "pending", initiator_id: pedro_profile.id, creator_id: iratxe_profile.id)
match.save!
# match = Match.create(status: "accepted", initiator_id: jamie_profile.id, creator_id: iratxe_profile.id)
# match.save!
# match = Match.create(status: "accepted", initiator_id: iratxe_profile.id, creator_id: mustafa_profile.id)
# match.save!
# match = Match.create(status: "rejected", initiator_id: zoe_profile.id, creator_id: iratxe_profile.id)
# match.save!
# match = Match.create(status: "rejected", initiator_id: iratxe_profile.id)
# match.save!


# message = Message.new(content: "hi", read_status: true, match_id: 2, sender_id: 2)
# message.save!
