class Piece < ApplicationRecord
    belongs_to :screenshot
    has_many :piece_types

    has_many :types, through: :piece_types, source: :type
end
