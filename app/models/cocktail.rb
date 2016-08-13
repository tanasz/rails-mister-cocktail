class Cocktail < ApplicationRecord
  has_many  :doses, dependent: :destroy
  has_many  :ingredients, through: :doses
  validates :name, uniqueness: true, presence: :true
  validates :description, presence:  :true
  mount_uploader :photo, PhotoUploader
  after_destroy :destroy_photo

  private

  def destroy_photo
    puts "Photo à détruire (quand on pourra détruire les cocktails !)"
  end
end
