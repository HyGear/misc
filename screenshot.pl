#!/usr/bin/perl -w 
#
use Win32::GUI();

# Block the console from staying visible
my ($DOS) = Win32::GUI::GetPerlWindow();
Win32::GUI::Hide($DOS);


my ($sec,$min,$hour,$day,$month,$yr19,@rest) =   localtime(time);
my $year = $yr19+1900;
my $cur_month = ++$month;
if ($sec < 10) {
	$sec = "0$sec";
}
if ($min < 10) {
	$min = "0$min";
}
if ($hour < 10) {
	$hour = "0$hour";
}
if ($day < 10) {
	$day = "0$day";
}
if ($cur_month < 10) {
	$cur_month = "0$cur_month";
}
#print "$year$cur_month$day$hour$min$sec\n";

#Open the temp tail file for writing
open NEWFILE, ">", "C:\\temp\\screen_temp.txt" or die $!;

#Begin writing the custom trail file.
print NEWFILE "\!trail file version No. 1400\n";
print NEWFILE "\!Pro\/ENGINEER  TM  Wildfire 4.0  \(c\) 2011 by Parametric Technology Corporation  All Rights Reserved.\n";
print NEWFILE "\!\%CIWelcome to Pro\/ENGINEER Wildfire 4.0.\n";
print NEWFILE "\~ Activate \`main_dlg_cur\` \`ProCmdWinActivate.file\`\n";
print NEWFILE "\~ Command \`ProCmdModelSaveAs\` \n";
print NEWFILE "\~ Open \`file_saveas\` \`type_option\`\n";
print NEWFILE "\~ Close \`file_saveas\` \`type_option\`\n";
print NEWFILE "\~ Select \`file_saveas\` \`type_option\` \\\n";
print NEWFILE "1  \`db_566\`\n";
print NEWFILE "\~ Activate \`file_saveas\` \`desktop_pb\`\n";
print NEWFILE "\~ Move \`main_dlg_cur\` \`proe_win\` \\\n";
print NEWFILE "9 266 617 0 1537 1439 872 1920 1080 231555 \n";
print NEWFILE "\~ Move \`main_dlg_cur\` \`proe_win\` \\\n";
print NEWFILE "9 255 617 0 513 1439 872 1920 1080 231571 \n";
print NEWFILE "\~ Move \`main_dlg_cur\` \`proe_win\` \\\n";
print NEWFILE "9 249 617 0 513 1439 872 1920 1080 231571 \n";
print NEWFILE "\~ Move \`main_dlg_cur\` \`proe_win\` \\\n";
print NEWFILE "9 245 617 0 513 1439 872 1920 1080 231586 \n";
print NEWFILE "\~ Move \`main_dlg_cur\` \`proe_win\` \\\n";
print NEWFILE "9 243 617 0 513 1439 872 1920 1080 231586 \n";
print NEWFILE "\~ Update \`file_saveas\` \`Inputname\` \\\n";
print NEWFILE " \`$year$cur_month$day$hour$min$sec.jpg\`\n";
print NEWFILE "\~ Activate \`file_saveas\` \`OK\`\n";
print NEWFILE "\~ Open \`shd_img_param\` \`o_dpi\`\n";
print NEWFILE "\~ Close \`shd_img_param\` \`o_dpi\`\n";
print NEWFILE "\~ Select \`shd_img_param\` \`o_dpi\` \\\n";
print NEWFILE "1  \`dpi300\`\n";
print NEWFILE "\~ Activate \`shd_img_param\` \`OK\`\n";
print NEWFILE "\!\%CICreating shaded image file.\n";
print NEWFILE "\!\%CIPerforming pass 1 out of 2.\n";
print NEWFILE "\!\%CIPerforming pass 2 out of 2.\n";
print NEWFILE "\!\%CIShaded image file is ready.\n";
print NEWFILE "\~ Activate \`main_dlg_cur\` \`main_dlg_cur\`\n";
close (NEWFILE);
 
# Release block of console
Win32::GUI::Show($DOS);
#EOF