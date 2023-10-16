public class Main {
    public static void main(String[] args) {
        int[] arr = {5, 10, 2, 8, 15, 7};
        //int[] arr = {5, 5, 5, 5, 5, 5}  ;
        //int[] arr = {5};
        int secondLargest = findSecondLargest(arr);

        if (secondLargest != -1) {
            System.out.println("The second largest element is: " + secondLargest);
        } else {
            System.out.println(secondLargest);
        }
    }


    public static int findSecondLargest(int[] arr) {
        if (arr == null || arr.length < 2) {
            return -1; // Not enough elements to find the second largest
        }

        int largest = Integer.MIN_VALUE;
        int secondLargest = Integer.MIN_VALUE;

        for (int num : arr) {
            if (num > largest) {
                secondLargest = largest;
                largest = num;
            } else if (num > secondLargest && num != largest) {
                secondLargest = num;
            }
        }

        if (secondLargest == Integer.MIN_VALUE) {
            return -1; // There is no second largest element
        }

        return secondLargest;
    }
}