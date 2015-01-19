module Piranha

  module Checker

    # Public: Check if executable with `name` is present in the current server
    def self.installed?(name)
      !!system("#{name} -h")
    end

  end
end
