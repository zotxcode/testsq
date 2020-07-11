# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Role.create name: :admin
Role.create name: :doctor
Role.create name: :patient

hospital1 = Hospital.create({ name: 'RS. TYPE A', address: 'Jl. Street One', city: 'Jakarta', phone: '123456789', email: 'typea@rs.xyz' })
hospital2 = Hospital.create({ name: 'RS. TYPE B', address: 'Jl. Street Two', city: 'Jakarta', phone: '123456790', email: 'typeb@rs.xyz' })
hospital3 = Hospital.create({ name: 'RS. TYPE C', address: 'Jl. Street Three', city: 'Jakarta', phone: '123456791', email: 'typec@rs.xyz' })

# generate doctors
doctor1 = User.new({ email: 'fania@doctor.xyz', password: '12345678' })
doctor1.build_doctor({ name: 'Dr. Fania Hung', specialize: 'Dermatologists, Family Physicians' })
doctor1.roles.build({ name: :doctor })
doctor1.save

doctor2 = User.new({ email: 'malachi@doctor.xyz', password: '12345678' })
doctor2.build_doctor({ name: 'Dr. Malachi Haro', specialize: 'Hematologists' })
doctor2.roles.build({ name: :doctor })
doctor2.save

doctor3 = User.new({ email: 'jonathan.lumbanpea@doctor.xyz', password: '12345678' })
doctor3.build_doctor({ name: 'Dr. Jonathan Lumbanpea', specialize: 'Infectious Disease Specialists' })
doctor3.roles.build({ name: :doctor })
doctor3.save

doctor4 = User.new({ email: 'tirto@doctor.xyz', password: '12345678' })
doctor4.build_doctor({ name: 'Dr. Tirto', specialize: 'Neurologists' })
doctor4.roles.build({ name: :doctor })
doctor4.save

doctor5 = User.new({ email: 'adi@doctor.xyz', password: '12345678' })
doctor5.build_doctor({ name: 'Dr. Adi', specialize: 'Plastic Surgeons' })
doctor5.roles.build({ name: :doctor })
doctor5.save

doctor6 = User.new({ email: 'vera@doctor.xyz', password: '12345678' })
doctor6.build_doctor({ name: 'Dr. Vera Bethari Salim', specialize: 'Urologists' })
doctor6.roles.build({ name: :doctor })
doctor6.save
# end generate doctors

# generate patients
patient1 = User.new({ email: 'talitha.simandalahi@patient.xyz', password: '12345678' })
patient1.build_patient({ name: 'Talitha Simandalahi', dob: '13/02/1990', gender: 'female', phone: '1234567890' })
patient1.roles.build({ name: :patient })
patient1.save

patient2 = User.new({ email: 'js@patient.xyz', password: '12345678' })
patient2.build_patient({ name: 'Joanna Samusra', dob: '23/09/1999', gender: 'female', phone: '1234567891' })
patient2.roles.build({ name: :patient })
patient2.save

patient3 = User.new({ email: 'khoosasimeirong@patient.xyz', password: '12345678' })
patient3.build_patient({ name: 'Khoosasi Meirong', dob: '06/11/1988', gender: 'male', phone: '1234567892' })
patient3.roles.build({ name: :patient })
patient3.save

patient4 = User.new({ email: 'jayawan@patient.xyz', password: '12345678' })
patient4.build_patient({ name: 'Jayawan Ying', dob: '22/06/2006', gender: 'male', phone: '1234567893' })
patient4.roles.build({ name: :patient })
patient4.save

patient5 = User.new({ email: 'mea@patient.xyz', password: '12345678' })
patient5.build_patient({ name: 'Mega Eko Atmadja', dob: '05/01/1970', gender: 'male', phone: '1234567894' })
patient5.roles.build({ name: :patient })
patient5.save
# end generate patients

# generate schedules
schedule1 = hospital1.schedules.build({ doctor: doctor1.doctor, start_at: '13/07/2020 09:00', end_at: '13/07/2020 13:00', max_patient: 10 })
schedule1.save
schedule2 = hospital1.schedules.build({ doctor: doctor2.doctor, start_at: '13/07/2020 19:00', end_at: '13/07/2020 22:00', max_patient: 10 })
schedule2.save

schedule3 = hospital2.schedules.build({ doctor: doctor3.doctor, start_at: '13/07/2020 13:00', end_at: '13/07/2020 17:00', max_patient: 10 })
schedule3.save
schedule4 = hospital2.schedules.build({ doctor: doctor4.doctor, start_at: '13/07/2020 19:00', end_at: '13/07/2020 22:00', max_patient: 10 })
schedule4.save

schedule5 = hospital3.schedules.build({ doctor: doctor5.doctor, start_at: '13/07/2020 13:00', end_at: '13/07/2020 17:00', max_patient: 10 })
schedule5.save
schedule6 = hospital3.schedules.build({ doctor: doctor6.doctor, start_at: '13/07/2020 17:00', end_at: '13/07/2020 22:00', max_patient: 10 })
schedule6.save

# end generate schedules

# generate appointment
patient1.patient.appointments.build({ schedule: Schedule.first, book_at: '13/07/2020 09:30' })
patient1.patient.save
patient2.patient.appointments.build({ schedule: Schedule.first, book_at: '13/07/2020 09:30' })
patient2.patient.save
patient3.patient.appointments.build({ schedule: Schedule.first, book_at: '13/07/2020 09:30' })
patient3.patient.save
patient4.patient.appointments.build({ schedule: Schedule.first, book_at: '13/07/2020 09:30' })
patient4.patient.save
patient5.patient.appointments.build({ schedule: Schedule.first, book_at: '13/07/2020 09:30' })
patient5.patient.save

# end generate appointment
