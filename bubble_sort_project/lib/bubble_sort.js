function swap(array, idx1, idx2) {
  [array[idx1], array[idx2]] = [array[idx2], array[idx1]];
  return array;
}

function bubbleSort(array) {
  let sorted = false;
  let n = array.length;
  while (sorted === false) {
    sorted = true;
    for (let i = 0; i < n - 1; i++) {
      if (array[i] > array[i + 1]) {
        swap(array, i, i + 1);
        sorted = false;
      }
    }
    n--;
  }
}

module.exports = {
  bubbleSort,
  swap,
};
