require 'rails_helper'

describe ContatosController, :type => :controller do

  describe 'GET #index' do
    it 'populate an array of contatos' do
      contato = create(:contato)
      get :index
      expect(assigns(:contatos)).to eq([contato])
    end

    it 'renders the index template' do
      get :index
      expect(response).to render_template(:index)
    end
  end

  describe 'GET #show' do
    it 'assigns the requested contato to @contato' do
      contato = create(:contato)
      get :show, id: contato
      expect(assigns(:contato)).to eq(contato)
    end

    it 'renders the #show view' do
      contato = create(:contato)
      get :show, id: contato
      expect(response).to render_template :show
    end
  end

  describe 'POST #create' do
    context 'with valid attributes' do
      it 'creates a new contato' do
        expect {
          post :create, contato: attributes_for(:contato)
        }.to change(Contato, :count).by(1)
      end

      it 'redirects to the new contato' do
        post :create, contato: attributes_for(:contato)
        expect(response).to redirect_to Contato.last
      end
    end

    context 'with invalid attributes' do
      it 'does not save the new contato' do
        expect {
          post :create, contato: attributes_for(:invalid_contato)
        }.to_not change(Contato, :count)
      end

      it 're-renders the new method' do
        post :create, contato: attributes_for(:invalid_contato)
        expect(response).to render_template :new
      end
    end
  end

  describe 'PUT #update' do

    before :each do
      @contato = create(:contato, name: 'Test Name', last_name: 'Test last name', email: 'test@test.com.br')
    end

    context 'valid attributes' do
      it 'located the requested @contato' do
        put :update, id: @contato, contato: attributes_for(:contato)
        expect(assigns(:contato)).to eq(@contato)
      end

      it 'changes @contato attributes' do
        put :update, id: @contato, contato: attributes_for(:contato, name: 'New contact', last_name: 'New contact last name')
        @contato.reload
        expect(@contato.name).to eq('New contact')
        expect(@contato.last_name).to eq('New contact last name')
      end

      it 'redirects to the updated contato' do
        put :update, id: @contato, contato: attributes_for(:contato)
        expect(response).to redirect_to contato_path( @contato)
      end
    end

    context 'invalid attributes' do
      it 'locates the requested @contato' do
        put :update, id: @contato, contato: attributes_for(:invalid_contato)
        expect(assigns(:contato)).to eq(@contato)
      end

      it 'does not change @contato attributes' do
        put :update, id: @contato, contato: attributes_for(:contato, name: 'New contact', last_name: nil)
        @contato.reload
        expect(@contato.name).not_to eq('New contact')
        expect(@contato.last_name).to eq('Test last name')
      end

      it 're-renders the edit method' do
        put :update, id: @contato, contato: attributes_for(:invalid_contato)
        expect(response).to render_template :edit
      end
    end
  end

  describe 'DELETE #destroy' do
    before :each do
      @contato = create(:contato)
    end

    it 'deletes the contato' do
      expect{
        delete :destroy, id: @contato
      }.to change(Contato,:count).by(-1)
    end

    it 'redirects to contatos#index' do
      delete :destroy, id: @contato
      expect(response).to redirect_to contatos_url
    end
  end
end