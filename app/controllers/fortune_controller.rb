class FortuneController < ApplicationController
  respond_to :json

  def do
    @user = User.find(params[:user_id])

    if @user.present?
      @result = {
        user: @user,
        target: params[:unique_str],
        user_fortune_number: fortune_number(@user.birth),
        target_fortune_number: 5
      }
 
      respond_with(@result) do |format|
        format.json {render}
      end
    end
  end

  private
  def fortune_number(birth)
    year_sum = magic_number(birth.year)
    month_sum = magic_number(birth.month)
    day_sum = magic_number(birth.day)

    fortune_sum = year_sum + month_sum + day_sum
    if fortune_sum > 9
      fortune_sum = fortune_sum / 10 + fortune_sum % 10
    end

    fortune_sum
  end

  def magic_number(number)
    sum = 0
    number.to_s.each_byte do |num_str|
      sum += num_str.to_i
    end
    if sum > 9
      sum = (sum / 10).round + sum % 10
    end

    sum
  end
end
