#!/usr/bin/env puma
# frozen_string_literal: true

rackup DefaultRackup
port ENV['PORT'] || 8080
stdout_redirect(stdout = '/dev/stdout', stderr = '/dev/stderr', append = true)
