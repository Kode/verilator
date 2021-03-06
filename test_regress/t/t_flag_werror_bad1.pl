#!/usr/bin/perl
if (!$::Driver) { use FindBin; exec("$FindBin::Bin/bootstrap.pl", @ARGV, $0); die; }
# DESCRIPTION: Verilator: Verilog Test driver/expect definition
#
# Copyright 2003 by Wilson Snyder. This program is free software; you can
# redistribute it and/or modify it under the terms of either the GNU
# Lesser General Public License Version 3 or the Perl Artistic License
# Version 2.0.

scenarios(vlt => 1);

top_filename("t/t_flag_werror.v");

compile(
    v_flags2 => ["--lint-only"],
    fails => $Self->{vlt_all},
    expect =>
q{%Warning-WIDTH: t/t_flag_werror.v:\d+: Operator ASSIGNW expects 4 bits on the Assign RHS, but Assign RHS.s CONST '6'h2e' generates 6 bits.
%Warning-WIDTH: Use .* and lint_on around source to disable this message.
%Error: Exiting due to},
    );

ok(1);
1;
