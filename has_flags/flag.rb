# frozen_string_literal: true

ビット演算でフラグを作成した時の記録

class NotificationManager
  attr_accessor :flags

  def initialize
    @flags = 0
  end

  def turn_on_flag(flag_position)
    @flags |= (1 << flag_position)
  end

  def turn_off_flag(flag_position)
    @flags &= ~(1 << flag_position)
  end

  def turn_off_all_flags
    @flags = 0
  end

  def flag_status(flag_position)
    @flags & (1 << flag_position) != 0
  end

  def show_flags
    @flags.to_s(2).rjust(8, '0') # 8ビットで0埋めして表示
  end
end
