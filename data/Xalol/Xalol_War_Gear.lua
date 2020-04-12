function user_setup()
	-- Options: Override default values
    state.OffenseMode:options('Normal','SomeAcc','Acc','FullAcc')
    state.WeaponskillMode:options('Match','Normal','SomeAcc','Acc','FullAcc')
    state.HybridMode:options('Normal','PDT')
    state.PhysicalDefenseMode:options('PDT')
    state.MagicalDefenseMode:options('MDT')
	state.ResistDefenseMode:options('MEVA')
	state.IdleMode:options('Normal','PDT','Refresh','Reraise')
    state.ExtraMeleeMode = M{['description']='Extra Melee Mode','None'}
	state.Passive = M{['description'] = 'Passive Mode','None','Twilight'}
	state.Weapons:options('Greataxe','Greatsword','SwordShield')

	gear.da_jse_back = {name="Cichol's Mantle",augments={'DEX+20','Accuracy+20 Attack+20','"Dbl.Atk."+10'}}
	gear.wsd_jse_back = { name="Cichol's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}}

	-- Additional local binds
	send_command('bind ^` input /ja "Hasso" <me>')
	send_command('bind !` input /ja "Seigan" <me>')
	send_command('bind @` gs c cycle SkillchainMode')
	send_command('bind !q gs c weapons Greatsword;gs c update')
	send_command('bind ^q gs c weapons Greataxe;gs c update')
	send_command('bind @q gs c cycle weapons;gs c update')
	
	
	select_default_macro_book()
end

-- Define sets and vars used by this job file.
function init_gear_sets()
	--------------------------------------
	-- Start defining the sets
	--------------------------------------
	-- Precast Sets
	
    sets.Enmity = {ammo="Paeapua",
	     neck="Unmoving Collar +1",ear1="Friomisi Earring",ear2="Cryptic Earring",
	     ring1="Petrov Ring",ring2="Supershear Ring",
		 back="Reiki Cloak",legs="Odyssean Cuisses"}
	sets.Knockback = {}
	--sets.passive.Twilight = {head="Twilight Helm",body="Twilight Mail"}
	
	-- Precast sets to enhance JAs
	sets.precast.JA['Berserk'] = {body="Pumm. Lorica +2",back="Cichol's Mantle"}
	sets.precast.JA['Warcry'] = {}
	sets.precast.JA['Defender'] = {}
	sets.precast.JA['Aggressor'] = {}
	sets.precast.JA['Mighty Strikes'] = {}
	sets.precast.JA["Warrior's Charge"] = {}
	sets.precast.JA['Tomahawk'] = {ammo="Thr. Tomahawk"}
	sets.precast.JA['Retaliation'] = {}
	sets.precast.JA['Restraint'] = {}
	sets.precast.JA['Blood Rage'] = {}
	sets.precast.JA['Brazen Rush'] = {}
	sets.precast.JA['Provoke'] = set_combine(sets.Enmity,{})
                   
	-- Waltz set (chr and vit)
	sets.precast.Waltz = {}
                   
	-- Don't need any special gear for Healing Waltz.
	sets.precast.Waltz['Healing Waltz'] = {}
           
	sets.precast.Step = {}
	
	sets.precast.Flourish1 = {}
		   
	-- Fast cast sets for spells

	sets.precast.FC = {ammo="Impatiens",
		neck="Voltsurge Torque",ear1="Enchntr. Earring +1",ear2="Loquacious Earring",
		hands="Leyline Gloves",ring2="Prolix Ring",
		waist="Flume Belt +1"}
	
	sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {})

	-- Midcast Sets
	sets.midcast.FastRecast = {ammo="Staunch Tathlum",
		neck="Voltsurge Torque",ear1="Enchntr. Earring +1",ear2="Loquacious Earring",
		hands="Leyline Gloves",ring2="Prolix Ring",
		waist="Flume Belt +1"}
	
	sets.midcast.Utsusemi = set_combine(sets.midcast.FastRecast, {})
                   
	sets.midcast.Cure = {}
	
	sets.Self_Healing = {ring2="Kunaji Ring",waist="Gishdubar Sash"}
	sets.Cure_Received = {ring2="Kunaji Ring",waist="Gishdubar Sash"}
						                   
	-- Weaponskill sets
	-- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {ammo="Knobkierrie",
		head=gear.valorous_wsd_head,neck="Fotia Gorget",ear1="Brutal Earring",ear2="Moonshade Earring",
		body="Pumm. Lorica +2",hands="Sulev. Gauntlets +2",ring1="Regal Ring",ring2="Niqmaddu Ring",
		back=gear.wsd_jse_back,waist="Fotia Belt",legs="Odyssean Cuisses",feet="Flam. Gambieras +2"}
	sets.precast.WS.SomeAcc = set_combine(sets.precast.WS, {})
	sets.precast.WS.Acc = set_combine(sets.precast.WS, {})
	sets.precast.WS.FullAcc = set_combine(sets.precast.WS, {})

    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.	
    sets.precast.WS['Savage Blade'] = {ammo="Knobkierrie",
		head=gear.valorous_wsd_head,neck="War. Beads +1",ear1="Thrud Earring",ear2="Moonshade Earring",
		body="Pumm. Lorica +2",hands="Odyssean Gauntlets",ring1="Regal Ring",ring2="Niqmaddu Ring",
		back=gear.wsd_jse_back,waist="Prosilio Belt",legs="Odyssean Cuisses",feet="Lustratio Leggings"}
    sets.precast.WS['Savage Blade'].SomeAcc = set_combine(sets.precast.WS['Savage Blade'], {})
    sets.precast.WS['Savage Blade'].Acc = set_combine(sets.precast.WS.Acc, {})
    sets.precast.WS['Savage Blade'].FullAcc = set_combine(sets.precast.WS.FullAcc, {})

    sets.precast.WS['Upheaval'] = set_combine(sets.precast.WS, {})
    sets.precast.WS['Upheaval'].SomeAcc = set_combine(sets.precast.WS.SomeAcc, {})
    sets.precast.WS['Upheaval'].Acc = set_combine(sets.precast.WS.Acc, {})
    sets.precast.WS['Upheaval'].FullAcc = set_combine(sets.precast.WS.FullAcc, {})
     
    sets.precast.WS['Resolution'] = set_combine(sets.precast.WS, {})
    sets.precast.WS['Resolution'].SomeAcc = set_combine(sets.precast.WS.SomeAcc, {})
    sets.precast.WS['Resolution'].Acc = set_combine(sets.precast.WS.Acc, {})
    sets.precast.WS['Resolution'].FullAcc = set_combine(sets.precast.WS.FullAcc, {})
	
    sets.precast.WS["Ukko's Fury"] = set_combine(sets.precast.WS, {})
    sets.precast.WS["Ukko's Fury"].SomeAcc = set_combine(sets.precast.WS.SomeAcc, {})
    sets.precast.WS["Ukko's Fury"].Acc = set_combine(sets.precast.WS.Acc, {})
    sets.precast.WS["Ukko's Fury"].FullAcc = set_combine(sets.precast.WS.FullAcc, {})
    sets.precast.WS["Ukko's Fury"].Fodder = set_combine(sets.precast.WS.Fodder, {})
	

	-- Swap to these on Moonshade using WS if at 3000 TP
	sets.MaxTP = {ear1="Thrud Earring",ear2="Ishvara Earring"}

     -- Sets to return to when not performing an action.
           
     -- Resting sets
     sets.resting = {}
           
	-- Idle sets
	sets.idle = {ammo="Staunch Tathlum",
		head=gear.valorous_wsd_head,neck="Loricate Torque +1",ear1="Genmei Earring",ear2="Etiolation Earring",
		body="Tartarus Platemail",hands="Sulev. Gauntlets +2",ring1="Defending Ring",ring2="Gelatinous Ring +1",
		back="Moonbeam Cape",waist="Flume Belt +1",legs="Sulevia's Cuisses +1",feet="Amm Greaves"}
		
	--sets.idle.Weak = set_combine(sets.idle, {head="Twilight Helm",body="Twilight Mail"})
	--sets.idle.Reraise = set_combine(sets.idle, {head="Twilight Helm",body="Twilight Mail"})
	
	-- Defense sets
	sets.defense.PDT = {ammo="Staunch Tathlum",
		head="Founder's Corona",neck="Loricate Torque +1",ear1="Genmei Earring",ear2="Etiolation Earring",
		body="Tartarus Platemail",hands="Sulev. Gauntlets +2",ring1="Defending Ring",ring2="Gelatinous Ring +1",
		back="Moonbeam Cape",waist="Flume Belt +1",legs="Sulevia's Cuisses +1",feet="Amm Greaves"}
		
	--sets.defense.PDTReraise = set_combine(sets.defense.PDT, {head="Twilight Helm",body="Twilight Mail"})

	sets.defense.MDT = {ammo="Staunch Tathlum",
		head="Founder's Corona",neck="Loricate Torque +1",ear1="Genmei Earring",ear2="Etiolation Earring",
		body="Tartarus Platemail",hands="Sulev. Gauntlets +2",ring1="Defending Ring",ring2="Gelatinous Ring +1",
		back="Moonbeam Cape",waist="Flume Belt +1",legs="Sulevia's Cuisses +1",feet="Amm Greaves"}
		
	--sets.defense.MDTReraise = set_combine(sets.defense.MDT, {head="Twilight Helm",body="Twilight Mail"})
		
	sets.defense.MEVA = {ammo="Staunch Tathlum",
		head="Founder's Corona",neck="Loricate Torque +1",ear1="Genmei Earring",ear2="Etiolation Earring",
		body="Tartarus Platemail",hands="Sulev. Gauntlets +2",ring1="Defending Ring",ring2="Gelatinous Ring +1",
		back="Moonbeam Cape",waist="Flume Belt +1",legs="Sulevia's Cuisses +1",feet="Amm Greaves"}

	sets.Kiting = {ring2="Shneddick Ring"}
	--sets.Reraise = {head="Twilight Helm",body="Twilight Mail"}
	--sets.buff.Doom = set_combine(sets.buff.Doom, {})
	--sets.buff.Sleep = {head="Frenzy Sallet"}
     
            -- Engaged sets
	sets.engaged = {ammo="Ginsen",
		head="Flam. Zucchetto +2",neck="Lissome Necklace",ear1="Brutal Earring",ear2="Cessance Earring",
		body="Argosy Hauberk",hands="Sulevia's Gauntlets +2",ring1="Petrov Ring",ring2="Niqmaddu Ring",
		back=gear.da_jse_back,waist="Ioskeha Belt +1",legs="Pumm. Cuisses +2",feet="Pumm. Calligae +2"}
    sets.engaged.SomeAcc = {ammo="Ginsen",
		head="Flam. Zucchetto +2",neck="Lissome Necklace",ear1="Brutal Earring",ear2="Cessance Earring",
		body="Argosy Hauberk",hands="Sulevia's Gauntlets +2",ring1="Petrov Ring",ring2="Niqmaddu Ring",
		back=gear.da_jse_back,waist="Ioskeha Belt +1",legs="Pumm. Cuisses +2",feet="Pumm. Calligae +2"}
	sets.engaged.Acc = {ammo="Ginsen",
		head="Flam. Zucchetto +2",neck="Lissome Necklace",ear1="Brutal Earring",ear2="Cessance Earring",
		body="Argosy Hauberk",hands="Sulevia's Gauntlets +2",ring1="Petrov Ring",ring2="Niqmaddu Ring",
		back=gear.da_jse_back,waist="Ioskeha Belt +1",legs="Pumm. Cuisses +2",feet="Pumm. Calligae +2"}
    sets.engaged.FullAcc = {ammo="Ginsen",
		head="Flam. Zucchetto +2",neck="Lissome Necklace",ear1="Brutal Earring",ear2="Cessance Earring",
		body="Argosy Hauberk",hands="Sulevia's Gauntlets +2",ring1="Petrov Ring",ring2="Niqmaddu Ring",
		back=gear.da_jse_back,waist="Ioskeha Belt +1",legs="Pumm. Cuisses +2",feet="Pumm. Calligae +2"}
		
    sets.engaged.PDT = {ammo="Staunch Tathlum",
        head="Founder's Corona",neck="Loricate Torque +1",ear1="Genmei Earring",ear2="Cessance Earring",
        body="Tartarus Platemail",hands="Sulevia's Gauntlets +2",ring1="Defending Ring",ring2="Niqmaddu Ring",
        back=gear.da_jse_back,waist="Flume Belt +1",legs="Pumm. Cuisses +2",feet="Pumm. Calligae +2"}
    sets.engaged.SomeAcc.PDT = {ammo="Staunch Tathlum",
        head="Founder's Corona",neck="Loricate Torque +1",ear1="Genmei Earring",ear2="Cessance Earring",
        body="Tartarus Platemail",hands="Sulevia's Gauntlets +2",ring1="Defending Ring",ring2="Niqmaddu Ring",
        back=gear.da_jse_back,waist="Flume Belt +1",legs="Pumm. Cuisses +2",feet="Pumm. Calligae +2"}
    sets.engaged.Acc.PDT = {ammo="Staunch Tathlum",
        head="Founder's Corona",neck="Loricate Torque +1",ear1="Genmei Earring",ear2="Cessance Earring",
        body="Tartarus Platemail",hands="Sulevia's Gauntlets +2",ring1="Defending Ring",ring2="Niqmaddu Ring",
        back=gear.da_jse_back,waist="Flume Belt +1",legs="Pumm. Cuisses +2",feet="Pumm. Calligae +2"}
    sets.engaged.FullAcc.PDT = {ammo="Staunch Tathlum",
        head="Founder's Corona",neck="Loricate Torque +1",ear1="Genmei Earring",ear2="Cessance Earring",
        body="Tartarus Platemail",hands="Sulevia's Gauntlets +2",ring1="Defending Ring",ring2="Niqmaddu Ring",
        back=gear.da_jse_back,waist="Flume Belt +1",legs="Pumm. Cuisses +2",feet="Pumm. Calligae +2"}
	--Extra Special Sets
	
	sets.buff.Retaliation = {}
	sets.buff.Restraint = {}
	sets.TreasureHunter = set_combine(sets.TreasureHunter, {})
	
	-- Weapons sets
	sets.weapons.Greataxe = {main="Aganoshe",sub="Utu Grip"}
	sets.weapons.Greatsword = {main="Montante +1",sub="Utu Grip"}
	sets.weapons.SwordShield = {main="Naegling",sub="Blurred Shield +1"}
	--sets.weapons.DualWeapons = {main="Reikiko",sub="Tramontane Axe"}
	
end
	
-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    -- Default macro set/book
    if player.sub_job == 'SAM' then
        set_macro_page(1, 3)
    elseif player.sub_job == 'DNC' then
        set_macro_page(2, 3)
    elseif player.sub_job == 'THF' then
        set_macro_page(3, 3)
    else
        set_macro_page(4, 3)
    end
end