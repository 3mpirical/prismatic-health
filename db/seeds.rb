


Institution.destroy_all()
Patient.destroy_all()


for i in (1..5)
    institution = Institution.create(
        name: Faker::Company.name(),
        address: Faker::Address.street_address()
    )

    for j in (1..4)
        doctor = Doctor.create(
            email: "fake@mail.com",
            password: "password",
            avatar: Faker::Avatar.image(),
            first_name: Faker::Name.first_name(),
            last_name: Faker::Name.last_name(),
            institution_id: institution.id
        )

        doctor = Doctor.create(
            email: Faker::Internet.email(),
            password: "password",
            avatar: Faker::Avatar.image(),
            first_name: Faker::Name.first_name(),
            last_name: Faker::Name.last_name(),
            institution_id: institution.id
        )if(!doctor.id)

        for i in (1..3)
            Service.create(
                name: Faker::Company.bs(),
                institution_id: institution.id,
                doctor_id: doctor.id
            )
        end
    end
end



Patient.create(
    email: "fake@mail.com",
    password: "password",
    avatar: Faker::Avatar.image(),
    first_name: Faker::Name.first_name(),
    last_name: Faker::Name.last_name()
)

for i in (1..10)
    Patient.create(
        email: Faker::Internet.email(),
        password: "password",
        avatar: Faker::Avatar.image(),
        first_name: Faker::Name.first_name(),
        last_name: Faker::Name.last_name()
    )   
end


Institution.all().each() {|inst|
    inst.doctors.each() {|doc|
        Patient.all().each() {|pat|

            selection = Random.rand(3).to_i
            Appointment.create(
                name: ["General Checkup", "Surgical Procedure", "Therapy"][selection],
                date: Faker::Date.forward(100),
                time: "12:00 PM",
                institution_id: inst.id,
                doctor_id: doc.id,
                patient_id: pat.id,
            )
        }
    }
}

puts "Database Seeded"


