function merge(array1, array2) {
  let out = [];
  while (array1.length > 0 && array2.length > 0) {
    if (array1[0] < array2[0]) out.push(array1.shift());
    else out.push(array2.shift());
  }
  if (array1.length > 0) out.push(...array1);
  else out.push(...array2);
  return out;
}

function mergeSort(array) {
  if (array.length <= 1) {
    return array;
  }
  let mid = array.length >> 1;

  let leftArr = mergeSort(array.slice(0, mid));
  let rightArr = mergeSort(array.slice(mid));

  return merge(leftArr, rightArr);
}

module.exports = {
  merge,
  mergeSort,
};

console.log(mergeSort([1, 9, 8, 9, 0, 5, 0, 4]));
// console.log(merge([1, 2, 3], [1]));

