# == Schema Information
#
# Table name: houses
#
#  id        :integer          not null, primary key
#  name      :string(255)
#  region_id :integer
#  user_id   :integer
#

class House < ActiveRecord::Base
  has_many :characters
  belongs_to :user
  belongs_to :region
end
