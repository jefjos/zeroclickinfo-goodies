package DDG::Goodie::Dessert;

use DDG::Goodie;

zci is_cached => 0;
triggers start => 'dessert', 'desserts', 'a dessert';

sub itemify {
    my @dessert_list = @{$_[0]};
    my $is_html = $_[1];

    my $i = rand scalar @dessert_list;
    my $dessert = $dessert_list[$i];

    if($is_html) {
	$dessert =~ s/\s/+/g;
	return "<a href='http://duckduckgo.com/?q=$dessert+recipe'>" . $dessert_list[$i] . "</a>";
    }
    return $dessert;
};

my %desserts = (
	a => ['Apple Turnover'],
	b => ['Banana Split', 'Biscuits'],
	c => ['Cherry Pie', 'Cupcake', 'Chocolate'],
	d => ['Donut'],
	e => ['Eclair'],
	f => ['Froyo', 'Fudge'],
	g => ['Gingerbread'],
	h => ['Honeycomb'],
	i => ['Ice Cream Sandwich', 'Ice Cream'],
	j => ['Jam Rolly Polly','Jelly Bean','Jelly'],
	k => ['Key Lime Pie'],
	l => ['Lollipop','Liqourice'],
	m => ['Macaroons','Meringues','Marshmallow','Muffin'],
	n => ['Nougat','Nutella'],
	o => ['Oatmeal Pie','Oreos'],
	p => ['Profiteroles','Pop Tart'],
	q => ['Quiche'],
	r => ['Rocky Road','Red Velvet Cake','Ruhbarb and Custard'],
	s => ['Sundae','Strudel','Strawberries and Cream','Souffle'],
	t => ['Tiramisu','Trifle','Twinkies','Taffy','Toffee'],
	u => ['Unicorn Cake','Upside-down cake'],
	v => ['Vanilla Swirl'],
	w => ['Waffles','Watermelon','White Chocolate'],
	x => ['Xmas Cake'],
	z => ['Zepolle','Zucchini Pie'],
);

handle remainder => sub {
    if(lc $_ =~ m/^(?:that )?(?:start|beginn?)s?(?:ing)? ?(?:with)? (?:the letter )?([a-zA-Z])$/i){
	my $in = lc $1;
	my $items = $desserts{lc $in};

	my $end = " is a dessert that begins with the letter " . uc $in . '.';

	my $html_output = itemify($items, 1) . $end;
	my $text_output = itemify($items, 0) . $end;
	
	return $text_output, html => $html_output;
    }
    return;
};

1;