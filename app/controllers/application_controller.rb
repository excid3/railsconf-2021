class ApplicationController < ActionController::Base
  before_action do
    Current.host = request.base_url
  end
end
