

module CommandType
  PUT_ROAD_KOMA = 'put road koma'
  REMOVE_ROAD_KOMA = 'remove road koma'
end


module ServerPhase
  SERVER_INITIALIZE = "server initialize"
  WAIT_CONNECTION   = "wait connection"
  GAME_INITIALIZE   = "game initialize"
  IN_THE_GAME       = "in the game"
  GAME_FINALIZE     = "game finalize"
  SERVER_FINALIZE   = "server finalize"
end

module ConnecttionPhase
end

module GamePhase
  GAME_INITIALIZE = "game initialize" 
  TURN_INITIALIZE = "turn initialize"
  TURN_OF_PLAYER  = "turn of player"
  TURN_OF_SYSTEM  = "turn of system"
  TURN_FINALIZE   = "turn finalize" 
  GAME_FINALIZE   = "game finalize" 
end

