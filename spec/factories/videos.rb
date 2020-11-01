FactoryBot.define do
    factory :video do
        videoid { Faker::Lorem.word }
        title { Faker::Lorem.word }
        color { Faker::Lorem.word }
    end
  end