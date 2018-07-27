class Event < ApplicationRecord
	belongs_to  :user
	has_many :invitations
    has_many :members, through: :invitations

  def country_name
    country = ISO3166::Country[country_code]
    country.translations[I18n.locale.to_s] || country.name
  end
end
