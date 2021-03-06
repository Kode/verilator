#!/usr/bin/perl
if (!$::Driver) { use FindBin; exec("$FindBin::Bin/bootstrap.pl", @ARGV, $0); die; }
# DESCRIPTION: Verilator: Verilog Test driver/expect definition
#
# Copyright 2003 by Wilson Snyder. This program is free software; you can
# redistribute it and/or modify it under the terms of either the GNU
# Lesser General Public License Version 3 or the Perl Artistic License
# Version 2.0.

scenarios(simulator => 1);

top_filename("t/t_unopt_combo.v");

compile(
    verilator_flags2 => ['+define+ISOLATE --stats'],
    );

if ($Self->{vlt_all}) {
    file_grep($Self->{stats}, qr/Optimizations, isolate_assignments blocks\s+5/i);
}

execute(
    );

ok(1);
1;
