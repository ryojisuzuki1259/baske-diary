module DiariesHelper
    def color
      if @diary.score > 0.0
        "green-color"
      elsif @diary.score < 0.0
        "blue-color"
      elsif @diary.score == nil
        "noscore"
      end
    end
end
