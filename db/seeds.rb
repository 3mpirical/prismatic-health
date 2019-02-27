


Institution.destroy_all()
Patient.destroy_all()


for i in (1..4)
    institution = Institution.create(
        name: Faker::Company.name(),
        address: Faker::Address.street_address()
    )

    patient = Patient.create(
        email: "fake@mail.com",
        password: "password",
        avatar: Faker::Avatar.image(),
        first_name: Faker::Name.first_name(),
        last_name: Faker::Name.last_name()
    )

    patient = Patient.create(
        email: Faker::Internet.email(),
        password: "password",
        avatar: Faker::Avatar.image(),
        first_name: Faker::Name.first_name(),
        last_name: Faker::Name.last_name()
    ) if(!patient.id)

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
            app = Appointment.create(
                name: "General Checkup",
                date: Faker::Date.forward(100),
                time: "12:00 PM",
                institution_id: institution.id,
                doctor_id: doctor.id,
                patient_id: patient.id,
            )
            Service.create(
                name: Faker::Company.bs(),
                institution_id: institution.id,
                doctor_id: doctor.id
            )
        end
    end
end

# Institution.all().each() {|int|
#     puts int.name
#     puts int.doctors
#     puts int.services
# }

puts Doctor.all()

puts Appointment.find_by_sql("SELECT * FROM  appointments");


