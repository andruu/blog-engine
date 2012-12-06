class Contact
  include ActiveAttr::Model

  attribute :name
  attribute :email
  attribute :message

  validates :name, presence: true, length: { in: 2..255 }
  validates :email, presence: true, format: { with: /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i }
  validates :message, presence: true, length: { minimum: 20 }
end