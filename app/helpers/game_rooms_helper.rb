module GameRoomsHelper
  def new_or_edit
    unless @game_room.id?
      game_rooms_path
    else
      game_room_path
    end
  end

end
