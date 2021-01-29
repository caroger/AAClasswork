import React from "react";
import ReactDOM from "react-dom";
import configureStore from "../frontend/store/store";
import { receiveTodo, receiveTodos } from "./actions/todo_actions";

document.addEventListener("DOMContentLoaded", function () {
  const store = configureStore;
  window.store = store;
  window.receiveTodo = receiveTodo;
  window.receiveTodos = receiveTodos;

  ReactDOM.render(
    <h1>Welcome to my to-do app</h1>,
    document.getElementById("root")
  );
});
