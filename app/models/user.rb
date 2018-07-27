class User < ApplicationRecord
  has_many :events
  has_many :invitations, through: :events
  has_many :members, through: :invitations


  def country_name
    country = ISO3166::Country[country_code]
    country.translations[I18n.locale.to_s] || country.name
  end
end
