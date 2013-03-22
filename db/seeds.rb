Plane.delete_all
Flight.delete_all
User.delete_all
Seat.delete_all

u1 = User.create(name: 'Bob', email: 'bob@gmail.com', password: 'a', password_confirmation: 'a')
u2 = User.create(name: 'Admin', email: 'admin@gmail.com', password: 'a', password_confirmation: 'a', is_admin: true)