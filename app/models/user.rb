class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  after_create :assign_default_role

  def assign_default_role
    self.add_role(:author) if self.roles.blank?
  end
  
  def set_slug
    self.slug = self.name + self.surname.chr
    self.save!
  end

end
