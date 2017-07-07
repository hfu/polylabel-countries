task :default do
  sh "../geojson-polygon-labels/bin/geojson-polygon-labels --include-area=true ../geo-countries/data/countries.geojson > polylabel-countries-all.geojson"
  sh "ruby filter.rb"
  sh "../tippecanoe/tippecanoe -f --output=polylabel-countries.mbtiles --layer=polylabel --minimum-zoom=0 --maximum-zoom=8 --base-zoom=0 polylabel-countries.geojson"
  sh "ruby fan-out.rb"
end
