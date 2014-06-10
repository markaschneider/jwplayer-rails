module JWPlayer::Rails
  module Helper
    DEFAULT_OPTIONS = {
      id: 'jwplayer',
      flashplayer: '/assets/flash.swf',
      license: 'your-licence-key-here'
    }

    # Includes JWPlayer javascript library
    def jwplayer_assets
      javascript_include_tag "jwplayer", "jwplayer.html5"
    end

    def jwplayer(options = {})
      options = DEFAULT_OPTIONS.merge(options)

      result = %Q{<div id='#{options[:id]}'></div>
                  <script type='text/javascript'>
                    jwplayer('#{options[:id]}').setup(#{options.except(:id,:license).to_json});
                  </script>
                  <script type="text/javascript">jwplayer.key='#{options[:license]}';</script>
                  }

      result.respond_to?(:html_safe) ? result.html_safe : result
    end
  end
end
