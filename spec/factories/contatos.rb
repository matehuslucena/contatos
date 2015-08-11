FactoryGirl.define do
  factory :contato do |f|
    f.name 'name'
    f.last_name 'last_name'
    f.email 'm@m.com.br'
    f.company 'company'
    f.job_title 'job title'
    f.phone '123456'
    f.website 'www.name.com'
  end

  factory :invalid_contato, parent: :contato do |f|
    f.name nil
  end
end