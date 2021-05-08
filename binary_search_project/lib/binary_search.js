function binarySearch(array, target) {
  let left = 0;
  let right = array.length - 1;

  while (left <= right) {
    let mid = (left + right) >> 1;
    if (array[mid] === target) return true;
    if (array[mid] < target) {
      left = mid + 1;
    } else {
      right = mid - 1;
    }
  }
  return false;
}

function binarySearchIndex(array, target) {
  let left = 0;
  let right = array.length - 1;

  while (left <= right) {
    let mid = (left + right) >> 1;
    if (array[mid] === target) return mid;
    if (array[mid] < target) left = mid + 1;
    if (array[mid] > target) right = mid - 1;
  }
  return -1;
}

module.exports = {
  binarySearch,
  binarySearchIndex,
};
