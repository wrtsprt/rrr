class SubscriptionsController < ApplicationController
  before_action :set_subscription, only: [:show, :edit, :update, :destroy, :cache_feed, :mark_all_read_for_subscription]

  # GET /subscriptions
  # GET /subscriptions.json
  def index
    @subscriptions = Subscription.all
  end

  # GET /subscriptions/1
  # GET /subscriptions/1.json
  def show
  end

  # GET /subscriptions/new
  def new
    @subscription = Subscription.new
  end

  # GET /subscriptions/1/edit
  def edit
  end

  # POST /subscriptions
  # POST /subscriptions.json
  def create
    @subscription = Subscription.new(subscription_params)

    respond_to do |format|
      if @subscription.save
        format.html { redirect_to @subscription, notice: 'Subscription was successfully created.' }
        format.json { render :show, status: :created, location: @subscription }
      else
        format.html { render :new }
        format.json { render json: @subscription.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /subscriptions/1
  # PATCH/PUT /subscriptions/1.json
  def update
    respond_to do |format|
      if @subscription.update(subscription_params)
        format.html { redirect_to @subscription, notice: 'Subscription was successfully updated.' }
        format.json { render :show, status: :ok, location: @subscription }
      else
        format.html { render :edit }
        format.json { render json: @subscription.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /subscriptions/1
  # DELETE /subscriptions/1.json
  def destroy
    @subscription.destroy
    respond_to do |format|
      format.html { redirect_to subscriptions_url, notice: 'Subscription was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def cache_feed
    FeedItemDownloader.cache_feed(@subscription)
    redirect_to action: :index
  end

  def cache_all_feeds
    Subscription.all.each do |subscription|
      FeedItemDownloader.cache_feed(subscription)
    end
    redirect_to action: :index
  end

  def enqueue_cache_all_feeds
    RefreshAllSubscriptionsWorker.perform_async
    redirect_to action: :index
  end

  def destroy_all_subscriptions
    Subscription.find_each do |subscription|
      subscription.destroy
    end
    respond_to do |format|
      format.html { redirect_to subscriptions_url, notice: 'Subscriptions were successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def destroy_all_feed_items
    FeedItem.destroy_all
    respond_to do |format|
      format.html { redirect_to subscriptions_url, notice: 'Subscriptions were successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def mark_all_read
    FeedItem.update_all read: true
    respond_to do |format|
      format.html { redirect_to subscriptions_url, notice: 'All marked as read' }
      format.json { head :no_content }
    end
  end

  def mark_all_read_for_subscription
    @subscription.feed_items.update_all read: true, updated_at: Time.now
    respond_to do |format|
      format.html { redirect_to subscriptions_url, notice: "All marked as read for #{@subscription.name}" }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_subscription
      @subscription = Subscription.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def subscription_params
      params.require(:subscription).permit(:name, :feed_url, :http_url, :tag_list)
    end
end
