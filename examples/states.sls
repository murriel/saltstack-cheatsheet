# Examples for common states

multiple_files:
  file.managed:
    - user:
    - group:
    - file_mode:
    - names:
      - /path/to/some/file1:
        - source: salt://path/to/source/file1
      - /path/to/some/file2:

multiple_directories:
  file.directory:
    - user:
    - group:
    - names:
      - /path/to/dir1
      - /path/to/dir2
      - /path/test/{{ salt['pillar.get']('build','test') }}
# look for 'build' pillar but if empty, use 'test'
