class Story < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :rates, dependent: :destroy

  validates :title, :body, presence: true

  scope :highest_rated, -> { order(rates_average: :desc) }
  scope :for_user, -> (user_id) { where(user_id: user_id) }

  def refresh_rates_average
    ActiveRecord::Base.transaction do
      self.rates_average = rates.average(:rate_value)
      save
    end
  end
end