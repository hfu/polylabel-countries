require 'json'

data = JSON::parse(File.read('polylabel-countries-all.geojson'))
maxes = Hash.new {|h,k| h[k] = 0}
data['features'].each {|f|
  maxes[f['properties']['ISO_A3']] = [
    f['properties']['_area'],
    maxes[f['properties']['ISO_A3']]
  ].max
}
maxes['MYS'] = 131341054
target = {:type => 'FeatureCollection', :features => []}
data['features'].each {|f|
  if(maxes[f['properties']['ISO_A3']] == f['properties']['_area'])
    f['properties']['ISO_A3'] = 'FRA' if f['properties']['ADMIN'] == 'France'
    f['properties'].delete('_area')
    target[:features].push(f)
  else
  end
}
File.write('polylabel-countries.geojson', JSON::dump(target))
