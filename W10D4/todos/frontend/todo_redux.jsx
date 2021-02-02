import React from "react";
import ReactDOM from "react-dom";
import Root from "./components/root";
import configureStore from "../frontend/store/store";
import { receiveTodo, receiveTodos, removeTodo } from "./actions/todo_actions";
import { receiveStep, receiveSteps, removeStep } from "./actions/step_actions";
import { allTodos } from "./reducers/selectors";
// TODO  for testing
// window.receiveTodo = receiveTodo;
// window.receiveTodos = receiveTodos;
// window.removeTodo = removeTodo;
// window.receiveStep = receiveStep;
// window.receiveSteps = receiveSteps;
// window.removeStep = removeStep;
window.allTodos = allTodos;

const root = document.getElementById("content");
const store = configureStore;
window.store = store;

document.addEventListener("DOMContentLoaded", () => {
  ReactDOM.render(<Root store={store} />, root);
});
