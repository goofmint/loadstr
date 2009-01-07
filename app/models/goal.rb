class Goal < ActiveRecord::Base
  belongs_to :user
  has_many :histories
  
  def totallines
    result = []
    ary = {}
    last = 0
    self.histories.each {|h| ary[h.history_at.strftime("%Y%m%d").to_i] = h}
    for j in time_range
      j = (Date.new(2009, 1, 1) + j.days).strftime("%Y%m%d").to_i
      result << (ary[j].nil? ? last : ary[j].after_number.to_i)
      last = result.last
    end
    result
  end
  
  def sparklines
    result = []
    ary = {}
    self.histories.each {|h| ary[h.history_at.strftime("%Y%m%d").to_i] = h}
    for j in time_range
      j = (Date.new(2009, 1, 1) + j.days).strftime("%Y%m%d").to_i
      result << (ary[j].nil? ? 0 : ary[j].number.to_i)
    end
    result
  end

  def has_text?
    (!self.message.blank? && !(self.number == 0) && !self.message.blank?)
  end
  
  private
  def time_range
    1..(Date.today - Date.new(2009, 1, 1)).to_i
  end
end
