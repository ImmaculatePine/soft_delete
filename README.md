# SoftDelete

This gem allows you to softly delete your ActiveRecord models.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'soft_delete'
```

And then execute:

    $ bundle

## Usage

Include `SoftDelete` module to your model:

    class Post < ActiveRecord::Base
      include SoftDelete
      # ...
    end

Use `soft_delete` method instead of `destroy`:

    if @post.soft_delete
      redirect_to posts_url, notice: 'Deleted successfuly'
    else
      redirect_to posts_url, alert: 'Something went wrong'
    end

Use `with_deleted` scope to fetch all the records, including the deleted ones:

    @posts = Post.with_deleted

Use `deleted` scope to fetch only deleted records:

    @posts = Post.deleted

Use `restore` method to restore the deleted record:

    @post = Post.deleted.find(params[:id])
    @post.restore

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/ImmaculatePine/soft_delete. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

