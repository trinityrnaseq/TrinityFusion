#!/usr/bin/env perl

use strict;
use warnings;
use FindBin;
use lib "$FindBin::Bin/../PerlLib";
use DelimParser;

my $usage = "\n\tusage: $0 fusions.preliminary > fusions.final\n\n";

my $prelim_fusions_file = $ARGV[0] or die $usage;


main: {
    open(my $fh, $prelim_fusions_file) or die "Error, cannot open file: $prelim_fusions_file";
    my $delim_reader = new DelimParser::Reader($fh, "\t");
    my @column_headers = $delim_reader->get_column_headers();

    my $delim_writer = new DelimParser::Writer(*STDOUT, "\t", \@column_headers);

    while (my $row = $delim_reader->get_row()) {
        if ($delim_reader->get_row_val($row, "SpliceType") eq "ONLY_REF_SPLICE") {
            $delim_writer->write_row($row);
        }
    }

    exit(0);
}


        
