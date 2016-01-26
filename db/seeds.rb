# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Menu.delete_all
#....
Menu.create(
  title: 'Thiết bị tin học',
  level: 1,
  description: ''
)
Menu.create(
  title: 'Thiết bị văn phòng',
  level: 1,
  description: ''
)
Menu.create(
  title: 'Thiết bị hệ thống mạng',
  level: 1,
  description: ''
)
Menu.create(
  title: 'Thiết bị viễn thông',
  level: 1,
  description: ''
)
Menu.create(
  title: 'An ninh kiểm soát',
  level: 1,
  description: ''
)
#....