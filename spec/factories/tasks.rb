FactoryGirl.define do
  factory :task do
    user nil
    description "MyText"
    deadline "2017-09-29"
    completed false
  end
end
