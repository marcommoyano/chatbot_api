# == Schema Information
#
# Table name: account
#
#  id               :integer          not null, primary key
#  account_id       :integer
#  adress           :string
#  quantity         :integer
#  is_paper_request :boolean
#  date             :date
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class Transaction < ApplicationRecord
  belongs_to :account

  scope :not_paper_request, -> { where(is_paper_request: false) }
  scope :paper_request, -> { where(is_paper_request: true) }
  scope :for_date, -> (date:) { where(date: date)}
end
