require 'rails_helper'
require 'sanitize'

include ActionView::Helpers::SanitizeHelper

RSpec.describe HtmlSanitizer do

  it 'sanitizes html' do
    file = File.new(Rails.root.join('test/fixtures/heise-article.html'))
    lines = file.readlines

    expect(lines).not_to eq(nil)
    sanitized = sanitize(lines.join)
    expect(sanitized).not_to eq(nil)
  end

end
