class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception
  before_action :basic_auth, if: :production?

  

  private

  def production?
    Rails.env.production?
  end

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]
    end
  end

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname,:last_name,:first_name,:last_furigana,:first_furigana,:birth_year,:birth_month,:birth_day,:phone_number,address_attributes: [:last_name_ad,:first_name_ad,:last_furigana_ad,:first_furigana_ad,:postal_code,:prefectures,:city_name,:street_number,:building_name]])
    # devise_parameter_sanitizer.permit(:sign_up, keys: [address_attributes: [:postal_code,:prefectures,:city_name,:street_number,:building_name]])
  end
  
end