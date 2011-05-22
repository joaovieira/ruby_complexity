require 'metric_fu'
require 'ruby_complexity'

class MetricFu::FlogBluffGrapher
  def graph!
    if File.basename(MetricFu.output_directory) == RubyComplexity::ANALYSER.underscore
      content = <<-EOS
        var g = new Bluff.Line('#{RubyComplexity::NAME}', '550x330');
        g.theme_pastel();
        g.tooltips = true;
        g.hide_title = 'true';
        g.data('average', [#{@flog_average.join(',')}]);
        g.data('top 5%', [#{@top_five_percent_average.join(',')}])
        g.labels = #{@labels.to_json};
        g.draw();
      EOS

      File.open(File.join(MetricFu.output_directory, 'flog.js'), 'w') {|f| f << content }
    end
  end
end
