


Institution.destroy_all()
Patient.destroy_all()


for i in (1..4)
    institution = Institution.create(
        name: Faker::Company.name(),
        address: Faker::Address.street_address()
    )

    patient = Patient.create(
        email: "fake@mail.com#{i}",
        password: "password",
        avatar: Faker::Avatar.image(),
        first_name: Faker::Name.first_name(),
        last_name: Faker::Name.last_name()
    )

    for i in (1..4)
        doctor = Doctor.create(
            email: "fake@mail.com#{i}",
            password: "password",
            avatar: Faker::Avatar.image(),
            first_name: Faker::Name.first_name(),
            last_name: Faker::Name.last_name(),
            institution_id: institution.id
        )

        app = Appointment.create(
            name: "General Checkup",
            date: Faker::Date.forward(100),
            time: "12:00 PM",
            institution_id: institution.id,
            doctor_id: doctor.id,
            patient_id: patient.id,
        )

        for i in (1..5)
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


