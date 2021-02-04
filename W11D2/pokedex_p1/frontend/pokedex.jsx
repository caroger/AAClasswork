import React from "react";
import ReactDOM from "react-dom";
import configureStore from "../frontend/store/store";
import { receiveAllPokemon } from "./actions/pokemon_actions";
import { fetchAllPokemon } from "./util/api_util";

// TODO: for testing only
window.receiveAllPokemon = receiveAllPokemon;
window.fetchAllPokemon = fetchAllPokemon;

document.addEventListener("DOMContentLoaded", () => {
  const rootEl = document.getElementById("root");
  let store;
  store = configureStore();
  window.getState = store.getState;
  window.dispatch = store.dispatch;
  ReactDOM.render(<h1>Pokedex</h1>, rootEl);
});
