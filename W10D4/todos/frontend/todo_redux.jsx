import React from "react";
import ReactDOM from "react-dom";
import configureStore from "../frontend/store/store";
import { receiveTodo, receiveTodos, removeTodo } from "./actions/todo_actions";
import { receiveStep, receiveSteps, removeStep } from "./actions/step_actions";

document.addEventListener("DOMContentLoaded", function () {
  const store = configureStore;
  window.store = store;
  window.receiveTodo = receiveTodo;
  window.receiveTodos = receiveTodos;
  window.removeTodo = removeTodo;
  window.receiveStep = receiveStep;
  window.receiveSteps = receiveSteps;
  window.removeStep = removeStep;

  ReactDOM.render(
    <h1>Welcome to my to-do app</h1>,
    document.getElementById("root")
  );
});
