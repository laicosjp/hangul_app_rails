# typed: true

# DO NOT EDIT MANUALLY
# This is an autogenerated file for dynamic methods in `RailsAdmin::ApplicationController`.
# Please instead update this file by running `bin/tapioca dsl RailsAdmin::ApplicationController`.


class RailsAdmin::ApplicationController
  sig { returns(HelperProxy) }
  def helpers; end

  module HelperMethods
    include ::Turbo::DriveHelper
    include ::Turbo::FramesHelper
    include ::Turbo::IncludesHelper
    include ::Turbo::StreamsHelper
    include ::ActionView::Helpers::CaptureHelper
    include ::ActionView::Helpers::OutputSafetyHelper
    include ::ActionView::Helpers::TagHelper
    include ::Turbo::Streams::ActionHelper
    include ::ActionText::ContentHelper
    include ::ActionText::TagHelper
    include ::DeviseI18n::ViewHelpers
    include ::ActionController::Base::HelperMethods
    include ::RailsAdmin::ApplicationHelper
    include ::RailsAdmin::MainHelper

    sig { returns(T.untyped) }
    def _current_user; end

    sig { returns(T.untyped) }
    def _get_plugin_name; end
  end

  class HelperProxy < ::ActionView::Base
    include HelperMethods
  end
end
