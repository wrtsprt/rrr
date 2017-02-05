class OpmlImportController < ApplicationController

  def index
  end

  def import
    uploaded_io = params[:file]
    contents = nil

    uploads_dir = Rails.root.join('public', 'uploads')

    FileUtils.mkdir_p(uploads_dir)

    File.open(File.join(uploads_dir, uploaded_io.original_filename), 'wb') do |file|
      file.write(uploaded_io.read)
    end
    File.open(File.join(uploads_dir, uploaded_io.original_filename), 'r') do |file|
      contents = file.read
    end

    opml = OpmlSaw::Parser.new(contents)
    opml.parse
    @feeds = opml.feeds
    @feeds.each do |feed|
      subscription = Subscription.create name: feed[:title], feed_url: feed[:xml_url], http_url: feed[:html_url]
      subscription.tag_list.add(feed[:tag])
      Rails.logger.debug "--> #{feed[:tag]}"
      subscription.save!

    end

    redirect_to subscriptions_path, notice: "#{@feeds.count} imported"
  end
end
