class User < ActiveRecord::Base

  # For Bycrpt.  Will encrypt password and store it in the
  # password digest.  Boohyah.
  has_secure_password
end
