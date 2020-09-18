include ActionDispatch::TestProcess
FactoryBot.define do
  factory :product do
    trait :with_image do
    
      images { [ Rack::Test::UploadedFile.new(Rails.root.join( "spec/fixtures/test-image.png"), '"spec/fixtures/test-image.png"')  ]}
    end
    name {Faker::Name.initials(number: 2)}
    price { 3000 }
    description{ "これはテストです。"}
    brand { 'SONY' }
    ship_day { 1 }
  
  end
end


