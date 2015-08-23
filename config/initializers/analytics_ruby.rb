Analytics = Segment::Analytics.new({
    write_key: 'YTurnXLBsG', 
    on_error: Proc.new { |status, msg| print msg }
})