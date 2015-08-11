class ContatosController < ApplicationController
  before_action :set_contato, only: [:show, :edit, :update, :destroy]

  def index
    @contatos = Contato.all.paginate(:page => params[:page], :per_page => 5)
  end

  def show
  end

  def new
    @contato = Contato.new
  end

  def edit
  end

  def create
    @contato = Contato.new(contato_params)

    respond_to do |format|
      if @contato.save
        format.html { redirect_to @contato, notice: 'Contato was successfully created.' }
        format.json { render :show, status: :created, location: @contato }
      else
        format.html { render :new }
        format.json { render json: @contato.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @contato.update(contato_params)
        format.html { redirect_to @contato, notice: 'Contato was successfully updated.' }
        format.json { render :show, status: :ok, location: @contato }
      else
        format.html { render :edit }
        format.json { render json: @contato.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @contato.destroy
    respond_to do |format|
      format.html { redirect_to contatos_url, notice: 'Contato was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_contato
      @contato = Contato.find(params[:id])
    end

    def contato_params
      params.require(:contato).permit(:name, :last_name, :email, :company, :job_title, :phone, :website)
    end
end
