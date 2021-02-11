FactoryBot.define do
  factory :hero do
    name  { Faker::Superhero.name }
    token { Faker::Alphanumeric.alpha(number: 10) }

    factory :invalid_hero do
      name { nil }
    end
  end
end
