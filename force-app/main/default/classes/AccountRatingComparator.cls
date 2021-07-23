/**
 * Compares account records based on Rating value as defined in the picklist order (not alphabetically).
 * This is used to sort account lists.
 */
public class AccountRatingComparator implements ListUtils.Comparator {
  // Cache for converting rating values from String to Integer
  private static Map<String, Integer> ratingValues;

  static {
    // Build cache of String to Integer rating values
    ratingValues = new Map<String, Integer>();
    List<Schema.PicklistEntry> ratingPicklistEntries = Account.Rating.getDescribe()
      .getPicklistValues();
    for (Integer i = 0; i < ratingPicklistEntries.size(); i++) {
      ratingValues.put(ratingPicklistEntries[i].getValue(), i);
    }
  }

  public Integer compare(Object o1, Object o2) {
    // Make sure that the two Object instances are Account instances
    if (!(o1 instanceof Account && o2 instanceof Account)) {
      throw new ListUtils.CompareException(
        'Accounts cannot be compared: ' +
        o1 +
        ' AND ' +
        o2
      );
    }
    Integer value1 = getRatingValueAsInteger(((Account) o1).Rating);
    Integer value2 = getRatingValueAsInteger(((Account) o2).Rating);
    if (value1 == value2) {
      return 0;
    }
    if (value1 > value2) {
      return 1;
    }
    return -1;
  }

  private Integer getRatingValueAsInteger(String rating) {
    // If rating is null, return highest value
    if (rating == null) {
      return ratingValues.size();
    }

    // Get rating value based on String
    Integer value = ratingValues.get(rating);
    if (value == null) {
      throw new ListUtils.CompareException('Invalid rating value: ' + rating);
    }
    return value;
  }
}
