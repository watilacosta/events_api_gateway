# frozen_string_literal: true

class UsersController < ApplicationController # :nodoc:
  EXCHANGE = 'users'

  def create
    Publisher.publish(EXCHANGE, user_params)
  end

  private

  def user_params
    params.require(:user)
          .permit(:first_name, :last_name, :email, :cpf, :password, :password_confirmation)
  end
end


# TUTORIAL
# https://www.monterail.com/blog/2014/event-sourcing-on-rails-with-rabbitmq
