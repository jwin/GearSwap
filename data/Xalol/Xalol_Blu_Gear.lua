function user_setup()
	-- Options: Override default values
    state.OffenseMode:options('Normal','SomeAcc','Acc','FullAcc')
	state.HybridMode:options('Normal','DTLite','PDT')
    state.WeaponskillMode:options('Match','Normal','SomeAcc','Acc','FullAcc')
    state.CastingMode:options('Normal','Resistant')
    state.IdleMode:options('Normal','PDT')
	state.PhysicalDefenseMode:options('PDT')
	state.MagicalDefenseMode:options('MDT')
	state.ResistDefenseMode:options('MEVA')
	
	state.Weapons:options('TanmoCol','KajaCol','VampClub','None')

    state.ExtraMeleeMode = M{['description']='Extra Melee Mode','None','SuppaBrutal'}

	--gear.da_jse_back = {name="Rosmerta's Cape",augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10',}}
	gear.stp_jse_back = {name="Rosmerta's Cape",augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10',}}
	gear.crit_jse_back = {name="Rosmerta's Cape",augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Crit.hit rate+10',}}
	--gear.wsd_jse_back = {name="Rosmerta's Cape",augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}}
	--gear.mab_jse_back = {name="Rosmerta's Cape",augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','"Mag.Atk.Bns."+10',}}

	-- temporary until capes are completed
	gear.da_jse_back = gear.stp_jse_back
	gear.wsd_jse_back = gear.crit_jse_back
	gear.mab_jse_back = gear.crit_jse_back

	-- Additional local binds
	send_command('bind ^` input /ja "Chain Affinity" <me>')
	send_command('bind @` input /ja "Efflux" <me>')
	send_command('bind !` input /ja "Burst Affinity" <me>')
	send_command('bind ^@!` gs c cycle SkillchainMode')
	send_command('bind ^backspace input /ja "Unbridled Learning" <me>;wait 1;input /ja "Diffusion" <me>;wait 2;input /ma "Mighty Guard" <me>')
	send_command('bind !backspace input /ja "Unbridled Learning" <me>;wait 1;input /ja "Diffusion" <me>;wait 2;input /ma "Carcharian Verve" <me>')
	send_command('bind @backspace input /ja "Convergence" <me>')

	select_default_macro_book()
end

function init_gear_sets()

	--------------------------------------
	-- Start defining the sets
	--------------------------------------

	sets.buff['Burst Affinity'] = {}--feet="Hashi. Basmak +1"}
	sets.buff['Chain Affinity'] = {}--feet="Assim. Charuqs +2"}
	sets.buff.Convergence = {} --head="Luh. Keffiyeh +1"}
	sets.buff.Diffusion = {feet="Luhlaza Charuqs +1"}
	sets.buff.Enchainment = {}
	sets.buff.Efflux = {back=gear.da_jse_back}--,legs="Hashishin Tayt +1"}
	sets.buff.Doom = set_combine(sets.buff.Doom, {})

	sets.HPDown = {head="Pixie Hairpin +1",
		hands="Jhakri Cuffs +2",ring1="Mephitas's Ring +1",
		back="Swith Cape +1"}

	-- Precast Sets

	-- Precast sets to enhance JAs
	sets.precast.JA['Azure Lore'] = {}--hands="Luh. Bazubands +1"}

	--[[ Waltz set (chr and vit)
	sets.precast.Waltz = {legs="Dashing Subligar"}

	-- Don't need any special gear for Healing Waltz.
	sets.precast.Waltz['Healing Waltz'] = {}

	sets.precast.Step = {ammo="Falcon Eye",
		head="Dampening Tam",neck="Combatant's Torque",ear1="Regal Earring",ear2="Telos Earring",
		body="Assimilator's Jubbah +2",hands="Assim. Bazu. +3",ring1="Ramuh Ring +1",ring2="Ramuh Ring +1",
		back=gear.da_jse_back,waist="Olseni Belt",legs="Carmine Cuisses +1",feet=gear.herculean_acc_feet}

	sets.precast.Flourish1 = {ammo="Falcon Eye",
		head="Jhakri Coronal +2",neck="Sanctity Necklace",ear1="Regal Earring",ear2="Digni. Earring",
		body="Jhakri Robe +2",hands="Jhakri Cuffs +2",ring1="Stikini Ring",ring2="Stikini Ring",
		back="Cornflower Cape",waist="Olseni Belt",legs="Jhakri Slops +2",feet="Jhakri Pigaches +1"}
		]]--

	-- Fast cast sets for spells

	sets.precast.FC = {ammo="Impatiens",
		head="Amalric Coif",neck="Voltsurge Torque",ear1="Enchntr. Earring +1",ear2="Loquacious Earring",
		body="Samnuha Coat",hands="Leyline Gloves",ring1="Kishar Ring",ring2="Rahab Ring",
		back="Swith Cape +1",waist="Witful Belt",legs="Ayanmo Cosciales +2",feet="Carmine Greaves"}

	--sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {body="Passion Jacket"})

	sets.precast.FC['Blue Magic'] = set_combine(sets.precast.FC, {})

	-- Default set for any weaponskill that isn't any more specifically defined
	sets.precast.WS = {ammo="Falcon Eye",
		head="Adhemar Bonnet",neck="Fotia Gorget",ear1="Moonshade Earring",ear2="Brutal Earring",
		body=gear.herculean_crit_body,hands="Adhemar Wristbands",ring1="Epona's Ring",ring2="Begrudging Ring",
		back=gear.crit_jse_back,waist="Fotia Belt",legs="Samnuha Tights",feet=gear.herculean_ta_feet}
	sets.precast.WS.SomeAcc = set_combine(sets.precast.WS, {})
	sets.precast.WS.Acc = set_combine(sets.precast.WS, {})
	sets.precast.WS.FullAcc = set_combine(sets.precast.WS, {})

	-- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
	sets.precast.WS['Requiescat'] = {ammo="Hydrocera",
		head="Jhakri Coronal +2",neck="Fotia Gorget",ear1="Moonshade Earring",ear2="Brutal Earring",
		body="Jhakri Robe +2",hands="Jhakri Cuffs +2",ring1="Epona's Ring",ring2="Rufescent Ring",
		back="Aurist's Cape +1",waist="Fotia Belt",legs="Jhakri Slops +2",feet="Jhakri Pigaches +1"}
	sets.precast.WS['Requiescat'].SomeAcc = set_combine(sets.precast.WS['Requiescat'], {})
	sets.precast.WS['Requiescat'].Acc = set_combine(sets.precast.WS['Requiescat'], {})
	sets.precast.WS['Requiescat'].FullAcc = set_combine(sets.precast.WS['Requiescat'], {})

	sets.precast.WS['Chant du Cygne'] = {ammo="Falcon Eye",
		head="Adhemar Bonnet",neck="Fotia Gorget",ear1="Moonshade Earring",ear2="Brutal Earring",
		body=gear.herculean_crit_body,hands="Adhemar Wristbands",ring1="Epona's Ring",ring2="Begrudging Ring",
		back=gear.crit_jse_back,waist="Fotia Belt",legs="Samnuha Tights",feet="Thereoid Greaves"}
	sets.precast.WS['Chant du Cygne'].SomeAcc = set_combine(sets.precast.WS['Chant du Cygne'], {})
	sets.precast.WS['Chant du Cygne'].Acc = set_combine(sets.precast.WS['Chant du Cygne'], {})
	sets.precast.WS['Chant du Cygne'].FullAcc = set_combine(sets.precast.WS['Chant du Cygne'], {})

	sets.precast.WS['Savage Blade'] = {ammo="Cheruski Needle",
		head=gear.herculean_wsd_head,neck="Caro Necklace",ear1="Moonshade Earring",ear2="Ishvara Earring",
		body="Assim. Jubbah +2",hands="Jhakri Cuffs +2",ring1="Apate Ring",ring2="Rufescent Ring",
		back="Cornflower Cape",waist="Prosilio Belt",legs="Jhakri Slops +2",feet=gear.herculean_ta_feet}
	sets.precast.WS['Savage Blade'].SomeAcc = set_combine(sets.precast.WS['Savage Blade'], {})
	sets.precast.WS['Savage Blade'].Acc = set_combine(sets.precast.WS['Savage Blade'], {})
	sets.precast.WS['Savage Blade'].FullAcc = set_combine(sets.precast.WS['Savage Blade'], {})

	-- Swap to these on Moonshade using WS if at 3000 TP
	sets.MaxTP = {ear1="Cessance Earring",ear2="Brutal Earring"}

	-- Midcast Sets
	sets.midcast.FastRecast = {ammo="Pemphredo Tathlum",
		head="Amalric Coif",neck="Voltsurge Torque",ear1="Enchntr. Earring +1",ear2="Loquacious Earring",
		body="Samnuha Coat",hands="Leyline Gloves",ring1="Kishar Ring",ring2="Rahab Ring",
		back="Swith Cape +1",waist="Witful Belt",legs="Ayanmo Cosciales +2",feet="Carmine Greaves"}

	sets.midcast['Blue Magic'] = {}

	-- Physical Spells --

	sets.midcast['Blue Magic'].Physical = {ammo="Cheruski Needle",
		head="Adhemar Bonnet",neck="Caro Necklace",ear1="Suppanomimi",ear2="Loquacious Earring",
		body="Assim. Jubbah +2",hands="Jhakri Cuffs +2",ring1="Rufescent Ring",ring2="Apate Ring",
		back=gear.wsd_jse_back,waist="Prosilio Belt",legs="Jhakri Slops +2",feet="Thereoid Greaves"}
	sets.midcast['Blue Magic'].Physical.Resistant = sets.midcast['Blue Magic'].Physical

	sets.midcast['Blue Magic'].PhysicalAcc = sets.midcast['Blue Magic'].Physical
	sets.midcast['Blue Magic'].PhysicalAcc.Resistant = set_combine(sets.midcast['Blue Magic'].PhysicalAcc, {})

	sets.midcast['Blue Magic'].PhysicalStr = set_combine(sets.midcast['Blue Magic'].Physical, {})
	sets.midcast['Blue Magic'].PhysicalStr.Resistant = set_combine(sets.midcast['Blue Magic'].Physical.Resistant, {})

	sets.midcast['Blue Magic'].PhysicalDex = set_combine(sets.midcast['Blue Magic'].Physical, {})
	sets.midcast['Blue Magic'].PhysicalDex.Resistant = set_combine(sets.midcast['Blue Magic'].Physical.Resistant, {})

	sets.midcast['Blue Magic'].PhysicalVit = set_combine(sets.midcast['Blue Magic'].Physical, {})
	sets.midcast['Blue Magic'].PhysicalVit.Resistant = set_combine(sets.midcast['Blue Magic'].Physical.Resistant, {})

	sets.midcast['Blue Magic'].PhysicalAgi = set_combine(sets.midcast['Blue Magic'].Physical, {})
	sets.midcast['Blue Magic'].PhysicalAgi.Resistant = set_combine(sets.midcast['Blue Magic'].Physical.Resistant, {})

	sets.midcast['Blue Magic'].PhysicalInt = set_combine(sets.midcast['Blue Magic'].Physical, {})
	sets.midcast['Blue Magic'].PhysicalInt.Resistant = set_combine(sets.midcast['Blue Magic'].Physical.Resistant, {})

	sets.midcast['Blue Magic'].PhysicalMnd = set_combine(sets.midcast['Blue Magic'].Physical, {})
	sets.midcast['Blue Magic'].PhysicalMnd.Resistant = set_combine(sets.midcast['Blue Magic'].Physical.Resistant, {})

	sets.midcast['Blue Magic'].PhysicalChr = set_combine(sets.midcast['Blue Magic'].Physical, {})
	sets.midcast['Blue Magic'].PhysicalChr.Resistant = set_combine(sets.midcast['Blue Magic'].Physical.Resistant, {})

	sets.midcast['Blue Magic'].PhysicalHP = set_combine(sets.midcast['Blue Magic'].Physical, {})
	sets.midcast['Blue Magic'].PhysicalHP.Resistant = set_combine(sets.midcast['Blue Magic'].Physical.Resistant, {})

	-- Magical Spells --

	sets.midcast['Blue Magic'].Magical = {ammo="Pemphredo Tathlum",
		head="Jhakri Coronal +2",neck="Eddy Necklace",ear1="Regal Earring",ear2="Friomisi Earring",
		body="Jhakri Robe +2",hands="Amalric Gages",ring1="Shiva Ring",ring2="Acumen Ring",
		back="Cornflower Cape",waist=gear.ElementalObi,legs="Amalric Slops",feet="Jhakri Pigaches +1"}
					 
	sets.midcast['Blue Magic'].Magical.Resistant = set_combine(sets.midcast['Blue Magic'].Magical, {
		neck="Sanctity Necklace",hands="Jhakri Cuffs +2",ring1="Stikini Ring",ring2="Stikini Ring"})

	sets.midcast['Blue Magic'].MagicalMnd = set_combine(sets.midcast['Blue Magic'].Magical, {neck="Sanctity Necklace",ring1="Stikini Ring",ring2="Stikini Ring"})
	sets.midcast['Blue Magic'].MagicalChr = set_combine(sets.midcast['Blue Magic'].Magical, {})
	sets.midcast['Blue Magic'].MagicalVit = set_combine(sets.midcast['Blue Magic'].Magical, {})
	sets.midcast['Blue Magic'].MagicalDex = set_combine(sets.midcast['Blue Magic'].Magical, {})

	sets.midcast['Blue Magic'].MagicAccuracy = sets.midcast['Blue Magic'].Magical.Resistant

	sets.midcast['Enfeebling Magic'] = {ammo="Pemphredo Tathlum",
		head="Jhakri Coronal +2",neck="Eddy Necklace",ear1="Enchntr. Earring +1",ear2="Digni. Earring",
		body="Jhakri Robe +2",hands="Amalric Gages",ring1="Stikini Ring",ring2="Stikini Ring",
		back="Cornflower Cape",waist="Eschan Stone",legs="Psycloth Lappas",feet="Jhakri Pigaches +1"}

	sets.midcast['Dark Magic'] = {ammo="Pemphredo Tathlum",
		head="Jhakri Coronal +2",neck="Erra Pendant",ear1="Etiolation Earring",ear2="Digni. Earring",
		body="Jhakri Robe +2",hands="Jhakri Cuffs +2",ring1="Stikini Ring",ring2="Stikini Ring",
		back="Cornflower Cape",waist="Eschan Stone",legs="Jhakri Slops +2",feet="Jhakri Pigaches +1"}

	sets.midcast['Enhancing Magic'] = {ammo="Pemphredo Tathlum",
		head="Telchine Cap",neck="Incanter's Torque",ear1="Etiolation Earring",ear2="Andoaa Earring",
		body="Telchine Chas.",hands="Telchine Gloves",ring1="Stikini Ring",ring2="Stikini Ring",
		back="Fi Follet Cape",waist="Olympus Sash",legs="Telchine Braconi",feet="Telchine Pigaches"}

	sets.midcast.Refresh = set_combine(sets.midcast['Enhancing Magic'], {head="Amalric Coif"})

	sets.midcast.Aquaveil = set_combine(sets.midcast['Enhancing Magic'], {head="Amalric Coif"})

	sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {waist="Siegel Sash"})

	--sets.midcast.BarElement = set_combine(sets.precast.FC['Enhancing Magic'], {legs="Shedir Seraweels"})
	
	sets.midcast.Protect = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring"})
	sets.midcast.Protectra = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring"})
	sets.midcast.Shell = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring"})
	sets.midcast.Shellra = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring"})

	sets.midcast['Divine Magic'] = {ammo="Pemphredo Tathlum",
		head="Jhakri Coronal +2",neck="Incanter's Torque",ear1="Etiolation Earring",ear2="Digni. Earring",
		body="Jhakri Robe +2",hands="Jhakri Cuffs +2",ring1="Stikini Ring",ring2="Stikini Ring",
		back="Cornflower Cape",waist="Eschan Stone",legs="Jhakri Slops +2",feet="Jhakri Pigaches +1"}

	sets.midcast['Elemental Magic'] = {ammo="Pemphredo Tathlum",
		head="Jhakri Coronal +2",neck="Eddy Necklace",ear1="Etiolation Earring",ear2="Friomisi Earring",
		body="Jhakri Robe +2",hands="Amalric Gages",ring1="Acumen Ring",ring2="Shiva Ring",
		back="Cornflower Cape",waist=gear.ElementalObi,legs="Jhakri Slops +2",feet="Jhakri Pigaches +1"}

	sets.midcast['Elemental Magic'].Resistant = {ammo="Pemphredo Tathlum",
		head="Jhakri Coronal +2",neck="Sanctity Necklace",ear1="Etiolation Earring",ear2="Friomisi Earring",
		body="Jhakri Robe +2",hands="Jhakri Cuffs +2",ring1="Acumen Ring",ring2="Shiva Ring",
		back="Cornflower Cape",waist="Eschan Stone",legs="Jhakri Slops +2",feet="Jhakri Pigaches +1"}

	sets.midcast.Helix = sets.midcast['Elemental Magic']
	sets.midcast.Helix.Resistant = sets.midcast['Elemental Magic'].Resistant

	sets.element.Dark = {head="Pixie Hairpin +1",ring2="Archon Ring"}
	sets.element.Earth = {}--{neck="Quanpur Necklace"}
	sets.element.Light = {} --ring2="Weatherspoon Ring"

	sets.midcast.Cure = {ammo="Pemphredo Tathlum",
		head="Dampening Tam",neck="Incanter's Torque",ear1="Etiolation Earring",ear2="Andoaa Earring",
		body="Vrikodara Jupon",hands="Telchine Gloves",ring1="Stikini Ring",ring2="Stikini Ring",
		back="Solemnity Cape",waist=gear.ElementalObi,legs="Carmine Cuisses +1",feet="Carmine Greaves"}

	-- Breath Spells --

	sets.midcast['Blue Magic'].Breath = {ammo="Mavi Tathlum",
		head="Telchine Cap",neck="Incanter's Torque",ear1="Etiolation Earring",ear2="Digni. Earring",
		body="Assimilator's Jubbah +2",hands="Jhakri Cuffs +2",ring1="Kunaji Ring",ring2="Rufescent Ring",
		back="Cornflower Cape",feet="Luhlaza Charuqs +1"}

	-- Physical Added Effect Spells most notably "Stun" spells --

	sets.midcast['Blue Magic'].Stun = {ammo="Pemphredo Tathlum",
		head="Jhakri Coronal +2",neck="Erra Pendant",ear1="Etiolation Earring",ear2="Digni. Earring",
		body="Jhakri Robe +2",hands="Jhakri Cuffs +2",ring1="Stikini Ring",ring2="Stikini Ring",
		back="Cornflower Cape",waist="Eschan Stone",legs="Jhakri Slops +2",feet="Jhakri Pigaches +1"}

	sets.midcast['Blue Magic'].Stun.Resistant = {ammo="Falcon Eye",
		head="Jhakri Coronal +2",neck="Erra Pendant",ear1="Etiolation Earring",ear2="Digni. Earring",
		body="Jhakri Robe +2",hands="Jhakri Cuffs +2",ring1="Stikini Ring",ring2="Stikini Ring",
		back="Cornflower Cape",waist="Eschan Stone",legs="Jhakri Slops +2",feet="Jhakri Pigaches +1"}

	-- Other Specific Spells --

	sets.midcast['Blue Magic']['White Wind'] = {ammo="Mavi Tathlum",
		head="Dampening Tam",neck="Incanter's Torque",ear1="Etiolation Earring",ear2="Loquac. Earring",
		body="Vrikodara Jupon",hands="Telchine Gloves",ring1="Stikini Ring",ring2="Stikini Ring",
		back="Solemnity Cape",waist=gear.ElementalObi,legs="Gyve Trousers",feet="Carmine Greaves"}
					
	sets.midcast['Blue Magic']['Healing Breeze'] = sets.midcast['Blue Magic']['White Wind']

	sets.midcast['Blue Magic'].Healing = {ammo="Staunch Tathlum",
		head="Dampening Tam",neck="Incanter's Torque",ear1="Etiolation Earring",ear2="Andoaa Earring",
		body="Vrikodara Jupon",hands="Telchine Gloves",ring1="Stikini Ring",ring2="Stikini Ring",
		back="Solemnity Cape",waist=gear.ElementalObi,legs="Carmine Cuisses +1",feet="Carmine Greaves"}

	--Overwrite certain spells with these peices even if the day matches, because of resource inconsistancies.
	sets.NonElementalCure = {back="Solemnity Cape",waist="Hachirin-no-obi"}

	sets.midcast['Blue Magic'].SkillBasedBuff = {ammo="Mavi Tathlum",
		head="Telchine Cap",neck="Mirage Stole +1",ear1="Etiolation Earring",ear2="Loquac. Earring",
		body="Assimilator's Jubbah +2",hands="Jhakri Cuffs +2",ring1="Stikini Ring",ring2="Stikini Ring",
		back="Cornflower Cape",waist="Witful Belt",legs="Psycloth Lappas",feet="Luhlaza Charuqs +1"}

	sets.midcast['Blue Magic'].Buff = {ammo="Mavi Tathlum",
		head="Telchine Cap",neck="Incanter's Torque",ear1="Etiolation Earring",ear2="Loquac. Earring",
		body="Assimilator's Jubbah +2",hands="Jhakri Cuffs +2",ring1="Kishar Ring",ring2="Stikini Ring",
		back="Aurist's Cape +1",waist="Witful Belt",legs="Psycloth Lappas",feet="Carmine Greaves"}

	sets.midcast['Blue Magic']['Battery Charge'] = set_combine(sets.midcast['Blue Magic'].Buff, {head="Amalric Coif"})

	sets.midcast['Blue Magic']['Carcharian Verve'] = set_combine(sets.midcast['Blue Magic'].Buff, {head="Amalric Coif"})

	-- Sets to return to when not performing an action.

	sets.latent_refresh = {waist="Fucho-no-obi"}
	sets.DayIdle = {}
	sets.NightIdle = {}

	-- Resting sets
	sets.resting = {ammo="Staunch Tathlum",
		head="Rawhide Mask",neck="Loricate Torque +1",ear1="Etiolation Earring", ear2="Genmei Earring",
		body="Jhakri Robe +2",hands="Malignance Gloves",ring1="Defending Ring",ring2="Gelatinous Ring +1",
		back="Moonbeam Cape",waist="Flume Belt +1",legs="Carmine Cuisses +1",feet="Malignance Boots"}

	-- Idle sets
	sets.idle = {ammo="Staunch Tathlum",
		head="Rawhide Mask",neck="Loricate Torque +1",ear1="Etiolation Earring", ear2="Genmei Earring",
		body="Jhakri Robe +2",hands="Malignance Gloves",ring1="Defending Ring",ring2="Gelatinous Ring +1",
		back="Moonbeam Cape",waist="Flume Belt +1",legs="Carmine Cuisses +1",feet="Malignance Boots"}

	--sets.idle.Sphere = set_combine(sets.idle, {body="Mekosu. Harness"})

	sets.idle.PDT = {main="Bolelabunga",sub="Genbu's Shield",ammo="Staunch Tathlum",
		head="Dampening Tam",neck="Loricate Torque +1",ear1="Etiolation Earring", ear2="Genmei Earring",
		body="Malignance Tabard",hands="Malignance Gloves",ring1="Defending Ring",ring2="Gelatinous Ring +1",
		back="Moonbeam Cape",waist="Flume Belt +1",legs="Ayanmo Cosciales +2",feet="Malignance Boots"}

	--sets.idle.DTHippo = set_combine(sets.idle.PDT, {legs="Carmine Cuisses +1",feet="Hippo. Socks +1"})

	-- Defense sets
	sets.defense.PDT = {ammo="Staunch Tathlum",
		head="Dampening Tam",neck="Loricate Torque +1",ear1="Suppanomimi", ear2="Brutal Earring",
		body="Malignance Tabard",hands="Malignance Gloves",ring1="Defending Ring",ring2="Gelatinous Ring +1",
		back="Moonbeam Cape",waist="Flume Belt +1",legs="Ayanmo Cosciales +2",feet="Malignance Boots"}

	sets.defense.MDT = {ammo="Staunch Tathlum",
		head="Dampening Tam",neck="Loricate Torque +1",ear1="Suppanomimi", ear2="Brutal Earring",
		body="Malignance Tabard",hands="Malignance Gloves",ring1="Defending Ring",ring2="Archon Ring",
		back="Moonbeam Cape",waist="Flume Belt +1",legs="Ayanmo Cosciales +2",feet="Malignance Boots"}

    sets.defense.MEVA ={ammo="Staunch Tathlum",
		head="Dampening Tam",neck="Loricate Torque +1",ear1="Suppanomimi", ear2="Brutal Earring",
		body="Ayanmo Corazza +2",hands="Malignance Gloves",ring1="Defending Ring",ring2="Archon Ring",
		back="Moonbeam Cape",waist="Flume Belt +1",legs="Ayanmo Cosciales +2",feet="Malignance Boots"}

	sets.Kiting = {legs="Carmine Cuisses +1"}

    -- Extra Melee sets.  Apply these on top of melee sets.
	sets.SuppaBrutal = {ear1="Suppanomimi", ear2="Brutal Earring"}
	sets.TreasureHunter = set_combine(sets.TreasureHunter, {})
	
	-- Weapons sets
	sets.weapons.TanmoCol = {main="Tanmogayi +1",sub="Colada"}
	sets.weapons.KajaCol = {main="Naegling",sub="Colada"}
	sets.weapons.VampClub= {main="Vampirism",sub="Nibiru Cudgel"}

	-- Engaged sets

	sets.engaged = {ammo="Ginsen",
		head="Adhemar Bonnet",neck="Lissome Necklace",ear1="Cessance Earring",ear2="Brutal Earring",
		body="Adhemar Jacket",hands="Adhemar Wristbands",ring1="Epona's Ring",ring2="Petrov Ring",
		back=gear.da_jse_back,waist="Windbuffet Belt +1",legs="Samnuha Tights",feet=gear.herculean_ta_feet}

	sets.engaged.SomeAcc = {ammo="Ginsen",
		head="Adhemar Bonnet",neck="Lissome Necklace",ear1="Cessance Earring",ear2="Brutal Earring",
		body="Adhemar Jacket",hands="Adhemar Wristbands",ring1="Epona's Ring",ring2="Petrov Ring",
		back=gear.da_jse_back,waist="Windbuffet Belt +1",legs="Samnuha Tights",feet=gear.herculean_ta_feet}

	sets.engaged.Acc = {ammo="Ginsen",
		head="Adhemar Bonnet",neck="Lissome Necklace",ear1="Cessance Earring",ear2="Brutal Earring",
		body="Adhemar Jacket",hands="Adhemar Wristbands",ring1="Epona's Ring",ring2="Petrov Ring",
		back=gear.da_jse_back,waist="Windbuffet Belt +1",legs="Samnuha Tights",feet=gear.herculean_ta_feet}

	sets.engaged.FullAcc = {ammo="Ginsen",
		head="Adhemar Bonnet",neck="Lissome Necklace",ear1="Cessance Earring",ear2="Brutal Earring",
		body="Adhemar Jacket",hands="Adhemar Wristbands",ring1="Epona's Ring",ring2="Petrov Ring",
		back=gear.da_jse_back,waist="Windbuffet Belt +1",legs="Samnuha Tights",feet=gear.herculean_ta_feet}


	sets.engaged.DTLite = {ammo="Ginsen",
		head="Adhemar Bonnet",neck="Lissome Necklace",ear1="Cessance Earring",ear2="Brutal Earring",
		body="Malignance Tabard",hands="Malignance Gloves",ring1="Epona's Ring",ring2="Defending Ring",
		back=gear.da_jse_back,waist="Windbuffet Belt +1",legs=gear.herculean_ta_legs,feet="Malignance Boots"}

	sets.engaged.PDT = {ammo="Ginsen",
		head="Adhemar Bonnet",neck="Lissome Necklace",ear1="Cessance Earring",ear2="Brutal Earring",
		body="Malignance Tabard",hands="Adhemar Wristbands",ring1="Epona's Ring",ring2="Petrov Ring",
		back=gear.da_jse_back,waist="Windbuffet Belt +1",legs=gear.herculean_ta_legs,feet=gear.herculean_ta_feet}

	sets.engaged.SomeAcc.DTLite = {ammo="Ginsen",
		head="Adhemar Bonnet",neck="Lissome Necklace",ear1="Cessance Earring",ear2="Brutal Earring",
		body="Adhemar Jacket",hands="Adhemar Wristbands",ring1="Epona's Ring",ring2="Petrov Ring",
		back=gear.da_jse_back,waist="Windbuffet Belt +1",legs=gear.herculean_ta_legs,feet=gear.herculean_ta_feet}

	sets.engaged.SomeAcc.PDT = {ammo="Ginsen",
		head="Adhemar Bonnet",neck="Lissome Necklace",ear1="Cessance Earring",ear2="Brutal Earring",
		body="Adhemar Jacket",hands="Adhemar Wristbands",ring1="Epona's Ring",ring2="Petrov Ring",
		back=gear.da_jse_back,waist="Windbuffet Belt +1",legs=gear.herculean_ta_legs,feet=gear.herculean_ta_feet}

	sets.engaged.Acc.DTLite = {ammo="Ginsen",
		head="Adhemar Bonnet",neck="Lissome Necklace",ear1="Cessance Earring",ear2="Brutal Earring",
		body="Adhemar Jacket",hands="Adhemar Wristbands",ring1="Epona's Ring",ring2="Petrov Ring",
		back=gear.da_jse_back,waist="Windbuffet Belt +1",legs=gear.herculean_ta_legs,feet=gear.herculean_ta_feet}

	sets.engaged.Acc.PDT = {ammo="Ginsen",
		head="Adhemar Bonnet",neck="Lissome Necklace",ear1="Cessance Earring",ear2="Brutal Earring",
		body="Adhemar Jacket",hands="Adhemar Wristbands",ring1="Epona's Ring",ring2="Petrov Ring",
		back=gear.da_jse_back,waist="Windbuffet Belt +1",legs=gear.herculean_ta_legs,feet=gear.herculean_ta_feet}

	sets.engaged.FullAcc.DTLite = {ammo="Ginsen",
		head="Adhemar Bonnet",neck="Lissome Necklace",ear1="Cessance Earring",ear2="Brutal Earring",
		body="Adhemar Jacket",hands="Adhemar Wristbands",ring1="Epona's Ring",ring2="Petrov Ring",
		back=gear.da_jse_back,waist="Windbuffet Belt +1",legs=gear.herculean_ta_legs,feet=gear.herculean_ta_feet}

	sets.engaged.FullAcc.PDT = {ammo="Ginsen",
		head="Adhemar Bonnet",neck="Lissome Necklace",ear1="Cessance Earring",ear2="Brutal Earring",
		body="Adhemar Jacket",hands="Adhemar Wristbands",ring1="Epona's Ring",ring2="Petrov Ring",
		back=gear.da_jse_back,waist="Windbuffet Belt +1",legs=gear.herculean_ta_legs,feet=gear.herculean_ta_feet}


	sets.Self_Healing = {waist="Gishdubar Sash",ring2="Kunaji Ring"}
	sets.Cure_Received = {waist="Gishdubar Sash",ring2="Kunaji Ring"}
	sets.Self_Refresh = {head="Amalric Coif",waist="Gishdubar Sash"}
	sets.MagicBurst = {body="Samnuha Coat",hands="Amalric Gages",ring1="Mujin Band",ring2="Locus Ring"}

end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
	-- Default macro set/book
	if player.sub_job == 'DNC' then
		set_macro_page(4, 4)
	elseif player.sub_job == 'NIN' then
		set_macro_page(3, 4)
	elseif player.sub_job == 'WAR' then
		set_macro_page(1, 4)
	elseif player.sub_job == 'RUN' then
		set_macro_page(6, 4)
	elseif player.sub_job == 'THF' then
		set_macro_page(5, 4)
	elseif player.sub_job == 'RDM' then
		set_macro_page(2, 4)
	else
		set_macro_page(7, 4)
	end
end
