require_relative "support/helpers"

setup("origin", "user_a")
change_repo("user_a")
run("change start bar")
run("change start foo")

result = `change delete --complete`

if result.lines.collect(&:strip).sort != [ "bar", "foo" ]
  raise "Expected `change delete --complete` to list all changes."
end
