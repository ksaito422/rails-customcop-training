class ApplicationController < ActionController::Base
  def hoge
    hoge = (1..10).to_a

    # return unless hoge.is_a?(Array) && !hoge.empty?
    if hoge.is_a?(Array) && !hoge.empty?
      logger hoge.length
      logger hoge
    end
  end
end
