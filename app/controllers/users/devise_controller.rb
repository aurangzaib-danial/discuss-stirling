# => This controller enhances Devise Responder class to
# => render status of unprocessable_entity when a user object has errors.
# => This directs Turbo to render the entire html response instead of turbo stream.

class Users::DeviseController < ApplicationController
  class Responder < ActionController::Responder
    def to_turbo_stream
     controller.render(options.merge(formats: :html))
    rescue ActionView::MissingTemplate => error
      if get?
        raise error
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