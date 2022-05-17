# frozen_string_literal: true

# Controller needed to modify turbo links to work with Devise in Rails 7
class TurboDeviseController < ApplicationController
  # Need to define a new responder class for turbo links with Devise in Rails 7
  class Responder < ActionController::Responder
    def to_turbo_stream
      controller.render(options.merge(formats: :html))
    rescue ActionView::MissingTemplate => e
      if get?
        raise e
      elsif has_errors? && default_action
        render rendering_options.merge(formats: :html, status: :unprocessable_entity)
      else
        redirect_to navigation_location
      end
    end
  end
  self.responder = Responder
  respond_to :html, :turbo_stream
end
