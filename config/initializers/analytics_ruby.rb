Analytics = Segment::Analytics.new({
    write_key: 'YFlrCTAoD85e92jJif1Tk0cOROLjAqH7',
    on_error: Proc.new { |status, msg| print msg }
})