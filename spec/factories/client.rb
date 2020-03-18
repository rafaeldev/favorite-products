# frozen_string_literal: true

FactoryBot.define do
  factory :client do
    email { Faker::Internet.email }
    password { 'password' }
    password_confirmation { 'password' }

    products do
      {
        'price' => 1699.0,
        'image' => 'http://challenge-api.luizalabs.com/images/1bf0f365-fbdd-4e21-9786-da459d78dd1f.jpg',
        'brand' => 'bébé confort',
        'id' => '1bf0f365-fbdd-4e21-9786-da459d78dd1f',
        'title' => 'Cadeira para Auto Iseos Bébé Confort Earth Brown'
      }
    end
  end
end
