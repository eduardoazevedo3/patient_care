# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

cancers = [
  'Cancer de Próstata',
  'Cancer de Mama',
  'Cancer de Intestino',
  'Cancer de Reto',
  'Cancer de Fígado',
  'Cancer de Pele'
]

journey_steps = [
  'Suspeita',
  'Diagnóstico',
  'Pré-tratamento',
  'Tratamento ativo',
  'Seguimento',
  'Recidiva',
  'Alta',
  'Progressão',
  'Cuidados paliativos',
  'Suspensão de Tratamento'
]

patients = [].tap do |patient|
  1000.times do
    patient << {
      full_name: FFaker::Name.unique.name,
      birthdate: FFaker::Time.between(Date.today - 90.years, Date.today - 18.years).to_date,
      cancer: cancers.sample,
      journey_step: journey_steps.sample,
      last_active_at: FFaker::Time.between(Date.today - 90.days, Date.today).to_datetime
    }
  end
end

Patient.create! patients
