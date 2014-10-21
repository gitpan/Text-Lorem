package Text::Lorem;

use strict;
use warnings;
use vars qw($VERSION);

$VERSION = "0.1";

sub new {
  my $class = shift;
  my $self ={};
  bless $self,$class;
  return $self;
}

sub generate_wordlist {
  my $self = shift;
  [ map { s/\W//; lc($_) }split(/\s+/, <DATA>) ];
}

sub wordlist {
  my $self = shift;
  $self->{ wordlist } ||= $self->generate_wordlist();
}

sub wordcount {
  my $self = shift;
  return scalar(@{$self->{ wordlist }});
}

sub get_word {
  my $self = shift;
  return $self->wordlist->[ int( rand( $self->wordcount ) ) ];
}

sub words {
  my $self = shift;
  my $num  = shift;
  my @words;
  push @words, $self->get_word() for (1..$num);
  return join(' ', @words);
}

sub get_sentence {
  my $self = shift;
  my $words = $self->words( 4 + int( rand( 6 ) ) );
  ucfirst( $words );
}

sub sentences {
  my $self = shift;
  my $num = shift;
  my @sentences;
  push @sentences, $self->get_sentence for (1..$num);
  join( '. ', @sentences ) . '.';
}

sub get_paragraph {
  my $self = shift;
  my $sentences = $self->sentences(3 + int( rand( 4 ) ) );
  
}

sub paragraphs {
  my $self = shift;
  my $num = shift;
  my @paragraphs;
  push @paragraphs, $self->get_paragraph for (1..$num);
  join( "\n\n", @paragraphs );
}

1;

=pod

=head1 NAME

Text::Lorem - Generate random Latin looking text

=head1 SYNOPSIS

    use Text::Lorem;
   
    my $text = Text::Lorem->new();
  
    # Generate a string of text with 5 words
    $words = $text->words(5);
  
    # Generate a string of text with 2 sentences
    $sentences = $text->sentences(2);
  
    # Generate 3 paragraphs
    $paragraphs = $text->paragraphs(3);

=head1 DESCRIPTION

Often when developing a website or other application it's important to have placeholders for content.  This module generates
prescribed amounts of fake Latin text.

=head1 CONSTRUCTOR

=over 4

=item C<new()>

The default constructor, C<new()> takes no arguments and returns a Text::Lorem object.

=back

=head1 METHODS

=over 4

=item C<words( INTEGER )>

Returns INTEGER fake Latin words.

=item C<sentences( INTEGER )>

Returns INTEGER sentences in fake Latin.

=item C<paragraphs( INTEGER )>

Returns INTEGER paragraphs of fake Latin text.

=back

=head1 THANKS

Thanks to the guys who pushed me off the cliff called comfort and into the scary world of Perl: James Duncan, Leon Brocard.

=head1 AUTHOR

Adeola Awoyemi (adeola@fotango.com)

=head1 SEE ALSO

  L<WWW::Lipsum> and L<http://lipsum.com/>

=head1 COPYRIGHT

Copyright 2003 Fotango Ltd. All rights reserved. L<http://opensource.fotango.com/>
This software is released under the same license as Perl itself.

=cut



























__DATA__
alias consequatur aut perferendis sit voluptatem accusantium doloremque aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis Nemo enim ipsam voluptatem quia voluptas sit suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae  et iusto odio dignissimos ducimus qui blanditiis praesentium laudantium, totam rem voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, Sed ut perspiciatis unde omnis iste natus error similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo porro quisquam est, qui minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur? At vero eos et accusamus officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores doloribus asperiores repellat.
