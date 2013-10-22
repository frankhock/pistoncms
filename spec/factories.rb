FactoryGirl.define do 

  factory :entry, class: Pistoncms::Entry do 
    title "test"

    factory :post, class: Pistoncms::Post do 
      sequence(:title) { |n| "test#{n}" }
    end

    factory :page, class: Pistoncms::Page do 
      sequence(:title) { |n| "test#{n}" }
    end
  end

  factory :admin do 
    sequence(:email) { |n| "frank.hock#{n}@gmail.com" }
    password "password"
    password_confirmation "password"
  end

  factory :menu, class: Pistoncms::Menu do 
    name 'primary'
  end

end