<script lang="ts">
	function stab(
		_node: HTMLElement,
		{
			delta,
			finalWidth,
			finalPos,
			posRelativeTo,
			delay = 0,
			duration = 100
		}: {
			delta: number;
			finalWidth: number;
			finalPos: number;
			posRelativeTo: 'left' | 'right';
			delay?: number;
			duration?: number;
		}
	) {
		return {
			delay,
			duration,
			css: (t: number) => `
				width: ${finalWidth + delta - t * delta}px;
				${posRelativeTo}: ${finalPos - delta + t * delta}px;
				opacity: ${t};
			`
		};
	}

	import '../app.css';
	import { items, ordinalNumbers } from './data';

	let chosenItems: number[] = $state([]);
	// let chosenItems: number[] = $state([0, 2]);

	let choicesSubmitted = $state(false);
	// let choicesSubmitted = $state(true);

	function handlePopState(e: PopStateEvent) {
		if ('chosenItems' in e.state) {
			chosenItems = e.state.chosenItems;
			choicesSubmitted = true;
		} else {
			choicesSubmitted = false;
			chosenItems = [];
		}
	}
	const submitChoices = () => {
		window.history.pushState({ chosenItems: $state.snapshot(chosenItems) }, '', '/results');
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

<svelte:window onpopstate={handlePopState} />

<svelte:head>
	<title>Nine Houses Quiz</title>
	{#each Array(9) as _, i}
		<link rel="preload" as="image" href={`/houses/${i + 1}.svg`} />
	{/each}
	<link rel="preload" as="image" href="/rapier.png" />
</svelte:head>

<section>
	<div style="display: flex">
		<div id="main-content">
			{#if !choicesSubmitted}
				<div id="intro-text-container">
					<div id="heading-container">
						<img
							class="desktop-none"
							width="175"
							height="175"
							id="heading-skeleton"
							src="/shh-its-a-test-transparent-smaller.png"
							alt="A shitty clip-art skeleton says, 'Get your pencils. Shh. It's a test!'"
						/>
						<div>
							<h1 style="text-align: center; margin-top: 32px; margin-bottom: 8px">
								Tamsyn Muir's SEABOUND
							</h1>
							<h4 style="text-align: center; margin-bottom: 24px">
								A Locked Tomb Universe Survival Adventure and House Identification Tool
							</h4>
						</div>
					</div>
					<p>
						You and a couple of your friends, if you have any, are on a boat in the ocean. Why are
						you here? Is this even relevant in the universe? Who cares. This ocean's purpose is to
						help you pick... your true House identity.
					</p>
					<p>
						Luckily, on this magical survival journey you have the opportunity to pick items to help
						you. You may salvage <strong>five</strong> items of the fifteen I am about to list below.
						These items will be the key to who you are, secretly, on the inside. You're probably going
						to die, but at least you will know who you are, which has to be some kind of comfort, right
					</p>
					<p>
						These items will score you points with one or more Houses. Once you have made your
						selection, we'll tally your points, and you will discover... Yourself!!!!
					</p>
					<h3>Choose Five Items:</h3>
				</div>
				<div id="items-container">
					{#each items as item, i (item.name)}
						{@const chosen = chosenItems.includes(i)}
						<button
							class="item-card"
							role="checkbox"
							aria-checked={chosen}
							disabled={chosenItems.length === 5 && !chosen}
							onclick={() => {
								if (!chosen) {
									if (chosenItems.length < 5) chosenItems.push(i);
								} else {
									chosenItems = chosenItems.filter((item) => item !== i);
								}
							}}
						>
							{item.name}
							{#if chosen}
								<img
									alt=""
									transition:stab={{
										delta: 30,
										finalWidth: 65,
										finalPos: -50,
										posRelativeTo: 'left'
									}}
									src="/rapier.png"
									style="filter: brightness(0.8) contrast(2);
										position: absolute; left: -50px; top: 50%; transform: translateY(-50%);
										width: 65px; height: 75px; object-fit: cover; object-position: left 50%"
								/>
								<img
									alt=""
									transition:stab={{
										delta: -30,
										finalWidth: 35,
										finalPos: -30,
										posRelativeTo: 'right'
									}}
									src="/rapier.png"
									style="filter: brightness(0.8) contrast(2);
										position: absolute; right: -30px; top: 50%; transform: translateY(-50%);
										width: 35px; height: 75px; object-fit: cover; object-position: right 50%"
								/>
							{/if}
						</button>
					{/each}
				</div>
				<button onclick={submitChoices} disabled={chosenItems.length < 5} class="submit-button"
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
									border-radius: 5px; padding: 8px 12px"
								style:box-shadow={houseResults.includes(houseIndex) ? '0px 0px 8px #fffa' : ''}
							>
								<img
									alt={ordinalNumbers[houseIndex] + ' house'}
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
						{#each chosenItems as itemIndex, i}
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
							{#if i !== chosenItems.length - 1}<hr
									style="margin: 12px 0; border-color: #fffa; border-width: 0.25px"
								/>{/if}
						{/each}
					</div>
				</div>
			{/if}
			<img
				class="flourish"
				src="end-flourish.svg"
				style="transform: scaleY(-100%); margin: 20px 0"
				alt=""
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
			src="/shh-its-a-test-transparent.png"
			alt="A shitty clip-art skeleton says, 'Get your pencils. Shh. It's a test!'"
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
	$item-columns-breakpoint: 650px;

	@media (max-width: $desktop-breakpoint) {
		.desktop-only {
			display: none;
		}
	}

	@media (min-width: $desktop-breakpoint) {
		.desktop-none {
			display: none;
		}
	}

	#main-content {
		display: flex;
		flex-direction: column;
		align-items: center;
		width: 85ch;
		margin: 0 auto;
		max-width: 100%;
		text-align: justify;
		padding: 16px;
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

	#intro-text-container {
		@media (min-width: $item-columns-breakpoint) {
			padding: 0px 35px;
		}
	}

	#heading-container {
		display: flex;
		justify-content: center;
		align-items: center;
		gap: 4px;
		padding: 0 4px;
		position: relative;
		flex-direction: row-reverse;
		@media (min-width: $item-columns-breakpoint) {
			flex-direction: row;
		}
	}

	#heading-skeleton {
		height: 175px;
		opacity: 0.6;
		z-index: -1;
		transform: rotate(-8deg);
	}

	#items-container {
		display: flex;
		flex-wrap: wrap;
		justify-content: center;
	}

	button {
		color: white;
		border: 1px solid white;
		&:disabled {
			border: 1px solid #fffc;
			color: #fff7;
		}
		&:active:not(:disabled) {
			border: 1px solid #fffa;
		}
	}

	.submit-button {
		width: 100%;
		margin: 28px 0;
		font-size: 1.5em;
		padding: 8px;
		background-color: black;
		box-shadow: 0px 0px 8px #fffa;
		transition: box-shadow 100ms linear;
		&:disabled {
			box-shadow: 0px 0px 8px #fff7;
		}
	}

	.item-card {
		color: inherit;
		display: flex;
		justify-content: center;
		align-items: center;
		background-color: #000a;
		border-radius: 8px;
		text-align: center;
		padding: 0 16px;
		height: 85px;
		position: relative;
		transition: color 100ms linear;
		width: calc(50% - 70px);
		margin: 10px 35px;
		@media (max-width: $item-columns-breakpoint) {
			width: 100%;
		}
	}

	.flourish {
		width: 400px;
		max-width: 70vw;
		filter: invert(100%);
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
