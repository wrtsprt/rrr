require 'rails_helper'
require 'sanitize'

RSpec.describe HtmlSanitizer do

  describe 'ddd' do

    file = File.new(Rails.root.join('test/fixtures/heise-article.html'))
    lines = file.readlines
    Rails.logger.debug lines
    lines.should_not == nil

    #clean = Sanitize.document(lines.join, Sanitize::Config::RELAXED)
    #clean.should_not == nil

  end

end
