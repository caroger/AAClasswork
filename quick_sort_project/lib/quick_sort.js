function quickSort(array) {
  if (array.length <= 1) return array;

  let pivot = array.shift();
  let left = quickSort(array.filter((e) => e <= pivot));
  let right = quickSort(array.filter((e) => e > pivot));

  return [...left, pivot, ...right];
}

module.exports = {
  quickSort,
};

