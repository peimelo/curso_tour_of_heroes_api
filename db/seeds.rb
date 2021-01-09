Hero.delete_all

5.times do
  Hero.create name: Faker::Superhero.name
end
