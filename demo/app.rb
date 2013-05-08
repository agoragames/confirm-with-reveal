require 'bundler'
Bundler.require

class App < Sinatra::Base

  set :root, File.dirname(__FILE__)
  set :sprockets, Sprockets::Environment.new(root)

  configure do

    %w[stylesheets javascripts images].each do |dir|
      sprockets.append_path(File.join(root, 'assets', dir))
    end

    set :haml, {
      :format => :html5,
      :attr_wrapper => '"',
      :ugly => false,
    }

  end

  helpers do
    def asset_path(source)
      "/assets/#{settings.sprockets.find_asset(source).digest_path}"
    end
  end

  get '/' do
    haml :index
  end

end
