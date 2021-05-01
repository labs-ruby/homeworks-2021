# frozen_string_literal: true

def task1(logs)
  exp = %r{/*.+\berror/*.+}
  if logs.match(exp)
    logs.match(exp).to_s
  else
    ''
  end
end
