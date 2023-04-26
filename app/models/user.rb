# == Schema Information
#
# Table name: user
#
#  id               :integer          not null, primary key
#  rut              :string
#  name             :string
#  lastname         :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class User < ApplicationRecord
  has_one :account

end
