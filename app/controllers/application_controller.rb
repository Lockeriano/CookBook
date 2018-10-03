# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  check_authorization
  load_and_authorize_resource

  rescue_from CanCan::AccessDenied do |exception|
    respond_to do |format|
      format.html { redirect_to main_app.root_url, notice: exception.message }
    end
  end
end
