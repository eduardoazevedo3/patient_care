module Squishize
  extend ActiveSupport::Concern

  def self.included(base)
    base.extend(ClassMethods)
  end

  module ClassMethods
    def squishize(*args)
      return if args.size.zero?
      args.each do |name|
        name = name.to_s
        module_eval <<-RUBY
          def #{name}=(#{name})
            super @#{name} = #{name}.to_s.squish
          end
        RUBY
      end
    end
  end
end
