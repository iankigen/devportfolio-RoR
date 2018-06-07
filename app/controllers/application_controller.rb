class ApplicationController < ActionController::Base
  include SetSource
  include DeviseWhitelist
  include CurrentUserConcern
end
