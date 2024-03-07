class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:get_current_address]

  def get_current_address
    results = Geocoder.search([params[:latitude], params[:longitude]])
    address = results.first.data["address"]
    final_address = "#{address["house_number"]} #{address["road"]}, #{address["city"]}"
    render json: {
      final_address: final_address
    }
  end
end
