class Rate < ActiveRecord::Base
  belongs_to :story
  belongs_to :user

  validates :rate_value, presence: true, inclusion: { in: 1..5 }

end