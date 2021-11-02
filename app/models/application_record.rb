class ApplicationRecord < ActiveRecord::Base
  include Squishize

  self.abstract_class = true

  cattr_accessor :search_scopes do
    []
  end

  def self.add_scope(name, &block)
    singleton_class.send(:define_method, name.to_sym) do |*args|
      block.call(*args) || all
    end
    search_scopes << name.to_sym
  end

  def self.paginate(args = {})
    args[:page] ||= 1
    args[:per_page] ||= 100

    limit(args[:per_page])
      .offset((args[:page].positive? ? args[:page] - 1 : 0) * args[:per_page])
  end
end
