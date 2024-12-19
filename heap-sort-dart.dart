void main() {
  // Example usage
  List<int> numbers = [12, 11, 13, 5, 6, 7, 3];
  print('Original array: $numbers');
  
  heapSort(numbers);
  print('Sorted array: $numbers');
}

void heapSort(List<int> arr) {
  int n = arr.length;

  // Build max heap
  for (int i = (n ~/ 2) - 1; i >= 0; i--) {
    heapify(arr, n, i);
  }

  // Extract elements from heap one by one
  for (int i = n - 1; i > 0; i--) {
    // Move current root to end
    int temp = arr[0];
    arr[0] = arr[i];
    arr[i] = temp;

    // Call heapify on reduced heap
    heapify(arr, i, 0);
  }
}

void heapify(List<int> arr, int n, int i) {
  int largest = i;
  int left = 2 * i + 1;
  int right = 2 * i + 2;

  // If left child is larger than root
  if (left < n && arr[left] > arr[largest]) {
    largest = left;
  }

  // If right child is larger than largest so far
  if (right < n && arr[right] > arr[largest]) {
    largest = right;
  }

  // If largest is not root
  if (largest != i) {
    int temp = arr[i];
    arr[i] = arr[largest];
    arr[largest] = temp;

    // Recursively heapify the affected sub-tree
    heapify(arr, n, largest);
  }
}

// Utility function to print the array (for testing)
void printArray(List<int> arr) {
  for (int i = 0; i < arr.length; i++) {
    print(arr[i]);
  }
}
