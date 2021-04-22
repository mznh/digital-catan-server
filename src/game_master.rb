require_relative './model/game_state'

class GameMaster
  def initialize
    @status = GamePhase::GAME_INITIALIZE
    @phase_to_work = {
      GamePhase::GAME_INITIALIZE => method(:do_game_initialize) , 
      GamePhase::TURN_INITIALIZE => method(:do_turn_initialize) ,
      GamePhase::TURN_OF_PLAYER  => method(:do_turn_of_player)  ,
      GamePhase::TURN_OF_SYSTEM  => method(:do_turn_of_system)  ,
      GamePhase::TURN_FINALIZE   => method(:do_turn_finalize)   ,
      GamePhase::GAME_FINALIZE   => method(:do_game_finalize)   ,
    }
    @game_is_finished = false

    # tmp code
    @remaining_turn = 2

    

  end

  def set_status(next_status)
    p "# change status"
    p "# #{@status}-> #{next_status}"
    @status = next_status
  end

  def work
    if @phase_to_work.keys.include? @status then
      @phase_to_work[@status].call()
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

    ## ターンをすすめる
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

