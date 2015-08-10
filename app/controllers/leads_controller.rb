class LeadsController < ApplicationController
  include Databasedotcom::Rails::Controller

  def index
    @leads = Lead.all
  end

  def new
    contato = Contato.find(params[:contato_id])
    user = User.first
    @lead = Lead.new
    @lead.OwnerId = user.Id
    @lead.FirstName = contato.name
    @lead.LastName = contato.last_name
    @lead.Email = contato.email
    @lead.Company = contato.company
    @lead.Title = contato.job_title
    @lead.Phone = contato.phone
    @lead.Website = contato.website
    @lead.IsConverted = false
    @lead.IsUnreadByOwner = true
    if @lead.save
      redirect_to leads_path, :notice => contato.name + ' successfully added'
    end
  end
end
