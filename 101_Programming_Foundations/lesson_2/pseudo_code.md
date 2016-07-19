# Pseudo-Code exercises

Write out pseudo-code (both casual and formal) that does the following:

1. a method that returns the sum of two integers
1. a method that takes an array of strings, and returns a string that is all those strings concatenated together
1. a method that takes an array of integers, and returns a new array with every other element

### A method that returns the sum of two integers

**Casual form**:

```ruby
- Define a method called sum_two_integers with two arguments (.e.g `x` and `y`)
  - set a variable called 'sum' which equals the sum of the two arguments
```


**Formal Form**:

```ruby
START

DEF sum_two_integers(x, y)
  SET sum = x + y

END
```


### A method that takes an array of strings, and returns a string that is all those strings concatenated together

**Casual form**:

```ruby
- Define a method called join_strings with an array as argument
  - Use the `join` method on the array to return all the strings concatenated together.
```

**Formal form**:

```ruby
START

DEF join_strings(array)
  SET array.join

END
```

### A method that takes an array of integers, and returns a new array with every other element

**Casual form**:

```ruby
- Define a method called every_other_int that takes as arguments an array and an option that is set to default as even but can be also set to odd.
  - Use the select method on the array to select either the elements with even indexes or with odd indexes (use 'array.select.with_index').
```

**Formal form**:

```ruby
START

DEF every_other_int(array, option="even")
  IF option is SET to "even"
    array.select.with_index those numbers with even indexes
  ELSE IF option is SET to "odd"
    array.select.with_index those numbers with odd indexes

END
```

