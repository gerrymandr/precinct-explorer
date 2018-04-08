/* global window,document */
import React, { Component } from 'react';
import { render } from 'react-dom';
import MapGL from 'react-map-gl';
import DeckGL, { GeoJsonLayer } from 'deck.gl';

import { SHAPE_OPTIONS, STATE_OPTIONS } from './constants';
import { LayerInfo, renderTable } from './components/tables';
import { StateDropdown, EntityDropdown } from './components/menus';
import { to_feature_collection, data_to_labels } from './utilities/geojson';

import { json as requestJson } from 'd3-request';

// Set your mapbox token here

const MAPBOX_TOKEN = process.env.MapboxAccessToken;
const DEFAULT_STYLE = 'mapbox://styles/mapbox/light-v9';

const colorScale = r => [r * 255, 140, 200 * (1 - r)];

function rand() {
  return Math.floor(Math.random() * 255) + 0;
}

const PRECINCT_URL = 'http://127.0.0.1:5000/shapefiles/precincts?';

class Root extends Component {
  constructor(props) {
    super(props);
    this.state = {
      viewport: {
        latitude: 35.33238,
        longitude: -82.13381,
        zoom: 6,
        maxZoom: 16,
        pitch: 0,
        bearing: 0,
        width: 500,
        height: 500
      },
      data: null,
      hoveredFeature: null,
      state_name: 'North Carolina',
      county_name: '',
      entity_name: '',
      polsby_popper: '',
      schwartzberg: '',
      entity_type: 'Census VTD Precincts',
      year: 2012
    };
  }

  _requestStateName() {
    const { state_name } = this.state;
    const url = PRECINCT_URL + 'state=' + state_name;
    requestJson(url, (error, response) => {
      if (!error) {
        this.setState({
          data: to_feature_collection(response),
          state_name: state_name
        });
      } else {
        console.log(error);
      }
    });
  }

  componentDidMount() {
    window.addEventListener('resize', this._resize.bind(this));
    this._resize();
    this._requestStateName();
  }

  _resize() {
    this._onViewportChange({
      width: window.innerWidth,
      height: window.innerHeight
    });
  }

  _render_info_panel() {
    return null;
  }

  _onViewportChange(viewport) {
    this.setState({
      viewport: { ...this.state.viewport, ...viewport }
    });
  }

  _onHover({ x, y, object }) {
    this.setState({ x, y, hoveredFeature: object });
  }

  _onSelect(val) {
    console.log(val);
  }

  _render_map() {
    const { viewport, data, labels } = this.state;
    if (!data) {
      return null;
    }
    const layer = new GeoJsonLayer({
      id: 'geojson_precincts',
      data,
      opacity: 0.4,
      stroked: false,
      filled: true,
      extruded: false,
      wireframe: false,
      fp64: false,
      getFillColor: () => [rand(), rand(), rand(), rand()],
      elevationScale: 0,
      getLineColor: f => [255, 255, 255],
      pickable: true,
      onHover: function(info) {
        if (info && info.object) {
          this.setState({
            county_name: info.object.properties.county_name,
            entity_name: info.object.properties.precinct_name,
            polsby_popper: info.object.properties.polsby_popper,
            schwartzberg: info.object.properties.schwartzberg
          });
        }
      }.bind(this)
    });
    return (
      <MapGL
        {...viewport}
        onViewportChange={this._onViewportChange.bind(this)}
        mapboxApiAccessToken={MAPBOX_TOKEN}
        mapStyle={DEFAULT_STYLE}
      >
        <DeckGL {...viewport} layers={[layer, labels]} />
      </MapGL>
    );
  }

  _on_state_select(value) {
    this.setState(
      { state_name: value.value },
      function() {
        this._requestStateName();
      }.bind(this)
    );
  }

  _on_entity_select(value) {
    this.setState({ entity_type: value.value });
  }

  render() {
    const { data, state_name, entity_type } = this.state;
    if (!data) {
      return null;
    }
    return (
      <div>
        {this._render_map()}
        <LayerInfo state={this.state} />
        <StateDropdown value={state_name} on_change={this._on_state_select.bind(this)} />
        <EntityDropdown value={entity_type} on_change={this._on_entity_select.bind(this)} />
      </div>
    );
  }
}

render(<Root />, document.body.appendChild(document.createElement('div')));
