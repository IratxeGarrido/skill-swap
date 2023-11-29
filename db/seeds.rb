require "open-uri"

# Destroy all Users, Offers, Profiles, Matches and Messages
User.destroy_all
Offer.destroy_all
Profile.destroy_all
Match.destroy_all
Message.destroy_all

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


spiderman = User.create(email: 'peter@skillswap.com', password: '123456')
file = URI.open("https://res.cloudinary.com/dbd4uen7z/image/upload/v1701203113/skill-swap/spiderman.jpg")
spiderman_profile = Profile.new(
  first_name: 'Peter',
  last_name: 'Parker',
  bio: 'I swing through the concrete canyons of New York, a web-slinging hero known as Spider-Man. Bitten by a radioactive spider, I gained super strength, agility, and a sixth sense. Juggling crime-fighting with my job as a photojournalist, I embody responsibility and wit, facing villains with a quip and clad in my iconic red and blue suit.',
  age: 34,
  gender: 'Male',
  address: 'Hauptstraße 13, Berlin',
  user_id: spiderman.id
)

spiderman_profile.photo.attach(io: file, filename: "spiderman.png", content_type: "image/png")
spiderman_profile.save!

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


match = Match.new(status: "pending", initiator_id: iratxe_profile.id)
match.save!
match = Match.create(status: "accepted", initiator_id: jamie_profile.id, creator_id: iratxe_profile.id)
match.save!
match = Match.create(status: "accepted", initiator_id: iratxe_profile.id, creator_id: mustafa_profile.id)
match.save!
match = Match.create(status: "rejected", initiator_id: zoe_profile.id, creator_id: iratxe_profile.id)
match.save!
match = Match.create(status: "rejected", initiator_id: iratxe_profile.id)
match.save!
