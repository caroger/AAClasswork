import React from "react";
import ReactDOM from "react-dom";
import configureStore from "../frontend/store/store";
import {
  receiveAllPokemon,
  requestAllPokemon,
} from "./actions/pokemon_actions";
import { fetchAllPokemon } from "./util/api_util";
import { selectAllPokemon } from "./reducers/selectors";
import Root from "./components/root";

// TODO: for testing only
window.receiveAllPokemon = receiveAllPokemon;
window.requestAllPokemon = requestAllPokemon;
window.fetchAllPokemon = fetchAllPokemon;
window.selectAllPokemon = selectAllPokemon;

document.addEventListener("DOMContentLoaded", () => {
  // const rootEl = document.getElementById("root");
  const root = document.getElementById("root");
  const store = configureStore();

  window.getState = store.getState;
  window.dispatch = store.dispatch;
  ReactDOM.render(<Root store={store} />, root);
});
