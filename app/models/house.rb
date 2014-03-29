class House < ActiveRecord::Base
  has_many :characters
  belongs_to :user
  belongs_to :region
end
