"""
---
name: #{project.name}
version: 0.0.0
authors:
- #{git.name} <#{git.email}>
targets:
  #{project.name}:
    main: src/bin/#{project.name}.cr
crystal: ">= 1.15.1"
"""
