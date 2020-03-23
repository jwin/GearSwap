-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
    state.OffenseMode:options('Normal','Acc')
    state.RangedMode:options('Normal', 'Acc')
    state.WeaponskillMode:options('Match','Normal', 'Acc')
    state.CastingMode:options('Normal', 'Resistant')
    state.IdleMode:options('Normal', 'PDT')
	--state.ExtraMeleeMode = M{['description']='Extra Melee Mode', 'None', 'DWMax'}
	state.Weapons:options('Default','DualSavageWeapons','DualLeadenRanged','DualLeadenMelee','None')
	state.CompensatorMode:options('300','1000','Never','Always')

    gear.RAbullet = "Eminent Bullet"
    gear.WSbullet = "Eminent Bullet"
    gear.MAbullet = "Orichalc. Bullet" --For MAB WS, do not put single-use bullets here.
    gear.QDbullet = "Orichalc. Bullet"
    options.ammo_warning_limit = 10

	gear.tp_ranger_jse_back = {name="Camulus's Mantle",augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','Rng.Acc.+10','"Store TP"+10',}}
	--gear.snapshot_jse_back = {name="Camulus's Mantle",augments={'"Snapshot"+10',}}
	--gear.tp_jse_back = {name="Camulus's Mantle",augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10',}}
	--gear.ranger_wsd_jse_back = {name="Camulus's Mantle",augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','AGI+10','Weapon skill damage +10%',}}
	gear.magic_wsd_jse_back = {name="Camulus's Mantle",augments={'AGI+20','Mag. Acc+20 /Mag. Dmg.+20','AGI+10','Weapon skill damage +10%',}}
	--gear.str_wsd_jse_back = {name="Camulus's Mantle",augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}}
	gear.da_jse_back = {name="Camulus's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10',}}
	gear.str_wsd_jse_back = gear.magic_wsd_jse_back
	gear.snapshot_jse_back = gear.da_jse_back

    -- Additional local binds
	send_command('bind ^` gs c cycle ElementalMode')
	send_command('bind @` input /ja "Random Deal" <me>')
	send_command('bind !` gs c elemental quickdraw')
	
	send_command('bind ^backspace input /ja "Double-up" <me>')
	send_command('bind @backspace input /ja "Snake Eye" <me>')
	send_command('bind !backspace input /ja "Fold" <me>')
	send_command('bind ^@!backspace input /ja "Crooked Cards" <me>')
	
    send_command('bind !\\\\ input /ja "Bolter\'s Roll" <me>')
	send_command('bind ^\\\\ gs c toggle LuzafRing')
	send_command('bind @f7 gs c toggle RngHelper')

	send_command('bind ^q gs c weapons DualSavageWeapons;gs c update')
	send_command('bind !q gs c weapons DualLeadenMelee;gs c update')
	send_command('bind @q gs c cycle weapons;gs c update')
	send_command('bind @pause roller roll')

    select_default_macro_book()
end

-- Define sets and vars used by this job file.
function init_gear_sets()
    --------------------------------------
    -- Start defining the sets
    --------------------------------------

    -- Precast Sets

    -- Precast sets to enhance JAs

	sets.precast.JA['Triple Shot'] = {}--body="Chasseur's Frac +1"}
    sets.precast.JA['Snake Eye'] = {}--legs="Lanun Trews +1"}
    sets.precast.JA['Wild Card'] = {feet="Lanun Bottes +1"}
    sets.precast.JA['Random Deal'] = {body="Lanun Frac +1"}
    sets.precast.FoldDoubleBust = {}--hands="Lanun Gants +1"}

    sets.precast.CorsairRoll = {range="Compensator",
        head="Lanun Tricorne +1",neck="Regal Necklace",ear1="Etiolation Earring",ear2="Genmei Earring",
        body="Lanun Frac +1",hands="Chasseur's Gants",ring1="Defending Ring",ring2="Gelatinous Ring +1",
        back=gear.da_jse_back,waist="Flume Belt +1",legs=gear.herculean_ta_legs,feet="Malignance Boots"}

    sets.precast.LuzafRing = {ring2="Luzaf's Ring"}
    
    --sets.precast.CorsairRoll["Caster's Roll"] = set_combine(sets.precast.CorsairRoll, {legs="Chas. Culottes +1"})
    sets.precast.CorsairRoll["Courser's Roll"] = set_combine(sets.precast.CorsairRoll, {feet="Chasseur's Bottes"})
    sets.precast.CorsairRoll["Blitzer's Roll"] = set_combine(sets.precast.CorsairRoll, {head="Chass. Tricorne +1"})
    --sets.precast.CorsairRoll["Tactician's Roll"] = set_combine(sets.precast.CorsairRoll, {body="Chasseur's Frac +1"})
    --sets.precast.CorsairRoll["Allies' Roll"] = set_combine(sets.precast.CorsairRoll, {hands="Chasseur's Gants +1"})
    
    sets.precast.CorsairShot = {ammo=gear.QDbullet,
        head=gear.herculean_wsd_head,neck="Sanctity Necklace",ear1="Digni. Earring",ear2="Friomisi Earring",
        body="Samnuha Coat",hands="Leyline Gloves",ring1="Regal Ring",ring2="Stikini Ring",
        back=gear.tp_ranger_jse_back,waist="Eschan Stone",legs="Meg. Chausses +2",feet="Carmine Greaves"}
		
	sets.precast.CorsairShot.Damage = {ammo=gear.QDbullet,
        head=gear.herculean_wsd_head,neck="Sanctity Necklace",ear1="Digni. Earring",ear2="Friomisi Earring",
        body="Samnuha Coat",hands="Leyline Gloves",ring1="Regal Ring",ring2="Shiva Ring",
        back=gear.ranger_wsd_jse_back,waist="Eschan Stone",legs="Meg. Chausses +2",feet="Chasseur's Bottes"}
	
    sets.precast.CorsairShot['Light Shot'] = {ammo=gear.QDbullet,
        head="Chass. Tricorne +1",neck="Sanctity Necklace",ear1="Digni. Earring",ear2="Enervating Earring",
        body="Samnuha Coat",hands="Leyline Gloves",ring1="Stikini Ring",ring2="Stikini Ring",
        back=gear.ranger_wsd_jse_back,waist="Eschan Stone",legs="Meg. Chausses +2",feet="Malignance Boots"}

    sets.precast.CorsairShot['Dark Shot'] = set_combine(sets.precast.CorsairShot['Light Shot'], {feet="Chasseur's Bottes"})

    -- Waltz set (chr and vit)
    sets.precast.Waltz = {
        head="Chass. Tricorne +1",neck="Loricate Torque +1",ear1="Etiolation Earring",
        ring1="Defending Ring",ring2="Valseur's Ring",
        back="Moonbeam Cape",waist="Flume Belt +1"}
		
	sets.Self_Waltz = {head="Mummu Bonnet +2"}
        
    -- Don't need any special gear for Healing Waltz.
    sets.precast.Waltz['Healing Waltz'] = {}

    -- Fast cast sets for spells
    
    sets.precast.FC = {
        head="Chass. Tricorne +1",neck="Voltsurge Torque",ear1="Enchntr. Earring +1",ear2="Loquacious Earring",
        body="Samnuha Coat",hands="Leyline Gloves",ring1="Kishar Ring",ring2="Rahab Ring",
        back="Moonbeam Cape",waist="Flume Belt +1",legs="Carmine Cuisses +1",feet="Carmine Greaves"}

    --sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {neck="Magoraga Beads",body="Passion Jacket"})
	
	--sets.precast.FC.Cure = set_combine(sets.precast.FC, {ear2="Mendi. Earring"})

    sets.precast.RA = {ammo=gear.RAbullet,
        head="Chass. Tricorne +1",
        body="Laksa. Frac +2",hands="Malignance Gloves",
        back=gear.snapshot_jse_back,waist="Eschan Stone",legs="Lak. Trews +1",feet="Malignance Boots"}
		
	sets.precast.RA.Flurry = set_combine(sets.precast.RA, {})
	sets.precast.RA.Flurry2 = set_combine(sets.precast.RA, {})

       
    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {
        head="Meghanada Visor +1",neck="Fotia Gorget",ear1="Moonshade Earring",ear2="Enervating Earring",
        body="Laksa. Frac +2",hands="Meg. Gloves +2",ring1="Regal Ring",ring2="Rufescent Ring",
        back=gear.str_wsd_jse_back,waist="Fotia Belt",legs="Meg. Chausses +2",feet="Lanun Bottes +1"}
		
    sets.precast.WS.Acc = {
        head="Meghanada Visor +1",neck="Fotia Gorget",ear1="Moonshade Earring",ear2="Enervating Earring",
        body="Laksa. Frac +2",hands="Meg. Gloves +2",ring1="Regal Ring",ring2="Rufescent Ring",
        back=gear.str_wsd_jse_back,waist="Fotia Belt",legs="Meg. Chausses +2",feet="Lanun Bottes +1"}
				
    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.

    sets.precast.WS['Requiescat'] = set_combine(sets.precast.WS, {head="Chass. Tricorne +1",ring2="Rufescent Ring",legs="Carmine Cuisses +1",feet="Carmine Greaves"})
	
	sets.precast.WS['Savage Blade'] = {ammo=gear.WSbullet,
        head=gear.herculean_wsd_head,neck="Caro Necklace",ear1="Moonshade Earring",ear2="Ishvara Earring",
        body="Laksa. Frac +2",hands="Meg. Gloves +2",ring1="Regal Ring",ring2="Rufescent Ring",
        back=gear.str_wsd_jse_back,waist="Prosilio Belt",legs=gear.herculean_wsd_legs,feet=gear.herculean_ta_feet}

    sets.precast.WS['Savage Blade'].Acc = {ammo=gear.WSbullet,
        head="Chass. Tricorne +1",neck="Caro Necklace",ear1="Moonshade Earring",ear2="Ishvara Earring",
        body="Laksa. Frac +2",hands="Meg. Gloves +2",ring1="Regal Ring",ring2="Rufescent Ring",
        back=gear.str_wsd_jse_back,waist="Prosilio Belt",legs="Carmine Cuisses +1",feet="Lanun Bottes +1"}
	
    sets.precast.WS['Last Stand'] = {ammo=gear.WSbullet,
        head="Meghanada Visor +1",neck="Fotia Gorget",ear1="Moonshade Earring",ear2="Ishvara Earring",
        body="Laksa. Frac +2",hands="Meg. Gloves +2",ring1="Regal Ring",ring2="Acumen Ring",
        back=gear.ranger_wsd_jse_back,waist="Fotia Belt",legs="Meg. Chausses +2",feet="Lanun Bottes +1"}

    sets.precast.WS['Last Stand'].Acc = {ammo=gear.WSbullet,
        head="Meghanada Visor +1",neck="Sanctity Necklace",ear1="Moonshade Earring",ear2="Ishvara Earring",
        body="Laksa. Frac +2",hands="Meg. Gloves +2",ring1="Regal Ring",ring2="Acumen Ring",
        back=gear.ranger_wsd_jse_back,waist="Fotia Belt",legs="Meg. Chausses +2",feet="Lanun Bottes +1"}
		
    sets.precast.WS['Detonator'] = sets.precast.WS['Last Stand']
    sets.precast.WS['Detonator'].Acc = sets.precast.WS['Last Stand'].Acc
    sets.precast.WS['Slug Shot'] = sets.precast.WS['Last Stand']
    sets.precast.WS['Slug Shot'].Acc = sets.precast.WS['Last Stand'].Acc
    sets.precast.WS['Numbing Shot'] = sets.precast.WS['Last Stand']
    sets.precast.WS['Numbing Shot'].Acc = sets.precast.WS['Last Stand'].Acc
    sets.precast.WS['Sniper Shot'] = sets.precast.WS['Last Stand']
    sets.precast.WS['Sniper Shot'].Acc = sets.precast.WS['Last Stand'].Acc
    sets.precast.WS['Split Shot'] = sets.precast.WS['Last Stand']
    sets.precast.WS['Split Shot'].Acc = sets.precast.WS['Last Stand'].Acc
	
    sets.precast.WS['Leaden Salute'] = {ammo=gear.MAbullet,
        head="Pixie Hairpin +1",neck="Sanctity Necklace",ear1="Moonshade Earring",ear2="Friomisi Earring",
        body="Samnuha Coat",hands="Leyline Gloves",ring1="Regal Ring",ring2="Archon Ring",
        back=gear.magic_wsd_jse_back,waist="Eschan Stone",legs="Lak. Trews +1",feet="Lanun Bottes +1"}

    sets.precast.WS['Leaden Salute'].Acc = {ammo=gear.MAbullet,
        head="Pixie Hairpin +1",neck="Sanctity Necklace",ear1="Moonshade Earring",ear2="Friomisi Earring",
        body="Samnuha Coat",hands="Leyline Gloves",ring1="Regal Ring",ring2="Meghanada Ring",
        back=gear.magic_wsd_jse_back,waist="Eschan Stone",legs="Lak. Trews +1",feet="Lanun Bottes +1"}

    sets.precast.WS['Wildfire'] = {ammo=gear.MAbullet,
        head=gear.herculean_wsd_head,neck="Sanctity Necklace",ear1="Moonshade Earring",ear2="Friomisi Earring",
        body="Laksa. Frac +2",hands="Leyline Gloves",ring1="Regal Ring",ring2="Meghanada Ring",
        back=gear.magic_wsd_jse_back,waist="Eschan Stone",legs="Lak. Trews +1",feet="Lanun Bottes +1"}

    sets.precast.WS['Wildfire'].Acc = {ammo=gear.MAbullet,
        head=gear.herculean_wsd_head,neck="Sanctity Necklace",ear1="Moonshade Earring",ear2="Friomisi Earring",
        body="Laksa. Frac +2",hands="Leyline Gloves",ring1="Regal Ring",ring2="Meghanada Ring",
        back=gear.magic_wsd_jse_back,waist="Eschan Stone",legs="Lak. Trews +1",feet="Lanun Bottes +1"}
		
    sets.precast.WS['Hot Shot'] = sets.precast.WS['Wildfire']
    sets.precast.WS['Hot Shot'].Acc = sets.precast.WS['Wildfire'].Acc
		
	-- Swap to these on Moonshade using WS if at 3000 TP
	sets.MaxTP = {}
	sets.AccMaxTP = {}
        
    -- Midcast Sets
    sets.midcast.FastRecast = {
        head="Jhakri Coronal +2",neck="Voltsurge Torque",ear1="Enchntr. Earring +1",ear2="Loquacious Earring",
        body="Samnuha Coat",hands="Leyline Gloves",ring1="Kishar Ring",ring2="Rahab Ring",
        back="Moonbeam Cape",waist="Flume Belt +1",legs="Carmine Cuisses +1",feet="Carmine Greaves"}
        
    -- Specific spells

	sets.midcast.Cure = {
        head="Dampening Tam",neck="Sanctity Necklace",ear1="Enchntr. Earring +1",ear2="Etiolation Earring",
        body="Samnuha Coat",hands="Leyline Gloves",ring1="Stikini Ring",ring2="Stikini Ring",
        back="Solemnity Cape",waist="Flume Belt +1",legs="Carmine Cuisses +1",feet="Carmine Greaves"}
	
	sets.Self_Healing = {ring2="Kunaji Ring",waist="Gishdubar Sash"}
	sets.Cure_Received = {ring2="Kunaji Ring",waist="Gishdubar Sash"}
	sets.Self_Refresh = {waist="Gishdubar Sash"}
	
    sets.midcast.Utsusemi = sets.midcast.FastRecast

    -- Ranged gear
    sets.midcast.RA = {ammo=gear.RAbullet,
        head="Meghanada Visor +1",neck="Sanctity Necklace",ear1="Enervating Earring",ear2="Suppanomimi",
        body="Meg. Cuirie +2",hands="Malignance Gloves",ring1="Apate Ring",ring2="Meghanada Ring",
        back=gear.tp_ranger_jse_back,waist="Eschan Stone",legs="Meg. Chausses +2",feet="Malignance Boots"}

    sets.midcast.RA.Acc = {ammo=gear.RAbullet,
        head="Meghanada Visor +1",neck="Sanctity Necklace",ear1="Enervating Earring",ear2="Suppanomimi",
        body="Laksa. Frac +2",hands="Meg. Gloves +2",ring1="Apate Ring",ring2="Meghanada Ring",
        back=gear.tp_ranger_jse_back,waist="Eschan Stone",legs="Meg. Chausses +2",feet="Malignance Boots"}
		
	--sets.buff['Triple Shot'] = {body="Chasseur's Frac +1"}
    
    -- Sets to return to when not performing an action.
	
	sets.DayIdle = {}
	sets.NightIdle = {}
	
	sets.buff.Doom = set_combine(sets.buff.Doom, {})
    
    -- Resting sets
    sets.resting = {}
    

    -- Idle sets
    sets.idle = {ammo=gear.RAbullet,
        head="Meghanada Visor +1",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Genmei Earring",
        body="Meg. Cuirie +2",hands="Malignance Gloves",ring1="Defending Ring",ring2="Gelatinous Ring +1",
        back="Moonbeam Cape",waist="Flume Belt +1",legs="Carmine Cuisses +1",feet="Malignance Boots"}
		    
    -- Defense sets
    sets.defense.PDT = {ammo=gear.RAbullet,
        head="Meghanada Visor +1",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Genmei Earring",
        body="Meg. Cuirie +2",hands="Malignance Gloves",ring1="Defending Ring",ring2="Gelatinous Ring +1",
        back="Moonbeam Cape",waist="Flume Belt +1",legs="Meg. Chausses +2",feet="Malignance Boots"}

    sets.defense.MDT = {ammo=gear.RAbullet,
        head="Meghanada Visor +1",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Genmei Earring",
        body="Meg. Cuirie +2",hands="Malignance Gloves",ring1="Defending Ring",ring2="Gelatinous Ring +1",
        back="Moonbeam Cape",waist="Flume Belt +1",legs="Meg. Chausses +2",feet="Malignance Boots"}
		
    sets.defense.MEVA = {ammo=gear.RAbullet,
        head="Meghanada Visor +1",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Genmei Earring",
        body="Meg. Cuirie +2",hands="Malignance Gloves",ring1="Defending Ring",ring2="Gelatinous Ring +1",
        back="Moonbeam Cape",waist="Flume Belt +1",legs="Meg. Chausses +2",feet="Malignance Boots"}

    sets.Kiting = {legs="Carmine Cuisses +1"}
	sets.TreasureHunter = set_combine(sets.TreasureHunter, {})
	--sets.DWMax = {ear1="Dudgeon Earring",ear2="Heartseeker Earring",body="Adhemar Jacket",hands="Floral Gauntlets",waist="Reiki Yotai"}

	-- Weapons sets
	sets.weapons.Default = {main="Fettering Blade",sub="Nusku Shield",range="Molybdosis"}
	sets.weapons.DualSavageWeapons = {main="Kaja Sword",sub="Blurred Knife +1",range="Anarchy +2"}
	sets.weapons.DualLeadenRanged = {main="Kaja Sword",sub="Fettering Blade",range="Molybdosis"}
	sets.weapons.DualLeadenMelee = {main="Kaja Sword",sub="Fettering Blade",range="Molybdosis"}
	
    -- Engaged sets

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion
    
    -- Normal melee group
    sets.engaged = {
		head="Dampening Tam",neck="Lissome Necklace",ear1="Cessance Earring",ear2="Brutal Earring",
		body="Adhemar Jacket",hands="Adhemar Wristbands",ring1="Epona's Ring",ring2="Petrov Ring",
		back=gear.da_jse_back,waist="Windbuffet Belt +1",legs="Samnuha Tights",feet=gear.herculean_ta_feet}
    
    sets.engaged.Acc = {
		head="Chass. Tricorne +1",neck="Sanctity Necklace",ear1="Cessance Earring",ear2="Digni. Earring",
		body="Meg. Cuirie +2",hands="Adhemar Wristbands",ring1="Epona's Ring",ring2="Petrov Ring",
		back=gear.da_jse_back,waist="Windbuffet Belt +1",legs="Carmine Cuisses +1",feet=gear.herculean_acc_feet}

    sets.engaged.DW = {
		head="Dampening Tam",neck="Lissome Necklace",ear1="Suppanomimi",ear2="Brutal Earring",
		body="Adhemar Jacket",hands="Floral Gauntlets",ring1="Epona's Ring",ring2="Petrov Ring",
		back=gear.da_jse_back,waist="Windbuffet Belt +1",legs="Samnuha Tights",feet=gear.herculean_ta_feet}
    
    sets.engaged.DW.Acc = {
		head="Dampening Tam",neck="Sanctity Necklace",ear1="Cessance Earring",ear2="Brutal Earring",
		body="Adhemar Jacket",hands="Adhemar Wristbands",ring1="Epona's Ring",ring2="Petrov Ring",
		back=gear.da_jse_back,waist="Windbuffet Belt +1",legs="Carmine Cuisses +1",feet=gear.herculean_ta_feet}

end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    if player.sub_job == 'NIN' then
        set_macro_page(2, 9)
    elseif player.sub_job == 'DNC' then
		set_macro_page(1, 9)
    elseif player.sub_job == 'WAR' then
        set_macro_page(3, 9)
    else
        set_macro_page(4, 9)
    end   


end
