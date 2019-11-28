# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  full_name       :string
#  email           :string
#  password_digest :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ApplicationRecord
  has_secure_password
  validates :email, :full_name, presence: true
  validates_uniqueness_of :email
end
