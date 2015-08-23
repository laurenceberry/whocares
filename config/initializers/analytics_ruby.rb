Analytics = Segment::Analytics.new({
    write_key: 'jjqlg13k3k',
    on_error: Proc.new { |status, msg| print msg }
})