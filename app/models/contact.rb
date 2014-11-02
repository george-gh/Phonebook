class Contact < ActiveRecord::Base

  validates :first_name, :last_name, :phone_number, presence: true, allow_blank: false
  validates :phone_number, uniqueness: true, allow_blank: false
  validates :phone_number, format: { with: /\A[+]\d{1,3}\s\d{1,3}\s\d{6,}\z/, message: "Invalid phone number" }
  


end
