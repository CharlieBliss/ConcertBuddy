# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Songkick::OAuth2::Model::Schema.migrate

Group.create(event_id: 1, name: "Party Down", size: 2, owner_id: 1)
Tag.create(title: "Hates loud noise")
Tag.create(title: "Scared of Animals")
Tag.create(title: "Bright Orange Skin")
Tag.create(title: "Frightening Visage")
Tag.create({title: "cool"})

