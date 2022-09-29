# Word Count

## Instructions

Given a phrase, count the occurrences of each _word_ in that phrase.

Words are separated by **whitespace**

When counting words you can assume the following rules:

1. The count is _case insensitive_ (i.e. "You", "you", and "YOU" are 3 uses of the same word)
2. The count is _unordered_; the tests will ignore how words and counts are ordered
3. The words can be separated by _any_ form of whitespace (i.e. "\t", "\n", " ").

Example:

For the phrase `"One two three four one one three"` the count would be:

```text
one: 3
two: 1
three: 2
four: 1
```

#### Hint

Check the `.split_whitespace()` method