class Dose < ApplicationRecord
  belongs_to :cocktail
  belongs_to :ingredient

  validates :description, presence: true
  validates :cocktail, presence: true, uniqueness: { scope: [:ingredient],
    message: "There should be a unique dose for a given cocktail/ingredient couple" }
end
