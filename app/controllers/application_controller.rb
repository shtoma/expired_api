class ApplicationController < ActionController::Base
  rescue_from WeakParameters::ValidationError do
    head 400
  end
end
