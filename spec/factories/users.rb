FactoryBot.define do
  factory :user do
    email { 'user@gmail.com' }
    password { '123456' }
    username { 'Jake' }
  end
end
