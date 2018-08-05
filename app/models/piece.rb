class Piece < ApplicationRecord
    belongs_to :screenshot
    belongs_to :type
end
