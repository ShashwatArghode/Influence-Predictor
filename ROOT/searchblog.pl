#!/usr/bin/env perl
require LWP::UserAgent;
use HTML::Tree;
use DBI;

my $driver = "mysql"; 
my $database = "webcrawl";
my $dsn = "DBI:$driver:database=$database";
my $userid = "root";
my $password = "root123";
my $filename = $ARGV[0];
my $mainurl = $ARGV[1];
open(FILE, "<", $filename) or die("Can't open file");
my $dbh = DBI->connect($dsn, $userid, $password ) or die $DBI::errstr;
@lines = <FILE>;
close(FILE);
chomp(@lines);

my $i = 0;
my ($term,$url,$hits,$title,$url_count,$url_start);

while ($i < $#lines) {
    $hits=0;
    $url_count = $lines[$i];
    $term = "$lines[$i+1]";
    #$title = $fields[1];
    $url_start = $i+2;
    $url_count = $url_count + $url_start;
    #print "\n------------------------------------------------------------------------------\n";
    while( $url_start < $url_count){
        $hits = 0;
        my @fields = split /,/, "$lines[$url_start]";
        #process url_count
        $url = $fields[0];
        $title = $fields[1];
        #print "\n processing url: " . $url . " for term : " . $term . " title :" . $title;
        #print "\n";
        my ($hits,$desc) = gethtmlpage($url,$term);
        #print "\n no of hits:" .$hits;
$query1 = "Replace into p_blogdata (url, title, descp, no_of_hits, tag,mainurl) values ('$url','$title','$desc',$hits,'$term','$mainurl');";
print $query1;
        if($hits > 0)
        {
			my $sth = $dbh->prepare($query1);
			$sth->execute() or die $DBI::errstr;
			$sth->finish();
        }
        #print "\n\n";
        $url_start++;
    }
    $i = $url_count;	
}

sub gethtmlpage {
    my $ua = LWP::UserAgent->new;
    my ($url,$pattern)= @_;
    my $i =0;
    my $comment_all;
    #~ Use below line of code for proxied net connection
    #$ua->proxy('http','http://[PROXY_URL]:[PROXY_PORT]/');
    my $response = $ua->post("$url");
    if ($response->is_success) 
    {
        my $fh;
        $output = $response->content;
        open($fh,">temp_int_file.txt") or die $!;
        print $fh $output;
        while($output =~ m/(p|li)\>(.*)$pattern(.*)\<\/(p|li)/ig)
        {
            my $comment;
            $pre_match = $2;
            $post_match = $3;
            $temp = $pre_match .$pattern. $post_match;
            my $tree = HTML::Tree->new();
            $tree->parse($temp);
            $comment = $tree->as_text; 
            if ($comment =~ /^(.*)\. (.*)$/g)
            {
                $comment = $1;
                #if (index($comment, $pattern) != -1) 
                #{
                    $comment_all = $comment_all . $comment;      
                    #} 

                #print "\nDescription No $i: $comment[$i]";
                $i+=1;
                #print "\n\n\nEndss----------------------------------------------------------------------------------------\n";
            } 
        }
    }
    else {
        #print "\n\n Error in getting HTML page";
    }
    close $fh;
    unlink($filename);
    return($i,$comment_all);
    #print "\n\nTotal comments:", $i,"\n";
}
