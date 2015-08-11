require 'rails_helper'

describe LeadsController, :type => :controller do
  describe 'GET #index' do
    it 'populate an array of leads' do
      lead = create(:lead)
      get :index
      expect(assigns(:leads)).to eq([lead])
    end

    it 'renders the index template' do
      get :index
      expect(response).to render_template(:index)
    end
  end
end