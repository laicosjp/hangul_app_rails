# typed: true

class Api::V1::Words::RecordsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_word

  def show
    @word_record = current_user.word_records.find_by!(word_id: @word.id)
  end

  def update
    @word_record = current_user.word_records.find_or_initialize_by(word_id: @word.id)

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
      params.require(:word_records).permit(:status).merge(studied_at: Time.current)
    end
end
