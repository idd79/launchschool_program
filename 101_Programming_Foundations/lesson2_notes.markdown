# Lesson 2 Notes

## Formal Pseudo-Code

We need to formazlie the pseudo-code a little bit using some keywords to help us break down the logic of the program into concrete commands and later makes translating to program code much easier.

Keywords we can use are:

| keyword             | meaning                              |
| ---                 | ---                                  |
| START               | start of the program                 |
| SET                 | sets a variable we can use for later |
| GET                 | retrieve input from user             |
| PRINT               | displays output to user              |
| READ                | retrieve value from variable         |
| IF / ELSE IF / ELSE | show conditional branches in logic   |
| WHILE               | show looping logic                   |
| END                 | end of program                       |

Example:

```ruby
START

# Given a collection of integers called "numbers"
# Find the greatest number

SET iterator = 1
SET saved_number = value within numbers collection at space 1

WHILE iterator < length of numbers
  SET current_number = value within numbers collection at space "iterator"
  IF saved_number >= current_number
    go to the next iteration
  ELSE
    saved_number = current_number

  iterator = iterator + 1

PRINT saved_number

END
```

- The only disadvantage of pseudo-code is that we cannot verify that the logic in the pseudo-code is sound until we actually go ahead and translate into program code.

- Translating the above pseudo-code to actual programming code would be the following:

```ruby
def find_greatest(numbers)
  saved_number = nil

  numbers.each do |num|
    saved_number ||= num  # assign to first value
    if saved_number >= num
      next
    else
      saved_number = num
    end
  end

  saved_number
end
```

- Look at the conditional assignment operator `||=` which will assign a value to a variable only if that variable is empty, otherwise it will not assign a new value. It is useful in this case to assign the first value to `saved_number`.

- After checking that the above logic works, we can start improving our code. For example, instead of checking whether `saved_number` is set to `nil` in every iteration, we could just assign `saved_number` to `numbers.first` instead (of `saved_number ||= num`).

- For bigger and more sophisticated problems, we need to take a piecemeal approach to applying pseudo-code, then translating that to Ruby code to verify the logic is correct, then moving on to the next piece in the problem. Step by step, we can slowly load the problem into our brain, verifying the logic each step along the way.
