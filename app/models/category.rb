class Category < ApplicationRecord
    validates :category, {presence: true}
    validates :number , {numericality: :only_integer}
end
