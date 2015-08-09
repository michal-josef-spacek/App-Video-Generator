#!/usr/bin/env perl

# Pragmas.
use strict;
use warnings;

# Modules.
use App::Video::Generator;

# Run.
App::Video::Generator->new->run;

# Output:
# Usage: /tmp/7b3GEofrss [-d duration] [-f fps] [-h]
#         [-s size] --version output_file
#
#         -d duration     Duration (default value is 10000 (=10s)
#         -f fps          Frame rate
#         -h              Help.
#         -s size         Size (default value is 1920x1080).
#         --version       Print version.