#!/usr/bin/env ruby
require 'metric_fu'
require 'templates/rcomplexity/rcomplexity_template'

# Load default configuration
MetricFu::Configuration.run {}

# Load local configuration
MetricFu::Configuration.run do |config|
  #define which metrics you want to use
  config.metrics  = [:flog]
  config.graphs   = [:flog]
  config.template_class = RcomplexityTemplate

  MetricFu::Grapher::BLUFF_GRAPH_SIZE = "600x360"
  MetricFu::Grapher::BLUFF_DEFAULT_OPTIONS = %{ 
      var g = new Bluff.Line('graph', "#{MetricFu::Grapher::BLUFF_GRAPH_SIZE}");
      g.theme_pastel();
      g.tooltips = true;
      g.title_font_size = "20px"
      g.legend_font_size = "8px"
      g.marker_font_size = "8px"
    }
end


