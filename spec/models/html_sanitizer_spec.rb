require 'rails_helper'

RSpec.describe HtmlSanitizer do

  it 'sanitizes html' do
    file = File.new(Rails.root.join('test/fixtures/heise-article.html'), 'rb')
    lines = file.read.encode!('UTF-8',
        :invalid => :replace,
        :undef   => :replace)

    expect(lines).not_to eq(nil)
    sanitized = Sanitize.clean(lines, :remove_contents => ['script', 'style'])
    expect(sanitized).not_to eq(nil)
    File.open(Rails.root.join('output.txt'), 'w') do |f|
      f.write sanitized
    end
  end

end
