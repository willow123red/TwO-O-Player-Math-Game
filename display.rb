class Display
  @locale = :en
  MESSAGES = {
    en: {
      new_turn: "----NEW TURN-----",
      game_over: "-----GAME OVER-----",
      good_bye: "Goodbye!"
    },
    fr: {
      new_turn: "----kshdfksdf  kjdfhkdf-----"
    }
  }

  def self.say (msg)
    puts MESSAGES[@locale][msg]
  end
end
