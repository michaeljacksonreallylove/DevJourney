module ApplicationHelper
  def to_user_id(member_id)
    user_id = member_id[2..-3].to_i / 3 - 17_674_114
    member_id2 = (user_id * 413).to_s[1, 2] + ((17_674_114 + user_id) * 3).to_s + (user_id * 794).to_s[1, 2]
    if member_id == member_id2
      return user_id
    else
      return false
    end
  end

  def datetime_to_date_string(datetime)
    datetime&.strftime("%Y-%-m-%-d %H:%M")
  end
end
