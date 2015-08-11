class Contato < ActiveRecord::Base

  validates_presence_of :name, :last_name, :email, :phone
end
