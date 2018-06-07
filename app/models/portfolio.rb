class Portfolio < ApplicationRecord
  validates_presence_of :title, :subtitle, :body, :main_image, :thumb_image

  def self.angular
    where(
      subtitle: 'Angular'
    )
  end

  scope :ruby_on_rails, -> { where(subtitle: 'Ruby on Rails') }
end
