class CalendarsController < ApplicationController
  before_action :set_calendar, only: [:show, :edit, :update, :destroy]

  # GET /calendars
  # GET /calendars.json
  def index
    @calendars = Calendar.all
    @calendar = Calendar.new
  end

  # GET /calendars/1
  # GET /calendars/1.json
  def show
  end

  # GET /calendars/new
  def new
    @calendar = Calendar.new
  end

  # GET /calendars/1/edit
  def edit
  end

  # POST /calendars
  # POST /calendars.json
  def create
    @calendar = current_user.calendars.new(calendar_params)
    if @calendar.save
      redirect_to calendars_path, success: '予定の投稿に成功しました'
    else
      flash.now[:danger] = "予定の投稿に失敗しました"
      render :new
    end
  end

  # PATCH/PUT /calendars/1
  # PATCH/PUT /calendars/1.json
  def update
    @calendar = Calendar.find(params[:id])
    @calendar.update(calendar_params)
    redirect_to calendar_path, success: '予定を更新しました'
  end

  # DELETE /calendars/1
  # DELETE /calendars/1.json
  def destroy
    @calendar.destroy
    redirect_to calendars_path, info: '予定を削除しました'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_calendar
      @calendar = Calendar.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def calendar_params
      params.require(:calendar).permit(:title, :description, :start_date, :end_date, :image)
    end
end
