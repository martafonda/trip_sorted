class TicketsController < ApplicationController
  before_action :set_ticket, only: [:show, :edit, :update, :destroy]
    before_action :set_trip, except: [:show, :edit, :update, :destroy]
  before_action :order, only: :index

  # GET /tickets
  # GET /tickets.json
  def index
    @tickets = Ticket.all
    @tickets_ordered 
  end

  # GET /tickets/1
  # GET /tickets/1.json
  def show

  end

  # GET /tickets/new
  def new
    @ticket = Ticket.new
  end

  # GET /tickets/1/edit
  def edit
    @ticket = Ticket.find(params[:id])
    @trip = @ticket.trip
  end

  # POST /tickets
  # POST /tickets.json
  def create
    @ticket = Ticket.new(ticket_params)

    respond_to do |format|
      if @ticket.save
        format.html { redirect_to @ticket, notice: 'Ticket was successfully created.' }
        format.json { render action: 'show', status: :created, location: @ticket }
      else
        format.html { render action: 'new' }
        format.json { render json: @ticket.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tickets/1
  # PATCH/PUT /tickets/1.json
  def update
    respond_to do |format|
      if @ticket.update(ticket_params)
        format.html { redirect_to @ticket, notice: 'Ticket was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @ticket.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tickets/1
  # DELETE /tickets/1.json
  def destroy
    @ticket.destroy
    respond_to do |format|
      format.html { redirect_to tickets_url }
      format.json { head :no_content }
    end
  end

  private

  def order
    @tickets_ordered = []
    @origin = Ticket.pluck(:origin)
    @destination = Ticket.pluck(:destination)
    @origin.each do |origin|
      if @destination.exclude?(origin)
            @tickets_ordered << Ticket.find_by(origin: origin)
      end
    end
    i = 0
    while i < Ticket.all.length
      @tickets_ordered << Ticket.find_by(origin: @tickets_ordered[i].destination)
      i += 1
    end
    return @tickets_ordered
  end

    # Use callbacks to share common setup or constraints between actions.
    def set_ticket
      @ticket = Ticket.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ticket_params
      params.require(:ticket).permit(:origin, :destination, :transportation_type, :transportation_id, :seat, :extra_information)
    end
    def set_trip
      @trip = Trip.find(params[:trip_id])
    end
end
