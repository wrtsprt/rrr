require 'rails_helper'
require 'sanitize'

RSpec.describe HtmlSanitizer do

  it 'sanitizes html' do
    file = File.new(Rails.root.join('test/fixtures/heise-article.html'))
    lines = file.readlines
    Rails.logger.debug lines
    expect(lines).not_to eq(nil)

    #clean = Sanitize.document(lines.join, Sanitize::Config::RELAXED)
    #expect(clean).not_to eq(nil)

  end

end
