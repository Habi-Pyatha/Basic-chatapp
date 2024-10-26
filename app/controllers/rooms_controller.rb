class RoomsController < ApplicationController
  def index
    @current_user = current_user
    redirect_to "/signin" unless @current_user
    # @rooms = Room.public_rooms
    @rooms=Room.all
    @users = User.all_except(@current_user)
    @room = Room.new
  end
  def create
    @room = Room.create(name: params["room"]["name"])
    # if @room.save
    #   # Handle success, e.g., redirect to the room index or broadcast updates
    #   redirect_to rooms_path, notice: "Room created successfully."
    # else
    #   # Handle failure, e.g., re-render the index with errors
    #   @rooms = Room.public_rooms
    #   # @rooms=Room.all
    #   @users = User.all_except(@current_user)
    #   @room = Room.new
    #   render :index
    # end
  end

  def show
    @current_user = current_user
    @single_room = Room.find(params[:id])
    # @rooms = Room.public_rooms
    @rooms=Room.all
    @users = User.all_except(@current_user)
    @room = Room.new
    @message = Message.new
    @messages = @single_room.messages
    render "index"
  end
end
