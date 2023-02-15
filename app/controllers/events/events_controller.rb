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

  # ! イベント投稿を更新するメソッド (フォーム入力)
  def edit
    @event = Event.find(params[:event_id])

    # * 投稿者でない場合リダイレクトする
    if @event.user.id != current_user.id
      redirect_to action: :index
    end
  end

  # ! イベント投稿を更新するメソッド （DB更新）
  def update
    @event = Event.find(params[:event_id])

    # * 投稿者でない場合リダイレクトする
    if @event.user.id != current_user.id
      redirect_to action: :index
    end

    if @event.update(event_params)
      redirect_to action: :index
    else
      render :edit
    end
  end

  private

  def event_params
    params.require(:event).permit(:title, :content, :belongings, :place)
  end
end
