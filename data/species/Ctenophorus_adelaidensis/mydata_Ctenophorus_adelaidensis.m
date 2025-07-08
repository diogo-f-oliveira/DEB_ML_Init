function [data, auxData, metaData, txtData, weights] = mydata_Ctenophorus_adelaidensis 

%% set metaData

metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Squamata'; 
metaData.family     = 'Agamidae';
metaData.species    = 'Ctenophorus_adelaidensis';  
metaData.species_en = 'Western heath dragon'; 

metaData.ecoCode.climate = {'B'};
metaData.ecoCode.ecozone = {'TA'};
metaData.ecoCode.habitat = {'0iThh'};
metaData.ecoCode.embryo  = {'Tt'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(30); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  % tags for different types of zero-variate data
metaData.data_1     = {'t-L'; 't-Ww'; 'L-Ww_f'; 'L0-Lt'}; % tags for different types of uni-variate data

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Hamish Burnett', 'Nina Marn'};          
metaData.date_subm = [2018 11 13];                       
metaData.email    = {'hamish.burnett89@gmail.com'};           
metaData.address  = {'UWA Crawley 6009 Western Australia'};   

metaData.curator     = {'Nina Marn'};
metaData.email_cur   = {'nina.marn@gmail.com'}; 
metaData.date_acc    = [2018 11 20]; 

%% set data
% zero-variate data;

data.ab = 36;      units.ab = 'd';    label.ab = 'age at birth';  bibkey.ab = 'Burn2018';   comment.ab  = 'mean value taken from several measurements'; 
  temp.ab = C2K(31.4);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.ap = 90 + data.ab;     units.ap = 'd';    label.ap = 'age at puberty'; bibkey.ap = 'Bamf1992';
  temp.ap = C2K(30);  units.temp.ap = 'K'; label.temp.ap = 'temperature';
  comment.ap = 'Estimate assuming maturity reached end of winter (Bamford 1992)and assuming little growth during winter. Plus growth measured in the lab so far suggests they likely reach maturity within a few months';
data.am = 3*365;     units.am = 'd';    label.am = 'life span';     bibkey.am = 'Bamf1992';   
  temp.am = C2K(25);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'Generally 2 years, but one female in M.Bamford data seems to be at least 5 years old.';

data.Lb  = 2.35;   units.Lb  = 'cm';   label.Lb  = 'snout to vent length at birth';    bibkey.Lb  = 'Burn2018';  
data.Lp  = 4.0;   units.Lp  = 'cm';   label.Lp  = 'snout to vent length at puberty';  bibkey.Lp  = 'Bamf1992'; 
data.Li  = 5.2;   units.Li  = 'cm';   label.Li  = 'ultimate snout to vent length';    bibkey.Li  = 'Bamf1992';

data.Wwb = 0.58; units.Wwb = 'g';    label.Wwb = 'wet weight at birth';              bibkey.Wwb = 'Burn2018';
data.Wwp = 2.5;   units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';           bibkey.Wwp = 'Bamf1992';
data.Wwi = 5.4;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';             bibkey.Wwi = 'Bamf1992';

data.Ri  = 3/365;    units.Ri  = '#/d';  label.Ri  = 'maximum reprod rate';       bibkey.Ri  = {'Bamf1992','Burn2018'};   
temp.Ri = C2K(25);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
comment.Ri = 'Based on Bamford 1992 and gravid females kept in the lab producing only one clutch with max size of 3';
 
% uni-variate data

%Temp-age at birth - eggs from wild females
data.Tab = [ ...
 31.5 31.5 31.2 31.2 25.4 25.4; % C, incubation temperature 
 37 37 36 34 67 67]'; % d, age at birth
units.Tab = {'C', 'd'};  label.Tab = {'incubation temperature', 'age at birth'};  
bibkey.Tab = 'Burn2018';

% snout-to-vent length and wet weights were measured at the same time
tLW_Gf1h1 = [ 
    0	25	0.65
    8	26	0.797
    15	26.5  1.065
    23	29.5  1.33
    29	31	1.64
    35	33.5  1.74
    43	34.5  1.9
    52	34.5  1.9
    59	35	2.1
    65	35	2.1
    72	35.5  2.05
 ];
tLW_Gf1h1(:,2) = tLW_Gf1h1(:,2)/10;
data.tL_Gf1h1 = tLW_Gf1h1(:, 1:2);  
units.tL_Gf1h1   = {'d', 'cm'};  label.tL_Gf1h1 = {'time since birth', 'snout to vent length'};  bibkey.tL_Gf1h1 = 'Burn2018';
temp.tL_Gf1h1    = C2K(30);  units.temp.tL_Gf1h1 = 'K'; label.temp.tL_Gf1h1 = 'temperature';

data.tW_Gf1h1 = tLW_Gf1h1(:,[1,3]);
units.tW_Gf1h1   = {'d', 'g'};  label.tW_Gf1h1 = {'time since birth', 'wet mass'};  bibkey.tW_Gf1h1 = 'Burn2018';
temp.tW_Gf1h1    = C2K(30);  units.temp.tW_Gf1h1 = 'K'; label.temp.tW_Gf1h1 = 'temperature';

data.LW_Gf1h1 = tLW_Gf1h1(:,[2,3]);
units.LW_Gf1h1   = {'cm', 'g'};  label.LW_Gf1h1 = {'snout vent length', 'wet mass'};  bibkey.LW_Gf1h1 = 'Burn2018';

%GF2H1 SECTION ---------------------------------------------
tLW_Gf2h1 = [
    0	24	0.56
    7	24.5	0.63
    15	26.5	0.77
    18	26.5	0.77
    24	27	0.897
    30	29	1.13
    38	31	1.39
    47	32	1.48
    54	34	1.8
    60	34	2
    67	35	1.87
];
tLW_Gf2h1(:,2) = tLW_Gf2h1(:,2)/10;

data.tL_Gf2h1 = tLW_Gf2h1(:, 1:2); 
units.tL_Gf2h1   = {'d', 'cm'};  label.tL_Gf2h1 = {'time since birth', 'snout to vent length'};  bibkey.tL_Gf2h1 = 'Burn2018';
temp.tL_Gf2h1    = C2K(30);  units.temp.tL_Gf2h1 = 'K'; label.temp.tL_Gf2h1 = 'temperature';

data.tW_Gf2h1 = tLW_Gf2h1(:,[1,3]);
units.tW_Gf2h1   = {'d', 'g'};  label.tW_Gf2h1 = {'time since birth', 'wet mass'};  bibkey.tW_Gf2h1 = 'Burn2018';
temp.tW_Gf2h1    = C2K(30);  units.temp.tW_Gf2h1 = 'K'; label.temp.tW_Gf2h1 = 'temperature';

data.LW_Gf2h1 = tLW_Gf2h1(:,[2,3]);
units.LW_Gf2h1   = {'cm', 'g'};  label.LW_Gf2h1 = {'snout vent length', 'wet mass'};  bibkey.LW_Gf2h1 = 'Burn2018';


%__GF5h1 section----------------------------------------------------------
tLW_Gf5h1 = [
    0	22.5	0.56
    7	24	0.69
    12	25	0.83
    18	26.5	0.974
    24	29	1.26
    32	30	1.52
    41	32	1.6
    48	32	1.71
    54	33	1.98
    61	34	2.08
];
tLW_Gf5h1(:,2) = tLW_Gf5h1(:,2)/10;

data.tL_Gf5h1 = tLW_Gf5h1(:, 1:2);
units.tL_Gf5h1   = {'d', 'cm'};  label.tL_Gf5h1 = {'time since birth', 'snout to vent length'};  bibkey.tL_Gf5h1 = 'Burn2018';
temp.tL_Gf5h1    = C2K(30);  units.temp.tL_Gf5h1 = 'K'; label.temp.tL_Gf5h1 = 'temperature';

data.tW_Gf5h1 = tLW_Gf5h1(:,[1,3]);
units.tW_Gf5h1   = {'d', 'g'};  label.tW_Gf5h1 = {'time since birth', 'wet mass'};  bibkey.tW_Gf5h1 = 'Burn2018';
temp.tW_Gf5h1    = C2K(30);  units.temp.tW_Gf5h1 = 'K'; label.temp.tW_Gf5h1 = 'temperature';

data.LW_Gf5h1 = tLW_Gf5h1(:,[2,3]);
units.LW_Gf5h1   = {'cm', 'g'};  label.LW_Gf5h1 = {'snout vent length', 'wet mass'};  bibkey.LW_Gf5h1 = 'Burn2018';

%__GF12h2 section----------------------------------------------------------
tLW_Gf12h2 = [
    0	22.5	0.56
    7	24	0.68
    15	25	0.91
    24	27	1.2
    31	28.5	1.3
    37	29.5	1.45
    44	30	1.36   
];
tLW_Gf12h2(:,2) = tLW_Gf12h2(:,2)/10;

data.tL_Gf12h2 = tLW_Gf12h2(:, 1:2);
units.tL_Gf12h2   = {'d', 'cm'};  label.tL_Gf12h2 = {'time since birth', 'snout to vent length'};  bibkey.tL_Gf12h2 = 'Burn2018';
temp.tL_Gf12h2    = C2K(30);  units.temp.tL_Gf12h2 = 'K'; label.temp.tL_Gf12h2 = 'temperature';

data.tW_Gf12h2 = tLW_Gf12h2(:,[1,3]);
units.tW_Gf12h2   = {'d', 'g'};  label.tW_Gf12h2 = {'time since birth', 'wet mass'};  bibkey.tW_Gf12h2 = 'Burn2018';
temp.tW_Gf12h2    = C2K(30);  units.temp.tW_Gf12h2 = 'K'; label.temp.tW_Gf12h2 = 'temperature';

data.LW_Gf12h2 = tLW_Gf12h2(:,[2,3]);
units.LW_Gf12h2   = {'cm', 'g'};  label.LW_Gf12h2 = {'snout vent length', 'wet mass'};  bibkey.LW_Gf12h2 = 'Burn2018';


%% COOL INCUBATION
%__GF1h2 section----------------------------------------------------------
tLW_Gf1h2 = [
    0	23.5	0.58
    5	25	0.72
    13	27.5	1.09
    22	31	1.43
    29	33	1.77
    35	34.5	2.03
    42	36.5	2 % here it was already sick
    ];
tLW_Gf1h2(:,2) = tLW_Gf1h2(:,2)/10;

data.tL_Gf1h2 = tLW_Gf1h2(:, 1:2);
units.tL_Gf1h2   = {'d', 'cm'};  label.tL_Gf1h2 = {'time since birth', 'snout to vent length'};  bibkey.tL_Gf1h2 = 'Burn2018';
temp.tL_Gf1h2    = C2K(30);  units.temp.tL_Gf1h2 = 'K'; label.temp.tL_Gf1h2 = 'temperature';

data.tW_Gf1h2 = tLW_Gf1h2(:,[1,3]);
units.tW_Gf1h2   = {'d', 'g'};  label.tW_Gf1h2 = {'time since birth', 'wet mass'};  bibkey.tW_Gf1h2 = 'Burn2018';
temp.tW_Gf1h2    = C2K(30);  units.temp.tW_Gf1h2 = 'K'; label.temp.tW_Gf1h2 = 'temperature';

data.LW_Gf1h2 = tLW_Gf1h2(:,[2,3]);
units.LW_Gf1h2   = {'cm', 'g'};  label.LW_Gf1h2 = {'snout vent length', 'wet mass'};  bibkey.LW_Gf1h2 = 'Burn2018';

%__GF3h2 section----------------------------------------------------------
tLW_Gf3h2 = [
    0	23.5	0.58
    4	25	0.64
    12	27.5	0.96
    21	31	1.42
    28	33.5	1.65
    34	35	1.93
    41	36	1.95 % here it is getting sick
    ];
tLW_Gf3h2(:,2) = tLW_Gf3h2(:,2)/10;

data.tL_Gf3h2 = tLW_Gf3h2(:, 1:2);
units.tL_Gf3h2   = {'d', 'cm'};  label.tL_Gf3h2 = {'time since birth', 'snout to vent length'};  bibkey.tL_Gf3h2 = 'Burn2018';
temp.tL_Gf3h2    = C2K(30);  units.temp.tL_Gf3h2 = 'K'; label.temp.tL_Gf3h2 = 'temperature';

data.tW_Gf3h2 = tLW_Gf3h2(:,[1,3]);
units.tW_Gf3h2   = {'d', 'g'};  label.tW_Gf3h2 = {'time since birth', 'wet mass'};  bibkey.tW_Gf3h2 = 'Burn2018';
temp.tW_Gf3h2    = C2K(30);  units.temp.tW_Gf3h2 = 'K'; label.temp.tW_Gf3h2 = 'temperature';

data.LW_Gf3h2 = tLW_Gf3h2(:,[2,3]);
units.LW_Gf3h2   = {'cm', 'g'};  label.LW_Gf3h2 = {'snout vent length', 'wet mass'};  bibkey.LW_Gf3h2 = 'Burn2018';

%__GF2h2 section----------------------------------------------------------
tLW_Gf2h2 = [
    0	21.5	0.51
    6	22.5	0.52
    15	25.5	0.74
    22	25.5	0.87
    28	27.5	0.96
    35	29	1.17
    ];
tLW_Gf2h2(:,2) = tLW_Gf2h2(:,2)/10;

data.tL_Gf2h2 = tLW_Gf2h2(:, 1:2);
units.tL_Gf2h2   = {'d', 'cm'};  label.tL_Gf2h2 = {'time since birth', 'snout to vent length'};  bibkey.tL_Gf2h2 = 'Burn2018';
temp.tL_Gf2h2    = C2K(30);  units.temp.tL_Gf2h2 = 'K'; label.temp.tL_Gf2h2 = 'temperature';

data.tW_Gf2h2 = tLW_Gf2h2(:,[1,3]);
units.tW_Gf2h2   = {'d', 'g'};  label.tW_Gf2h2 = {'time since birth', 'wet mass'};  bibkey.tW_Gf2h2 = 'Burn2018';
temp.tW_Gf2h2    = C2K(30);  units.temp.tW_Gf2h2 = 'K'; label.temp.tW_Gf2h2 = 'temperature';

data.LW_Gf2h2 = tLW_Gf2h2(:,[2,3]);
units.LW_Gf2h2   = {'cm', 'g'};  label.LW_Gf2h2 = {'snout vent length', 'wet mass'};  bibkey.LW_Gf2h2 = 'Burn2018';

%__GF6h1 section----------------------------------------------------------
tLW_Gf6h1 = [
    0	22	0.53
    8	23	0.57
    15	23	0.67
    21	24	0.68
    28	26	0.94
    ];
tLW_Gf6h1(:,2) = tLW_Gf6h1(:,2)/10;

data.tL_Gf6h1 = tLW_Gf6h1(:, 1:2);
units.tL_Gf6h1   = {'d', 'cm'};  label.tL_Gf6h1 = {'time since birth', 'snout to vent length'};  bibkey.tL_Gf6h1 = 'Burn2018';
temp.tL_Gf6h1    = C2K(30);  units.temp.tL_Gf6h1 = 'K'; label.temp.tL_Gf6h1 = 'temperature';

data.tW_Gf6h1 = tLW_Gf6h1(:,[1,3]);
units.tW_Gf6h1   = {'d', 'g'};  label.tW_Gf6h1 = {'time since birth', 'wet mass'};  bibkey.tW_Gf6h1 = 'Burn2018';
temp.tW_Gf6h1    = C2K(30);  units.temp.tW_Gf6h1 = 'K'; label.temp.tW_Gf6h1 = 'temperature';

data.LW_Gf6h1 = tLW_Gf6h1(:,[2,3]);
units.LW_Gf6h1   = {'cm', 'g'};  label.LW_Gf6h1 = {'snout vent length', 'wet mass'};  bibkey.LW_Gf6h1 = 'Burn2018';

%__GF8h1 section----------------------------------------------------------
tLW_Gf8h1 = [
    0	21.5	0.54
    2	21.5	0.49
    9	23.5	0.61
    15	25	0.8
    22	27	1.23
    ];
tLW_Gf8h1(:,2) = tLW_Gf8h1(:,2)/10;

data.tL_Gf8h1 = tLW_Gf8h1(:, 1:2);
units.tL_Gf8h1   = {'d', 'cm'};  label.tL_Gf8h1 = {'time since birth', 'snout to vent length'};  bibkey.tL_Gf8h1 = 'Burn2018';
temp.tL_Gf8h1    = C2K(30);  units.temp.tL_Gf8h1 = 'K'; label.temp.tL_Gf8h1 = 'temperature';

data.tW_Gf8h1 = tLW_Gf8h1(:,[1,3]);
units.tW_Gf8h1   = {'d', 'g'};  label.tW_Gf8h1 = {'time since birth', 'wet mass'};  bibkey.tW_Gf8h1 = 'Burn2018';
temp.tW_Gf8h1    = C2K(30);  units.temp.tW_Gf8h1 = 'K'; label.temp.tW_Gf8h1 = 'temperature';

data.LW_Gf8h1 = tLW_Gf8h1(:,[2,3]);
units.LW_Gf8h1   = {'cm', 'g'};  label.LW_Gf8h1 = {'snout vent length', 'wet mass'};  bibkey.LW_Gf8h1 = 'Burn2018';

%Bamford Cooljarloo data females (B_COOL_F) ---------------------------------------------------
  
LW_B_Cool_F = [
52	52	48	48	45	48	45	43	42	33    
5	5	4.2	4.2	3.6	3.4	3	2.6	2.4	1.4
]';

LW_B_Cool_F(:,1) = LW_B_Cool_F(:,1)/10;

data.LW_B_Cool_F = LW_B_Cool_F(:,[1,2]); 
units.LW_B_Cool_F  = {'cm', 'g'};  label.LW_B_Cool_F = {'Snout vent length', 'Wet mass'};  bibkey.LW_B_Cool_F = 'Bamf2018';

%Bamford recaps, L1L2t
L1L2t = [
    25	36	180
    31	33	30
    33	42	240
    37	37	30
    40	40	30
    40	40	30
    40	40	30
    40	40	360
    36	37	30
    39.5 41	180
    41	41	360
    40	43	360
    45	45	90
    43.5 45	30
    43	44	30
    44	46	30
    46	46	30
    46	48	270
    48	49	30
    36	37.5 30
    44	47	330
    38	39	270
    50	50	60
    ];
L1L2t(:,[1,2]) = L1L2t(:,[1,2])/10;
L0Lt = sortrows(L1L2t); % sort by first column in ascending order 
data.L0Lt_B_Recap = L0Lt(:,[1,2]);
units.L0Lt_B_Recap = {'cm','cm'}; label.L0Lt_B_Recap = {'SVL at first capture','SVL at second capture'};
temp.L0Lt_B_Recap = C2K(28);  units.temp.L0Lt_B_Recap = 'K'; label.temp.L0Lt_B_Recap = 'temperature';

bibkey.L0Lt_B_Recap = 'Bamf2018';
time.L0Lt_B_Recap = L0Lt(:,3); units.time.L0Lt_B_Recap ='d'; label.time.L0Lt_B_Recap = 'Time between captures';
treat.L0Lt_B_Recap = {0}; units.treat.L0Lt_B_Recap = ''; label.treat.L0Lt_B_Recap = '';
% SCLnt1 (cm) % SCLnt2 (cm) % interval (d)

%The Female recap assuming 45 days old
tL_femrecap = [
   50   3.1
   80   3.3
   315  4.2
 ];
data.tL_femrecap = tL_femrecap(:, 1:2);
units.tL_femrecap = {'d', 'cm'};  label.tL_femrecap = {'time since birth', 'snout to vent length'};  bibkey.tL_femrecap = 'Bamf2018';
temp.tL_femrecap = C2K(30); units.temp.tL_femrecap = 'K'; label.temp.tL_femrecap = 'temperature';


%% set weights for all real data
weights = setweights(data, []);

%% overwriting weights 
% zero-variate data:
weights.am = 1/2 * weights.am; % less confidence in max lifespan
weights.Wwi = 10 * weights.Wwi; % more confidence in the ultimate wet mass
weights.Wwp = 10 * weights.Wwp; % more confidence in the wet mass at puberty
weights.Ri = 10 * weights.Ri; % more confidence in the Reproduction
weights.Li = 20 * weights.Li; % more confidence in max svl
% uni-variate data: 
weights.L0Lt_B_Recap = 0 * weights.L0Lt_B_Recap; 
weights.Tab = 10 * weights.Tab;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.time = time; 
auxData.treat = treat; 
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
if exist('comment','var')
  txtData.comment = comment;
end

%% Group plots
set1 = {'tL_Gf1h1','tL_Gf2h1', 'tL_Gf5h1', 'tL_Gf12h2', 'tL_femrecap'};
subtitle1 ={'SVL over time of 4 hatchlings + recap female'};
set2 = {'tW_Gf1h1','tW_Gf2h1', 'tW_Gf5h1', 'tW_Gf12h2'};
subtitle2 ={'Wet weight over time of 4 hatchlings'};
set3 = {'LW_Gf1h1','LW_Gf2h1', 'LW_Gf5h1','LW_Gf12h2'};
subtitle3 = {'Wet weight and SVL of 4 hatchlings'};
set4 = {'tL_Gf1h2','tL_Gf3h2','tL_Gf2h2', 'tL_Gf6h1', 'tL_Gf8h1'};
subtitle4 ={'SVL over time of 5 hatchlings, cool incub'};
set5 = {'tW_Gf1h2','tW_Gf3h2','tW_Gf2h2', 'tW_Gf6h1', 'tW_Gf8h1'};
subtitle5 ={'Wet weight over time of 5 hatchlings, cool incub'};
set6 = {'LW_Gf1h2','LW_Gf3h2','LW_Gf2h2', 'LW_Gf6h1','LW_Gf8h1'};
subtitle6 = {'Wet weight and SVL of 5 hatchlings, cool incub'};
set7 = {'LW_B_Cool_F'};
subtitle7 = {'SVL and wet weight of wild captured females'};
set8 = {'L0Lt_B_Recap'};
subtitle8 = {'Growth over time of wild recaptured dragons'};
set9 = {'tL_Gf1h1','tL_Gf2h1', 'tL_Gf5h1', 'tL_femrecap'};
subtitle9 = {'SVL over time for a recaptured wild female'};
metaData.grp.sets = {set1, set2, set3, set4, set5, set6, set7, set8, set9};
metaData.grp.subtitle = {subtitle1, subtitle2, subtitle3, subtitle4, subtitle5, subtitle6, ...
    subtitle7, subtitle8, subtitle9};


%% Discussion points
D1 = 'For animals cought in the wild (data: M. Bamford) the age was assumed';
D2 = 'Most of the wild data is for females; there is a difference in size between males and females. Data for (wild) males might be added at a later stage.';     
D3 = ['Captive reared individuals were reared from eggs laid by wild females in captivity, and incubated', ...
    'at two temperatures (as indicated). All juveniles were reared at same conditions.'];     
D4 = 'Food abundance for uni-variate data and zero-variate wild data was allowed to differ.' ; 
D5 = 'This entry contains some unpublished data; If you plan to use it, please contact Hamish (hamish.burnett89@gmail.com)';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3, 'D4',D4, 'D5',D5);

%% Facts
F1 = 'The Western heath dragon is one of the most common lizards in coastal Southwestern Australia. It lives in coastal heath, kwongan, and Banksia woodland habitats with sandy substrates.';
metaData.bibkey.F1 = 'Wiki'; 
F2 = 'They are often one of the first vertebrates that appear after habitat restoration of (sand) mining sites in WA.';
metaData.bibkey.F2 = 'Bamf2018'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '326DR'; % Cat of Life
metaData.links.id_ITIS = '1056730'; % ITIS
metaData.links.id_EoL = '460054'; % Ency of Life
metaData.links.id_Wiki = 'Ctenophorus_adelaidensis'; % Wikipedia
metaData.links.id_ADW = 'Ctenophorus_adelaidensis'; % ADW
metaData.links.id_Taxo = '3809096'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_ReptileDB = 'genus=Ctenophorus&species=adelaidensis'; % ReptileDB
metaData.links.id_AnAge = ''; % AnAge


%% References
bibkey = 'Kooy2010'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Kooijman, S.A.L.M.}, ' ...
'year = {2010}, ' ...
'title  = {Dynamic Energy Budget theory for metabolic organisation}, ' ...
'publisher = {Cambridge Univ. Press, Cambridge}, ' ...
'pages = {Table 4.2 (page 150), 8.1 (page 300)}, ' ...
'howpublished = {\url{../../../bib/Kooy2010.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'LikaKear2011'; type = 'Article'; bib = [ ...  % used for the estimation method
'author = {Lika, K. and Kearney, M.R. and Freitas, V. and van der Veer, H.W. and van der Meer, J. and Wijsman, J.W.M. and Pecquerie, L. and Kooijman, S.A.L.M.},'...
'year = {2011},'...
'title = {The ''''covariation method'''' for estimating the parameters of the standard Dynamic Energy Budget model \textrm{I}: Philosophy and approach},'...
'journal = {Journal of Sea Research},'...
'volume = {66},'...
'number = {4},'...
'pages = {270-277},'...
'DOI = {10.1016/j.seares.2011.07.010},'...
'howpublished = {\url{http://www.sciencedirect.com/science/article/pii/S1385110111001055}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%------------------------------------------------------------------------------------------------------

 bibkey = 'Wiki'; type = 'Misc'; bib = [...
 'howpublished = {\url{https://en.wikipedia.org/wiki/Ctenophorus_adelaidensis}},'...% 
 'note = {Accessed : 2018-11-15}'];
 metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Burn2018'; type = 'Misc'; bib = [ ... 
'author = {Burnett, H}, ' ... 
'year = {2018}, ' ...
'note = {Data collected in UWA lab}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Bamf2018'; type = 'Misc'; bib = [ ... 
'author = {Bamford, M}, ' ... 
'year = {2018}, ' ...
'note = {Long term fauna monitoring dataset from {C}ooljarloo mine, 1991-2017}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Bamf1992'; type = 'Article'; bib = [...
'title = {Growth and sexual dimorphism in size and tail length in \textit{Tympanocryptis adelaidensis} ({L}acertia: {A}gamidae)},'...
'author = {Bamford, MJ},'...
'journal = {Herpetofauna},'...
'volume = {22},'...
'pages = {25--30},'...
'year = {1992}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%