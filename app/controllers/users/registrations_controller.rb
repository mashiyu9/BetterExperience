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
  def update
    if params[:room_info]
      self.resource = resource_class.to_adapter.get!(send(:"current_#{resource_name}").to_key)
      prev_unconfirmed_email = resource.unconfirmed_email if resource.respond_to?(:unconfirmed_email)
      resource_updated = update_resource(resource, account_update_params)
      yield resource if block_given?
      if resource_updated
        set_flash_message_for_update(resource, prev_unconfirmed_email)
        bypass_sign_in resource, scope: resource_name if sign_in_after_change_password?

      ############################ my
        @participant = Participant.new(participant_id: current_user.id, state: 1, game_room_id: params[:room_info])
        @current_user = current_user
        @owner_user = GameRoom.find(params[:room_info]).participants.find_by(state: 0)
        if params[:twitter] == "true" && params[:skype] == "true"
          if params[:user][:skype_id].present? && params[:user][:twitter_address].present?
            if @participant.save
              GameRoomMailer.request_mail(@current_user, @owner_user).deliver
            end
          else
            flash[:notice] = t('game_rooms.index.validate_info')
          end
        elsif params[:twitter] == "true" && params[:discord] == "true"
          if params[:user][:discord_id].present? && params[:user][:twitter_address].present?
            if @participant.save
              GameRoomMailer.request_mail(@current_user, @owner_user).deliver
            end
          else
            flash[:notice] = t('game_rooms.index.validate_info')
          end
        elsif params[:skype] == "true"
          if params[:user][:skype_id].present?
            if @participant.save
              GameRoomMailer.request_mail(@current_user, @owner_user).deliver
            end
          else
            flash[:notice] = t('game_rooms.index.validate_info')
          end
        elsif params[:twitter] == "true"
          if params[:user][:twitter_address].present?
            if @participant.save
              GameRoomMailer.request_mail(@current_user, @owner_user).deliver
            end
          else
            flash[:notice] = t('game_rooms.index.validate_info')
          end
        elsif params[:discord] == "true"
          if params[:user][:discord_id].present?
            if @participant.save
              GameRoomMailer.request_mail(@current_user, @owner_user).deliver
            end
          else
            flash[:notice] = t('game_rooms.index.validate_info')
          end
        elsif params[:game_device] == "true"
          # if params[:user][:discord_id]
            # if @participant.save
            #   GameRoomMailer.request_mail(@current_user, @owner_user).deliver
            # end
          # end
        end
        ##########################################################################
        respond_with resource, location: after_update_path_for(resource)
      else
        clean_up_passwords resource
        set_minimum_password_length
        respond_with resource
      end
    else
      super
    end

  end

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
