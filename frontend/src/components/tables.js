import React, { Component } from 'react';

export function renderTable(state, layerName = 'No Layer Name', testTitle = 'Hovered Point') {
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
            {state['county_name'] || 'None'} County, {state['state_name']}
          </td>
        </tr>
        <tr>
          <th>Entity Name</th>
          <td> {state.entity_name || 'No entity selected'} </td>
        </tr>
        <tr>
          <th>Entity Type</th>
          <td> {state.entity_type || 'No entity selected'} </td>
        </tr>
        <tr>
          <th>Polsby</th>
          <td> {state.polsby_popper || 'NaN'} </td>
        </tr>
        <tr>
          <th>schwartzberg </th>
          <td> {state.schwartzberg || 'NaN'} </td>
        </tr>
      </tbody>
    </table>
  );
}

export function LayerInfo(state) {
  let data = [];
  return (
    <div
      id="overlay-control"
      style={{
        position: 'absolute',
        bottom: 20,
        left: 20,
        zIndex: 99,
        pointerEvents: 'none',
        backgroundColor: 'coral',
        borderRadius: '10px',
        border: '1px solid black'
      }}
    >
      <div
        style={{
          padding: '1em',
          marginBottom: '2em',
          width: 500
        }}
      >
        <div>{renderTable(state.state)}</div>
      </div>
    </div>
  );
}
