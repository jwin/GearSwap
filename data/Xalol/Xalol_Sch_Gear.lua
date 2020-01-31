-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
    state.OffenseMode:options('Normal')
    state.CastingMode:options('Normal','Resistant')
    state.IdleMode:options('Normal', 'PDT')
	state.HybridMode:options('Normal','PDT')
	state.Weapons:options('None','Akademos')

	gear.nuke_jse_back = {name="Lugh's Cape",augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10'}}
	
	gear.obi_cure_back = "Tempered Cape +1"
	gear.obi_cure_waist = "Witful Belt"

	gear.obi_low_nuke_waist = "Refoccilation Stone"
	gear.obi_high_nuke_waist = "Refoccilation Stone"
	
		-- Additional local binds
	send_command('bind ^` gs c cycle ElementalMode')
	send_command('bind @` gs c scholar power')
	send_command('bind !` gs c cycle MagicBurstMode')
	--send_command('bind ^q gs c weapons Khatvanga;gs c set CastingMode OccultAcumen')
	--send_command('bind !q gs c weapons default;gs c reset CastingMode')
	send_command('bind @f10 gs c cycle RecoverMode')
	send_command('bind @f8 gs c toggle AutoNukeMode')
	send_command('bind !pause gs c toggle AutoSubMode') --Automatically uses sublimation and Myrkr.
	send_command('bind @^` input /ja "Parsimony" <me>')
	send_command('bind ^backspace input /ma "Stun" <t>')
	send_command('bind !backspace gs c scholar speed')
	send_command('bind @backspace gs c scholar aoe')
	send_command('bind ^= input /ja "Dark Arts" <me>')
	send_command('bind != input /ja "Light Arts" <me>')
	send_command('bind ^\\\\ input /ma "Protect V" <t>')
	send_command('bind !\\\\ input /ma "Shell V" <t>')
	send_command('bind @\\\\ input /ma "Reraise III" <me>')
	
    select_default_macro_book()
end

-- Define sets and vars used by this job file.
function init_gear_sets()

    --------------------------------------
    -- Start defining the sets
    --------------------------------------

    -- Precast Sets

    -- Precast sets to enhance JAs

    sets.precast.JA['Tabula Rasa'] = {} --legs="Peda. Pants +1"
	sets.precast.JA['Enlightenment'] = {} --body="Peda. Gown +1"

    -- Fast cast sets for spells

    sets.precast.FC = {main="Malevolence",sub="Genbu's Shield",ammo="Impatiens",
        head="Amalric Coif",neck="Voltsurge Torque",ear1="Enchntr. Earring +1",ear2="Malignance Earring",
        body="Shango Robe",hands="Telchine Gloves",ring1="Kishar Ring",ring2="Rahab Ring",
        back="Swith Cape +1",waist="Witful Belt",legs="Psycloth Lappas",feet="Pedagogy Loafers +1"}
		
	sets.precast.FC.Arts = {}

    sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {waist="Siegel Sash"})

    sets.precast.FC['Elemental Magic'] = set_combine(sets.precast.FC, {ear1="Barkaro. Earring"})

    sets.precast.FC.Cure = set_combine(sets.precast.FC, {main="Daybreak",sub="Sors Shield",back="Pahtli Cape"})

    sets.precast.FC.Curaga = sets.precast.FC.Cure

    sets.precast.FC.Impact = set_combine(sets.precast.FC['Elemental Magic'], {head=empty,body="Twilight Cloak"})
	
	sets.precast.FC.Dispelga = set_combine(sets.precast.FC, {main="Daybreak"})

    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS['Myrkr'] = {ammo="Staunch Tathlum",
		head="Pixie Hairpin +1",neck="Sanctity Necklace",ear1="Etiolation Earring",ear2="Malignance Earring",
		body="Vrikodara Jupon",hands="Amalric Gages",ring1="Mephitas's Ring +1",ring2="Rahab Ring",
		back="Aurist's Cape +1",waist="Fucho-no-Obi",legs="Psycloth Lappas",feet="Telchine Pigaches"}

    -- Midcast Sets
	--sets.TreasureHunter = set_combine(sets.TreasureHunter, {feet=gear.chironic_treasure_feet})	
	
	-- Gear for Magic Burst mode.
    sets.MagicBurst = {
        head=gear.merlinic_mb_head,neck="Mizu. Kubikazari",
        hands="Amalric Gages",ring1="Mujin Band",ring2="Locus Ring",
        legs=gear.merlinic_mb_legs,feet="Jhakri Pigaches +1"}
	
	-- Gear for specific elemental nukes.
	sets.element.Wind = {main="Marin Staff +1"}
	--sets.element.Ice = {main="Ngqoqwanb"}
	--sets.element.Earth = {neck="Quanpur Necklace"}
	sets.element.Dark = {head="Pixie Hairpin +1",ring2="Archon Ring"}

    sets.midcast.FastRecast = {main="Malevolence",sub="Genbu's Shield",ammo="Sapience Orb",
		head="Amalric Coif",neck="Voltsurge Torque",ear1="Enchntr. Earring +1",ear2="Malignance Earring",
		body="Shango Robe",hands="Telchine Gloves",ring1="Kishar Ring",ring2="Rahab Ring",
		back="Swith Cape +1",waist="Witful Belt",legs="Psycloth Lappas",feet="Jhakri Pigaches +1"}
		
    sets.midcast.Cure = {main="Daybreak",sub="Sors Shield",ammo="Sapience Orb",
        head="Vanya Hood",neck="Nodens Gorget",ear1="Etiolation Earring",ear2="Malignance Earring",
        body="Vrikodara Jupon",hands="Telchine Gloves",ring1="Stikini Ring",ring2="Stikini Ring",
        back="Solemnity Cape",waist="Witful Belt",legs="Gyve Trousers",feet="Pedagogy Loafers +1"}

    sets.midcast.LightWeatherCure = set_combine(sets.midcast.Cure,
        {waist="Hachirin-no-obi"})
		
    sets.midcast.LightDayCure = set_combine(sets.midcast.Cure,
        {waist="Hachirin-no-obi"})

    sets.midcast.Curaga = sets.midcast.Cure

	sets.Self_Healing = {ring1="Kunaji Ring",waist="Gishdubar Sash"}
	sets.Cure_Received = {ring1="Kunaji Ring",waist="Gishdubar Sash"}
	sets.Self_Refresh = {}
	
	-- this set is BAD -- needs healing magic skill
	sets.midcast.Cursna = {main="Malevolence",sub="Genbu's Shield",ammo="Sapience Orb",
		head="Amalric Coif",neck="Incanter's Torque",ear1="Enchntr. Earring +1",ear2="Malignance Earring",
		body="Shango Robe",hands="Telchine Gloves",ring1="Kishar Ring",ring2="Rahab Ring",
		back="Swith Cape +1",waist="Witful Belt",legs="Psycloth Lappas",feet="Jhakri Pigaches +1"}
		
	sets.midcast.StatusRemoval = set_combine(sets.midcast.FastRecast, {main="Akademos",sub="Niobid Strap"})

	sets.midcast['Enhancing Magic'] = {main="Bolelabunga",sub="Genbu's Shield",ammo="Pemphredo Tathlum",
		head="Telchine Cap",neck="Incanter's Torque",ear1="Andoaa Earring",
		body="Telchine Chas.",hands="Telchine Gloves",ring1="Stikini Ring",ring2="Stikini Ring",
		back="Fi Follet Cape",waist="Embla Sash",legs="Telchine Braconi",feet="Telchine Pigaches"}

    sets.midcast.Regen = set_combine(sets.midcast['Enhancing Magic'], {head="Arbatel Bonnet +1",back="Bookworm's Cape"})

    sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {neck="Nodens Gorget",waist="Siegel Sash"})
	
	sets.midcast.Refresh = set_combine(sets.midcast['Enhancing Magic'], {head="Amalric Coif"})
	
	sets.midcast.Aquaveil = set_combine(sets.midcast['Enhancing Magic'], {head="Amalric Coif"})
	
	sets.midcast.BarElement = set_combine(sets.precast.FC['Enhancing Magic'], {})

    sets.midcast.Storm = set_combine(sets.midcast['Enhancing Magic'], {feet="Peda. Loafers +1"})

    sets.midcast.Protect = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring"})
    sets.midcast.Protectra = sets.midcast.Protect

    sets.midcast.Shell = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring"})
    sets.midcast.Shellra = sets.midcast.Shell


    -- Custom spell classes

	sets.midcast['Enfeebling Magic'] = {main="Akademos",sub="Enki Strap",ammo="Pemphredo Tathlum",
        head="Befouled Crown",neck="Incanter's Torque",ear1="Barkarole Earring",ear2="Digni. Earring",
        body="Shango Robe",hands="Jhakri Cuffs +2",ring1="Kishar Ring",ring2="Stikini Ring",
        back=gear.nuke_jse_back,waist="Rumination Sash",legs="Psycloth Lappas",feet="Jhakri Pigaches +1"}
	
	sets.midcast['Enfeebling Magic'].Resistant = {main="Akademos",sub="Enki Strap",ammo="Pemphredo Tathlum",
        head="Befouled Crown",neck="Erra Pendant",ear1="Barkarole Earring",ear2="Digni. Earring",
        body="Shango Robe",hands="Jhakri Cuffs +2",ring1="Stikini Ring",ring2="Stikini Ring",
        back=gear.nuke_jse_back,waist="Rumination Sash",legs="Psycloth Lappas",feet="Jhakri Pigaches +1"}
		
    sets.midcast.ElementalEnfeeble = set_combine(sets.midcast['Enfeebling Magic'], {head="Amalric Coif",ear2="Barkaro. Earring",back=gear.nuke_jse_back,waist="Eschan Stone"})
    sets.midcast.ElementalEnfeeble.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {head="Amalric Coif",ear2="Barkaro. Earring",back=gear.nuke_jse_back,waist="Eschan Stone"})
	
	sets.midcast.IntEnfeebles = set_combine(sets.midcast['Enfeebling Magic'], {head="Amalric Coif",ear1="Barkaro. Earring",back=gear.nuke_jse_back,waist="Eschan Stone"})
	sets.midcast.IntEnfeebles.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {head="Amalric Coif",ear2="Barkaro. Earring",back=gear.nuke_jse_back,waist="Eschan Stone"})

	sets.midcast.MndEnfeebles = set_combine(sets.midcast['Enfeebling Magic'], {ring1="Stikini Ring"})
	sets.midcast.MndEnfeebles.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {ring1="Stikini Ring"})
	
	sets.midcast.Dia = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast.Diaga = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast['Dia II'] = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast.Bio = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast['Bio II'] = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	
	sets.midcast['Divine Magic'] = set_combine(sets.midcast['Enfeebling Magic'], {ring1="Stikini Ring"})

    sets.midcast['Dark Magic'] = {main="Rubicundity",sub="Genbu's Shield",ammo="Pemphredo Tathlum",
        head="Amalric Coif",neck="Incanter's Torque",ear1="Malignance Earring",ear2="Barkaro. Earring",
        body="Shango Robe",hands="Amalric Gages",ring1="Stikini Ring",ring2="Stikini Ring",
        back=gear.nuke_jse_back,waist="Eschan Stone",legs="Jhakri Slops +2",feet="Arbatel Loafers +1"}

    sets.midcast.Kaustra = {main="Akademos",sub="Niobid Strap",ammo="Pemphredo Tathlum",
        head="Pixie Hairpin +1",neck="Erra Pendant",ear1="Malignance Earring",ear2="Barkaro. Earring",
        body="Jhakri Robe +2",hands="Amalric Gages",ring1="Shiva Ring",ring2="Archon Ring",
        back=gear.nuke_jse_back,waist="Refoccilation Stone",legs=gear.merlinic_mb_legs,feet="Arbatel Loafers +1"}
		
    sets.midcast.Kaustra.Resistant = {main="Akademos",sub="Niobid Strap",ammo="Pemphredo Tathlum",
        head=gear.merlinic_mb_head,neck="Erra Pendant",ear1="Malignance Earring",ear2="Barkaro. Earring",
        body="Jhakri Robe +2",hands="Amalric Gages",ring1="Stikini Ring",ring2="Stikini Ring",
        back=gear.nuke_jse_back,waist="Eschan Stone",legs=gear.merlinic_mb_legs,feet="Arbatel Loafers +1"}

    sets.midcast.Drain = {main="Rubicundity",sub="Genbu's Shield",ammo="Pemphredo Tathlum",
        head="Pixie Hairpin +1",neck="Erra Pendant",ear1="Digni. Earring",ear2="Barkaro. Earring",
        body="Shango Robe",hands="Jhakri Cuffs +2",ring1="Kishar Ring",ring2="Excelsis Ring",
        back=gear.nuke_jse_back,waist="Fucho-no-obi",legs="Jhakri Slops +2",feet="Arbatel Loafers +1"}
		
    sets.midcast.Drain.Resistant = {main="Rubicundity",sub="Genbu's Shield",ammo="Pemphredo Tathlum",
        head="Amalric Coif",neck="Erra Pendant",ear1="Digni. Earring",ear2="Barkaro. Earring",
        body="Shango Robe",hands="Jhakri Cuffs +2",ring1="Stikini Ring",ring2="Stikini Ring",
        back=gear.nuke_jse_back,waist="Eschan Stone",legs="Jhakri Slops +2",feet="Arbatel Loafers +1"}

    sets.midcast.Aspir = sets.midcast.Drain
	sets.midcast.Aspir.Resistant = sets.midcast.Drain.Resistant

    sets.midcast.Stun = {main="Akademos",sub="Enki Strap",ammo="Sapience Orb",
        head="Amalric Coif",neck="Voltsurge Torque",ear1="Malignance Earring",ear2="Barkaro. Earring",
        body="Shango Robe",hands="Jhakri Cuffs +2",ring1="Kishar Ring",ring2="Stikini Ring",
        back=gear.nuke_jse_back,waist="Eschan Stone",legs="Psycloth Lappas",feet="Jhakri Pigaches +1"}

    sets.midcast.Stun.Resistant = {main="Akademos",sub="Enki Strap",ammo="Pemphredo Tathlum",
        head="Amalric Coif",neck="Erra Pendant",ear1="Malignance Earring",ear2="Barkaro. Earring",
        body="Shango Robe",hands="Jhakri Cuffs +2",ring1="Stikini Ring",ring2="Stikini Ring",
        back=gear.nuke_jse_back,waist="Eschan Stone",legs="Psycloth Lappas",feet="Jhakri Pigaches +1"}

    -- Elemental Magic sets are default for handling low-tier nukes.
    sets.midcast['Elemental Magic'] = {main="Akademos",sub="Enki Strap",ammo="Pemphredo Tathlum",
        head="Jhakri Coronal +2",neck="Eddy Necklace",ear1="Barkaro. Earring",ear2="Malignance Earring",
        body="Jhakri Robe +2",hands="Amalric Gages",ring1="Acumen Ring",ring2="Shiva Ring",
        back=gear.nuke_jse_back,waist=gear.elementalObi,legs="Amalric Slops",feet="Arbatel Loafers +1"}

    sets.midcast['Elemental Magic'].Resistant = {main="Akademos",sub="Niobid Strap",ammo="Pemphredo Tathlum",
        head="Amalric Coif",neck="Sanctity Necklace",ear1="Malignance Earring",ear2="Barkaro. Earring",
        body="Jhakri Robe +2",hands="Amalric Gages",ring1="Shiva Ring",ring2="Stikini Ring",
        back=gear.nuke_jse_back,waist="Rumination Sash",legs="Merlinic Shalwar",feet=gear.merlinic_mb_feet}
								
    -- Custom refinements for certain nuke tiers
	sets.midcast['Elemental Magic'].HighTierNuke = set_combine(sets.midcast['Elemental Magic'], {
        main="Akademos",sub="Niobid Strap",ammo="Pemphredo Tathlum"})

	sets.midcast['Elemental Magic'].HighTierNuke.Resistant = set_combine(sets.midcast['Elemental Magic'].Resistant, {
        main="Akademos",sub="Niobid Strap",ammo="Pemphredo Tathlum",
        ear1="Malignance Earring",ear2="Barkaro. Earring",hands="Amalric Gages"})

	sets.midcast.Helix = set_combine(sets.midcast['Elemental Magic'], {neck="Argute Stole +1"})
	
	sets.midcast.Helix.Resistant = set_combine(sets.midcast.Helix, {})
				
	sets.midcast.Dispelga = set_combine(sets.midcast['Enfeebling Magic'], {main="Daybreak", sub="Genbu's Shield"})

	sets.midcast.Impact = {main="Akademos",sub="Enki Strap",ammo="Pemphredo Tathlum",
		head=empty,neck="Erra Pendant",ear1="Malignance Earring",ear2="Barkaro. Earring",
		body="Twilight Cloak",hands="Jhakri Cuffs +2",ring1="Stikini Ring",ring2="Stikini Ring",
		back=gear.nuke_jse_back,waist="Eschan Stone",legs="Merlinic Shalwar",feet="Jhakri Pigaches +1"}
		
    -- Sets to return to when not performing an action.

     -- Resting sets
    sets.resting = {main="Daybreak",sub="Genbu's Shield",ammo="Staunch Tathlum",
        head="Befouled Crown",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Genmei Earring",
        body="Jhakri Robe +2",hands="Jhakri Cuffs +2",ring1="Defending Ring",ring2="Gelatinous Ring +1",
        back="Moonbeam Cape",waist="Fucho-no-Obi",legs="Assiduity Pants +1",feet="Battlecast Gaiters"}


    -- Idle sets (default idle set not needed since the other three are defined, but leaving for testing purposes)

    sets.idle = {main="Daybreak",sub="Genbu's Shield",ammo="Staunch Tathlum",
        head="Befouled Crown",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Genmei Earring",
        body="Jhakri Robe +2",hands="Jhakri Cuffs +2",ring1="Defending Ring",ring2="Gelatinous Ring +1",
        back="Moonbeam Cape",waist="Eschan Stone",legs="Assiduity Pants +1",feet="Battlecast Gaiters"}

    sets.idle.PDT = {main="Malignance Pole",sub="Enki Strap",ammo="Staunch Tathlum",
        head="Befouled Crown",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Genmei Earring",
        body="Jhakri Robe +2",hands="Jhakri Cuffs +2",ring1="Defending Ring",ring2="Gelatinous Ring +1",
        back="Moonbeam Cape",waist="Eschan Stone",legs="Assiduity Pants +1",feet="Battlecast Gaiters"}
		
	--sets.idle.Hippo = set_combine(sets.idle.PDT, {feet="Hippo. Socks +1"})

    sets.idle.Weak = {main="Malignance Pole",sub="Enki Strap",ammo="Staunch Tathlum",
        head="Befouled Crown",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Genmei Earring",
        body="Jhakri Robe +2",hands=gear.merlinic_refresh_hands,ring1="Defending Ring",ring2="Gelatinous Ring +1",
        back="Moonbeam Cape",waist="Eschan Stone",legs="Assid. Pants +1",feet="Battlecast Gaiters"}

    -- Defense sets

    sets.defense.PDT = {main="Malignance Pole",sub="Enki Strap",ammo="Staunch Tathlum",
        head=gear.merlinic_mb_head,neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Genmei Earring",
        body="Vrikodara Jupon",hands="Amalric Gages",ring1="Defending Ring",ring2="Gelatinous Ring +1",
        back="Moonbeam Cape",waist="Eschan Stone",legs=gear.merlinic_mb_legs,feet="Battlecast Gaiters"}

    sets.defense.MDT = {main="Malignance Pole",sub="Enki Strap",ammo="Staunch Tathlum",
        head="Vanya Hood",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Genmei Earring",
        body="Vrikodara Jupon",hands="Amalric Gages",ring1="Defending Ring",ring2="Archon Ring",
        back="Moonbeam Cape",waist="Eschan Stone",legs=gear.merlinic_mb_legs,feet="Battlecast Gaiters"}
		
    sets.defense.MEVA = {main="Malignance Pole",sub="Enki Strap",ammo="Staunch Tathlum",
        head=gear.merlinic_mb_head,neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Genmei Earring",
        body="Shango Robe",hands="Amalric Gages",ring1="Defending Ring",ring2="Archon Ring",
        back=gear.nuke_jse_back,waist="Eschan Stone",legs=gear.merlinic_mb_legs,feet="Telchine Pigaches"}
		
    sets.Kiting = {ring2="Shneddick Ring"}
    sets.latent_refresh = {waist="Fucho-no-obi"}
	sets.DuskIdle = {}
	sets.DayIdle = {}
	sets.NightIdle = {}

    -- Engaged sets

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion

    -- Normal melee group
    sets.engaged = {main="Malignance Pole",sub="Enki Strap",ammo="Staunch Tathlum",
        head="Befouled Crown",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Genmei Earring",
        body="Jhakri Robe +2",hands="Jhakri Cuffs +2",ring1="Defending Ring",ring2="Gelatinous Ring +1",
        back="Moonbeam Cape",waist="Eschan Stone",legs="Assid. Pants +1",feet="Jhakri Pigaches +1"}
		
	sets.engaged.PDT = {main="Malignance Pole",sub="Enki Strap",ammo="Staunch Tathlum",
        head="Jhakri Robe +2",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Genmei Earring",
        body="Vrikodara Jupon",hands="Amalric Gages",ring1="Defending Ring",ring2="Gelatinous Ring +1",
        back="Moonbeam Cape",waist="Eschan Stone",legs="Gyve Trousers",feet="Jhakri Pigaches +1"}

    -- Buff sets: Gear that needs to be worn to actively enhance a current player buff.
    sets.buff['Ebullience'] = {head="Arbatel Bonnet +1"}
    sets.buff['Rapture'] = {head="Arbatel Bonnet +1"}
    sets.buff['Perpetuance'] = {hands="Arbatel Bracers +1"}
    sets.buff['Immanence'] = {hands="Arbatel Bracers +1"}
    sets.buff['Penury'] = {} --{legs="Arbatel Pants +1"}
    sets.buff['Parsimony'] = {} --{legs="Arbatel Pants +1"}
    sets.buff['Celerity'] = {feet="Peda. Loafers +1"}
    sets.buff['Alacrity'] = {feet="Peda. Loafers +1"}
    sets.buff['Klimaform'] = {feet="Arbatel Loafers +1"}
	
	--sets.HPDown = {head="Pixie Hairpin +1",ear1="Mendicant's Earring",ear2="Evans Earring",
	--	body="Zendik Robe",hands="Hieros Mittens",ring1="Mephitas's Ring +1",ring2="Mephitas's Ring",
	--	back="Swith Cape +1",waist="Flax Sash",legs="Shedir Seraweels",feet=""}
	
	sets.buff.Doom = set_combine(sets.buff.Doom, {})
	sets.buff['Light Arts'] = {} --legs="Academic's Pants +3"
	sets.buff['Dark Arts'] = {} --body="Academic's Gown +3"

    sets.buff.FullSublimation = {waist="Embla Sash"}
    sets.buff.PDTSublimation = {}
	
	-- Weapons sets
	sets.weapons.Akademos = {main="Akademos",sub="Niobid Strap"}
end

-- Select default macro book on initial load or subjob change.
-- Default macro set/book
function select_default_macro_book()
	if player.sub_job == 'RDM' then
		set_macro_page(1, 8)
	elseif player.sub_job == 'BLM' then
		set_macro_page(2, 8)
	elseif player.sub_job == 'WHM' then
		set_macro_page(3, 8)
	else
		set_macro_page(4, 8)
	end
end