@isTest
public class SortableAccountTests {
  private final static Account a1 = new Account(ShippingCountry = 'A');
  private final static Account a2 = new Account(ShippingCountry = 'A');
  private final static Account a3 = new Account(ShippingCountry = 'B');
  private final static Account a4 = new Account(ShippingCountry = 'C');

  @isTest
  private static void sort_works() {
    List<Account> accounts = new List<Account>{ a4, a2, a3, a1 };

    SortableAccount.sort(accounts);

    List<Account> expected = new List<Account>{ a2, a1, a3, a4 };
    System.assertEquals(accounts, expected);
  }

  @isTest
  private static void compareTo_fails_when_incompatible_type() {
    SortableAccount sa1 = new SortableAccount(a1);
    Integer i = 1;

    try {
      sa1.compareTo(i);
      System.assert(false, 'Expected SortException');
    } catch (SortableAccount.SortException e) {
      System.assert(true);
    }
  }
}
