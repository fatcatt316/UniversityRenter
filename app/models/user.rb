class User < ActiveRecord::Base
  authenticates_with_sorcery!
  
  belongs_to :user_status
  belongs_to :gender
  
  has_many :user_roles, :dependent => :destroy
  has_many :roles, :through => :user_roles
  has_many :documents
  has_many :listings, :foreign_key => "creator_id"

  validates_confirmation_of :password  
  validates_presence_of :password, :on => :create  
  validates_presence_of :email  
  validates_uniqueness_of :email
  
  
  def to_s
    return email.to_s
  end
  

  def has_role?(role_name)
    return self.roles.map(&:name).include?(role_name.to_s.capitalize)
  end
  
  
  def admin?
    return self.has_role?("admin")
  end
  
  
  def editable?(user=nil)
    return user && (user.admin? || user.id == self.id)
  end
end
