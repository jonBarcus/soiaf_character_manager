# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  email           :string(255)
#  username        :string(255)
#  name            :string(255)
#  password_digest :string(255)
#  created_at      :datetime
#  updated_at      :datetime
#

class User < ActiveRecord::Base

  # For Bycrpt.  Will encrypt password and store it in the
  # password digest.  Boohyah.
  has_secure_password

  has_many :houses
  has_many :characters, :through => :houses
end
