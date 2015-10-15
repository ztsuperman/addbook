class User < ActiveRecord::Base
def admin? 
  self.role == 'admin' 
end
has_secure_password
end
