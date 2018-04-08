import React, { Component } from 'react';
import Dropdown from 'react-dropdown';

import { SHAPE_OPTIONS, STATE_OPTIONS } from '../constants';

export function StateDropdown({ value, on_change }) {
  return (
    <div
      id="overlay-control"
      style={{
        position: 'absolute',
        top: 20,
        right: 30,
        zIndex: 99,
        pointerEvents: 'auto',
        backgroundColor: 'coral',
        borderRadius: '10px',
        border: '1px solid black'
      }}
    >
      <div
        style={{
          padding: '1em',
          marginTop: '1em',
          height: 100,
          width: 300,
          overflowX: 'hidden',
          overflowY: 'scroll'
        }}
      >
        <Dropdown
          className="state_select_id"
          options={STATE_OPTIONS}
          onChange={on_change}
          value={value}
          placeholder="State"
        />
      </div>
    </div>
  );
}

export function EntityDropdown({ value, on_change }) {
  return (
    <div
      id="overlay-control"
      style={{
        position: 'absolute',
        top: 20,
        left: 40,
        zIndex: 99,
        pointerEvents: 'auto',
        borderRadius: '10px',
        backgroundColor: 'coral',
        border: '1px solid black'
      }}
    >
      <div
        style={{
          padding: '1em',
          marginTop: '2em',
          height: 50,
          width: 300,
          overflowX: 'hidden',
          overflowY: 'scroll'
        }}
      >
        <Dropdown
          className="entity_select_id"
          options={SHAPE_OPTIONS}
          onChange={on_change}
          value={value}
          placeholder="Entity Type"
        />
      </div>
    </div>
  );
}
