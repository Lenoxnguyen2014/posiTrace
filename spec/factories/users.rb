# spec/factories/users.rb

FactoryBot.define do
    factory :user do
        email {Faker::Internet.email}
        password {'0000'}
    end
end