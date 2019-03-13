class RegistrationsController < ApplicationController
  before_action :set_registration, only: [show, edit, update, destroy]

  # GET /registrations with (index.html.erb)
  def index
    @registrations = Registration.all
  end

  # GET /registrations/:id with (show.html.erb)
  def show
  end

  # GET /registrations/new with (new.html.erb)
  def new
  end


  def create
    @registration = Registration.new(order_params)
  end
  
  # GET /registrations/:id/edit with (edit.html.erb)
  def edit
  end

  # PUT/PATCH /registrations/:id with (edit.html.erb)
  def update
    # Méthode qui met à jour le potin à partir du contenu du formulaire de edit.html.erb, soumis par l'utilisateur
    # pour info, le contenu de ce formulaire sera accessible dans le hash params
    # Une fois la modification faite, on redirige généralement vers la méthode show (pour afficher le potin modifié)
  end

  # DELETE registrations/:id
  def destroy
    @Registration.destroy
    respond_to do |format|
      format.html { redirect_to event_path, notice: 'Registration was successfully destroyed.' }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_Registration
    @Registration = Registration.find(params[:id])
  end

  def Registration_params
    params.require(:Registration).permit(:user_id, :event_id, :role)
  end
end