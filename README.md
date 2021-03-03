# dlfs

TODO: Write a description here

## Installation

TODO: Write installation instructions here

## Usage

TODO: Write usage instructions here

## Development

TODO: Write development instructions here

## Contributing

1. Fork it (<https://github.com/your-github-user/dlfs/fork>)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Contributors

- [nemorami](https://github.com/your-github-user) - creator and maintainer

## NOTE
  ### num/src/grad/primitives/gate.cr 
   - abstract def cache(result : Num::Grad::Variable(T), *args : Num::Grad::Variable(T))
  ### tensor/internal/random.cr

  ```
  require "alea"


  
  class Num::Rand
    class_getter generator = Alea::Random.new
    class_getter generator = Alea::Random(Alea::XSR128).new
    class_getter stdlib_generator = Random.new
    class_getter stdlib_generator = Random.new
  
    def self.set_seed(seed)
      @@generator = Alea::Random.new(seed)
      @@generator = Alea::Random(Alea::XSR128).new(seed)
      @@stdlib_generator = Random.new(seed)
      @@stdlib_generator = Random.new(seed)
    end  
  end
  ```
  ### num/src/tensor/tensor.cr
   s, o = Indexable.range_to_index_and_count(arg, @shape[i]).not_nil!