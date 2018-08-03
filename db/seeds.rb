# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

s1 = Screenshot.create()
s2 = Screenshot.create()
s3 = Screenshot.create()
s4 = Screenshot.create()
s5 = Screenshot.create()
s6 = Screenshot.create()
s7 = Screenshot.create()
s8 = Screenshot.create()

u1 = Piece.create(screenshot_id: s1.id, checked: true) # image and text
u2 = Piece.create(screenshot_id: s1.id, checked: true) # ad
u3 = Piece.create(screenshot_id: s1.id, checked: true) # ad
u4 = Piece.create(screenshot_id: s1.id, checked: false)
u5 = Piece.create(screenshot_id: s1.id, checked: false)
u7 = Piece.create(screenshot_id: s1.id, checked: false)
u6 = Piece.create(screenshot_id: s1.id, checked: false)
u8 = Piece.create(screenshot_id: s1.id, checked: false)
u9 = Piece.create(screenshot_id: s1.id, checked: false)
u10 = Piece.create(screenshot_id: s1.id, checked: false)
u11 = Piece.create(screenshot_id: s1.id, checked: false)
u12 = Piece.create(screenshot_id: s2.id, checked: false)
u13 = Piece.create(screenshot_id: s2.id, checked: false)

t1 = Type.create(name: 'Text', color: 'blue-5')
t2 = Type.create(name: 'Image', color: 'green-6')
t3 = Type.create(name: 'Graph', color: 'yellow-5')
t4 = Type.create(name: 'Ad', color: 'red-6')
t5 = Type.create(name: 'Blank', color: 'grey-5')

PieceType.create([
  {piece: u1, type: t1},
  {piece: u1, type: t2},
  {piece: u2, type: t3},
  {piece: u3, type: t3}
])