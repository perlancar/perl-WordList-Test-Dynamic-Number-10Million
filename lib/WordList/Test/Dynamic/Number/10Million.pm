package WordList::Test::Dynamic::Number::10Million;

# DATE
# VERSION

use WordList;
our @ISA = qw(WordList);

sub each_word {
    my ($self, $code) = @_;

    for my $i (1..10_000_000) {
        my $word = sprintf "%08d", $i;
        my $res = $code->($word);
        last if defined $res && $res == -2;
    }
}

# STATS

1;
# ABSTRACT: 10 million numbers from "00000001" to "10000000"
