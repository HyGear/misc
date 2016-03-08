#!/usr/bin/perl -w 
#
# *************************
# Linestock Generation Tool
# *************************
# Written by: Jarrod Hyder
# Compatibility: Pro/E WF 2.0
# Platform: Windows/Linux
# License: GPLv3
#
# ===========
# Release Log
# +++++++++++
# 10-18-2010: J. Hyder - Initial Release.
# 10-18-2010: J. Hyder - Added code to hide command prompt when script runs.
# 			 Re-organized CSV file layout to improve script performance.

use strict;

use Tk;
use Text::CSV_PP;
use Win32::GUI();

# Block the console from staying visible
my ($DOS) = Win32::GUI::GetPerlWindow();
Win32::GUI::Hide($DOS);

# Global Variables
our $filepath = "";
our $outdir = "";

# Local Variables
my $mw = MainWindow->new;
my $csv = Text::CSV_PP->new();

# Define the GUI
# ==============
# Buttons
my $but = $mw -> Button(-width => 20, -text => "Import Linestock List",
				-command =>\&get_file);
my $but2 = $mw -> Button(-width => 20, -text => "Select Output Directory",
				-command =>\&get_outdir);
my $but3 = $mw -> Button(-width => 20, -text => "Generate Pro/E Files",
				-command =>\&gen_files);
# Logo
my $canvar = $mw -> Canvas(-width => 156, -height => 45);
my $img = $canvar->Photo( 'IMG', 
                     -file => 'logo.gif' ); 
	$canvar->create( 'image',5,5, 
                     '-anchor' => 'nw', 
                     '-image'  => $img );


# Draw the GUI
$canvar -> pack();
$but -> pack();
$but2 -> pack();
$but3 -> pack();

                    

# Subroutine for file selection dialog.
sub get_file 
{
  my @types =
       (["CSV files", [qw/.csv .txt/]],
        ["All files",        '*'],
       );
  $filepath = $mw->getOpenFile(-filetypes => \@types) or return();
  print "$filepath selected\n";
  return($filepath);
}

# Subroutine for directory selection dialog.
sub get_outdir
{
 $outdir = $mw->chooseDirectory(-title => 'Choose an output directory');
 print "$outdir selected\n";
 return($outdir);
}


MainLoop;


# Subroutine for generating the linestock (.stk) files
sub gen_files
{
	if ($filepath ne "" and $outdir ne "") {
		open (CSV, "<", $filepath) or die $!;
		while (<CSV>) {
			if ($csv->parse($_)) {
				my @columns = $csv->fields();
				my $line_file = "";
				if ($columns[2] < 10) {
					$line_file = "$outdir/$columns[3]\-0$columns[2]\.stk";
				}
				else {
					$line_file = "$outdir/$columns[3]\-$columns[2]\.stk";
				}
				print "$line_file\n";
				open NEWFILE, "+>>", $line_file or die $!;
				print NEWFILE "\!Hose Linestock\n";
				print NEWFILE "\!Author\: $columns[1]\n";
				print NEWFILE "\!Created\: $columns[0]\n";
				print NEWFILE "MATERIAL $columns[3]\n";
				print NEWFILE "TYPE $columns[4]\n";
				print NEWFILE "GRADE $columns[5]\n";
				print NEWFILE "SECTION_TYPE HOLLOW\n";
				print NEWFILE "SHAPE STRAIGHT FLEXIBLE\n";
				print NEWFILE "CORNER_TYPES BEND\n";
				print NEWFILE "MAX_OVERALL_LENGTH   10000\n";
				print NEWFILE "MIN_STRAIGHT_LENGTH_END     25\n";
				print NEWFILE "MAX_NUMBER_BENDS	      100\n";
				print NEWFILE "MIN_BEND_SEPARATION     10\n";
				print NEWFILE "BEND_ANGLE	90 45 60\n";
				print NEWFILE "MAX_BEND_ANGLE	180\n";
				print NEWFILE "MIN_BEND_ANGLE	5\n";
				print NEWFILE "BEND_RADIUS $columns[15] $columns[16] $columns[17] $columns[18]\n";
				print NEWFILE "MAX_BEND_RADIUS 1000\n";
				print NEWFILE "MIN_BEND_RADIUS $columns[15]\n";
				print NEWFILE "OD $columns[13]\n";
				print NEWFILE "WALL_THICKNESS $columns[14]\n";
				print NEWFILE "WT/LEN $columns[19]\n";
				close (NEWFILE);
			}
		}
		close CSV;
	}
	else {
		my $warn_string = "Please select an input file and an output directory before choosing to output Pro/E files\n";
		print "$warn_string\n";
		my $warn_dialog = $mw -> messageBox(-message=>$warn_string,-type=>'ok',-icon=>'info');

	}
}

# Release block of console
Win32::GUI::Show($DOS);
#EOF
