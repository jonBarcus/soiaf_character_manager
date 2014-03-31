# == Schema Information
#
# Table name: characters
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  age             :integer
#  gender          :string(255)
#  house_id        :integer          default(1)
#  agility         :integer          default(2)
#  animal_handling :integer          default(2)
#  athletics       :integer          default(2)
#  awareness       :integer          default(2)
#  cunning         :integer          default(2)
#  deception       :integer          default(2)
#  endurance       :integer          default(2)
#  fighting        :integer          default(2)
#  healing         :integer          default(2)
#  language        :integer          default(2)
#  knowledge       :integer          default(2)
#  marksmanship    :integer          default(2)
#  persuasion      :integer          default(2)
#  status          :integer          default(2)
#  stealth         :integer          default(2)
#  survival        :integer          default(2)
#  thievery        :integer          default(2)
#  warfare         :integer          default(2)
#  will            :integer          default(2)
#  is_alive        :boolean          default(TRUE)
#  created_at      :datetime
#  updated_at      :datetime
#  user_id         :integer
#

class Character < ActiveRecord::Base
  belongs_to :house

end
