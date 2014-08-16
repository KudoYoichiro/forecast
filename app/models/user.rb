class User < ActiveRecord::Base
    def self.authenticate(username, password)
    usr = find_by(username: username)
    if usr != nil && usr.password == password
      usr
    else
      return
    end
  end
end
