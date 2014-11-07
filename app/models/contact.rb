class Contact < ActiveRecord::Base

  validates :first_name, :last_name, :phone_number, presence: { message: "Empty field!" }, allow_blank: false
  # validates :phone_number, uniqueness: true, allow_blank: false
  validates :phone_number, uniqueness: { message: "Number already in use" }
  validates :phone_number, format: { with: /\A[+]\d{1,3}\s\d{1,3}\s\d{6,}\z/, message: "Invalid phone number!" }

  # Sanitize AR find using hash conditions
  def self.search conditions
    return nil unless valid_conditions? conditions
    contacts = self.where(sanitize_sql(conditions))
    contacts
  end

  # Validate conditions hash
  def self.valid_conditions? conditions
    (conditions.keys.map{|el| el.to_sym} - fields).blank?
  end

  # Model accessible attributes
  def self.fields
    [ :first_name, :last_name, :phone_number ]
  end

end
