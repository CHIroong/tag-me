# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

s1 = Screenshot.create(isFinished: false, assignee: "Jaemin", image: "https://user-images.githubusercontent.com/17509651/43684963-14b98a6c-98e5-11e8-8a31-91b1554d34bd.png")
s2 = Screenshot.create(isFinished: false, assignee: "Jaeyoon", image: "https://user-images.githubusercontent.com/17509651/43684963-14b98a6c-98e5-11e8-8a31-91b1554d34bd.png")
s3 = Screenshot.create(isFinished: false, assignee: "Kiroong", image: "https://user-images.githubusercontent.com/17509651/43684963-14b98a6c-98e5-11e8-8a31-91b1554d34bd.png")
s4 = Screenshot.create(isFinished: false, assignee: "Kiroong", image: "https://user-images.githubusercontent.com/17509651/43684963-14b98a6c-98e5-11e8-8a31-91b1554d34bd.png")
s5 = Screenshot.create(isFinished: false, assignee: "Jaeyoon", image: "https://user-images.githubusercontent.com/17509651/43684963-14b98a6c-98e5-11e8-8a31-91b1554d34bd.png")
s6 = Screenshot.create(isFinished: false, assignee: "Jaemin", image: "https://user-images.githubusercontent.com/17509651/43684963-14b98a6c-98e5-11e8-8a31-91b1554d34bd.png")
s7 = Screenshot.create(isFinished: false, assignee: "Jaemin", image: "https://user-images.githubusercontent.com/17509651/43684963-14b98a6c-98e5-11e8-8a31-91b1554d34bd.png")
s8 = Screenshot.create(isFinished: false, assignee: "Jaemin", image: "https://user-images.githubusercontent.com/17509651/43684963-14b98a6c-98e5-11e8-8a31-91b1554d34bd.png")

t1 = Type.create(name: 'Text', color: 'blue-5')
t2 = Type.create(name: 'Image', color: 'green-6')
t3 = Type.create(name: 'Graph', color: 'yellow-5')
t4 = Type.create(name: 'Ad', color: 'red-6')
t5 = Type.create(name: 'BadAd', color: 'grey-5')

u1 = Piece.create(screenshot_id: s1.id, type_id: t1.id, left: 30, top: 20, width: 65, height: 40) # image
u2 = Piece.create(screenshot_id: s1.id, type_id: t2.id, left: 230, top: 120, width: 65, height: 40) # ad
u3 = Piece.create(screenshot_id: s1.id, type_id: t3.id, left: 430, top: 220, width: 65, height: 40)
u4 = Piece.create(screenshot_id: s1.id, type_id: t4.id, left: 630, top: 320, width: 65, height: 40)
u5 = Piece.create(screenshot_id: s1.id, type_id: t5.id, left: 830, top: 420, width: 65, height: 40)