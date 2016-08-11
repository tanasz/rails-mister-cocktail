class Ingredient < ApplicationRecord
  has_many  :doses
  has_many  :cocktails, through: :doses
  validates :name, uniqueness: true, presence: :true
  # before_remove: :is_used_by_cocktails

  def is_used_by_cocktails(ingredient)
    # ???
  end
end
