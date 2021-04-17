require_relative './model/game_state'
module GamePhase
  GAME_INITIALIZE = "game initialize" 
  TURN_INITIALIZE = "turn initialize"
  TURN_OF_PLAYER  = "turn of player"
  TURN_OF_SYSTEM  = "turn of system"
  TURN_FINALIZE   = "turn finalize" 
  GAME_FINALIZE   = "game finalize" 
end

class GameMaster
  def initialize
    @status = GamePhase::GAME_INITIALIZE
    @game_is_finished = false
    
    # tmp code
    @remaining_turn = 5
  end

  def set_status(next_status)
    p "change status"
    p "#{@status}-> #{next_status}"
    @status = next_status
  end

  def work
    ## ここ配列にしてなめたほうがいいきがしている
    case @status
    when GamePhase::GAME_INITIALIZE then do_game_initialize
    when GamePhase::TURN_INITIALIZE then do_turn_initialize
    when GamePhase::TURN_OF_PLAYER then do_turn_of_player
    when GamePhase::TURN_OF_SYSTEM then do_turn_of_system
    when GamePhase::TURN_FINALIZE  then do_turn_finalize 
    when GamePhase::GAME_FINALIZE  then do_game_finalize 
    else 
      p "unknown status error"
    end
  end

  def work_completed?
    return @game_is_finished
  end

  def do_game_initialize
    p "#{@status} do"
    p "#{@status} done"
    set_status(GamePhase::TURN_INITIALIZE)
  end
  def do_turn_initialize 
    p "#{@status} do"
    ## ターンが進む
    p "残り #{@remaining_turn} ターン"
    @remaining_turn -= 1

    p "#{@status} done"
    set_status(GamePhase::TURN_OF_PLAYER)
  end
  def do_turn_of_player  
    p "#{@status} do"
    p "#{@status} done"
    set_status(GamePhase::TURN_OF_SYSTEM)
  end
  def do_turn_of_system  
    p "#{@status} do"
    p "#{@status} done"
    set_status(GamePhase::TURN_FINALIZE)
  end
  def do_turn_finalize   
    p "#{@status} do"
    p "#{@status} done"
    if @remaining_turn <= 0 then
      set_status(GamePhase::GAME_FINALIZE)
    else
      set_status(GamePhase::TURN_INITIALIZE)
    end
  end
  def do_game_finalize   
    p "#{@status} do"
    @game_is_finished = true
    p "#{@status} done"
  end
end

