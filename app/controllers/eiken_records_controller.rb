class EikenRecordsController < ApplicationController
  def index
    @eiken_records = current_user.eiken_records.order(exam_date: :desc)

    @score_data = @eiken_records.map { |record| [record.exam_date, record.total_score] }
  end

  def show
    @eiken_record = current_user.eiken_records.find(params[:id])
  end

  def new
    @eiken_record = EikenRecord.new
  end

  def create
    @eiken_record = current_user.eiken_records.build(eiken_records_params)
    if @eiken_record.save
      redirect_to eiken_records_path, notice: "英検スコアを新しく記録しました"
    else
      render :new, status: :unprocessable_entity
      flash.now[:danger] = "新しく記録できませんでした。"
    end
  end

  def edit
    @eiken_record = current_user.eiken_records.find(params[:id])
  end

  def update
    @eiken_record = current_user.eiken_records.find(params[:id])
    if @eiken_record.update(eiken_records_params)
      redirect_to eiken_records_path, notice: "英検スコアを更新しました"
    else
      render :edit, status: :unprocessable_entity
      flash.now[:danger] = "更新できませんでした。"
    end
  end

  def destroy
    @eiken_record = current_user.eiken_records.find(params[:id])
    @eiken_record.destroy
    redirect_to eiken_records_path, notice: "削除しました"
  end

  private

  def eiken_records_params
    params.require(:eiken_record).permit(:level, :speaking_score, :reading_score, :listening_score, :writing_score, :exam_date, :passed, :memo)
  end
end
