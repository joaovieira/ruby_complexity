class MetricFu::FlogBluffGrapher
  def graph!
    content = <<-EOS
      var g = new Bluff.Line('Complexity', '400x240');
      g.theme_pastel();
      g.tooltips = true;
      g.title_font_size = '16px';
      g.legend_font_size = '8px';
      g.marker_font_size = '7px';
      g.hide_title = 'true';
      g.data('average', [#{@flog_average.join(',')}]);
      g.data('top 5%', [#{@top_five_percent_average.join(',')}])
      g.labels = #{@labels.to_json};
      g.draw();
    EOS

    File.open(File.join(MetricFu.output_directory, 'flog.js'), 'w') {|f| f << content }
  end
end
