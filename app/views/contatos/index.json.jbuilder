json.array!(@contatos) do |contato|
  json.extract! contato, :id, :name, :last_name, :email, :company, :job_title, :phone, :website
  json.url contato_url(contato, format: :json)
end
