class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /events
  # GET /events.json
  def index
    @user = current_user
    @events = @user.events
  end

  # GET /events/1
  # GET /events/1.json
  def show
    @user = current_user
  end

  # GET /events/new
  def new
    @event = Event.new
    @user = current_user
  end

  # GET /events/1/edit
  def edit
    @user = current_user
  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(event_params)

    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, flash: { key: 'イベントを新規作成しました！' } }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render "users/show" }
        format.json { render json: @event.errors, status: :unprocessable_entity }
        @user = current_user
      end
    end
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to @event, flash: { key: 'イベントの内容を更新しました！' } }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
        @user = current_user
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url, notice: 'イベントを削除しました！' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_event
    @event = Event.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def event_params
    params.require(:event).permit(:title, :body, :start_date, :end_date, :user_id)
  end
end
