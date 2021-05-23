class MaxHeap:
    def __init__(self):
        self._ary = [None]

    def insert(self, val):
        self._ary.append(val)
        self.siftUp(len(self._ary)-1)

    def siftUp(self, idx):
        if idx == 1:
            return

        pIdx = idx//2
        if self._ary[idx] > self._ary[pIdx]:
            self._ary[idx], self._ary[pIdx] = self._ary[pIdx], self._ary[idx]
        self.siftUp(pIdx)

    def deleteMax(self):
        maxVal = self._ary[1]
        lastVal = self._ary.pop()
        self._ary[1] = lastVal
        self.siftDown(1)
        return maxVal

    def siftDown(self, idx):
        lIdx, rIdx = idx * 2, idx * 2 - 1
        val = self._ary[idx]

        lVal = self._ary[lIdx] if lIdx < len(self._ary) else float('-inf')
        rVal = self._ary[rIdx] if rIdx < len(self._ary) else float('-inf')
        swapIdx = None

        if val > lVal and val > rVal:
            return
        elif lVal > rVal:
            swapIdx = lIdx
        else:
            swapIdx = rIdx
        self._ary[swapIdx], self._ary[idx] = self._ary[idx], self._ary[swapIdx]
        self.siftDown(swapIdx)

    def __repr__(self):
        return " -> ".join([str(i) for i in self._ary])


heap = MaxHeap()
heap.insert(1)
heap.insert(2)
heap.insert(20)
heap.insert(120)
heap.insert(130)
heap.insert(30)
print(heap)
print(heap.deleteMax())
print(heap.deleteMax())
print(heap.deleteMax())
print(heap.deleteMax())
print(heap)
