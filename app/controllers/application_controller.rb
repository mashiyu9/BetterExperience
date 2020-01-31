class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  # before_action :authenticate_user!

  protected

  def configure_permitted_parameters
    # devise_parameter_sanitizer.permit(:sign_up,
    # keys: [ game_machines_attributes: [:game_device, :device_id],:name, :profile, :twitter_address, :skype_id, :discord_id, :game_machine])
    # devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :profile, :twitter_address, :skype_id, :discord_id, game_machines_attributes: [:game_device, :device_id]])
    devise_parameter_sanitizer
      .permit(:sign_up,
              keys:
                [
                  :name,
                  :profile,
                  :twitter_address,
                  :skype_id,
                  :discord_id,
                  game_machines_attributes: [
                    :game_device,
                    :device_id
                  ]
                ]
              )
    devise_parameter_sanitizer
    .permit(:account_update,
            keys:
              [
                :id,
                :name,
                :profile,
                :twitter_address,
                :skype_id,
                :discord_id,
                game_machines_attributes: [
                  :game_device,
                  :device_id
                ]
              ]
            )
  end

end
