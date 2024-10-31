require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module App
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0

    # ジェネレータの設定
    config.generators do |g|
      g.helper false          # ヘルパーファイルを作成しない
      g.view_specs false      # ビューファイル用のSpecを作成しない
      g.helper_specs false    # ヘルパー用のSpecを作成しない
      g.controller_specs false # コントローラ用のSpecを作成しない
      g.routing_specs false    # ルーティング用のSpecを作成しない
      g.request_specs false    # リクエスト用のSpecを作成しない
    end

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
  end
end
