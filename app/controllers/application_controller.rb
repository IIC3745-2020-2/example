# frozen_string_literal: true

# Application-wide controller
class ApplicationController < ActionController::Base
  # protect_from_forgery with: :exception

  before_action :authenticate_user!
end
