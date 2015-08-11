class LeadsController < ApplicationController

  def index
    @leads = LeadCreate.list_leads
  end

  def new
    contato = Contato.find(params[:contato_id])
    message = LeadCreate.create(contato)
    redirect_to leads_path, :notice => message
  end
end
