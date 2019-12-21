module Cors
  extend ActiveSupport::Concern

  included do
    prepend_before_action :set_cors_headers
    skip_before_action :authenticate_request, only: [:options_stub]
  end

  def options_stub
    head :ok
  end

  private

  def set_cors_headers
    response.headers.update \
      'Content-Type' => 'text/plain', \
      'Access-Control-Allow-Origin' => '*', \
      'Access-Control-Allow-Methods' => %w[GET POST PUT DELETE].join(','), \
      'Access-Control-Allow-Headers' => %w[Origin Accept Content-Type X-Requested-With X-CSRF-Token Authorization].join(',')
  end
end
