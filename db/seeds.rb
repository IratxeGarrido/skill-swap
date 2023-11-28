
# Destroy all Users, Offers, Profiles, Matches and Messages

User.destroy_all
Offer.destroy_all
Profile.destroy_all
Match.destroy_all
Message.destroy_all

iratxe = User.create(email: 'iratxe@skillswap.com', password: '123456')
spiderman = User.create(email: 'peter@gmail.com', password: '123456')

Profile.create(
  id: 2,
  first_name: 'Peter',
  last_name: 'Parker',
  bio: 'I swing through the concrete canyons of New York, a web-slinging hero known as Spider-Man. Bitten by a radioactive spider, I gained super strength, agility, and a sixth sense. Juggling crime-fighting with my job as a photojournalist, I embody responsibility and wit, facing villains with a quip and clad in my iconic red and blue suit.',
  age: 34,
  gender: 'Male',
  address: 'New York',
  user_id: spiderman.id
)

