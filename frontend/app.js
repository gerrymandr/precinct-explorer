/* global window,document */
import React, { Component } from "react";
import { render } from "react-dom";
import MapGL from "react-map-gl";
import DeckGL, { GeoJsonLayer } from "deck.gl";
import Dropdown from "react-dropdown";

import { json as requestJson } from "d3-request";

// Set your mapbox token here
const MAPBOX_TOKEN = process.env.MapboxAccessToken;

const NC = require("./nc2012_results.json");

const colorScale = r => [r * 255, 140, 200 * (1 - r)];

const state_options = [
  "Alabama",
  "Alaska",
  "Arizona",
  "Arkansas",
  "California",
  "Colorado",
  "Connecticut",
  "Delaware",
  "District of Columbia",
  "Florida",
  "Georgia",
  "Hawaii",
  "Idaho",
  "Illinois",
  "Indiana",
  "Iowa",
  "Kansas",
  "Louisiana",
  "Maine",
  "Maryland",
  "Massachusetts",
  "Michigan",
  "Minnesota",
  "Mississippi",
  "Missouri",
  "Montana",
  "Nebraska",
  "Nevada",
  "New Hampshire",
  "New Jersey",
  "New Mexico",
  "New York",
  "North Carolina",
  "North Dakota",
  "Ohio",
  "Oklahoma",
  "Oregon",
  "Pennsylvania",
  "Puerto Rico",
  "South Carolina",
  "South Dakota",
  "Tennessee",
  "Texas",
  "Utah",
  "Vermont",
  "Virginia",
  "Washington",
  "West Virginia",
  "Wisconsin",
  "Wyoming"
];

const shape_options = ["US Congressional Districts", "Census VTD Precincts"];

function renderTable(
  state,
  layerName = "No Layer Name",
  testTitle = "Hovered Point"
) {
  return (
    <table width="100%">
      <thead>
        <tr>
          <th />
          <th>{testTitle}</th>
        </tr>
      </thead>
      <tbody>
        <tr>
          <th>Year</th>
          <td> 2012 </td>
        </tr>
        <tr>
          <th>County, State</th>
          <td>
            {state["county_name"] || "None"} County, {state["state_name"]}
          </td>
        </tr>
        <tr>
          <th>Entity Name</th>
          <td> {state.entity_name || "No entity selected"} </td>
        </tr>
        <tr>
          <th>Entity Type</th>
          <td> {state.entity_type || "No entity selected"} </td>
        </tr>
      </tbody>
    </table>
  );
}

function LayerInfo(state) {
  let data = [];
  return (
    <div
      id="overlay-control"
      style={{
        position: "absolute",
        bottom: 20,
        left: 20,
        zIndex: 99,
        pointerEvents: "none"
      }}
    >
      <div
        style={{
          padding: "1em",
          marginBottom: "2em",
          width: 500
        }}
      >
        <div>{renderTable(state.state)}</div>
      </div>
    </div>
  );
}

function StateDropdown({ value, on_change }) {
  return (
    <div
      id="overlay-control"
      style={{
        position: "absolute",
        top: 20,
        right: 30,
        zIndex: 99,
        pointerEvents: "auto"
      }}
    >
      <div
        style={{
          padding: "1em",
          marginTop: "2em",
          width: 500,
          overflowX: "hidden",
          overflowY: "scroll"
        }}
      >
        <Dropdown
          className="state_select_id"
          options={state_options}
          onChange={on_change}
          value={value}
          placeholder="State"
        />
      </div>
    </div>
  );
}

function EntityDropdown({ value, on_change }) {
  return (
    <div
      id="overlay-control"
      style={{
        position: "absolute",
        top: 20,
        left: 40,
        zIndex: 99,
        pointerEvents: "auto"
      }}
    >
      <div
        style={{
          padding: "1em",
          marginTop: "2em",
          width: 500,
          overflowX: "hidden",
          overflowY: "scroll"
        }}
      >
        <Dropdown
          className="entity_select_id"
          options={shape_options}
          onChange={on_change}
          value={value}
          placeholder="Entity Type"
        />
      </div>
    </div>
  );
}

function to_feature_collection(arr) {
  let features = [];
  for (var precinct in arr) {
    const {
      state_name,
      county_name,
      precinct_name,
      centroid,
      st_asgeojson
    } = arr[precinct];
    features.push({
      type: "Feature",
      geometry: st_asgeojson,
      properties: {
        county_name: county_name,
        precinct_name: precinct_name,
        title: precinct_name
      }
    });
    features.push({
      type: "Feature",
      geometry: centroid,
      properties: {
        title: precinct_name
      }
    });
  }
  return {
    type: "FeatureCollection",
    features: features
  };
}

function data_to_labels(arr) {
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

function rand() {
  return Math.floor(Math.random() * 255) + 0;
}

const PRECINCT_URL = "http://127.0.0.1:5000/shapefiles/precincts?";

class Root extends Component {
  constructor(props) {
    super(props);
    this.state = {
      viewport: {
        latitude: 39.609065,
        longitude: -75.664186,
        zoom: 11,
        maxZoom: 16,
        pitch: 0,
        bearing: 0,
        width: 500,
        height: 500
      },
      data: null,
      hoveredFeature: null,
      state_name: "Delaware",
      county_name: "",
      entity_name: "",
      entity_type: "Census VTD Precincts",
      year: 2012
    };
  }

  _requestStateName() {
    const { state_name } = this.state;
    const url = PRECINCT_URL + "state=" + state_name;
    console.log("Looking up", url);
    requestJson(url, (error, response) => {
      if (!error) {
        this.setState({
          data: to_feature_collection(response),
          state_name: state_name
        });
      } else {
        console.log("boned");
        console.log(error);
      }
    });
  }

  componentDidMount() {
    window.addEventListener("resize", this._resize.bind(this));
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

  _onMouseMove(evt) {
    if (evt.nativeEvent) {
      this.setState({
        mousePosition: [evt.nativeEvent.offsetX, evt.nativeEvent.offsetY]
      });
    }
  }

  _onMouseEnter() {
    this.setState({ mouseEntered: true });
  }

  _onMouseLeave() {
    this.setState({ mouseEntered: false });
  }

  _render_map() {
    const { viewport, data, labels } = this.state;
    if (!data) {
      return null;
    }
    const layer = new GeoJsonLayer({
      id: "geojson",
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
            entity_name: info.object.properties.precinct_name
          });
        }
      }.bind(this)
    });
    return (
      <MapGL
        {...viewport}
        onViewportChange={this._onViewportChange.bind(this)}
        mapboxApiAccessToken={MAPBOX_TOKEN}
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
    const { viewport, data, state_name, entity_type } = this.state;

    if (!data) {
      return null;
    }

    return (
      <div
        onMouseMove={this._onMouseMove.bind(this)}
        onMouseEnter={this._onMouseEnter.bind(this)}
        onMouseLeave={this._onMouseLeave.bind(this)}
      >
        {this._render_map()}
        <LayerInfo state={this.state} />
        <StateDropdown
          value={state_name}
          on_change={this._on_state_select.bind(this)}
        />
        <EntityDropdown
          value={entity_type}
          on_change={this._on_entity_select.bind(this)}
        />
      </div>
    );
  }
}

render(<Root />, document.body.appendChild(document.createElement("div")));
