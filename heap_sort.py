def swap(arr, i, j):
    arr[i], arr[j] = arr[j], arr[i]


def heapify(arr, n, i):
    v = arr[i]
    left_i = i * 2 + 1
    right_i = i * 2 + 2

    left_v = float("-inf") if left_i >= n else arr[left_i]
    right_v = float("-inf") if right_i >= n else arr[right_i]

    if v > left_v and v > right_v:
        return
    swap_i = left_i if left_v > right_v else right_i

    swap(arr, i, swap_i)
    heapify(arr, n, swap_i)


def heap_sort(arr):
    n = len(arr)
    for i in reversed(range(n)):
        heapify(arr, n, i)

    for i in reversed(range(n)):
        swap(arr, i, 0)
        heapify(arr, i, 0)


array = [1, 8, 10, -8, -4, 99, 74]

heap_sort(array)
print(array)
