class MaterialReviewsController < ApplicationController
  def index
    @material_reviews = MaterialReview.valid
                                      .includes(:user)
                                      .where(users: { is_deleted: false })
                                      .order(created_at: :desc)
  end

  def new
    return render template: "errors/render_404", layout: false, status: :not_found unless user_signed_in?
    @material_review = MaterialReview.new
  end

  def create
    return render template: "errors/render_404", layout: false, status: :not_found unless user_signed_in?

    @material_review = MaterialReview.new(material_review_params)
    return render template: "errors/render_404", layout: false, status: :not_found unless @material_review.user_id == current_user.id
    @score = material_review_params[:score].to_i

    if @material_review.save
      flash[:notice] = "レビューを投稿しました！"
      redirect_to material_reviews_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
    def material_review_params
      params.require(:material_review).permit(:user_id, :title, :material_url, :score, :description)
    end
end
