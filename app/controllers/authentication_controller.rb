class AuthenticationController < ApplicationController
	skip_before_filter  :verify_authenticity_token
  def verify
  end
end
