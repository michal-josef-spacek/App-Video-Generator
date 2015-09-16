package App::Video::Generator;

# Pragmas.
use strict;
use warnings;

# Modules.
use English;
use Error::Pure qw(err);
use Getopt::Std;
use Video::Generator;

# Version.
our $VERSION = 0.04;

# Constructor.
sub new {
	my $class = shift;

	# Create object.
	my $self = bless {}, $class;

	# Object.
	return $self;
}

# Run script.
sub run {
	my $self = shift;

	# Process arguments.
	$self->{'_opts'} = {
		'd' => 10000,
		'f' => 60,
		'h' => 0,
		's' => '1920x1080',
		'v' => 0,
	};
	if (! getopts('d:f:hs:v', $self->{'_opts'}) || @ARGV < 1
		|| $self->{'_opts'}->{'h'}) {

		print STDERR "Usage: $0 [-d duration] [-f fps] [-h]\n\t".
			"[-s size] [-v] [--version] output_file\n\n";
		print STDERR "\t-d duration\tDuration in numeric value or ".
			"with ms/s suffix\n\t\t\t(default value is 10000 ".
			"[=10s]).\n";
		print STDERR "\t-f fps\t\tFrame rate\n";
		print STDERR "\t-h\t\tPrint help.\n";
		print STDERR "\t-s size\t\tSize (default value is ".
			"1920x1080).\n";
		print STDERR "\t-v\t\tVerbose mode.\n";
		print STDERR "\t--version\tPrint version.\n";
		exit 1;
	}
	$self->{'_output_file'} = $ARGV[0];

	# Check size.
	if ($self->{'_opts'}->{'s'} !~ m/^(\d+)x(\d+)$/ms) {
		err 'Bad size value.', 'Value', $self->{'_opts'}->{'s'};
	}
	$self->{'_width'} = $1;
	$self->{'_height'} = $2;

	# Run.
	eval {
		my $vg = Video::Generator->new(
			'duration' => $self->{'_opts'}->{'d'},
			'fps' => $self->{'_opts'}->{'f'},
			'height' => $self->{'_height'},
			'verbose' => $self->{'_opts'}->{'v'},
			'width' => $self->{'_width'},
		);
		$vg->create($self->{'_output_file'});
	};
	if ($EVAL_ERROR) {
		err 'Cannot create video.';
	}
	return 0;
}

1;

__END__

=pod

=encoding utf8

=head1 NAME

App::Video::Generator - Perl class for video-generator application.

=head1 SYNOPSIS

 use App::Video::Generator;
 my $obj = App::Video::Generator->new;
 $obj->run;

=head1 METHODS

=over 8

=item C<new()>

 Constructor.

=item C<run()>

 Run.

=back

=head1 ERRORS

 new():
         Bad size value.
                 Value: %s
         From Class::Utils:
                 Unknown parameter '%s'.

 run():
         Cannot create video.

=head1 EXAMPLE

 # Pragmas.
 use strict;
 use warnings;

 # Modules.
 use App::Video::Generator;

 # Run.
 App::Video::Generator->new->run;

 # Output like:
 # Usage: /tmp/7b3GEofrss [-d duration] [-f fps] [-h]
 #         [-s size] [-v] [--version] output_file
 #
 #         -d duration     Duration in numeric value or with ms/s suffix
 #                         (default value is 10000 [=10s]).
 #         -f fps          Frame rate
 #         -h              Print help.
 #         -s size         Size (default value is 1920x1080).
 #         -v              Verbose mode.
 #         --version       Print version.

=head1 DEPENDENCIES

L<English>,
L<Error::Pure>,
L<Getopt::Std>,
L<Video::Generator>.

=head1 REPOSITORY

L<https://github.com/tupinek/App-Video-Generator>.

=head1 AUTHOR

Michal Špaček L<mailto:skim@cpan.org>

L<http://skim.cz>

=head1 LICENSE AND COPYRIGHT

 © 2015 Michal Špaček
 BSD 2-Clause License

=head1 VERSION

0.04

=cut
