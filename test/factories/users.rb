FactoryBot.define do
  factory :user do
    name { 'username' }
    email { 'test@user' }
    password { '123456' }
  end
end
