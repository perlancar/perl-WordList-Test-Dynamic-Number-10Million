package WordList::Test::Dynamic::Number::10Million;

# DATE
# VERSION

use WordList;
our @ISA = qw(WordList);

use Role::Tiny::With;
with 'WordListRole::EachFromFirstNextReset';

our $DYNAMIC = 1;

sub reset_iterator {
    my $self = shift;
    $self->[0] = 0;
}

sub first_word {
    my $self = shift;
    $self->reset_iterator;
    $self->next_word;
}

sub next_word {
    my $self = @_;

    $self->[0] = 0 unless defined $self->[0];
    return undef if $self->[0]++ >= 10_000_000;
    sprintf "%08d", $self->[0];
}

# STATS

1;
# ABSTRACT: 10 million numbers from "00000001" to "10000000"
