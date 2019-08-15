module ResistorColorDuo
  COLOR_MAP = {
    black: 0,
    brown: 1,
    red: 2,
    orange: 3,
    yellow: 4,
    green: 5,
    blue: 6,
    violet: 7,
    grey: 8,
    white: 9,
  }.freeze

  def self.value(colours)
    colours.reverse_each.map.with_index do |colour, index|
      COLOR_MAP[colour.to_sym] * (10**index)
    end.sum
  end
end
