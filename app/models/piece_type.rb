class PieceType < ApplicationRecord
  belongs_to :piece
  belongs_to :type
end
