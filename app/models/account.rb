# == Schema Information
#
# Table name: account
#
#  id               :integer          not null, primary key
#  user_id          :integer
#  amount           :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class Account < ApplicationRecord
  belongs_to :user
  has_many :transactions
end
