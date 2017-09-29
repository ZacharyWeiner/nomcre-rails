FactoryGirl.define do
  factory :proposal do
    title "MyString"
    content "MyText"
    deadline "2017-09-29"
    price 1
    accepted false
    company nil
    proposal_type "MyString"
    completed false
    completed_on "2017-09-29"
    paid false
    charge_id "MyString"
    bts ""
    focus_points ""
    time_of_day "MyString"
    location "MyString"
    background "MyString"
  end
end
