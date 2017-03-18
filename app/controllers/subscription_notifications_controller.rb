class SubscriptionNotificationsController < ApplicationController
  before_action :set_subscription_notification, only: [:show, :edit, :update, :destroy]

  # GET /subscription_notifications
  # GET /subscription_notifications.json
  def index
    @subscription_notifications = SubscriptionNotification.where(subscription_id: params[:subscription_id]).all
  end

  # GET /subscription_notifications/1
  # GET /subscription_notifications/1.json
  def show
  end

  # GET /subscription_notifications/new
  def new
    @subscription_notification = SubscriptionNotification.new
  end

  # GET /subscription_notifications/1/edit
  def edit
  end

  # POST /subscription_notifications
  # POST /subscription_notifications.json
  def create
    @subscription_notification = SubscriptionNotification.new(subscription_notification_params)

    respond_to do |format|
      if @subscription_notification.save
        format.html { redirect_to @subscription_notification, notice: 'Subscription notification was successfully created.' }
        format.json { render :show, status: :created, location: @subscription_notification }
      else
        format.html { render :new }
        format.json { render json: @subscription_notification.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /subscription_notifications/1
  # PATCH/PUT /subscription_notifications/1.json
  def update
    respond_to do |format|
      if @subscription_notification.update(subscription_notification_params)
        format.html { redirect_to @subscription_notification, notice: 'Subscription notification was successfully updated.' }
        format.json { render :show, status: :ok, location: @subscription_notification }
      else
        format.html { render :edit }
        format.json { render json: @subscription_notification.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /subscription_notifications/1
  # DELETE /subscription_notifications/1.json
  def destroy
    @subscription_notification.destroy
    respond_to do |format|
      format.html { redirect_to subscription_notifications_url, notice: 'Subscription notification was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_subscription_notification
      @subscription_notification = SubscriptionNotification.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def subscription_notification_params
      params[:subscription_notification].permit(:subscription_id)
    end
end
