class User < ActiveRecord::Base
  require 'digest/sha1'
  attr_accessible :archived, :email, :first_name, :is_locked, :last_name, :password, :salt, :user_name
  validates_length_of :user_name, :within => 3..40
    # validates_length_of :password, :within => 5..40
  validates_presence_of :user_name, :email,:first_name,:last_name
  validates_uniqueness_of :user_name, :email
  before_save :default_pass
    def self.random_string(len)
      #generate a random password consisting of strings and digits
      chars = ("a".."z").to_a + ("A".."Z").to_a + ("0".."9").to_a
      newpass = ""
      1.upto(len) { |i| newpass << chars[rand(chars.size-1)] }
      return newpass
    end
    def password=(pass)
      @password=pass
      self.salt = User.random_string(10) if !self.salt?
      self.hashed_password = User.encrypt(@password, self.salt)
      #Rails.logger.debug{self.hashed_password.inspect}
      #Rails.logger.debug{self.salt.inspect}
    end
    def self.encrypt(pass, salt)
      #Rails.logger.debug(pass +" and salt is "+salt)
      salt = "" if salt.nil?
      Digest::SHA1.hexdigest(pass+salt)
    end

    def self.authenticate(login, pass)

      u=find(:first, :conditions=>["user_name = ?", login])

      return nil if u.nil? or pass.nil? or login.nil?
      #Rails.logger.debug{User.encrypt(pass, u.salt)}
      return u if User.encrypt(pass, u.salt).eql?(u.hashed_password)
    end
    def send_new_password
      new_pass = User.random_string(10)
      self.password = self.password_confirmation = new_pass
      self.save
      #Notifications.deliver_forgot_password(self.email, self.login, new_pass)
    end
  def default_pass
      #create a default password
    if  self.hashed_password.nil?
        password = '_12346'
         self.is_first_time = 1
         self.failed_attempts=0
         self.salt = User.random_string(10) if !self.salt?
         #Rails.logger.debug{self.inspect}
         self.hashed_password = User.encrypt(password, self.salt)

     end
  end
  def self.change_password(username,password)

    u=find(:first, :conditions=>["user_name = ?", username])

    u.salt = User.random_string(10) if !u.salt?
    #Rails.logger.debug{self.inspect}
    u.hashed_password = User.encrypt(password, u.salt)
    u.is_first_time = 0
    u.save
  end
  def admin_password_change(username)
    u=find(:first, :conditions=>["user_name = ?", username])
    return nil if u.nil?
    if u.is_locked?
      u.default_pass
      u.save
    end
  end
end
