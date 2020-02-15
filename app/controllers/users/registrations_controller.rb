# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  # def new
  #   super

  #    @game_devices =
  #      ["playstation", "nintendo", "steam"].reduce([]) do |a, b|
  #        a << @user.game_machines.build(game_device: b)
  #      end
  # end


  # def create
  #   super
  # end

  # POST /resource
  # def create
  #   super
  # end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  protected

  # def configure_sign_up_params
  #   device_parameter_sanitizer.permit(:sign_up) do |params|
  #     params.permit(:name, game_machines_attributes: [:game_device, :device_id])
  #   end
  # end
  #
  # def user_params
  #   device_parameter_sanitizer.permit(:user) do |params|
  #     params.permit(:name, game_machines_attributes: [:game_device, :device_id, :name])
  #   end
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
  def update_resource(resource, params)
    resource.update_without_password(params)
  end
end
