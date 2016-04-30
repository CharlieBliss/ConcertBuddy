# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


User.create({name: 'Thomas', email: 'Thomas@Yancey.web', password_digest: 'assword', about: "I am a cool guy who loves heading out to concerts, laying down on the floor, and crying my eyes out" })

Event.create({title: "Cool Concert", location: "The Floor"})

Group.create({event_id: 1, name: "Please hang out with me", size: 3, owner_id: 1})

Tag.create({title: "cool"})

