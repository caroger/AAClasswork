import React from "react";
import ReactDOM from "react-dom";
import App from "./components/app";
import configureStore from "../frontend/store/store";
import { receiveTodo, receiveTodos, removeTodo } from "./actions/todo_actions";
import { receiveStep, receiveSteps, removeStep } from "./actions/step_actions";
// const store = configureStore;
// window.store = store;
// window.receiveTodo = receiveTodo;
// window.receiveTodos = receiveTodos;
// window.removeTodo = removeTodo;
// window.receiveStep = receiveStep;
// window.receiveSteps = receiveSteps;
// window.removeStep = removeStep;

document.addEventListener("DOMContentLoaded", () => {
  const root = document.getElementById("content");
  ReactDOM.render(<App />, root);
});
