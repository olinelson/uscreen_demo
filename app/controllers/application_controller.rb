class ApplicationController < ActionController::Base
  include Authentication
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  def render(*args)
      options = args.extract_options!
      case turbo_frame_request_id
      when /modal/
          @in_modal = true
          options[:layout] = "modal"
      end
      super(*args, options)
  end
end
