class FlightsController < ApplicationController
  def index
    @flights = Flight.all.order({ :created_at => :desc })

    render({ :template => "flights/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")
    @flight = Flight.where({:id => the_id }).at(0)

    render({ :template => "flights/show.html.erb" })
  end

  def create
    @flight = Flight.new
    @flight.passenger_id = params.fetch("query_passenger_id")
    @flight.description = params.fetch("query_description")
    @flight.departs_at = params.fetch("query_departs_at")

    if @flight.valid?
      @flight.save
      redirect_to("/flights", { :notice => "Flight created successfully." })
    else
      redirect_to("/flights", { :notice => "Flight failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    @flight = Flight.where({ :id => the_id }).at(0)

    @flight.passenger_id = params.fetch("query_passenger_id")
    @flight.description = params.fetch("query_description")
    @flight.departs_at = params.fetch("query_departs_at")
    @flight.message_sent = params.fetch("query_message_sent", false)

    if @flight.valid?
      @flight.save
      redirect_to("/flights/#{@flight.id}", { :notice => "Flight updated successfully."} )
    else
      redirect_to("/flights/#{@flight.id}", { :alert => "Flight failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    @flight = Flight.where({ :id => the_id }).at(0)

    @flight.destroy

    redirect_to("/flights", { :notice => "Flight deleted successfully."} )
  end
end
