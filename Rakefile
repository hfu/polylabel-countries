task :default do
  sh "../geojson-polygon-labels/bin/geojson-polygon-labels --include-area=true ../geo-countries/data/countries.geojson > polylabel-countries-all.geojson"
  sh "ruby filter.rb"
end
