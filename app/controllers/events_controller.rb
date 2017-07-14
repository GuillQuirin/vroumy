class EventsController < ApplicationController
  load_and_authorize_resource
  before_action :authenticate_utilisateur!, only: [:new, :create]
  #before_action :set_event, only: [:show, :edit, :update, :destroy]

  # GET /events
  # GET /events.json
  def index
    @events = Event.includes(:utilisateurs)
  end

  # GET /events/1
  # GET /events/1.json
  def show
    @hash = Gmaps4rails.build_markers(@event) do |event, marker|
      marker.lat event.latitude
      marker.lng event.longitude
    end
  end

  # GET /events/new
  def new
    @event = Event.new
  end

  # GET /events/1/edit
  def edit
  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(event_params)
    if @event.save
      flash[:notice] = "L\'évènement #{@event.name} a bien été créé."
      redirect_to @event  
    else
      render 'new'
    end
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    if @event.update(event_params)
      flash[:notice] = "L\'évènement #{@event.name} a bien été mis à jour."
      redirect_to @event
    else
      render 'edit'
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event.destroy
    flash[:notice] = "L\'évènement #{@event.name} a bien été supprimé."
    redirect_to events_path
  end


  def join_utilisateur
    @event = Event.find(params[:id])
    @event.event_utilisateurs.build(:utilisateur_id => current_utilisateur.id)
    if @event.save
      flash[:notice] = "Votre inscription à l'évènement '#{@event.name}' a bien été prise en compte."
      redirect_to event_url(@event)
    end
  end

  private
    #def set_event
    # @event = Event.find(params[:id])
    #end

    def event_params
      params.require(:event).permit(
        :name, 
        :startDate, 
        :endDate, 
        :place, 
        :rate,
        :avatar,
        :status,
        utilisateur_ids: []
      )
    end
end
