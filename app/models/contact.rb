class Contact < ApplicationRecord
  has_many :posts, as: :author

  def display_name
    "#{name} <#{email}>"
  end
end
