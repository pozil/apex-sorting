public class SortableAccount implements Comparable {
  private final Account account;

  private SortableAccount(Account account) {
    this.account = account;
  }

  /**
   * Sort accounts based on ShippingCountry
   */
  public Integer compareTo(Object otherObject) {
    SortableAccount other = (SortableAccount) otherObject;
    if (this.account.ShippingCountry == other.account.ShippingCountry) {
      return 0;
    }
    if (this.account.ShippingCountry > other.account.ShippingCountry) {
      return 1;
    }
    return -1;
  }

  /**
   * Sorts a list of Account records using SortableAccount
   */
  public static void sort(List<Account> accounts) {
    // Convert List<Account> into List<SortableAccount>
    List<SortableAccount> sortableAccounts = new List<SortableAccount>();
    for (Account acc : accounts) {
      sortableAccounts.add(new SortableAccount(acc));
    }

    // Sort accounts using SortableAccount.compareTo
    sortableAccounts.sort();

    // Overwrite the original account list with the sorted list
    // Doing this avoids a return statement
    // (less verbose and reduces risk of errors)
    for (Integer i = 0; i < accounts.size(); i++) {
      accounts[i] = sortableAccounts[i].account;
    }
  }
}
