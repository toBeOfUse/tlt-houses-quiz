<script lang="ts">
	import '../app.css';
	const items = [
		{
			name: 'A sack of old ossicles',
			description:
				"<p>Only a Ninth House necromancer would want this. Not even a bone necromancer would look in joy on a sack of ossicles. If it was a more useful bone or even a fresher bone, sure, or let's say a whole skeleton, that would be arguably useful, but in the hands of most bone adepts the ossicle is simply an ossicle. You're from the Ninth House if you ranked this highly, which means odds are good that you are 90+ and have kidney and bladder problems.</p>",
			housePoints: { '9': 15 }
		},
		{
			name: 'A sack of fresh human hands',
			description:
				"<p>Fresh human hands are generally useful. Fresh flesh (say that five times fast) will carry a goodly amount of thanergy (death energy) <em>and</em> thalergy (life energy), which in the hands of a necromancer might be put to good purpose. Extra points to the Third and Seventh houses, places where you're likely to find very talented flesh magicians; five points to the other houses as flesh magic is quite generally used, and if not, there's a whole articulating hand in there for the bone magicians. The Ninth House don't rate this quite as highly as the sack of ossicles because you have to get the flesh off first. The Eighth House does not want your sack of fresh human hands.</p>\n<p>The Second House gets an extra point because we could always eat those hands. We've eaten worse.</p>",
			housePoints: { '2': 6, '3': 10, '4': 5, '5': 5, '6': 5, '7': 7, '9': 5 }
		},
		{
			name: 'A rolled-up flag of the Cohort, soldiers of the blessed Necrolord Prime',
			description:
				"<p>Only a Second House denizen would think this was a must-have. It doesn't even have a pole. You can't fly it. You can just look at it and think patriotic thoughts about the Cohort. The only reason you get +1 from any other House is because you could maybe use it as shade. The Seventh House scores a cool five points off this one because it would be a very Seventh House thought to be found dead and draped in the Cohort flag. Symbolic... aesthetic.... Raw</p>",
			housePoints: { '1': 1, '2': 15, '3': 1, '4': 1, '5': 1, '6': 1, '7': 5, '8': 1, '9': 1 }
		},
		{
			name: 'Pen and flimsy',
			description:
				"<p>Reaching for the pen and flimsy first is a very Sixth House thing to do, because you're going to immediately try to form a committee, have a huge argument, split off on your own and do some kind of brainstorm of ideas, then maybe you're going to write down a bunch of bullshit equations and jot notes on the back about ways in which this might contribute to your research. The Fifth House also may well reach for this, but it's to write down everyone on the boat's memoirs, and perhaps a group letter expressing regret at what a bish they've made of it and perhaps a small measure of buttoned-up, restrained feeling for their lovers back home. </p>\n<p>The Seventh House have written a single, very beautiful and oblique sentence about the water. The Eighth House have written down a list of any moral crimes committed on the boat.</p>",
			housePoints: { '5': 10, '6': 15, '7': 10, '8': 10 }
		},
		{
			name: 'A bottle of 160 proof rum',
			description:
				"<p>CUP OF ACE, CUP OF GOOSE, CUP OF CRIS</p>\n<p>The good Third House citizen has resigned themselves to death, but to not go gentle into that good night. The Fourth House thinks they could light this on fire, or something? Who knows</p>\n<p>The Second House citizen will surprise you by doing a generous shot of this before everyone starts playing <em>Mercy Stab The Weakest Members Of The Boat So They Won't Have To Suffer.</em></p>",
			housePoints: { '2': 1, '3': 15, '4': 5 }
		},
		{
			name: 'A waterproof portrait of the emperor',
			description:
				"<p>The Eighth House citizen will pray at this grimly until they die. The Ninth House citizen will also do a certain amount of praying at this grimly until they die, but get less points because they'll also be praying to other things.</p>\n<p>The Seventh House citizen may hope to drape the Cohort flag over one of their dead bodies, and this to be held by another, and then they've got a tableau so symbolic that their rescuers will set it up as an art installation.</p>",
			housePoints: { '7': 5, '8': 15, '9': 5 }
		},
		{
			name: 'An empty bottle with a lid to seal it',
			description:
				"<p>There's no water around, so what are you going to do with this EXCEPT use it to put your rolled-up memoirs, thought crimes, or the useful rebuttal to that one article you just thought up and hope someone will rescue and publish?</p>",
			housePoints: { '5': 9, '6': 9, '8': 9 }
		},
		{
			name: 'An antique flare gun of curious make',
			description:
				"<p>This thing will blow your head off. It's a gun. Don't – don't fucking fire it here (NOISE OF BODY PARTS HITTING WATER)</p>\n<p>It is intensely Fourth House to take an unbelievably dangerous piece of kit you barely understand and bravely fire it in the hope of getting rescued. It is also intensely Fifth and Sixth house just to keep a museum piece around so you can look at it and admire it. How interesting our antecedents were, to be sure</p>",
			housePoints: { '4': 15, '5': 5, '6': 5 }
		},
		{
			name: 'A book of antiquated Ninth House prayers',
			description:
				"<p>'Nuff said.</p>\n<p>The other points reflects different desperations in the Sixth and Fifth houses are for reading material, and the Seventh House might add this to the tableau as an Enigma.</p>",
			housePoints: { '5': 1, '6': 5, '7': 5, '9': 15 }
		},
		{
			name: 'A twenty-five litre container of blood!!!!',
			description:
				'<p>Nobody wants this and very few people are talented enough to separate the toxic iron stew from some drinkable plasma, or something. The Fifth House in its boundless optimism may take this thinking they might call a ghost, but otherwise, yuk</p>',
			housePoints: { '5': 9 }
		},
		{
			name: 'A single sharp rapier',
			description:
				'<p>The Second House knows that the death of a colleague neatly stabbing you is better than a death by drowning. The Fourth House is going to fuck up an octopus. The Seventh House is going to have it present, centrally, on the boat, and cast down glances through their eyelashes at it but otherwise never mention its presence, tortured. The Third House just wants a sword for the delicious drama. Delicious, delicious drama</p>',
			housePoints: { '2': 10, '3': 2, '4': 9, '7': 9 }
		},
		{
			name: 'A shaving mirror',
			description:
				'<p>A mirror can reflect the sun, generating up to seven million candlepower in light. A mirror would be a very Fourth House idea: something that sounds unrealistic and stupid on first blush, but turns out to be a one in a million incredible idea that may even save your life.</p>\n<p>The Third House just want to check their mascara, and also see over their shoulder before one of their boat colleagues sticks the single sharp rapier inside them. <em>Drama</em></p>',
			housePoints: { '3': 2, '4': 6 }
		},
		{
			name: 'A case of absolutely disgusting army rations, hard and bad',
			description: "<p>We can't fault you for practicality.</p>",
			housePoints: { '1': 1, '2': 9, '3': 1, '4': 1, '5': 1, '6': 1, '7': 1, '8': 1, '9': 1 }
		},
		{
			name: 'A case of extremely glamorous luxe rations, but poisoned',
			description:
				'<p>Fuck this noise and pass me the caviar, darling</p>\n<p>The Eighth House are also ready to receive the poison, but they will try their damndest not to enjoy it.</p>',
			housePoints: { '3': 8, '8': 5 }
		},
		{
			name: 'A tinier, leakier fold-out raft, with a dubious motor',
			description:
				"<p>This is not going to get you five yards on a free ticket, which is why hopping into it and getting that dusty, wheezy motor going, then sailing for help as the rest of the boat watches you sink into the ocean and get snapped up by a giant undead squid is the most Fourth House thing you could've done.</p>",
			housePoints: { '4': 5 }
		}
	];
	const ordinalNumbers = [
		'First',
		'Second',
		'Third',
		'Fourth',
		'Fifth',
		'Sixth',
		'Seventh',
		'Eighth',
		'Ninth'
	];
	let chosenItems: number[] = $state([]);
	// let chosenItems: number[] = $state([0, 2]);

	let choicesSubmitted = $state(false);
	// let choicesSubmitted = $state(true);

	const submitChoices = () => {
		choicesSubmitted = true;
		window.scrollTo({ top: 0, behavior: 'smooth' });
	};

	const calculatedScore = $derived(
		chosenItems.reduce(
			(acc, itemNumber) => {
				const chosenItem = items[itemNumber];
				for (const [house, points] of Object.entries(chosenItem.housePoints) as [
					keyof (typeof chosenItem)['housePoints'],
					number
				][]) {
					const houseIndex = Number(house) - 1;
					acc[houseIndex] = acc[houseIndex] + points;
				}
				return acc;
			},
			Array(9).fill(0) as number[]
		)
	);
	/**
	 * has the indexes of the house(s) with which the quiz-taker got the highest score
	 */
	const houseResults = $derived.by(() => {
		const highestScore = Math.max(...calculatedScore);
		return calculatedScore.reduce(
			(acc, val, i) => (val === highestScore ? [...acc, i] : acc),
			[] as number[]
		);
	});

	const andFormatter = new Intl.ListFormat('en', {
		style: 'long',
		type: 'conjunction'
	});
</script>

<svelte:head>
	<title>Nine Houses Quiz</title>
	{#each Array(9) as _, i}
		<link rel="preload" as="image" href={`/houses/${i + 1}.svg`} />
	{/each}
</svelte:head>

<section>
	<div style="display: flex">
		<div id="main-content">
			<img class="flourish" src="end-flourish.svg" style="margin: 20px 0 5px" />
			{#if !choicesSubmitted}
				<h1 style="text-align: center; margin-top: 12px; margin-bottom: 8px">
					Tamsyn Muir's SEABOUND
				</h1>
				<h4 style="text-align: center; margin-bottom: 12px">
					A Locked Tomb Universe Survival Adventure and House Identification Tool
				</h4>
				<p>
					You and a couple of your friends, if you have any, are on a boat in the ocean. Why are you
					here? Is this even relevant in the universe? Who cares. This ocean's purpose is to help
					you pick... your true House identity.
				</p>
				<p>
					Luckily, on this magical survival journey you have the opportunity to pick items to help
					you. You may salvage <strong>five</strong> items of the fifteen I am about to list under the
					cut. These items will be the key to who you are, secretly, on the inside. You're probably going
					to die, but at least you will know who you are, which has to be some kind of comfort, right
				</p>
				<p>
					These items will score you points with one or more Houses. Once you have made your
					selection, we'll tally your points, and you will discover... Yourself!!!!
				</p>
				<div>
					<h3>Select Five Items:</h3>
					<div style="display: flex; gap: 18px; flex-wrap: wrap; justify-content: center">
						{#each items as item, i (item.name)}
							<button
								class={['item-card', { 'selected-item-card': chosenItems.includes(i) }]}
								disabled={chosenItems.length === 5 && !chosenItems.includes(i)}
								onclick={() => {
									console.log(i, $state.snapshot(chosenItems));
									if (!chosenItems.includes(i)) {
										if (chosenItems.length < 5) chosenItems.push(i);
									} else {
										chosenItems = chosenItems.filter((item) => item !== i);
									}
								}}
							>
								{item.name}
							</button>
						{/each}
					</div>
				</div>
				<button
					onclick={submitChoices}
					disabled={chosenItems.length < 5}
					style="align-self: flex-start; width: 100%; margin: 18px 0;
						font-size: 1.5em; padding: 8px; background-color: black;"
					>{chosenItems.length === 5
						? 'go out to sea'
						: `(${chosenItems.length}/5 items selected)`}</button
				>
			{:else}
				<div style="margin-bottom: 5px; text-align: center">
					<h1 style="margin: 16px 0">Your Results:</h1>
					<div id="score-grid">
						{#each calculatedScore as score, houseIndex}
							<div
								style="display: flex; flex-direction: column; align-items: center;
									border-radius: 5px; padding: 8px 12px; background-color: transparent"
								style:box-shadow={houseResults.includes(houseIndex) ? '0px 0px 8px #fffa' : ''}
							>
								<img
									src={`/houses/${houseIndex + 1}.svg`}
									style="height: 80px; filter: invert(100%)"
								/>
								<span
									style:white-space="nowrap"
									style:font-weight={houseResults.includes(houseIndex) ? 'bold' : ''}
									>{score} points</span
								>
							</div>
						{/each}
					</div>
					{#if houseResults.length === 1}
						<h3>You belong to the <strong>{ordinalNumbers[houseResults[0]]} House.</strong></h3>
					{:else}
						<h3>
							Your top houses are the {andFormatter.format(
								houseResults.map((houseIndex) => ordinalNumbers[houseIndex])
							)} Houses.
						</h3>
					{/if}
				</div>
				<div style="text-align: left">
					<h2>Guide to your items:</h2>
					<div style="display: flex; flex-direction: column; gap: 4px">
						{#each chosenItems as itemIndex}
							<div>
								<h4 style="margin: 8px 0; font-size: 115%">{items[itemIndex].name}</h4>
								{#each Object.entries(items[itemIndex].housePoints) as [house, points], pointsIndex}
									<em
										style="display:block; font-size: 90%"
										style:margin={`3px 0 3px ${pointsIndex * 0.9}em`}
									>
										+{points}
										{ordinalNumbers[Number(house) - 1]} House points
									</em>
								{/each}
								{@html items[itemIndex].description}
							</div>
						{/each}
					</div>
				</div>
			{/if}
			<img
				class="flourish"
				src="end-flourish.svg"
				style="transform: scaleY(-100%); margin: 10px 0 20px;"
			/>
			<footer style="text-center; font-size: 75%">
				Based on <a
					href="https://tazmuir.tumblr.com/post/188233732278/get-ready-for"
					target="_blank">the quiz</a
				> by Tamsyn Muir
			</footer>
		</div>
		<img
			class="desktop-only"
			style="height: 100vh; width: auto; top: 0; right: 0; position: sticky"
			src="https://64.media.tumblr.com/ebb963902e6c9d33e1a41c9daac9af51/5e808fe65e90fb85-f5/s400x600/47a7634f670867eb539bf011833a804af2aa3eec.pnj"
		/>
	</div>
</section>

<style lang="scss">
	@keyframes fade-in {
		from {
			opacity: 0;
		}

		to {
			opacity: 1;
		}
	}

	$desktop-breakpoint: 1150px;

	@media (max-width: $desktop-breakpoint) {
		.desktop-only {
			display: none;
		}
	}

	#main-content {
		display: flex;
		flex-direction: column;
		align-items: center;
		width: 75ch;
		margin: 0 auto;
		max-width: 100%;
		text-align: justify;
		padding: 16px 12px;
	}

	#main-content > * {
		animation: fade-in 1s ease-in;
		animation-fill-mode: both;

		@for $i from 1 through 10 {
			&:nth-child(#{$i}) {
				animation-delay: 150ms * $i;
			}
		}
	}

	.item-card {
		color: inherit;
		display: flex;
		justify-content: center;
		align-items: center;
		background-color: transparent;
		border-radius: 8px;
		text-align: center;
		padding: 10px 40px;
		height: 80px;
		position: relative;
		transition:
			color 100ms linear,
			background-color 100ms linear;
		/* 9px is half the gap between items in the container that contains these */
		width: calc(50% - 9px);
		@media (max-width: 650px) {
			width: 100%;
		}
	}

	.flourish {
		width: 400px;
		max-width: 70vw;
		filter: invert(100%);
	}

	button {
		color: white;
		&:disabled {
			color: #fff7;
		}
	}

	.selected-item-card {
		background-color: #0005;
		color: #fffd;
	}

	.selected-item-card::after {
		position: absolute;
		left: 15px;
		top: 50%;
		transform: translateY(-50%);
		width: 10px;
		height: 10px;
		border-radius: 10px;
		background-color: #fffd;
		filter: blur(0.5px);
		content: '';
	}

	#score-grid {
		display: grid;
		grid-template-columns: repeat(9, 1fr);
		gap: 4px;
		@media (max-width: $desktop-breakpoint) {
			grid-template-columns: repeat(3, 1fr);
		}
	}
</style>
