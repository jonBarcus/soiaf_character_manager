class User < ActiveRecord::Base

  # For Bycrpt.  Will encrypt password and store it in the
  # password digest.  Boohyah.
  has_secure_password

  has_many :houses
  has_many :characters, :through => :houses
end
