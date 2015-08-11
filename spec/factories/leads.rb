FactoryGirl.define do
  factory :lead do |f|
    f.FirstName 'name'
    f.LastName 'last_name'
    f.Email 'm@m.com.br'
    f.Company 'company'
    f.Title 'job title'
    f.Phone '123456'
    f.Website 'www.name.com'
    f.IsConverted  false
    f.IsUnreadByOwner  true
  end

  factory :invalid_lead, parent: :lead do |f|
    f.FirstName nil
  end
end