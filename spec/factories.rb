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

end