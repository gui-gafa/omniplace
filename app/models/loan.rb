class Loan < ApplicationRecord
  belongs_to :taker
  belongs_to :provider
end
