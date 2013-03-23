Plane.delete_all
Flight.delete_all
User.delete_all
Seat.delete_all

u1 = User.create(name: 'Bob', email: 'bob@gmail.com', password: 'a', password_confirmation: 'a')
u2 = User.create(name: 'Admin', email: 'admin@gmail.com', password: 'a', password_confirmation: 'a', is_admin: true)

s1 = Seat.create(row: 4, col: 20)

f1 = Flight.create(name: '1234', origin: 'JFK', dest: 'LAX', dep_time: '2013-04-20')

p1 = Plane.create(name: 'Boeing 747', rows: 6, cols: 20)


f1.create_seats(p1.id)


u1.seats << s1

p1.flights << f1