class Type < ApplicationRecord
    has_many :piece_types  
    
    has_many :pieces, through: :piece_types, source: :piece
end
