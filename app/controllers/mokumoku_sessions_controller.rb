class MokumokuSessionsController < ApplicationController
  def index
    # 未削除、期限有効なセッションのみ取得
    @mokumoku_sessions = MokumokuSession.valid
                                        .includes(:user)
                                        .where(users: { is_deleted: false })
                                        .order(created_at: :desc)
  end

  def new
    return render template: "errors/render_404", layout: false, status: :not_found unless user_signed_in?
    @mokumoku_session = MokumokuSession.new
  end

  def create
    return render template: "errors/render_404", layout: false, status: :not_found unless user_signed_in?

    @mokumoku_session = MokumokuSession.new(mokumoku_session_params)
    return render template: "errors/render_404", layout: false, status: :not_found unless @mokumoku_session.creator_user_id == current_user.id

    # 投稿から12時間経ったら投稿を非表示
    @mokumoku_session.expired_at = Time.zone.now + 12.hours

    if @mokumoku_session.save
      flash[:notice] = "もくもく会を作成しました！"
      redirect_to mokumoku_sessions_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
    def mokumoku_session_params
      params.expect(mokumoku_session: [ :creator_user_id, :title, :description, :session_url, :expired_at ])
    end
end
