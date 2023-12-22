class Division < ApplicationRecord
  belongs_to :country
  has_many :district 
end
