@isTest
public class AccountRatingComparatorTests {
  private final static Account a1 = new Account(Rating = 'Cold');
  private final static Account a2 = new Account(Rating = 'Cold');
  private final static Account a3 = new Account(Rating = 'Hot');
  private final static Account a4 = new Account(Rating = null);

  @isTest
  private static void sort_works() {
    List<Account> accounts = new List<Account>{ a4, a2, a3, a1 };

    ListUtils.sort(accounts, new AccountRatingComparator());

    List<Account> expected = new List<Account>{ a3, a1, a2, a4 };
    System.assertEquals(accounts, expected);
  }

  @isTest
  private static void sort_fails_when_incompatible_types() {
    String someString;
    List<Object> objects = new List<Object>{ a1, someString };

    try {
      ListUtils.sort(objects, new AccountRatingComparator());
      System.assert(false, 'Expected ListUtils.CompareException');
    } catch (ListUtils.CompareException e) {
      System.assert(true);
    }
  }

  @isTest
  private static void sort_fails_when_invalid_rating_value() {
    Account invalidRatingAccont = new Account(Rating = 'Invalid');
    List<Account> accounts = new List<Account>{ a1, invalidRatingAccont };

    try {
      ListUtils.sort(accounts, new AccountRatingComparator());
      System.assert(false, 'Expected ListUtils.CompareException');
    } catch (ListUtils.CompareException e) {
      System.assert(true);
    }
  }
}
