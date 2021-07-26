FactoryBot.define do
  factory :product do
    p_name                   {Faker::Name.initials}
    description                    {Faker::Lorem.sentence}
    category_id             {'2'}
    status_id         {'3'}
    obligation_id  {'2'}
    prefecture_id           {'3'}
    day_id   {'2'}
    price                   {'1000'}  
    association :user

    after(:build) do |product|
      product.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end