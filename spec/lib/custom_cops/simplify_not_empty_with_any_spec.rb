require 'rails_helper'

RSpec.describe CustomCops::SimplifyNotEmptyWithAny, :config do
  it 'registers an offense when using `!a.empty?`' do
    expect_offense(<<~RUBY)
      !array.empty?
      ^^^^^^^^^^^^^ ダメです！
    RUBY
  end

  it 'does not register an offense when using `.any?` or `.empty?`' do
    expect_no_offenses(<<~RUBY)
      array.any?
      array.empty?
    RUBY
  end

  it 'corrects `!a.empty?`' do
    expect_offense(<<~RUBY)
      !array.empty?
      ^^^^^^^^^^^^^ ダメです！
    RUBY

    expect_correction(<<~RUBY)
      array.any?
    RUBY
  end
end
