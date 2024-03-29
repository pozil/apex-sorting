> **Warning**
> Starting from Winter '24, use the new [Comparator](https://developer.salesforce.com/docs/atlas.en-us.apexref.meta/apexref/apex_interface_System_Comparator.htm) interface instead of this.

# Sample Code for Sorting in Apex

This repository contains sample code for advanced sorting with Apex. It presents two approaches that go beyond the default [List.sort](https://developer.salesforce.com/docs/atlas.en-us.apexcode.meta/apexcode/langCon_apex_collections_lists_sorting.htm) method.

## Sorting Lists of sObjects with Custom Ordering

[SortableAccount](force-app/main/default/classes/SortableAccount.cls) demonstrates how you can sort a list of Account records based on the `ShippingCountry` field:

```apex
SortableAccount.sort(List<Account>);
```

## Sorting Lists with Reusable Comparators

[ListUtils](force-app/main/default/classes/ListUtils.cls) and the [Comparator](force-app/main/default/classes/ListUtils.cls#L21) interface demonstrate how you can sort lists with custom reusable comparators such as:

```apex
// Sort a list of accounts alphabetically based on shipping country
ListUtils.sort(accounts, new SObjectStringFieldComparator('ShippingCountry'));

// Sort a list of accounts alphabetically based on industry
ListUtils.sort(accounts, new SObjectStringFieldComparator('Industry'));

// Sort a list of accounts based on rating values
// as defined in the rating picklist order (non-alphabetical sort)
ListUtils.sort(accounts, new AccountRatingComparator());
```

**A note on performance:** `ListUtils` uses a bubble sort algorithm. This works fine in most cases but other algorithms may be more efficient depending on the type and volume of data that you are sorting.
