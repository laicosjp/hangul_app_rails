# typed: true

# DO NOT EDIT MANUALLY
# This is an autogenerated file for types exported from the `devise-i18n` gem.
# Please instead update this file by running `bin/tapioca gem devise-i18n`.


# source://devise-i18n//lib/devise-i18n/view_helpers.rb#1
module DeviseI18n
  class << self
    # source://railties/7.1.3.4/lib/rails/engine.rb#412
    def railtie_helpers_paths; end

    # source://railties/7.1.3.4/lib/rails/engine.rb#395
    def railtie_namespace; end

    # source://railties/7.1.3.4/lib/rails/engine.rb#416
    def railtie_routes_url_helpers(include_path_helpers = T.unsafe(nil)); end

    # source://railties/7.1.3.4/lib/rails/engine.rb#401
    def table_name_prefix; end

    # source://railties/7.1.3.4/lib/rails/engine.rb#408
    def use_relative_model_naming?; end
  end
end

# source://devise-i18n//lib/devise-i18n/railtie.rb#5
class DeviseI18n::Engine < ::Rails::Engine
  class << self
    # source://activesupport/7.1.3.4/lib/active_support/callbacks.rb#70
    def __callbacks; end
  end
end

# source://devise-i18n//lib/devise-i18n/railtie.rb#14
class DeviseI18n::Railtie < ::Rails::Railtie
  class << self
    # source://devise-i18n//lib/devise-i18n/railtie.rb#25
    def add(pattern); end

    # source://devise-i18n//lib/devise-i18n/railtie.rb#30
    def pattern_from(args); end
  end
end

# source://devise-i18n//lib/devise-i18n/view_helpers.rb#2
module DeviseI18n::ViewHelpers
  # Custom logic to fix case for different strings and languages.
  #
  # source://devise-i18n//lib/devise-i18n/view_helpers.rb#4
  def devise_i18n_fix_model_name_case(text, i18n_key:); end
end
