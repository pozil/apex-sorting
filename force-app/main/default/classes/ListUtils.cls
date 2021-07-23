public class ListUtils {
  /**
   * Sorts a list of objects using bubble sort algorithm and a comparator
   */
  public static void sort(List<Object> objects, Comparator comparator) {
    Integer n = objects.size();
    for (Integer i = 0; i < n - 1; i++) {
      for (Integer j = 0; j < n - i - 1; j++) {
        if (comparator.compare(objects[j], objects[j + 1]) > 0) {
          Object temp = objects[j];
          objects[j] = objects[j + 1];
          objects[j + 1] = temp;
        }
      }
    }
  }

  /**
   * Interface that specifies how two objects should be compared for ordering
   */
  public interface Comparator {
    /**
     * Compares two objects
     * Returns 0 if objects are equal, 1 first object is 'greater' than the second or 2 otherwise.
     */
    Integer compare(Object o1, Object o2);
  }

  /**
   * Exception thrown when Comparator.compare fails.
   * This can happen when comparing different object types.
   */
  public class CompareException extends Exception {
  }
}
