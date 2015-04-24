module JWPlayer::Rails
  module Helper
    LICENSE_OPTIONS = {
      license: 'your-licence-key-here'
    }

    def default_options
      {
          id: 'jwplayer',
          flashplayer: asset_path('jwplayer.flash.swf')
      }
    end

    def swf_path
      asset_path('jwplayer.flash.swf')
    end

    # Includes JWPlayer javascript library
    def jwplayer_assets
      javascript_include_tag "jwplayer", "jwplayer.html5"
    end

    # Includes JWPlayer license
    def jwplayer_license(options = {})
      options = LICENSE_OPTIONS.merge(options)
      javascript_tag "jwplayer.key='#{options[:license]}';"
    end

    def jwplayer(options = {})
      options = default_options.merge(options)

      result = %Q{<div id='#{options[:id]}'></div>
                  <script type='text/javascript'>
                    jwplayer('#{options[:id]}').setup(#{options.except(:id).to_json});
                  </script>
                  }

      result.respond_to?(:html_safe) ? result.html_safe : result
    end
  end
end
