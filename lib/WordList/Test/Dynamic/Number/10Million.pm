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
    $self->{_iterator_idx} = 0;
}

sub first_word {
    my $self = shift;
    $self->reset_iterator;
    $self->next_word;
}

sub next_word {
    my $self = shift;

    $self->{_iterator_idx} = 0 unless defined $self->{_iterator_idx};
    return undef if $self->{_iterator_idx}++ >= 10_000_000;
    sprintf "%08d", $self->{_iterator_idx};
}

# STATS

1;
# ABSTRACT: 10 million numbers from "00000001" to "10000000"
