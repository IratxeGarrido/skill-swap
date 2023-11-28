# Destroy all Users, Offers, Profiles, Matches and Messages

User.destroy_all
Offer.destroy_all
Profile.destroy_all
Match.destroy_all
Message.destroy_all

iratxe = User.create(email: "iratxe@skillswap.com", password: "123456")

Profile.create()
