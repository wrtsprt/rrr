require 'sanitize'

class HtmlSanitizer

  def self.clean(input)
    Sanitize.clean(input, :remove_contents => ['script', 'style'])
  end

  def self.relaxed(input)
    Sanitize.document(input, Sanitize::Config::RELAXED)
  end

end
