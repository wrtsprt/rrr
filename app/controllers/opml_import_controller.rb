class OpmlImportController < ApplicationController

  def index
  end

  def import
    uploaded_io = params[:file]
    contents = nil
    File.open(Rails.root.join('public', 'uploads', uploaded_io.original_filename), 'wb') do |file|
      file.write(uploaded_io.read)
    end
    File.open(Rails.root.join('public', 'uploads', uploaded_io.original_filename), 'r') do |file|
      contents = file.read
    end
    opml = OpmlSaw::Parser.new(contents)
    opml.parse
    @feeds = opml.feeds
    Rails.logger.debug opml.feeds

    render :imported
  end
end
