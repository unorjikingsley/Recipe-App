FactoryBot.define do
  factory :recipe do
    name { 'Example Recipe' }
    public { true }
    created_at { Time.current }
    user { nil }
  end
end
