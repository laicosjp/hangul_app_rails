# typed: true

class Api::V1::Words::RecordsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_word

  def show
    @word_record = current_user.word_records.find_by!(word_id: @word.id)
  end

  def update
    @word_record = current_user.word_records.find_or_initialize_by(word_id: @word.id)
    @word_record.first_studied_at ||= Time.current
    @word_record.last_studied_at = Time.current
    @word_record.step = word_record_params[:status] == 'correct' ? @word_record.next_step : @word_record.previous_step
    @word_record.next_scheduled_question_at = @word_record.last_studied_at + @word_record.step_before_type_cast.minutes

    if @word_record.update(word_record_params)
      render :show
    else
      render json: { data: @word_record.errors.full_messages }
    end
  end

  private

    def set_word
      @word = Word.find(params[:word_id])
    end

    def word_record_params
      params.require(:word_records).permit(:status)
    end
end
