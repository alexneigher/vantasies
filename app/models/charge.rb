class Charge < ApplicationRecord
  belongs_to :user
  belongs_to :van
end
