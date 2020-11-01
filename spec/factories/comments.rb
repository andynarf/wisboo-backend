FactoryBot.define do
    factory :comment do
      text { Faker::Lorem.word }
      video_id nil
    end
  end