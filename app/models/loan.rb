class Loan < ApplicationRecord
  belongs_to :taker, class_name: "User"
  belongs_to :provider, class_name: "User"
end
