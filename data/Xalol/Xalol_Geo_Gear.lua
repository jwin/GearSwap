function user_setup()

	-- Options: Override default values
    state.OffenseMode:options('Normal')
	state.CastingMode:options('Normal', 'Resistant')
    state.IdleMode:options('Normal', 'PDT')
	state.PhysicalDefenseMode:options('PDT', 'NukeLock', 'GeoLock', 'PetPDT')
	state.MagicalDefenseMode:options('MDT', 'NukeLock')
	state.ResistDefenseMode:options('MEVA')
	state.Weapons:options('None','MalPole','Idris')

	--gear.nuke_jse_back = {name="Nantosuelta's Cape",augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','"Mag.Atk.Bns."+10'}}
	gear.idle_jse_back = {name="Nantosuelta's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Pet: "Regen"+10',}}
	
	gear.obi_cure_back = "Tempered Cape +1"
	gear.obi_cure_waist = "Witful Belt"

	gear.obi_low_nuke_back = gear.nuke_jse_back
	gear.obi_low_nuke_waist = "Sekhmet Corset"

	gear.obi_high_nuke_back = gear.nuke_jse_back
	gear.obi_high_nuke_waist = "Refoccilation Stone"
	
	autoindi = "Haste"
	autogeo = "Frailty"
	
	-- Additional local binds
	send_command('bind ^` gs c cycle ElementalMode')
	send_command('bind !` input /ja "Full Circle" <me>')
	send_command('bind @f8 gs c toggle AutoNukeMode')
	send_command('bind @` gs c cycle MagicBurstMode')
	send_command('bind @f10 gs c cycle RecoverMode')
	send_command('bind ^backspace input /ja "Entrust" <me>')
	send_command('bind !backspace input /ja "Life Cycle" <me>')
	send_command('bind @backspace input /ma "Sleep II" <t>')
	send_command('bind ^delete input /ma "Aspir III" <t>')
	send_command('bind @delete input /ma "Sleep" <t>')
	send_command('bind @q gs c cycle weapons;gs c update')
	
	indi_duration = 290
	
	select_default_macro_book()
end

function init_gear_sets()
	
	--------------------------------------
	-- Precast sets
	--------------------------------------

	-- Precast sets to enhance JAs
	sets.precast.JA.Bolster = {body="Bagua Tunic +1"}
	sets.precast.JA['Life Cycle'] = {back=gear.idle_jse_back} --body="Geo. Tunic +1",back=gear.idle_jse_back}
	sets.precast.JA['Radial Arcana'] = {} --feet="Bagua Sandals +1"}
	sets.precast.JA['Mending Halation'] = {} --legs="Bagua Pants +1"}
	sets.precast.JA['Full Circle'] = {head="Azimuth Hood +1"} --,hands="Bagua Mitaines +1"}
	
	-- Indi Duration in slots that would normally have skill here to make entrust more efficient.
	sets.buff.Entrust = {}
	
	-- Relic hat for Blaze of Glory HP increase.
	sets.buff['Blaze of Glory'] = {}
	
	-- Fast cast sets for spells

	sets.precast.FC = {main="Malevolence",sub="Genbu's Shield",range="Dunna",ammo=empty,
		head="Amalric Coif",neck="Voltsurge Torque",ear1="Enchntr. Earring +1",ear2="Malignance Earring",
		body="Shango Robe",hands="Telchine Gloves",ring1="Kishar Ring",ring2="Rahab Ring",
		back="Swith Cape +1",waist="Witful Belt",legs="Psycloth Lappas",feet="Battlecast Gaiters"}

	sets.precast.FC.Geomancy = set_combine(sets.precast.FC, {range="Dunna",ammo=empty})
	
    sets.precast.FC['Elemental Magic'] = set_combine(sets.precast.FC, {ear1="Barkaro. Earring"})

	sets.precast.FC.Cure = set_combine(sets.precast.FC, {main="Daybreak",sub="Sors Shield",back="Pahtli Cape"})
		
	sets.precast.FC.Curaga = sets.precast.FC.Cure
	
    sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {waist="Siegel Sash"})

    sets.precast.FC.Stoneskin = set_combine(sets.precast.FC['Enhancing Magic'], {head="Umuthi Hat"})

	--sets.precast.FC.Impact = {ammo="Impatiens",
	--	head=empty,neck="Voltsurge Torque",ear1="Enchntr. Earring +1",ear2="Loquacious Earring",
	--	body="Twilight Cloak",hands="Volte Gloves",ring1="Kishar Ring",ring2="Lebeche Ring",
	--	back="Lifestream Cape",waist="Witful Belt",legs="Geomancy Pants",feet="Regal Pumps +1"}
	
	-- Weaponskill sets
	-- Default set for any weaponskill that isn't any more specifically defined
	sets.precast.WS = {}


	--------------------------------------
	-- Midcast sets
	--------------------------------------

    sets.midcast.FastRecast = {main="Malevolence",sub="Genbu's Shield",range="Dunna",
		head="Amalric Coif",neck="Voltsurge Torque",ear1="Etiolation Earring",ear2="Malignance Earring",
		body="Jhakri Robe +2",hands="Jhakri Cuffs +2",ring1="Kishar Ring",ring2="Rahab Ring",
        back="Swith Cape +1",waist="Witful Belt",legs="Psycloth Lappas",feet="Jhakri Pigaches +1"}

	sets.midcast.Geomancy = {main="Idris",sub="Genbu's Shield",range="Dunna",
		head="Azimuth Hood +1",neck="Incanter's Torque",ear1="Etiolation Earring",ear2="Malignance Earring",
		body="Bagua Tunic +1",hands="Geo. Mitaines +2",ring1="Stikini Ring",ring2="Stikini Ring",
		back="Lifestream Cape",waist="Witful Belt",legs="Psycloth Lappas",feet="Jhakri Pigaches +1"}


	--Extra Indi duration as long as you can keep your 900 skill cap.
	sets.midcast.Geomancy.Indi = set_combine(sets.midcast.Geomancy, {})
		
    sets.midcast.Cure = {main="Daybreak",sub="Sors Shield",
        head="Amalric Coif",neck="Nodens Gorget",ear1="Etiolation Earring",ear2="Malignance Earring",
        body="Vrikodara Jupon",hands="Telchine Gloves",ring1="Stikini Ring",ring2="Stikini Ring",
        back="Solemnity Cape",waist="Witful Belt",legs="Gyve Trousers",feet="Jhakri Pigaches +1"}
		
    sets.midcast.LightWeatherCure = set_combine(sets.midcast.Cure, {waist="Hachirin-no-Obi"})
		
    sets.midcast.LightDayCure = set_combine(sets.midcast.Cure, {waist="Hachirin-no-Obi"})

    sets.midcast.Curaga = sets.midcast.Cure

	sets.midcast.Cursna =  set_combine(sets.midcast.Cure, {})
	
	sets.midcast.StatusRemoval = set_combine(sets.midcast.FastRecast, {})
	
    sets.midcast['Elemental Magic'] = {main="Contemplator",sub="Enki Strap",range="Dunna",
		head="Jhakri Coronal +2",neck="Eddy Necklace",ear1="Barkaro. Earring",ear2="Malignance Earring",
		body="Jhakri Robe +2",hands="Jhakri Cuffs +2",ring1="Acumen Ring",ring2="Shiva Ring",
		back="Aurist's Cape +1",waist="Eschan Stone",legs="Jhakri Slops +2",feet="Jhakri Pigaches +1"}

    sets.midcast['Elemental Magic'].Resistant = {main="Contemplator",sub="Enki Strap",range="Dunna",
		head="Jhakri Coronal +2",neck="Eddy Necklace",ear1="Barkaro. Earring",ear2="Malignance Earring",
		body="Jhakri Robe +2",hands="Jhakri Cuffs +2",ring1="Acumen Ring",ring2="Shiva Ring",
		back="Aurist's Cape +1",waist="Eschan Stone",legs="Jhakri Slops +2",feet="Jhakri Pigaches +1"}
		

	sets.midcast['Elemental Magic'].HighTierNuke = set_combine(sets.midcast['Elemental Magic'], {})
	sets.midcast['Elemental Magic'].HighTierNuke.Resistant = set_combine(sets.midcast['Elemental Magic'].Resistant, {})
		
    sets.midcast['Dark Magic'] = {main="Rubicundity",sub="Genbu's Shield",ammo="Pemphredo Tathlum",
        head=gear.merlinic_mb_head,neck="Erra Pendant",ear1="Barkaro. Earring",ear2="Malignance Earring",
        body="Jhakri Robe +2",hands="Amalric Gages",ring1="Stikini Ring",ring2="Stikini Ring",
        back="Aurist's Cape +1",waist="Eschan Stone",legs=gear.merlinic_mb_legs,feet="Jhakri Pigaches +1"}
		
    sets.midcast.Drain = {main="Rubicundity",sub="Genbu's Shield",ammo="Pemphredo Tathlum",
        head="Pixie Hairpin +1",neck="Erra Pendant",ear1="Barkaro. Earring",ear2="Malignance Earring",
        body="Jhakri Robe +2",hands="Amalric Gages",ring1="Archon Ring",ring2="Kishar Ring",
        back="Aurist's Cape +1",waist="Eschan Stone",legs=gear.merlinic_mb_legs,feet="Jhakri Pigaches +1"}
    
    sets.midcast.Aspir = sets.midcast.Drain
		
	sets.midcast.Stun = {main="Idris",sub="Genbu's Shield",ammo="Pemphredo Tathlum",
        head="Pixie Hairpin +1",neck="Erra Pendant",ear1="Barkaro. Earring",ear2="Malignance Earring",
        body="Jhakri Robe +2",hands="Amalric Gages",ring1="Archon Ring",ring2="Kishar Ring",
        back="Aurist's Cape +1",waist="Eschan Stone",legs=gear.merlinic_mb_legs,feet="Jhakri Pigaches +1"}
		
	sets.midcast.Stun.Resistant = {main="Idris",sub="Genbu's Shield",ammo="Pemphredo Tathlum",
        head="Pixie Hairpin +1",neck="Erra Pendant",ear1="Barkaro. Earring",ear2="Malignance Earring",
        body="Jhakri Robe +2",hands="Amalric Gages",ring1="Archon Ring",ring2="Kishar Ring",
        back="Aurist's Cape +1",waist="Eschan Stone",legs=gear.merlinic_mb_legs,feet="Jhakri Pigaches +1"}
		
	--sets.midcast.Impact = {main="Oranyan",sub="Enki Strap",ammo="Pemphredo Tathlum",
	--	head=empty,neck="Erra Pendant",ear1="Regal Earring",ear2="Barkaro. Earring",
	--	body="Twilight Cloak",hands="Regal Cuffs",ring1="Stikini Ring",ring2="Stikini Ring",
	--	back=gear.nuke_jse_back,waist="Acuity Belt +1",legs="Merlinic Shalwar",feet=gear.merlinic_nuke_feet}
		
	sets.midcast['Enfeebling Magic'] = {main="Idris",sub="Genbu's Shield",ammo="Pemphredo Tathlum",
        head="Befouled Crown",neck="Incanter's Torque",ear1="Barkaro. Earring",ear2="Malignance Earring",
        body="Shango Robe",hands="Jhakri Cuffs +2",ring1="Kishar Ring",ring2="Stikini Ring",
        back="Aurist's Cape +1",waist="Rumination Sash",legs="Psycloth Lappas",feet="Jhakri Pigaches +1"}
		
	sets.midcast['Enfeebling Magic'].Resistant = {main="Idris",sub="Genbu's Shield",ammo="Pemphredo Tathlum",
        head="Befouled Crown",neck="Incanter's Torque",ear1="Barkaro. Earring",ear2="Malignance Earring",
        body="Shango Robe",hands="Jhakri Cuffs +2",ring1="Kishar Ring",ring2="Stikini Ring",
        back="Aurist's Cape +1",waist="Rumination Sash",legs="Psycloth Lappas",feet="Jhakri Pigaches +1"}
		
    sets.midcast.ElementalEnfeeble = set_combine(sets.midcast['Enfeebling Magic'], {})
	
	sets.midcast.IntEnfeebles = set_combine(sets.midcast['Enfeebling Magic'], {})
	
	sets.midcast.MndEnfeebles = set_combine(sets.midcast['Enfeebling Magic'], {range=empty,ring1="Stikini Ring"})
		
	sets.midcast['Divine Magic'] = set_combine(sets.midcast['Enfeebling Magic'], {ring1="Stikini Ring"})
		
	sets.midcast['Enhancing Magic'] =  {main="Bolelabunga",sub="Genbu's Shield",ammo="Pemphredo Tathlum",
		head="Telchine Cap",neck="Incanter's Torque",ear1="Andoaa Earring",
		body="Telchine Chas.",hands="Telchine Gloves",ring1="Stikini Ring",ring2="Stikini Ring",
		back="Fi Follet Cape",waist="Embla Sash",legs="Telchine Braconi",feet="Telchine Pigaches"}

	sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {neck="Nodens Gorget",waist="Siegel Sash"})
	
	sets.midcast.Refresh = set_combine(sets.midcast['Enhancing Magic'], {head="Amalric Coif"})
	
	--sets.midcast.Aquaveil = set_combine(sets.midcast['Enhancing Magic'], {main="Vadose Rod",sub="Genbu's Shield",head="Amalric Coif",hands="Regal Cuffs",waist="Emphatikos Rope",legs="Shedir Seraweels"})
	
	--sets.midcast.BarElement = set_combine(sets.precast.FC['Enhancing Magic'], {legs="Shedir Seraweels"})
	
	sets.midcast.Protect = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring"})
	sets.midcast.Protectra = sets.midcast.Protect
	sets.midcast.Shell = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring"})
	sets.midcast.Shellra = sets.midcast.Shell
	
	sets.Self_Healing = {ring1="Kunaji Ring",waist="Gishdubar Sash"}
	sets.Cure_Received = {ring1="Kunaji Ring",waist="Gishdubar Sash"}
	sets.Self_Refresh = {}

	-- Gear for specific elemental nukes.
	sets.element.Wind = {main="Marin Staff +1"}
	--sets.element.Ice = {main="Ngqoqwanb"}
	--sets.element.Earth = {neck="Quanpur Necklace"}

	--------------------------------------
	-- Idle/resting/defense/etc sets
	--------------------------------------

	-- Resting sets
	sets.resting = {main="Contemplator",sub="Enki Strap",
		head="Befouled Crown",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Genmei Earring",
		body="Jhakri Robe +2",hands="Geomancy Mitaines +2",ring1="Defending Ring",ring2="Gelatinous Ring +1",
		back="Moonbeam Cape",legs="Assid. Pants +1",feet=gear.merlinic_refresh_feet}

	-- Idle sets

	sets.idle = {main="Daybreak",sub="Genbu's Shield",ammo="Staunch Tathlum",
        head="Befouled Crown",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Genmei Earring",
        body="Jhakri Robe +2",hands="Geomancy Mitaines +2",ring1="Defending Ring",ring2="Gelatinous Ring +1",
        back="Moonbeam Cape",waist="Fucho-no-obi",legs="Assiduity Pants +1",feet="Battlecast Gaiters"}
		
	sets.idle.PDT = set_combine(sets.idle, 
		{main="Malignance Pole",sub="Enki Strap",head="Vanya Hood"})

	-- .Pet sets are for when Luopan is present.
	sets.idle.Pet = {main="Idris",sub="Genbu's Shield",range="Dunna",ammo=empty,
        head="Azimuth Hood +1",neck="Sanctity Necklace",ear1="Etiolation Earring",ear2="Genmei Earring",
        body="Jhakri Robe +2",hands="Geomancy Mitaines +2",ring1="Defending Ring",ring2="Gelatinous Ring +1",
        back=gear.idle_jse_back,waist="Fucho-no-obi",legs="Psycloth Lappas",feet="Battlecast Gaiters"}
        
	sets.idle.PDT.Pet = set_combine(sets.idle.Pet, 
		{neck="Loricate Torque +1"})

	-- .Indi sets are for when an Indi-spell is active.
	sets.idle.Indi = set_combine(sets.idle, {})
	sets.idle.Pet.Indi = set_combine(sets.idle.Pet, {}) 
	sets.idle.PDT.Indi = set_combine(sets.idle.PDT, {}) 
	sets.idle.PDT.Pet.Indi = set_combine(sets.idle.PDT.Pet, {})

	sets.idle.Weak = {main="Idris",sub="Genbu's Shield",ammo="Staunch Tathlum",
        head="Befouled Crown",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Genmei Earring",
        body="Jhakri Robe +2",hands="Geomancy Mitaines +2",ring1="Defending Ring",ring2="Gelatinous Ring +1",
        back="Moonbeam Cape",waist="Fucho-no-obi",legs="Assiduity Pants +1",feet="Battlecast Gaiters"}

	-- Defense sets
	
	sets.defense.PDT = {main="Malignance Pole",sub="Enki Strap",ammo="Staunch Tathlum",
		head=gear.merlinic_mb_head,neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Genmei Earring",
		body="Vrikodara Jupon",hands="Geomancy Mitaines +2",ring1="Defending Ring",ring2="Gelatinous Ring +1",
		back="Moonbeam Cape",waist="Eschan Stone",legs=gear.merlinic_mb_legs,feet="Battlecast Gaiters"}

	sets.defense.MDT = {main="Malignance Pole",sub="Enki Strap",ammo="Staunch Tathlum",
		head="Azimuth Hood +1",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Genmei Earring",
		body="Vrikodara Jupon",hands="Geomancy Mitaines +2",ring1="Defending Ring",ring2="Archon Ring",
		back="Moonbeam Cape",waist="Eschan Stone",legs=gear.merlinic_mb_legs,feet="Battlecast Gaiters"}
		
    sets.defense.MEVA = {main="Malignance Pole",sub="Enki Strap",ammo="Staunch Tathlum",
        head="Azimuth Hood +1",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Genmei Earring",
		body=gear.merlinic_nuke_body,hands="Telchine Gloves",ring1="Defending Ring",ring2="Archon Ring",
		back="Moonbeam Cape",waist="Eschan Stone",legs=gear.merlinic_mb_legs,feet="Battlecast Gaiters"}
		
	sets.defense.PetPDT = sets.idle.PDT.Pet
		
	sets.defense.NukeLock = sets.midcast['Elemental Magic']
	
	sets.defense.GeoLock = sets.midcast.Geomancy.Indi

	sets.Kiting = {ring2="Shneddick Ring"}
	sets.latent_refresh = {waist="Fucho-no-obi"}
	sets.DayIdle = {}
	sets.NightIdle = {}
	--sets.TreasureHunter = set_combine(sets.TreasureHunter, {feet=gear.chironic_treasure_feet})
	
	--sets.HPDown = {head="Pixie Hairpin +1",ear1="Mendicant's Earring",ear2="Evans Earring",
	--	body="Jhakri Robe +2",hands="Jhakri Cuffs +2",ring1="Mephitas's Ring +1",ring2="Mephitas's Ring",
	--	back="Swith Cape +1",legs="Shedir Seraweels",feet="Jhakri Pigaches +2"}
	
	sets.buff.Doom = set_combine(sets.buff.Doom, {})

	--------------------------------------
	-- Engaged sets
	--------------------------------------

	sets.engaged = {range="Dunna",
        head="Azimuth Hood +1",neck="Sanctity Necklace",ear1="Cessance Earring",ear2="Moonshade Earring",
        body="Jhakri Robe +2",hands="Jhakri Cuffs +2",ring1="Rajas Ring",ring2="Excelsis Ring",
        back="Aurist's Cape +1",waist="Windbuffet Belt +1",legs="Jhakri Slops +2",feet="Jhakri Pigaches +1"}
		
	--------------------------------------
	-- Custom buff sets
	--------------------------------------
	
	-- Gear that converts elemental damage done to recover MP.	
	--sets.RecoverMP = {body="Seidr Cotehardie"}
	
	-- Gear for Magic Burst mode.
    sets.MagicBurst = {
        head=gear.merlinic_mb_head,neck="Mizu. Kubikazari",
        hands="Amalric Gages",ring1="Mujin Band",ring2="Locus Ring",
        legs=gear.merlinic_mb_legs,feet="Jhakri Pigaches +1"}

	-- Weapons sets
	sets.weapons.MalPole = {main="Malignance Pole",sub="Tzacab Grip",range="Dunna"}
	sets.weapons.Idris = {main="Idris",sub="Genbu's Shield",range="Dunna"}
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
	set_macro_page(1, 5)
end