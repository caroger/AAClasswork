function insertionSort(arr) {
  if (arr.length <= 1) return arr;

  for (let i = 1; i < arr.length; i++) {
    let cur = arr[i];
    for (let j = i - 1; j >= 0; j--) {
      if (arr[j] >= cur) {
        [arr[j + 1], arr[j]] = [arr[j], arr[j + 1]];
      }
    }
  }
}

module.exports = {
  insertionSort,
};

