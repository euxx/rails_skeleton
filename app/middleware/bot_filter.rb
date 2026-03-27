# Rack middleware that intercepts obvious bot/scanner requests before they reach
# Skylight's middleware, preventing them from being counted against the usage quota.
#
# Legitimate search engine crawlers (Googlebot, Bingbot, etc.) are still blocked
# if they target suspicious paths (/.env, /wp-login.php, etc.) — spoofed UAs
# cannot bypass the path filter.
class BotFilter
  ALLOWED_BOTS = /
    googlebot | bingbot | slurp | duckduckbot | baiduspider |
    yandexbot  | applebot | twitterbot | facebookexternalhit |
    linkedinbot | whatsapp | telegrambot | ia_archiver
  /ix

  BAD_UA_KEYWORDS = /
    headless | phantom | selenium | puppeteer | playwright |
    scrapy    | masscan | nikto    | sqlmap    | nuclei    | zgrab |
    python-requests | go-http-client | libwww-perl | lwp-trivial
  /ix

  BAD_UA_EXACT = /\A(?:java(?:\/\S+)?|node[- ]fetch(?:\/\S+)?|axios(?:\/\S+)?|okhttp(?:\/\S+)?|curl(?:\/\S+)?|wget(?:\/\S+)?)\z/i

  # Block requests to paths that suggest probing, attack patterns, or resources
  # this app does not serve (feed/sitemap/rss/atom — confirmed absent from routes).
  # Note: does NOT include .js/.css/.gif/.jpg so legitimate asset requests pass through.
  BAD_PATHS = /
    \.(?:php|asp|aspx|jsp|cgi|env|bak|git|svn|sql|db|tar|gz|zip|cfg|ini|conf|log|xml|rss|atom)\z |
    \/feed(?:\/|\z) |
    \/(wp-(?:admin|login|content|includes)|xmlrpc\.php|phpmyadmin|\.git|\.env|\.htaccess|actuator|solr)
  /ix

  # Block when the Referer header looks like a spam URL (mirrors original bot? logic).
  BAD_REFERER_PATTERNS = /php|feed|admin/i

  def initialize(app)
    @app = app
  end

  def call(env)
    return [204, {}, []] if bot?(env)

    @app.call(env)
  end

  private

  def bot?(env)
    path    = env["PATH_INFO"].to_s
    referer = env["HTTP_REFERER"].to_s

    # Path/referer checks run before the UA allowlist — spoofed Googlebot UAs
    # cannot bypass path-based blocks.
    return true if BAD_PATHS.match?(path)
    return true if BAD_REFERER_PATTERNS.match?(referer)

    ua = env["HTTP_USER_AGENT"].to_s.strip

    return false if ALLOWED_BOTS.match?(ua)

    ua.empty? ||
      BAD_UA_KEYWORDS.match?(ua) ||
      BAD_UA_EXACT.match?(ua) ||
      ua.downcase =~ /(client)|(request)|(headless)/
  end
end
