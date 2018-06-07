class ApplicationController < ActionController::Base
  include SetSource
  include DeviseWhitelist
end
