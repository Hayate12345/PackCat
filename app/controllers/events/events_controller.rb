class Events::EventsController < ApplicationController
  # ! イベント一覧を取得するメソッド
  def index
    @events = Event.all.order(updated_at: "DESC")
  end

  # ! イベントを新規投稿するメソッド (フォーム入力)
  def new
    @event = Event.new
  end

  # ! イベントを新規投稿するメソッド （DB挿入）
  def create
    @event = Event.new(event_params)
    @event.user_id = current_user.id

    if @event.save
      redirect_to action: :index
    else
      render :new
    end
  end

  private

  def event_params
    params.require(:event).permit(:title, :content, :belongings, :place)
  end
end
