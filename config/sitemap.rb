require 'rubygems'
require 'sitemap_generator'

SitemapGenerator::Sitemap.default_host = 'http://whocares.io'
SitemapGenerator::Sitemap.create do
  add '/', :changefreq => 'daily', :priority => 0.9
  add '/professions', :changefreq => 'daily', :priority => 0.8
  add '/tags', :changefreq => 'daily', :priority => 0.8
  add '/conditions', :changefreq => 'daily', :priority => 0.8
  add '/about', :changefreq => 'weekly', :priority => 0.7
end
SitemapGenerator::Sitemap.ping_search_engines # Not needed if you use the rake tasks