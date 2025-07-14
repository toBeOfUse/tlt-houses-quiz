<script lang="ts">
	const items = [
		{
			name: 'A SACK OF OLD OSSICLES',
			description:
				"Only a Ninth House necromancer would want this. Not even a bone necromancer would look in joy on a sack of ossicles. If it was a more useful bone or even a fresher bone, sure, or let's say a whole skeleton, that would be arguably useful, but in the hands of most bone adepts the ossicle is simply an ossicle. You're from the Ninth House if you ranked this highly, which means odds are good that you are 90+ and have kidney and bladder problems.",
			housePoints: {
				'9': 15
			}
		},
		{
			name: 'A SACK OF FRESH HUMAN HANDS',
			description:
				"Fresh human hands are generally useful. Fresh flesh (say that five times fast) will carry a goodly amount of thanergy (death energy) <em>and</em> thalergy (life energy), which in the hands of a necromancer might be put to good purpose. Extra points to the Third and Seventh houses, places where you're likely to find very talented flesh magicians; five points to the other houses as flesh magic is quite generally used, and if not, there's a whole articulating hand in there for the bone magicians. The Ninth House don't rate this quite as highly as the sack of ossicles because you have to get the flesh off first. The Eighth House does not want your sack of fresh human hands.\nThe Second House gets an extra point because we could always eat those hands. We've eaten worse.",
			housePoints: {
				'2': 6,
				'3': 10,
				'4': 5,
				'5': 5,
				'6': 5,
				'7': 7,
				'9': 5
			}
		},
		{
			name: 'A ROLLED-UP FLAG OF THE COHORT, SOLDIERS OF THE BLESSED NECROLORD PRIME',
			description:
				"Only a Second House denizen would think this was a must-have. It doesn't even have a pole. You can't fly it. You can just look at it and think patriotic thoughts about the Cohort. The only reason you get +1 from any other House is because you could maybe use it as shade. The Seventh House scores a cool five points off this one because it would be a very Seventh House thought to be found dead and draped in the Cohort flag. Symbolic... aesthetic.... Raw",
			housePoints: {
				'1': 1,
				'2': 15,
				'3': 1,
				'4': 1,
				'5': 1,
				'6': 1,
				'7': 5,
				'8': 1,
				'9': 1
			}
		},
		{
			name: 'PEN AND FLIMSY',
			description:
				"Reaching for the pen and flimsy first is a very Sixth House thing to do, because you're going to immediately try to form a committee, have a huge argument, split off on your own and do some kind of brainstorm of ideas, then maybe you're going to write down a bunch of bullshit equations and jot notes on the back about ways in which this might contribute to your research. The Fifth House also may well reach for this, but it's to write down everyone on the boat's memoirs, and perhaps a group letter expressing regret at what a bish they've made of it and perhaps a small measure of buttoned-up, restrained feeling for their lovers back home. \nThe Seventh House have written a single, very beautiful and oblique sentence about the water. The Eighth House have written down a list of any moral crimes committed on the boat.",
			housePoints: {
				'5': 10,
				'6': 15,
				'7': 10,
				'8': 10
			}
		},
		{
			name: 'A BOTTLE OF 160 PROOF RUM',
			description:
				"CUP OF ACE, CUP OF GOOSE, CUP OF CRIS\nThe good Third House citizen has resigned themselves to death, but to not go gentle into that good night. The Fourth House thinks they could light this on fire, or something? Who knows\nThe Second House citizen will surprise you by doing a generous shot of this before everyone starts playing <em>Mercy Stab The Weakest Members Of The Boat So They Won't Have To Suffer.</em>",
			housePoints: {
				'2': 1,
				'3': 15,
				'4': 5
			}
		},
		{
			name: 'A WATERPROOF PORTRAIT OF THE EMPEROR',
			description:
				"The Eighth House citizen will pray at this grimly until they die. The Ninth House citizen will also do a certain amount of praying at this grimly until they die, but get less points because they'll also be praying to other things.\nThe Seventh House citizen may hope to drape the Cohort flag over one of their dead bodies, and this to be held by another, and then they've got a tableau so symbolic that their rescuers will set it up as an art installation.",
			housePoints: {
				'7': 5,
				'8': 15,
				'9': 5
			}
		},
		{
			name: 'AN EMPTY BOTTLE WITH A LID TO SEAL IT',
			description:
				"There's no water around, so what are you going to do with this EXCEPT use it to put your rolled-up memoirs, thought crimes, or the useful rebuttal to that one article you just thought up and hope someone will rescue and publish?",
			housePoints: {
				'5': 9,
				'6': 9,
				'8': 9
			}
		},
		{
			name: 'AN ANTIQUE FLARE GUN OF CURIOUS MAKE',
			description:
				"This thing will blow your head off. It's a gun. Don't – don't fucking fire it here (NOISE OF BODY PARTS HITTING WATER)\nIt is intensely Fourth House to take an unbelievably dangerous piece of kit you barely understand and bravely fire it in the hope of getting rescued. It is also intensely Fifth and Sixth house just to keep a museum piece around so you can look at it and admire it. How interesting our antecedents were, to be sure",
			housePoints: {
				'4': 15,
				'5': 5,
				'6': 5
			}
		},
		{
			name: 'A BOOK OF ANTIQUATED NINTH HOUSE PRAYERS',
			description:
				"'Nuff said.\nThe other points reflects different desperations in the Sixth and Fifth houses are for reading material, and the Seventh House might add this to the tableau as an Enigma.",
			housePoints: {
				'5': 1,
				'6': 5,
				'7': 5,
				'9': 15
			}
		},
		{
			name: 'A TWENTY-FIVE LITRE CONTAINER OF BLOOD!!!!',
			description:
				'Nobody wants this and very few people are talented enough to separate the toxic iron stew from some drinkable plasma, or something. The Fifth House in its boundless optimism may take this thinking they might call a ghost, but otherwise, yuk',
			housePoints: {
				'5': 9
			}
		},
		{
			name: 'A SINGLE SHARP RAPIER',
			description:
				'The Second House knows that the death of a colleague neatly stabbing you is better than a death by drowning. The Fourth House is going to fuck up an octopus. The Seventh House is going to have it present, centrally, on the boat, and cast down glances through their eyelashes at it but otherwise never mention its presence, tortured. The Third House just wants a sword for the delicious drama. Delicious, delicious drama',
			housePoints: {
				'2': 10,
				'3': 2,
				'4': 9,
				'7': 9
			}
		},
		{
			name: 'A SHAVING MIRROR',
			description:
				'A mirror can reflect the sun, generating up to seven million candlepower in light. A mirror would be a very Fourth House idea: something that sounds unrealistic and stupid on first blush, but turns out to be a one in a million incredible idea that may even save your life.\nThe Third House just want to check their mascara, and also see over their shoulder before one of their boat colleagues sticks the single sharp rapier inside them. <em>Drama</em>',
			housePoints: {
				'3': 2,
				'4': 6
			}
		},
		{
			name: 'A CASE OF ABSOLUTELY DISGUSTING ARMY RATIONS, HARD AND BAD',
			description: "We can't fault you for practicality.",
			housePoints: {
				'1': 1,
				'2': 9,
				'3': 1,
				'4': 1,
				'5': 1,
				'6': 1,
				'7': 1,
				'8': 1,
				'9': 1
			}
		},
		{
			name: 'A CASE OF EXTREMELY GLAMOROUS LUXE RATIONS, BUT POISONED',
			description:
				'Fuck this noise and pass me the caviar, darling\nThe Eighth House are also ready to receive the poison, but they will try their damndest not to enjoy it.',
			housePoints: {
				'3': 8,
				'8': 5
			}
		},
		{
			name: 'A TINIER, LEAKIER FOLD-OUT RAFT, WITH A DUBIOUS MOTOR',
			description:
				"This is not going to get you five yards on a free ticket, which is why hopping into it and getting that dusty, wheezy motor going, then sailing for help as the rest of the boat watches you sink into the ocean and get snapped up by a giant undead squid is the most Fourth House thing you could've done.",
			housePoints: {
				'4': 5
			}
		}
	];
</script>

<svelte:head>
	<title>Home</title>
	<meta name="description" content="Svelte demo app" />
</svelte:head>

<section>
	{#each items as item}
		<h3>{item.name}</h3>
		{@html item.description
			.split('\n')
			.map((p) => `<p>${p}</p>`)
			.join('\n')}
	{/each}
</section>

<style>
	:global(body) {
		background-color: rgb(83, 42, 94);
		color: white;
	}
</style>
