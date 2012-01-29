class MakeFirstPeople

  def self.go
    admin = Role.find_by_name("Admin")
    gender = Gender.find_by_name("Male")
    active = UserStatus.find_by_name("Active")
    
    unless admin && active && gender
      puts "Hey you need to run the seeds first, yo"
      return false
    end
    
    users = [{:email => "joe@universityrenter.com",
              :password => "password",
              :password_confirmation => "password",
              :gender => gender,
              :user_status => active},
             {:email => "billy@universityrenter.com",
              :password => "password",
              :password_confirmation => "password",
              :gender => gender,
              :user_status => active}]
    
    for user_hash in users
      user = User.new(user_hash)
      user.user_roles.build(:role => admin)
      user.save!
    end
    
    puts "Change the passwords of the initial people!"
    
  end

end