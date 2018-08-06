class Screenshot < ApplicationRecord
    has_many :pieces, dependent: :destroy
end
