export function to_feature_collection(arr) {
  let features = [];
  for (var precinct in arr) {
    const {
      state_name,
      county_name,
      precinct_name,
      centroid,
      st_asgeojson,
      polsby_popper,
      schwartzberg
    } = arr[precinct];
    features.push({
      type: 'Feature',
      geometry: st_asgeojson,
      properties: {
        county_name: county_name,
        precinct_name: precinct_name,
        title: precinct_name,
        polsby_popper: polsby_popper,
        schwartzberg: schwartzberg
      }
    });
    features.push({
      type: 'Feature',
      geometry: centroid,
      properties: {
        title: precinct_name
      }
    });
  }
  return {
    type: 'FeatureCollection',
    features: features
  };
}

export function data_to_labels(arr) {
  let labels = [];
  for (var precinct in arr) {
    const { precinct_name, centroid } = arr[precinct];
    labels.push({
      text: precinct_name,
      coordinates: JSON.parse(centroid).coordinates
    });
  }
  return labels;
}
