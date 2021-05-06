function swap(arr, index1, index2) {
  [arr[index1], arr[index2]] = [arr[index2], arr[index1]];
  // return arr;
}

function selectionSort(arr) {
  for (let i = 0; i < arr.length; i++) {
    let curMin = arr[i];
    let swapIndex = i;
    for (let j = i + 1; j < arr.length; j++) {
      if (arr[j] < curMin) {
        curMin = arr[j];
        swapIndex = j;
      }
    }

    swap(arr, i, swapIndex);
  }
}

module.exports = {
  selectionSort,
  swap,
};

