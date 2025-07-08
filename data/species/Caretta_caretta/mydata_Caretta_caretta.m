function [data, auxData, metaData, txtData, weights] = mydata_Caretta_caretta
%% set metaData
metaData.phylum     = 'Chordata';
metaData.class      = 'Reptilia';
metaData.order      = 'Testudines';
metaData.family     = 'Cheloniidae';
metaData.species    = 'Caretta_caretta';
metaData.species_en = 'Loggerhead turtle, North Atlantic';

metaData.ecoCode.climate = {'MA', 'MB'};
metaData.ecoCode.ecozone = {'MC'};
metaData.ecoCode.habitat = {'0bTd', 'biMcp'};
metaData.ecoCode.embryo  = {'Tt'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dtmf'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(20); % K, body temp
metaData.data_0     = {'ah'; 'ab'; 'ap'; 'am'; 'Lh'; 'Lb'; 'Lp'; 'Li'; 'Wwh'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'; 'E0'}; % tags for different types of zero-variate data
metaData.data_1     = {'T-ah'; 't-L_T'; 't-Ww_T'; 'L-Ww'; 'L-N'; 'L-dL'; 'L0-Lt'};

metaData.COMPLETE = 3; % using criteria of LikaKear2011

metaData.author   = {'Nina Marn'};
metaData.date_subm = [2016 01 22];
metaData.email    = {'nmarn@irb.hr'};
metaData.address  = {'Rudjer Boskovic Institute, 10000, Croatia'};

metaData.author_mod_1   = {'Nina Marn'};
metaData.date_mod_1 = [2017 01 22];
metaData.email_mod_1    = {'nina.marn@gmail.com'};
metaData.address_mod_1  = {'Rudjer Boskovic Institute, 10000, Croatia'};

metaData.author_mod_2   = {'Bas Kooijman'};
metaData.date_mod_2     = [2017 11 12];
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};
metaData.address_mod_2  = {'VU University, Amsterdam'};

metaData.author_mod_3   = {'Nina Marn'};
metaData.date_mod_3 = [2018 05 17];
metaData.email_mod_3    = {'nina.marn@gmail.com'};
metaData.address_mod_3  = {'Rudjer Boskovic Institute, 10000, Croatia'};

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@biology.uoc.gr'};
metaData.date_acc    = [2018 05 18]; 


%% set data
% for reference: wild populations of NW Atlantic (NA) - assumed f_NA = Li/Lm =105/130 = 0.8,
% (Lm = 130 cm SCL, reported as largest nesting female in North Carolina <FrazScwa1984>)

data.ah = 55.4 - 4.1;  units.ah = 'd';      label.ah = 'age at hatching';        bibkey.ah = {'StokWyne2006','GodfMros1997'};
temp.ah = C2K(30);   units.temp.ah = 'K'; label.temp.ah = 'temperature';
comment.ah = 'hatching (exit the egg) to emergence (exit the nest) interval estimated as 4.1days';
data.ab = 55.4 + 2;    units.ab = 'd';      label.ab = 'age at birth';        bibkey.ab = 'Stok2014';
temp.ab = C2K(29);   units.temp.ab = 'K'; label.temp.ab = 'temperature';
comment.ab = 'age at birth = age at emergence + relying on yolksac (2-3d)';
data.tp = 18 * 365;    units.tp = 'd';      label.tp = 'age at puberty';      bibkey.tp = {'Spot2004', 'ZugWynn1986'};
% reported in years to get a better idea for the data vs. prediction, but calculations are done in predict file in days
temp.tp = C2K(21.8);   units.temp.tp = 'K'; label.temp.tp = 'temperature';
comment.tp = '28yrs in <Spot2004>, 13-15 yrs in <ZugWynn1986>; temp mean 21.8C, range between 18.2 and 29.2C HawkLucy2011';
data.am = 67*365;      units.am = 'd';      label.am = 'life span';           bibkey.am = 'Wiki';
temp.am = C2K(21.8); units.temp.am = 'K'; label.temp.am = 'temperature';
% temp higher for adults due to better behavioral thermoregulation {HawkLucy2011}

data.Lb  = 4.5;       units.Lb  = 'cm';  label.Lb  = 'SCL at birth';       bibkey.Lb  = {'ReicBjor2008','StokWyne2006'};
comment.Lb = 'according to BennTapl1986, length at hatch and emergence same approx.the same as L_b';
data.Lh  = data.Lb;   units.Lh  = 'cm';  label.Lh  = 'SCL at hatching';    bibkey.Lh  = {'ReicBjor2008','StokWyne2006'};
data.Lp  = 80;        units.Lp  = 'cm';  label.Lp  = 'SCL at puberty';     bibkey.Lp  = {'ByrdMurp2005', 'EhrhYode1978', 'Ston1980', 'Nort2005','TiwaBjor2000'};
comment.Lp = 'SCL, mean of min in <ByrdMurph2005, EhrhYod1978, Ston1980, Nort2005, TiwaBjor2000>';
data.Li  = 105.26;    units.Li  = 'cm';  label.Li  = 'ultimate SCL';       bibkey.Li  = {'ByrdMurp2005', 'EhrhYode1978', 'Ston1980', 'Nort2005', 'TiwaBjor2000'};
comment.Li = 'SCL , mean of max in <ByrdMurph2005, EhrhYod1978, Ston1980, Nort2005, TiwaBjor2000>';

data.Wwh = 18.67;        units.Wwh = 'g';   label.Wwh = 'yolk-free wet weight at hatching';    bibkey.Wwh = {'Acke1981gr'};
comment.Wwh = 'yolkfree hatchling; residual yolk 3.41 g';
data.Wwb = 19.41;        units.Wwb = 'g';   label.Wwb = 'wet weight at birth';    bibkey.Wwb = {'ReicBjor2008','StokWyne2006'};
comment.Wwb = 'according to BennTapl1986, weight decrease between hatching and emergence / birth, then weight increase: drink water + feeding';
data.Wwp = 79e3;         units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';  bibkey.Wwp = {'EhrhYode1978', 'Nort2005'};
comment.Wwp = 'mean of mins in <EhrhYod1978; Nort2005>; reported range for North Atl 75-150kg';
data.Wwi = 162.62e3;     units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';    bibkey.Wwi = {'EhrhYode1978', 'Nort2005'};
comment.Wwi = 'mean of maxs in <EhrhYod1978; Nort2005>; Wiki: Wwi= 545 kg, indicated source: Ernst 2009, but cannot be checked';

data.E0 = 210e3; units.E0  = 'J'; label.E0  = 'initial energy content of the egg'; bibkey.E0  = 'HaysSpea1991';
comment.E0 = 'range 165-260kJ';
iniRes.E0 = data.E0; units.iniRes.E0 = 'J'; label.iniRes.E0 = 'initial reserve'; % used in predictions
data.Ri  = 4 * 140/ (2 * 365); units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = {'MillLimp2003', 'Tuck2010', 'SCDNR', 'HawkBrod2005', 'TiwaBjor2000'};
temp.Ri = C2K(21.8);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
comment.Ri = ['calculated as number of nests per nesting season (4,{Tuck2010, HawkBrod2005})',...
    'multiplied by number of eggs per clutch (140,{SCDNR,TiwaBjor2000})',...
    'and divided by the interval between two nesting seasons (2 yr,{HawkBrod2005})', ...
    'same value for Ri obtained with 5 clutches every 2.5 years'];

%%%%%%%%%%%%%% UNI-VARIATE data %%%%%%%%%%%%%%%%%%
% === INCUBATION DATA ===
% StokWyne2006 (Atlantic) from Figure9 (plot reader)
% incub_temp(C), %incub_dur(d)(emergence!!),
Tt_incub = [
    27.62	28.25	28.42	28.62	28.68	28.69	28.78	28.84	29.03	29.03	29.06	29.12	29.14	29.21	29.22	29.28	29.28	29.32	29.33	29.38	29.4	29.44	29.47	29.62	29.66	29.66	29.66	29.73	29.77	29.84	29.88	29.92	29.97	29.99	30.03	30.08	30.12	30.13	30.21	30.35	30.47	30.49	30.54	30.54	30.58	30.6	30.72	30.86	30.86	30.88	30.98	30.98	31.1	31.17	31.42	31.64	31.82	31.89	32.13	32.13	32.61
    63.74	62.83	59.86	58.87	54.91	60.06	62.04	60.86	63.97	59.08	60.93	53.86	57.95	57.03	60.07	56.04	56.04	54.85	57.96	57.1	59.88	58.95	53.8	54.79	59.88	58.03	58.03	51.89	57.97	57.11	55.99	54.87	56.12	54.08	55.07	49.91	56.06	56.99	56	53.88	51.84	54.02	57.92	57.13	56.2	52.9	53.03	50.92	49.93	52.97	49.14	49.14	50.86	48.15	50.93	48.16	47.18	49.16	47.18	46.26	45.08
    ]';
data.Tah = [Tt_incub(:,1), Tt_incub(:,2) ]; % emergence -- corrected in predict for hatching to emergence
units.Tah  = {'C', 'd'};  label.Tah = {'temperature', 'age at emergence'};
bibkey.Tah = 'StokWyne2006';


% === HATCHLINGS, captive ===
% weight and straight carapace length from Stokes (pers.comm), dataset described in StokWyne2006,
% temp 27 +- 2 C  ; f = first 2 weeks fed 20% weight, then 8% of weight; simplified to f = 0.99
% here reported: mean values of clutch means; there are also corresponding carapace width and body depth measurments
% rows ---> columns:
%     1- age since birth
%     2- SCL (cm)
%     3- wet weight (g)

% north, Early season: cape2-cape4: t ; Ww ; SCL
cape2_4 = [0.50	2.00	9.00	16.00	24.00	32.00	39.00	46.00	53.00	60.00	67.00	74.00
    4.46	4.62	5.07	5.82	6.56	7.18	7.59	8.09	8.59	8.99	9.37	9.82
    19.26	19.84	26.18	35.50	45.61	57.20 66.81	79.62	95.17	108.96	124.87	144.25]';

data.tL_Stok2014_1 = [cape2_4(:,1), cape2_4(:,2)];   % pack
units.tL_Stok2014_1 = {'d', 'cm'};    label.tL_Stok2014_1 = {'time since birth', 'total length'};     bibkey.tL_Stok2014_1 = 'Stok2014';
temp.tL_Stok2014_1 = C2K(27);  units.temp.tL_Stok2014_1 = 'K'; label.temp.tL_Stok2014_1 = 'temperature';
data.tW_Stok2014_1 = [cape2_4(:,1), cape2_4(:,3)];
units.tW_Stok2014_1 = {'d', 'g'};     label.tW_Stok2014_1 = {'time since birth', 'total wet weight'}; bibkey.tW_Stok2014_1 = 'Stok2014';
temp.tW_Stok2014_1 = C2K(27);  units.temp.tW_Stok2014_1 = 'K'; label.temp.tW_Stok2014_1 = 'temperature';
data.LW_Stok2014_1 = [cape2_4(:,2), cape2_4(:,3)];
units.LW_Stok2014_1 = {'cm', 'g'};    label.LW_Stok2014_1 = {'total length', 'total wet weight'};     bibkey.LW_Stok2014_1 = 'Stok2014';

% north, early -mid season : cape6 - cape9
cape6_9 = [0.50	7.00	15.00	23.00	30.00	37.00 44.00	51.00	58.00	65.00	72.00
    4.56	4.97	5.77	6.49	6.91	7.29	7.91	8.28	8.63	9.02	9.27
    19.42	24.57	35.00	45.77	53.72	63.41	76.53	88.02	100.31	116.52	127.82 ]';

data.tL_Stok2014_2 = [cape6_9(:,1), cape6_9(:,2)];  % pack
units.tL_Stok2014_2 = {'d', 'cm'};  label.tL_Stok2014_2 = {'time since birth', 'total length'};     bibkey.tL_Stok2014_2 = 'Stok2014';
temp.tL_Stok2014_2 = C2K(27);  units.temp.tL_Stok2014_2 = 'K'; label.temp.tL_Stok2014_2 = 'temperature';
data.tW_Stok2014_2 = [cape6_9(:,1), cape6_9(:,3)];
units.tW_Stok2014_2 = {'d', 'g'};   label.tW_Stok2014_2 = {'time since birth', 'total wet weight'};  bibkey.tW_Stok2014_2 = 'Stok2014';
temp.tW_Stok2014_2 = C2K(27);  units.temp.tW_Stok2014_2 = 'K'; label.temp.tW_Stok2014_2 = 'temperature';
data.LW_Stok2014_2 = [cape6_9(:,2), cape6_9(:,3)];
units.LW_Stok2014_2 = {'cm', 'g'};  label.LW_Stok2014_2 = {'total length', 'total wet weight'};      bibkey.LW_Stok2014_2 = 'Stok2014';

% north, mid-late season : cape11 - cape14
cape11_14 = [0.50	7.00	14.00	21.00	28.00	35.00	42.00	49.00	56.00	63.00	70.00
    4.58	5.03	5.62	6.16	6.63	6.98	7.43	7.77	8.10	8.33	NaN
    20.08	25.52	34.24	41.60	49.23	56.99	65.90	77.47	86.66	99.19	103.18 ]';

data.tL_Stok2014_3 = [cape11_14(1:end-1,1), cape11_14(1:end-1,2)];  % pack
units.tL_Stok2014_3 = {'d', 'cm'};    label.tL_Stok2014_3 = {'time since birth', 'total length'};  bibkey.tL_Stok2014_3 = 'Stok2014';
temp.tL_Stok2014_3 = C2K(27);  units.temp.tL_Stok2014_3 = 'K'; label.temp.tL_Stok2014_3 = 'temperature';
data.tW_Stok2014_3 = [cape11_14(:,1), cape11_14(:,3)];
units.tW_Stok2014_3 = {'d', 'g'};     label.tW_Stok2014_3 = {'time since birth', 'total wet weight'};  bibkey.tW_Stok2014_3 = 'Stok2014';
temp.tW_Stok2014_3 = C2K(27);  units.temp.tW_Stok2014_3 = 'K'; label.temp.tW_Stok2014_3 = 'temperature';
data.LW_Stok2014_3 = [cape11_14(1:end-1,2), cape11_14(1:end-1,3)];
units.LW_Stok2014_3 = {'cm', 'g'};    label.LW_Stok2014_3 = {'total length', 'total wet weight'};  bibkey.LW_Stok2014_3 = 'Stok2014';

% SOUTH (Florida), early season:

juno1_4 = [2.00	9.00	16.00	23.00	30.00	37.00	44.00	51.00	58.00	65.00
    4.39	4.93	5.51	6.07	6.66	7.11	7.55	7.94	8.32	8.65
    18.85	23.78	31.37	40.22	47.71	56.13	66.86	78.25	88.70	101.49 ]';

data.tL_Stok2014_4 = [juno1_4(:,1), juno1_4(:,2)]; % pack
units.tL_Stok2014_4 = {'d', 'cm'}; label.tL_Stok2014_4 = {'time since birth', 'total length'};      bibkey.tL_Stok2014_4 = 'Stok2014';
temp.tL_Stok2014_4 = C2K(27);  units.temp.tL_Stok2014_4 = 'K'; label.temp.tL_Stok2014_4 = 'temperature';
data.tW_Stok2014_4 = [juno1_4(:,1), juno1_4(:,3)];
units.tW_Stok2014_4 = {'d', 'g'};  label.tW_Stok2014_4 = {'time since birth', 'total wet weight'};  bibkey.tW_Stok2014_4 = 'Stok2014';
temp.tW_Stok2014_4 = C2K(27);  units.temp.tW_Stok2014_4 = 'K'; label.temp.tW_Stok2014_4 = 'temperature';
data.LW_Stok2014_4 = [juno1_4(:,2), juno1_4(:,3)];
units.LW_Stok2014_4 = {'cm', 'g'}; label.LW_Stok2014_4 = {'total length', 'total wet weight'};      bibkey.LW_Stok2014_4 = 'Stok2014';

% mid season
juno5_8 = [ 2.00	9.00	16.00	23.00	30.00	37.00	44.00	51.00	58.00	65.00
    4.40	4.93	5.60	6.09	6.57	7.00	7.37	7.61	7.85	8.02
    18.31	22.94	32.18	39.83	45.26	52.83	63.89	67.54	73.95	78.42 ]';

data.tL_Stok2014_5 = [juno5_8(:,1), juno5_8(:,2)];  % pack
units.tL_Stok2014_5 = {'d', 'cm'};    label.tL_Stok2014_5 = {'time since birth', 'total length'};      bibkey.tL_Stok2014_5 = 'Stok2014';
temp.tL_Stok2014_5 = C2K(27);  units.temp.tL_Stok2014_5 = 'K'; label.temp.tL_Stok2014_5 = 'temperature';
data.tW_Stok2014_5 = [juno5_8(:,1), juno5_8(:,3)];
units.tW_Stok2014_5 = {'d', 'g'};     label.tW_Stok2014_5 = {'time since birth', 'total wet weight'};  bibkey.tW_Stok2014_5 = 'Stok2014';
temp.tW_Stok2014_5 = C2K(27);  units.temp.tW_Stok2014_5 = 'K'; label.temp.tW_Stok2014_5 = 'temperature';
data.LW_Stok2014_5 = [juno5_8(:,2), juno5_8(:,3)];
units.LW_Stok2014_5 = {'cm', 'g'};    label.LW_Stok2014_5 = {'total length', 'total wet weight'};      bibkey.LW_Stok2014_5 = 'Stok2014';

% late season
juno9_11 = [2.00	9.00	16.00	23.00	30.00	37.00	44.00	51.00	58.00	65.00
    4.48	5.61	6.13	6.39	6.66	6.99	7.26	7.45	7.77	7.89
    18.84	31.40	39.76	42.63	47.27	54.10	61.85	68.28	74.44	79.16
    ]';

data.tL_Stok2014_6 = [juno9_11(:,1), juno9_11(:,2)]; % pack
units.tL_Stok2014_6 = {'d', 'cm'};    label.tL_Stok2014_6 = {'time since birth', 'total length'};      bibkey.tL_Stok2014_6 = 'Stok2014';
temp.tL_Stok2014_6 = C2K(27);  units.temp.tL_Stok2014_6 = 'K'; label.temp.tL_Stok2014_6 = 'temperature';
data.tW_Stok2014_6 = [juno9_11(:,1), juno9_11(:,3)];
units.tW_Stok2014_6 = {'d', 'g'};     label.tW_Stok2014_6 = {'time since birth', 'total wet weight'};  bibkey.tW_Stok2014_6 = 'Stok2014';
temp.tW_Stok2014_6 = C2K(27);  units.temp.tW_Stok2014_6 = 'K'; label.temp.tW_Stok2014_6 = 'temperature';
data.LW_Stok2014_6 = [juno9_11(:,2), juno9_11(:,3)];
units.LW_Stok2014_6 = {'cm', 'g'};    label.LW_Stok2014_6 = {'total length', 'total wet weight'};      bibkey.LW_Stok2014_6 = 'Stok2014';


% ====== JUVENILES, captive ======
% data from <FrazSchw1984>, data excluded - shape of the growth curve indicates the
% growth was maybe hampered by size of tank

% data from Parker 1926 and Parker 1929 %% temps and food unknown, Pa1
% was kept separately than Pa2,Pa3 & Pa4 (3 kept together); semi-natural
% conditions in Florida Key West
% age (yrs), % weight (kg) % carapace length (cm) -not specified which
tWL_Pa1 = [2.58	18.00 46 % reported in Park1926
    3.00	19.00   53
    3.50	28.00    NaN %  from figure (referred to as 'Table1') in Park1929
    4.00	32.00    NaN
    4.50	37.00   NaN ];

tW_Pa2 = [0.01	0.20
    4.74/12 1.30   % at 4 months and 3 weeks, reported in Park1926
    1.00	1.40  % from figure (referred to as 'Table1') in Park1929
    1.50	3.50
    2.00	6.50
    2.50	8.80
    3.00	12.10];

tW_Pa3 = [0.01	0.20
    4.75/12 0.625   % at 4 months and 3 weeks, reported in Park1926
    1.00	0.70    % from figure (referred to as 'Table1') in Park1929
    1.50	1.90
    2.00	4.30
    2.50	5.80
    3.00	8.30];

tW_Pa4 = [0.01	0.20
    4.75/12  0.565   % at 4 months and 3 weeks, reported in Park1926
    1.00	0.60  % from figure (referred to as 'Table1') in Park1929
    1.50	1.50
    2.00	3.30
    2.50	4.50];

data.tW_Park1929_1(:,1) = 365 * tWL_Pa1(:,1); % convert yr to d
data.tW_Park1929_1(:,2) = 1e3 * tWL_Pa1(:,2); % convert kg to g
units.tW_Park1929_1 = {'d', 'g'};     label.tW_Park1929_1 = {'time since birth', 'total wet weight'}; ...
    bibkey.tW_Park1929_1 = {'Park1926', 'Park1929'};
temp.tW_Park1929_1 = C2K(23);  units.temp.tW_Park1929_1 = 'K'; label.temp.tW_Park1929_1 = 'temperature';
% (this was an older turtle, it is possible to assume a higher f because it is already used to more food sources,
% temp was probably the same as for other turtles (same facility), unless some environmental warming was active)

data.tL_Park1926 = [tWL_Pa1(1:2, 1)*365, tWL_Pa1(1:2, 3)]; % yrs to days
units.tL_Park1926 = {'d', 'cm'};     label.tL_Park1926 = {'time since birth', 'carapace length'}; ...
    bibkey.tL_Park1926 = 'Park1926';
temp.tL_Park1926 = C2K(23);  units.temp.tL_Park1926 = 'K'; label.temp.tL_Park1926 = 'temperature';

data.tW_Park1929_2(:,1) = 365 * tW_Pa2(:,1); % convert yr to d
data.tW_Park1929_2(:,2) =  1e3 *tW_Pa2(:,2); % convert kg to g
units.tW_Park1929_2 = {'d', 'g'};     label.tW_Park1929_2 = {'time since birth', 'total wet weight'}; ...
    bibkey.tW_Park1929_2 =  {'Park1926', 'Park1929'};
temp.tW_Park1929_2 = C2K(22); units.temp.tW_Park1929_2 = 'K'; label.temp.tW_Park1929_2 = 'temperature';
% tW3(:,4) = 0.78; tW3(:,5) = 22 + 273;  % less ideal conditions

data.tW_Park1929_3(:,1) = 365 * tW_Pa3(:,1); % convert yr to d
data.tW_Park1929_3(:,2) =  1e3 * tW_Pa3(:,2); % convert kg to g
units.tW_Park1929_3 = {'d', 'g'};     label.tW_Park1929_3 = {'time since birth', 'total wet weight'};  ...
    bibkey.tW_Park1929_3 =  {'Park1926', 'Park1929'};
% tW4(:,4) = 0.78; tW4(:,5) = 22 + 273;  % less ideal conditions

data.tW_Park1929_4(:,1) = 365 * tW_Pa4(:,1); % convert yr to d
data.tW_Park1929_4(:,2) =   1e3 *tW_Pa4(:,2); % convert kg to g
units.tW_Park1929_4 = {'d', 'g'};   label.tW_Park1929_4 = {'time since birth', 'total wet weight'};  ...
    bibkey.tW_Park1929_4 = {'Park1926', 'Park1929'};
% tW5(:,4) = 0.78; tW5(:,5) = 22 + 273;  % less ideal conditions

%%% data from Hildebrand and Hatsel, 1927 : turtles hatched in the relocated nest (Beuafort, North Carolina),
% held outdoors, then after first winter held indoors for next winters, but maybe tenks too small.
% Temp not reported, food - fish, after 3 years also clams.
% age (yrs), CL (cm), weight (kg)
tLW_HH = [ 0.01  4.2 NaN
    1   13.6 NaN
    4.5 59.8 20.4
    6   NaN  25 ];

tW_HH =[4.5 21.3 % age (yrs), and weight (kg)
    6  27.7
    ];

data.tW_HildHats1927_1(:,1) = 365 * tLW_HH(3:4,1); % convert yr to d
data.tW_HildHats1927_1(:,2) = 1e3 * tLW_HH(3:4,3); % convert kg to g
units.tW_HildHats1927_1 = {'d', 'g'};     label.tW_HildHats1927_1 = {'time since birth', 'total wet weight'}; ...
    bibkey.tW_HildHats1927_1 = {'HildHats1927'};
temp.tW_HildHats1927_1 = C2K(21);  units.temp.tW_HildHats1927_1 = 'K'; label.temp.tW_HildHats1927_1 = 'temperature';
% (this was an older turtle, it is possible to assume a higher f because it is already used to more food sources,
% temp was probably the same as for other turtles (same facility), unless some environmental warming was active)

data.tL_HildHats1927 = [tLW_HH(1:3, 1)*365, tLW_HH(1:3, 2)]; % yrs to days
units.tL_HildHats1927 = {'d', 'cm'};     label.tL_HildHats1927 = {'time since birth', 'carapace length'}; ...
    bibkey.tL_HildHats1927 = 'HildHats1927';
%temp.tL_Park1926 = C2K(23);  units.temp.tL_Park1926 = 'K'; label.temp.tL_Park1926 = 'temperature';

data.tW_HildHats1927_2 = [tW_HH(:, 1)*365, tW_HH(:, 2)* 1e3]; % yrs to days, kg to g
units.tW_HildHats1927_2 = {'d', 'g'};     label.tW_HildHats1927_2 = {'time since birth', 'total wet weight'}; ...
    bibkey.tW_HildHats1927_2 = 'HildHats1927';

% === SUBADULTS, ADULTS, wild =======

% data_LW; %matrix LW_AN, data from WabnPaul2008 by PlotReader; modified for Atlantic only
LW_Wab = [12.18,1 ;12.98,0.67; 13.69,1.12; 14.39,1.01; 15.47,0.83; 16.77,0.84; 17.54,0.66; 18.23,1.91; 19.09,0.31; 19.27,2.62; 19.87,0.67; 20.56,2.27; 21.25,0.49; 22.11,2.45; 22.54,0.85; 23.06,2.81; 23.41,1.03;
    23.92,1.39; 24.09,3.16; 24.61,0.68; 24.78,3.88; 25.13,0.86; 25.47,2.46; 25.91,3.52; 26.16,1.75; 26.77,0.50; 26.94,2.46; 26.94,4.06; 27.72,1.22; 28.58,4.06; 28.84,3 ;29.7,4.24; 30.22,4.6; 30.99,3.18; 31.51,5.85;
    31.94,4.6; 33.58,5.32; 34.53,5.68; 34.96,4.79; 36.08,6.75; 37.97,8.17; 39.61,8.89; 40.3,8; 42.11,12.45; 42.28,10.49; 42.37,5.16; 44.78,11.92; 44.87,14.41; 47.2,14.59; 47.28,9.62; 48.84,16.37; 49.7,16.73; 50.3,19.93;
    52.2,19.4; 54.01,24.56; 54.87,22.79;56.59,24.75; 59.01,25.29; 59.7,28.13; 60.13,18.18; 60.13,19.6; 60.65,30.8; 61.51,32.58; 61.77,33.65; 63.58,34.19; 64.87,36.5; 66.42,39.7; 67.97,46.28; 73.32,54.83; 78.49,65.69; 83.06,78.14;
    84.96,81.52; 41.08,12.62; 42.97,15.3; 43.15,11.92; 43.75,15.3; 44.09,9.96; 45.47,14.41; 45.91,18.86; 46.16,16.9; 46.34,14.06; 47.46,13.71; 47.54,18.33; 47.97,21; 48.41,18.33; 48.92,15.66; 48.92,14.95; 49.61,19.22; 49.78,20.11;
    49.96,20.47; 50.13,21.53; 50.22,22.6; 50.56,15.85; 50.56,21.89; 50.82,24.91; 51.16,22.78; 51.51,21.18; 51.51,22.43; 51.59,17.45; 51.77,19.76; 51.77,24.74; 52.37,29.54; 52.37,29.72; 52.46,29.01; 52.54,36.29; 52.72,23.67; 52.8,18.69;
    52.8,22.61; 52.8,28.65; 52.89,26.7; 52.89,27.23; 52.97,22.25; 52.97,26.34; 53.15,25.1; 53.23,34.52; 53.32,22.43; 53.49,24.21; 53.58,22.96; 53.58,23.85; 54.27,20.48; 54.27,16.74; 54.35,19.05; 54.44,21.19; 54.44,18.52; 54.61,27.05;
    54.61,22.25; 54.96,16.57; 55.04,24.57; 55.3,30.79; 55.3,31.86; 55.3,34.34; 55.39,29.9; 55.47,29.37; 55.56,28.48; 55.91,17.1; 55.91,20.66; 55.91,21.9; 55.99,18.7; 55.99,22.79; 56.25,26.35; 56.77,20.66; 56.77,27.24; 56.77,31.86;
    56.85,31.15; 57.03,29.9; 57.11,27.42; 57.11,28.66; 57.54,20.66; 57.89,24.4; 58.32,28.66; 58.32,29.2; 58.41,30.09; 58.41,30.8; 58.41,32.22; 58.58,22.44; 58.66,34.53; 58.66,35.77; 58.75,34.89; 58.75,32.75; 59.09,33.29; 59.35,24.4;
    59.78,35.07; 60.13,27.6; 60.13,35.24; 60.3,24.76; 60.47,35.96; 60.73,36.49; 61.51,27.07; 61.59,26.18; 61.68,25.29; 61.77,38.09; 61.77,38.98; 61.77,40.94; 61.77,41.47; 61.85,37.2; 61.94,29.38; 62.11,39.87; 62.2,37.2; 62.46,29.38;
    62.8,44.14; 62.89,30.98; 62.89,31.87; 62.89,37.03; 62.97,29.21; 62.97,42.01; 63.06,38.27; 63.06,40.41; 63.15,26.36; 63.32,26.36; 63.41,29.03; 63.66,33.3; 63.66,36.85; 63.66,39.16; 63.66,43.25; 64.09,36.5; 64.18,42.54; 64.18,67.25;
    64.27,32.59; 64.53,37.92; 64.53,42.37; 64.7,35.97; 64.7,42.37; 64.78,28.32; 64.96,28.32; 64.96,42.37; 65.04,43.97; 65.04,44.32; 65.04,44.5; 65.13,37.74; 65.22,37.57; 65.47,27.43; 65.65,33.3; 65.73,27.08; 65.73,33.66; 66.08,44.32;
    66.08,44.32; 66.25,40.06; 66.34,43.26; 66.51,40.06; 66.51,42.55; 66.68,37.39; 66.77,36.68; 66.77,37.93; 66.77,41.66; 66.85,36.15; 66.85,38.28; 66.85,46.28; 66.85,46.64; 66.85,47.53; 66.85,48.77; 66.85,50.01; 66.94,41.48; 67.2,41.66;
    67.72,41.31; 67.97,40.42; 68.23,57.66; 68.41,31; 68.75,48.95; 68.75,50.91; 68.92,37.75; 69.18,46.46; 69.27,33.13; 69.44,41.67; 69.61,51.09; 69.87,48.07; 69.96,36.87; 70.04,44.33; 70.56,52.87; 70.91,24.78; 70.99,38.82; 71.42,34.38;
    71.42,51.27; 71.68,52.87; 71.68,53.94; 71.68,54.83; 71.77,55.18; 71.94,55.54; 72.03,43.98; 72.11,49.67; 72.28,56.6; 72.37,39.18; 72.46,46.29; 72.46,52.69; 72.63,46.12; 72.72,53.05; 72.8,57.49; 72.89,46.3; 72.89,48.25; 73.06,47.54;
    73.06,47.54; 73.15,50.92; 73.41,39.36; 73.58,44.87; 74.01,55.72; 74.09,54.48; 74.09,53.41; 74.27,44.7; 74.7,56.79; 74.87,56.79; 75.22,61.77; 75.3,56.79; 75.3,63.9; 75.65,51.81; 75.73,51.81; 75.82,56.97; 75.99,44.35; 76.16,54.48;
    76.16,64.08; 76.34,52.7; 76.34,54.12; 76.42,53.06; 76.42,53.59; 76.42,60.53; 76.77,24.79; 76.77,64.26; 76.85,44.35; 76.94,61.59; 77.2,55.73; 77.28,68.35; 77.37,53.95; 77.54,66.39; 78.06,83.28; 78.23,43.46; 78.23,82.4; 78.41,72.44;
    78.84,61.06; 79.01,70.31; 79.44,76; 79.53,88.44; 79.7,61.24; 79.78,88.44; 80.04,43.47; 80.3,70.31; 80.56,63.91; 80.56,66.22; 80.99,75.65; 81.16,46.67; 82.2,80.98; 82.28,73.34; 82.37,84.36; 82.63,78.85; 82.97,50.58; 83.06,80.63;
    83.92,76.72; 84.35,85.25; 84.35,84.19; 84.7,83.3; 84.96,90.94; 85.04,73.7; 85.65,68.01; 86.08,82.24; 86.59,98.06; 86.94,84.19; 86.94,87.39; 87.72,100.19; 87.8,91.66; 88.15,87.22; 89.09,79.93; 89.18,81.53; 89.78,86.87; 89.96,72.64;
    90.13,72.82; 90.91,103.05; 91.16,82.07; 91.25,90.6; 91.51,85.27; 91.77,95.94; 91.77,104.83; 92.28,99.67; 93.23,108.38; 93.66,100.56; 94.53,98.08; 94.87,125.63; 95.04,114.79; 96.59,104.84; 97.03,121.55; 97.46,117.64; 98.23,101.11;
    99.01,130.62; 100.04,133.29; 101.08,131.16; 102.03,153.74; 103.58,143.96; 105.04,141.12; 70.73,44.87; 78.66,65.51; 82.72,70.32; 87.63,105.53; 96.42,111.41];

data.LW_WabnPaul2008 = sortrows(LW_Wab,1);
% data.LW_WabnPaul2008(:,2) = data.LW_WabnPaul2008(:,2) * 1000;% convert kg to g
units.LW_WabnPaul2008  = {'cm', 'g'};  label.LW_WabnPaul2008 = {'SCL', 'wet weight'};
bibkey.LW_WabnPaul2008 = {'WabnPaul2008'};

% repro output (fecundity), from TiwaBjor2000, fig.1
% SCL (cm), % eggs per nest (#); on average 4 nests per female can be assumed
LN_NA =[ 76.801	80.186	80.617	82.993	83.493	84.691	84.696	85.212	86.514	87.352	88.286	88.607	88.831	89.285	89.507	89.573	89.599	89.754	89.844	90.324	90.335	90.366	90.726	91.034	91.115	91.377	91.451	91.482	91.602	91.953	92.548	92.582	92.92	93.379	93.463	93.74	94.282	94.286	95.214	95.372	96.095	96.146	96.491	97.2	97.887	98.955	100.237	100.276
    71.887	68.69	97.788	90.763	103.983	78.701	81.587	75.803	111.859	126.756	114.468	106.764	126.003	84.62	102.897	85.576	128.874	107.703	104.333	106.007	112.021	102.398	145.689	101.903	93.723	106.948	122.822	112.719	126.909	109.101	121.838	85.754	115.816	104.982	98.726	148.755	102.798	133.108	117.212	125.628	101.799	131.626	109.969	133.769	116.916	126.997	122.641	145.733
    ]';

data.LN = LN_NA; units.LN  = {'cm', '#/clutch'};  label.LN = {'SCL', 'eggs per clutch'};
fecund.LN = 3.7/2.5; units.fecund.LN = 'clutches/year'; label.fecund.LN = 'clutches per nesting season/years between nesting seasons';
comment.LN = 'for fecundity, used an average 3-4 nests per season per female with nesting seasons 2-3 yrs apart';
bibkey.LN = {'TiwaBjor2000'};

%%%% NEW  : include a bunch of data for growth  
% Bjorndal et al 2000, wild population, capture(L1)-recapture(L2)-interval(t)
% "In the waters around the Azores,mean surface temperature in winter
% is 16 C and in  summer 22 C (M. Alves pers. comm.)"
L1L2t = [4.65	9.9	160   % CCL1 (cm) % CCL2 (cm) % interval (d)
    19.3	42	1868
    26	42	1233
    28	48	1504
    31.9	49	1206
    40.5	49.8	950
    41	52	828
    45	74	1647
    60.4	70.9	1210
    64	69.6	680
    78.4	80.4	552];
L0Lt = sortrows(L1L2t); % sort by first column in ascending order
data.L0Lt_BjorBolt2000 = L0Lt(:,[1,2]);
units.L0Lt_BjorBolt2000 = {'cm','cm'}; label.L0Lt_BjorBolt2000={'CCL at first capture','CCL at second capture'};
bibkey.L0Lt_BjorBolt2000 = 'BjorBolt2000';
temp.L0Lt_BjorBolt2000    = C2K(19);  units.temp.L0Lt_BjorBolt2000 = 'K'; label.temp.L0Lt_BjorBolt2000 = 'temperature';
time.L0Lt_BjorBolt2000 = L0Lt(:,3); units.time.L0Lt_BjorBolt2000 = 'd'; label.time.L0Lt_BjorBolt2000 = 'time between captures';
treat.L0Lt_BjorBolt2000 = {0}; units.treat.L0Lt_BjorBolt2000 = ''; label.treat.L0Lt_BjorBolt2000 = '';
comment.L0Lt_BjorBolt2000 ='mean SST in the Azores bewteen 17C in winter and 22C in summer; time between captures varies, see mydata file.';

% Snover et al 2007, wild population, capture(L1)-recapture(L2)-interval(t)
L1L2t = [59.1	59.6	907   % SCLnt1 (cm) % SCLnt2 (cm) % interval (d)
    50.6	57.6	1062
    61.8	70.8	1249
    56.3	58.6	667
    62.1	72.7	929
    52.9	72.7	2000
    63.6	76.8	1470
    74.8	78.4	1290
    63.6	67	1506
    62.6	69	570
    65.7	67.9	1036
    52	64.8	1692];
L0Lt = sortrows(L1L2t); % sort by first column in ascending order
data.L0Lt_SnovAven2007 = L0Lt(:,[1,2]);
units.L0Lt_SnovAven2007 = {'cm','cm'}; label.L0Lt_SnovAven2007={'SCL at first capture','SCL at second capture'};
bibkey.L0Lt_SnovAven2007 = 'SnovAven2007';
time.L0Lt_SnovAven2007 = L0Lt(:,3); units.time.L0Lt_SnovAven2007 = 'd'; label.time.L0Lt_SnovAven2007 = 'time between captures';
treat.L0Lt_SnovAven2007 = {0}; units.treat.L0Lt_SnovAven2007 = ''; label.treat.L0Lt_SnovAven2007 = '';
comment.L0Lt_SnovAven2007 ='average temp of population assumed, time between captures varies, see mydata file.';

% Bjorndal et al 2000, wild population, CCL - growth rate
LdL = [30.583	4.378
    33.881	4.687
    37.934	4.882
    40.339	5.177
    46.448	4.767
    44.999	3.557
    59.367	6.366
    65.598	3.184
    66.764	2.973
    79.389	1.28
    ]; data.LdL_BjorBolt2000 = LdL;
units.LdL_BjorBolt2000   = {'cm', 'cm/yr'};  label.LdL_BjorBolt2000 = {'carapace length, CCL', 'change in carapace length'};
% temp.LdL_BjorBolt2000    = temp.am;  units.temp.LdL_M = 'K'; label.temp.LdL_M = 'temperature';
bibkey.LdL_BjorBolt2000 = 'BjorBolt2000'; comment.LdL_BjorBolt2000 = 'temp is guessed';

% Scott et al 2012, wild population, mean CCL - growth rate
LdL = [6.428	31.119	42.572	41.233	55.427	57.077	60.758	59.738	64.532	66.368	68.102	69.634	72.198	73.837	80.89	83.344	81.085	80.78	90.086
    12.036	4.713	4.87	3.561	0.961	2.904	2.962	3.22	1.673	1.038	0.443	0.224	1.235	1.73	1.352	1.451	0.143	0.321	0.518
    ]'; data.LdL_ScotMars2012 = LdL;
units.LdL_ScotMars2012   = {'cm', 'cm/yr'};  label.LdL_ScotMars2012 = {'carapace length, CCL', 'change in carapace length'};
% temp.LdL_ScotMars2012    = temp.am;  units.temp.LdL_ScotMars2012 = 'K'; label.temp.LdL_ScotMars2012 = 'temperature';
bibkey.LdL_ScotMars2012 = 'ScotMars2012'; comment.LdL_ScotMars2012 = 'temp is guessed';

% Bjorndal et al 2013, wild population, mean CCL - growth rate
LdL = [55.6952	69.2415	70.5229	70.2218	63.9463	58.8233	58.8756	61.7719	62.9275	69.9506	70.7044	71.0333	70.3203	52.4572	55.3615	55.6418	54.9054	54.7846	54.1365	52.7134	50.6159	50.9647	52.665	50.3269	54.3747	56.5082	57.6023	59.1759	59.8607	61.3051	62.9422	57.4625	57.5559	58.109	56.6805	56.1469	56.2038	57.7755	58.0219	58.5717	60.2102	59.1616	59.5361	60.7705	62.7099	62.6508	62.8373	62.5006	64.6892	65.4628	64.9437	65.0351	65.469	65.963	69.5436	70.3131	71.4619	72.3563	73.0343	57.8422	57.5055	58.3093	58.1925	58.9682	60.1999	60.6298	61.8918	61.9228	63.1874	63.779	60.4803	61.0672	59.2291	58.7313	58.9166	59.4084	59.8095	60.4924	60.8957	61.4842	61.6092	61.7893	61.9763	60.8878	61.0101	61.1936	61.3159	61.7793	62.2433	62.0281	62.3621	63.075	63.7261	63.0171	62.9272	63.1732	63.5444	63.6693	62.655	62.7175	62.8079	63.3344	63.6436	63.8265	64.3233	63.7081	63.8625	63.4642	63.8656	64.5789	64.7927	64.73	64.667	64.7283	64.4794	65.2822	65.2534	65.7148	66.0252	66.2707	66.2435	66.5845	65.1286	65.0976	66.0277	66.1212	67.0196	67.2349	67.1768	68.012	64.9705	65.1555	66.3608	67.1986	68.035	67.8198	67.9744	68.1913	68.9328	69.4567	69.8907	69.6119	70.1668	70.4134	70.9392	70.693	71.4645	71.805	71.93	71.8387	71.9581	71.8647	71.9878	71.739	71.5219	70.9643	71.057	71.3652	71.3331	71.6418	71.6415	70.8073	70.3437	70.2208	70.4398	69.7285	69.7909	69.7915	69.6989	69.082	68.9592	68.278	67.9691	67.783	68.1834	68.8012	68.8617	68.6758	66.9172	67.2886	67.2571	67.2234	67.5016	67.4705	68.0564	68.2715	68.1157	68.392	68.3609	68.7647	68.8264	68.9191	69.1035	66.7269	66.1722	65.9551	64.3179	64.41	64.8425	64.8722	65.3664	65.2727	65.1479	64.6841	64.3139	64.3126	64.4662	64.8984	64.8676	63.8458	64.3708	64.2766	63.7817	63.5024	64.3053	64.9522	65.5741	65.5735	65.9162	66.3799	66.8428	67.0898	67.4598	67.3087	67.6179	67.4342	67.2496	67.3117	67.5595	70.0008	69.9045	70.3385	71.2347	71.9785	67.21	67.21	66.87	66.7124	66.5853	67.295	67.9434	68.3442	67.5775	67.7955	69.2761	68.9404	69.5887	69.8067	69.4057	70.4893	71.0424	71.2882	71.8449	71.2541	72.5561	72.3112	71.9405	73.5144	73.3946	73.0883	73.5829	74.1388	74.448	75.0974	75.2166	73.5691	73.8784	73.694	75.949	76.2902	76.8741	81.5099	84.9138	77.5012	79.0438	77.6582	77.4425	77.0719	76.1805	75.9968	75.7487	75.2559	75.1935	75.5026	75.751	73.7711	73.3706	73.031	72.9704	72.6005	72.4792	73.188	73.4039	73.7441	73.5908	73.9611	73.9619	73.87	73.592	73.4377	74.3338	74.4582	74.5823	74.6756	74.1819	73.9672	73.9069	73.4742	72.8237	72.9185	72.9204	74.4968	76.3218	75.8844	75.7912	76.8715	76.9628	77.7342	77.5518	75.7869	75.2615	75.4456	75.2593	75.1648	74.6079	75.9699	76.7702	76.6785	76.865	76.835	77.0827	77.7249	77.7888	78.895	79.6399	78.5602	78.778	78.563	78.5337	78.2554	79.2145	79.5214	80.5084	81.6194	80.6335	80.5431	79.5579	79.065	79.129	82.4266	82.3339	81.965	82.5226	82.8929	82.8643	81.9375	82.5264	82.5903	82.5924	82.1295	80.1216	80.708	80.4587	80.3345	80.3338	80.4874	80.888	81.0726	83.8791	84.4022	84.9875	84.899	84.0974	84.5934	84.7788	85.0896	84.8117	83.8851	83.5766	83.4244	84.0109	84.1053	84.3499	85.0338	86.7323	85.7371	86.1397	86.3875	86.45	86.8525	86.4206	86.0808	85.8336	85.7094	84.8154	84.938	85.2468	85.4322	85.8037	85.8044	85.7433	85.4033	86.6941	86.134	88.3898	88.1751	89.752	89.8441	88.6409	88.735	88.0243	88.7672	89.6018	90.0954	90.4646	91.1758	91.8559	91.7628	92.288	92.8138	92.3134	92.9964	93.3672	94.7177	96.3811	90.5896	90.591	88.19	88.1255	88.0639	87.9715	87.7839	87.6589	87.5957	87.5028	88.0907	87.9357	87.9042	87.904	88.212	88.3053	88.3371	89.2012	89.1086	89.0165	88.8934	88.2774	88.3711	88.6499	88.8977	89.2996	89.7003	89.7917	89.4193	88.9254	88.6782	89.5424	89.6963	90.1912	90.4397	90.4706	90.1942	90.3795	90.6873	90.5622	91.1477	90.9945	91.0269	91.8306	91.4587	91.3956	92.4149	92.2612	92.2622	92.5726	92.6049	93.0037	93.0653	93.5303	93.6549	93.838	94.3636	94.7651	95.168	94.5194	94.9804	95.3202	95.01	95.6299	95.8473	96.0042	95.9731	95.88	96.7142	96.4022	95.8432	97.2992	97.3606	97.6072	97.4832	98.0082	98.4722	98.8124	98.6901	98.6604	98.168	97.462	101.0357	101.0666	94.6991	95.5056	97.1985	97.9202	98.621	104.0713	106.2841	108.133
    8.634	8.8128	7.8043	6.1191	5.9277	5.6979	4.434	4.8426	4.4979	5.4298	5.5319	4.4213	4.2043	3.5191	3.5589	3.3404	2.8142	2.5262	2.4468	2.6156	2.2284	1.3348	1.2652	0.2128	0.2426	0.1135	-1.1475	-0.9092	-1.4057	-0.6113	-0.5418	0.4809	0.4113	0.7291	1.434	2.2681	2.7645	3.1915	3.2709	3.9163	3.8468	3.6383	3.2709	3.4397	4.1844	3.9163	3.7972	3.4794	4.0255	3.9163	3.2908	3.4199	3.2908	3.3305	3.7376	4.0454	3.4993	3.6681	3.8567	2.695	2.3773	2.3376	1.6525	1.3348	1.7716	2.0496	2.5461	2.5362	2.7745	2.3277	1.5433	1.5631	-0.0454	0.2922	0.3121	0.5702	0.6298	0.322	0.1631	0.0241	-0.1149	0.4213	0.2624	0.9574	1.0965	1.2851	1.4142	1.434	1.3844	1.2652	1.8709	1.6525	1.434	1.2553	0.9773	1.0965	1.0567	0.9277	0.3816	0.3121	0.5404	0.4213	0.4014	0.6596	0.4213	0.1333	0.1433	-0.2043	-0.1745	-0.4326	-0.1745	-0.0851	0.034	0.0837	0.2525	0.322	0.1135	0.322	0.183	0.3518	-0.0156	-0.1248	0.2326	0.2426	-0.0652	-0.1447	-0.373	-0.2738	-0.6511	-0.7305	0.5901	0.6298	0.6199	0.2723	0.0638	-0.0454	-0.0553	-0.1149	-0.105	0.044	-0.095	-0.0255	0.1035	0.1631	0.1234	0.0142	0.1234	0.0638	-0.0752	-0.2142	0.2028	0.2723	0.322	0.4809	0.5603	0.6993	0.6993	0.7887	0.9078	0.9376	0.9674	0.9574	0.9574	0.8879	0.6199	0.6794	0.6199	0.5603	0.5404	0.4312	0.3518	0.4908	0.4709	0.5404	0.6794	0.6993	0.8284	0.878	0.6	0.5404	0.6	0.8879	0.878	0.8979	1.017	1.1461	1.2752	1.4539	1.4738	1.2652	1.2752	1.2752	1.3745	1.0965	0.9376	1.017	0.9574	1.017	1.0369	1.156	1.1759	1.2752	1.3943	1.4241	1.3645	1.4936	1.583	1.6227	1.6128	1.8213	1.861	2.0099	2.0596	2.1787	2.2284	2.4369	2.0397	2.1092	1.8213	1.8113	1.8709	1.8908	1.9702	1.6326	1.6128	1.444	1.3546	1.3248	1.2652	1.2652	1.6227	1.4837	1.4837	1.2652	2.2383	2.2383	2.2383	2.556	2.9035	3.0128	3.0624	3.1518	2.566	2.3972	2.6652	2.2383	2.3078	2.139	2.0596	1.861	2.1688	2.3177	2.2681	2.6355	2.2184	1.9901	1.9801	2.1887	1.8014	1.5333	1.5135	1.5433	1.5234	1.4837	1.9206	2.9035	2.8738	2.7745	2.8539	2.7248	3.0525	2.9929	2.5163	2.139	2.3872	1.8908	1.8213	1.8014	1.3248	1.156	1.2454	1.0766	1.1362	1.1262	1.0071	1.2355	1.1064	1.0766	0.9574	0.8582	0.6298	0.8284	0.8681	0.8383	0.7191	0.7688	0.6894	0.6099	0.6	0.5702	0.5801	0.5007	0.4511	0.3915	0.3121	0.1532	0.0043	0.0142	0.173	-0.0454	-0.234	-0.2738	-0.4525	0.0241	0.0738	0.2028	0.3418	0.461	0.1532	0.5106	0.5106	0.6496	0.739	0.9177	0.9872	0.7489	1.0667	0.9674	0.8582	0.7589	0.7191	1.3943	1.1858	1.8113	1.4837	1.295	1.1461	1.017	0.8582	0.8681	0.7589	0.9674	1.156	1.305	1.0071	0.7688	0.4014	0.2525	0.034	0.9277	0.9277	0.7291	0.5901	0.6397	0.4113	0.3915	0.2128	-0.0057	-0.2142	-0.2738	-0.3433	-0.2738	-0.0652	-0.0057	0.0638	0.1631	0.2723	0.3518	0.9078	1.1362	1.3149	0.8979	0.7092	0.5504	0.5504	0.3716	0.3518	0.3121	0.2525	0.0241	0.0837	-0.0851	0.183	-0.234	-0.1248	0.5206	0.4312	0.3716	0.3021	0.2227	0.1532	0.1333	0.1333	0.1929	-0.0156	0.0837	0.1035	0.1035	0.034	-0.0355	-0.105	-0.095	0.6099	1.0071	1.0071	0.8482	0.7489	0.8085	0.6099	0.4709	0.4709	0.3418	0.322	0.4014	0.5603	0.5206	0.4908	0.5305	0.5404	0.4908	1.0965	0.7787	0.7787	1.7021	2.2383	0.4213	0.2823	-0.661	-0.383	-0.4028	-0.4326	-0.2142	-0.0752	0.0638	0.0837	0.0043	0.0539	0.1135	0.1333	0.2426	0.183	0.0936	0.2028	0.1929	0.1333	0.0837	-0.1248	-0.2241	-0.2936	-0.3532	-0.373	-0.2638	-0.1348	0.0241	-0.0255	-0.0255	0.0738	0.1333	0.0936	-0.0454	-0.0454	-0.2142	-0.2043	-0.0752	0.0738	0.2326	0.1035	-0.0454	-0.0752	0.034	0.1631	0.2128	0.1333	0.034	-0.1149	-0.2539	0.044	0.0638	-0.0851	-0.1844	0.044	0.0241	0.044	-0.0752	-0.105	0.1433	0.1532	0.2723	0.0837	-0.0255	-0.2638	-0.244	-0.2043	-0.1844	0.1135	0.3915	0.0241	0.0638	0.1234	0.1631	0.2028	0.1532	0.1234	-0.0057	-0.1248	-0.3333	-0.8099	0.2823	0.2823	0.6876	0.6924	0.6147	0.9443	0.3555	0.093	0.2842	0.3438
    ]';data.LdL_BjorSchr2013 = LdL;
units.LdL_BjorSchr2013   = {'cm', 'cm/yr'};  label.LdL_BjorSchr2013 = {'carapace length, CCL', 'change in carapace length'};
% temp.LdL_BjorSchr2013    = temp.am;  units.temp.LdL_BjorSchr2013 = 'K'; label.temp.LdL_BjorSchr2013 = 'temperature';
bibkey.LdL_BjorSchr2013 = 'BjorSchr2013'; comment.LdL_BjorSchr2013 = 'temp is guessed';

% Braun-McNeill et al 2008, wild population North Carolina, mean SCL - growth rate
LdL = [48.543	50.706	51.576	50.155	51.764	51.478	54.966	57.478	62.334	73.385	80.024	83.143	78.06	77.59	76.826	75.619	76.222	75.433	74.684	73.413	74.5	74.866	74.192	73.217	72.045	70.59	71.565	70.108	68.161	66.494	63.015	62.341	61.279	59.817	58.588	57.978	57.189	55.693	57.672	58.287	71.678	70.996	70.313	69.601	68.856	67.102	63.677	62.834	61.298	60.031	56.352	66.411	63.984	54.462	54.686	52.683	53.277	55.029	55.511	55.957	55.436	55.248	56.623	56.51	56.134	56.282	56.542	60.075	59.629	59.702	60.111	60.147	60.444	58.22	58.293	58.813	59.075	59.15	59.669	59.967	60.079	61.267	61.044	60.971	62.049	62.013	62.052	60.378	60.639	61.086	61.496	59.786	59.639	58.932	59.119	58.859	58.152	57.966	58.004	57.595	59.047	59.381	59.605	59.718	60.61	61.801	62.246	63.288	63.586	64.628	65.112	65.297	66.86	66.97	67.192	68.16	68.122	68.418	68.417	68.378	68.34	68.973	69.159	69.828	70.275	69.501	69.686	70.133	70.58	72.028	72.139	72.732	72.845	74.296	74.669	75.788	76.011	81.625	81.699	70.643	70.196	70.269	69.974	69.044	68.375	65.508	65.507	64.764	66.105	66.998	66.403	66.366	67.26	66.702	67.822	67.414	66.78	66.779	66.22	65.332	65.629	65.888	65.813	65.142	64.993	65.289	65.251	64.246	64.507	64.245	63.984	63.799	63.987	64.583	64.211	63.84	63.394	64.399	64.586	64.177	64.848	64.215	64.663	62.244	63.025	63.212	63.359	63.545	62.949	62.799	62.056	61.461	61.089
    7.381	3.713	2.291	0.345	1.092	0.529	5.514	5.709	6.152	7.333	3.16	1.729	0.856	1.233	2.004	2.003	1.04	0.999	0.44	0.34	1.778	2.517	2.959	2.328	2.519	2.567	3.949	4.433	4.339	4.293	5.148	5.333	5.189	4.962	4.083	3.713	3.159	2.197	1.778	-0.904	1.686	1.818	1.386	1.777	2.567	3.474	3.674	2.657	0.855	0.528	1.341	0.816	0.484	2.562	2.361	0.938	1.102	0.226	0.664	0.719	0.974	1.248	1.85	2.197	3.237	3.347	3.675	3.839	3.803	4.095	4.296	4.442	4.788	2.58	2.909	3.237	2.818	2.471	3.073	2.964	2.781	3.456	3.328	3.091	3.237	2.909	2.58	2.361	2.361	2.088	1.996	1.467	1.084	1.193	0.974	0.719	0.847	0.901	0.628	0.536	0.208	0.391	0.208	-0.12	-0.029	0.044	0.226	0.19	0.08	0.117	-0.029	0.208	0.172	0.518	0.828	0.628	0.865	1.285	1.668	2.069	2.307	1.996	2.142	2.179	2.051	0.245	0.518	0.409	0.226	0.956	1.102	1.777	1.376	1.175	0.92	0.299	0.281	1.212	1.358	3.128	3.328	3.639	3.091	2.945	2.945	3.474	3.639	3.566	3.036	3.109	2.891	2.781	2.653	2.526	1.595	1.285	1.467	1.814	1.996	0.847	1.084	1.394	1.522	1.759	2.033	2.361	2.672	2.69	2.69	2.964	3.146	2.781	2.288	2.234	2.015	1.887	1.814	1.522	1.321	1.266	1.011	0.92	0.737	0.737	0.792	0.737	1.029	1.175	1.248	1.54	1.467	1.339	1.339
    ]';data.LdL_BrauEppe2008 = LdL;
units.LdL_BrauEppe2008   = {'cm', 'cm/yr'};  label.LdL_BrauEppe2008 = {'carapace length, SCL', 'change in carapace length'};
bibkey.LdL_BrauEppe2008 = 'BrauEppe2008'; comment.LdL_BrauEppe2008 = 'temp is guessed (assumed lower than average, because NC is colder than Florida';
temp.LdL_BrauEppe2008 = C2K(19);  units.temp.LdL_BrauEppe2008 = 'K'; label.temp.LdL_BrauEppe2008 = 'temperature';

%% set weights for all real data
weights = setweights(data, []);
%  weights.ab = 10 * weights.ab;   % more weight to ab
weights.Lb = 10 * weights.Lb;   % more weight to Lb
weights.Lp = 100 * weights.Lp;   % more weight to Lp
weights.Li = 100 * weights.Li;   % more weight to Li
weights.Wwb = 10 * weights.Wwb; % more weight to Wwb --> E_Hb
weights.Wwp = 5 * weights.Wwp; % more weight to Wwp --> E_Hp
weights.Wwi = 10 * weights.Wwi; % more weight to Wwi --> z
weights.E0 = 10 * weights.E0;  % more weight to E_0
weights.tp = 1/10 * weights.tp; % less weight to t_p
weights.Ri = 10 * weights.Ri;   % more weight to Ri
weights.LN = 10 *weights.LN;
weights.LW_WabnPaul2008 = 100 *weights.LW_WabnPaul2008;
weights.Tah = weights.Tah/10;
weights.LdL_BrauEppe2008 = 0.1 * weights.LdL_BrauEppe2008; % I think this is making the most problems in converging
% weights.L0Lt_BjorBolt2000 = 0 * weights.L0Lt_BjorBolt2000;
% weights.L0Lt_SnovAven2007 = 0 * weights.L0Lt_SnovAven2007;
% weights.LdL_BjorBolt2000 = 0 * weights.LdL_BjorBolt2000;
% weights.LdL_BjorSchr2013 = 0 * weights.LdL_BjorSchr2013;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0.5; weights.psd.k = 0.5;
data.psd.k = 0.75; units.psd.k  = '-'; label.psd.k  = 'maintenance ratio';
%%% add some pseudodata just to see values -- keep weights to zero so this does NOT contribute
data.psd.p_Am = 800; units.psd.p_Am  = 'J/cm^3.d'; label.psd.p_Am  = 'max surf area assimilation';
weights.psd.p_Am = 0;
data.psd.w = 1.5; units.psd.w  = '-'; label.psd.w  = 'omega'; weights.psd.w = 0;
data.psd.E_m = 1e+04; units.psd.E_m  = 'J/cm^3'; label.psd.E_m  = 'max reserve density';
weights.psd.E_m = 0;
% VALUE FOR K SAME AS FOR OTHER TURTLES

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
auxData.time = time;
auxData.fecund = fecund;
auxData.iniRes = iniRes;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% save data for table
save('data_Caretta_caretta_NA', 'data', 'txtData', 'weights')

%% Group plots
set1 = {'tL_Stok2014_1','tL_Stok2014_2','tL_Stok2014_3','tL_Stok2014_4','tL_Stok2014_5','tL_Stok2014_6'};
subtitle1 = {'data from Stok2014 north & south, all seasons'};
set2 = {'tW_Stok2014_1','tW_Stok2014_2','tW_Stok2014_3','tW_Stok2014_4','tW_Stok2014_5','tW_Stok2014_6'};
subtitle2 = {'data from Stok2014 north & south, all seasons'};
set3 = {'LW_Stok2014_1','LW_Stok2014_2','LW_Stok2014_3','LW_Stok2014_4','LW_Stok2014_5','LW_Stok2014_6'};
subtitle3 = {'data from Stok2014 north & south, all seasons'};
set4 = {'tW_Park1929_1','tW_Park1929_2','tW_Park1929_3','tW_Park1929_4', 'tW_HildHats1927_1','tW_HildHats1927_2'};
subtitle4 = {'weight data from Park1926, Park1929 & HildHats1927'};
set5 = {'tL_Park1926','tL_HildHats1927'};
subtitle5 = {'length data from Park1926 & HildHats1927'};
set6 = {'LdL_BjorBolt2000','LdL_ScotMars2012', 'LdL_BjorSchr2013'};
subtitle6 = {'(mean) CCL and change in CCL, from 3 publications '};

metaData.grp.sets = {set1,set2,set3,set4,set5,set6};
metaData.grp.subtitle = {subtitle1,subtitle2,subtitle3,subtitle4,subtitle5,subtitle6};

%% Discussion points
D1 = 'In view of low somatic maintenance, pseudodata k_J = 0.002 1/d is accompanied by pseudodata k = 0.7 --> value in other sea turtles';
D2 = ['Adults have a different shape correction coefficient to allow for a change in chape (Marn et al,', ...
    ' "Size Scaling in Western North Atlantic Loggerhead Turtles Permits Extrapolation between Regions, but Not Life Stages" ,PLOS ONE, 2015).', ...
    ' SCL = Straight Caparace Length (preferred), CCL - Curved Carapace length'];
D3 = 'Maturity levels at hatching and emergence relatively uncertain';
D4 = ['Ontogenetic habitat shift occuring mostly during the juvenile stage generally means food ',...
    'of better quality and higher temperature -> This was not (but can be) included in the model'];
D5 = ['Age at puberty reported in literature is mostly deduced from size at first nesting + bone growth marks;',...
    'onset of investement into reproduction may be sooner'];
D6 = 'Reproduction was modeled as continous, and then approximated as clutches';
D7 = ['A paper with a detailed discussion on the parameter values and model predictions: ',...
    'Marn et al.,2017, "Inferring physiological energetics of loggerhead turtle (Caretta caretta) from existing data using a general metabolic theory", MERE'];
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3, 'D4',D4, 'D5',D5, 'D6',D6, 'D7',D7);

%% Facts
F1 = 'For the Atlantic population only, part of phd research';
metaData.bibkey.F1 = {'Marn2016', 'MarnKooy2017'};
F2 = ['Hatching can last up to 24hrs. Hatching (exit the egg) to emergence (exit the nest) interval estimated as 4.1days at 30C', ...
    'Yolk bag absorbed  24-48 hours after emerging, tissue density of 0.28 reported.', ...
    'Onset of feeding observed in sea water (at 27 C) 2-3 days after emergence = approximated as birth'];
metaData.bibkey.F2 = {'GodfMros1997', 'KraeBenn1981', 'Stok2014','BennTapl1986'};
F3= ['Life stages: hatchling, pelagic juvenile, benthic juvenile, adult;',...
    'switch from pelagic to benthic stage(recruitment) happens at a certain size -> 53cm SCL(min46cm SCL max64cm SCL),', ...
    'A slight change in shape present, but isomorphy good approximation.'];
metaData.bibkey.F3 = {'BjorBolt2000', 'MarnKlan2015'};
F4 = 'Long lived species, 11-17 yrs  duration of pelagic stage, 15-35 years to reach maturity (BjorBolt2000; 28yrs in Spot2004, 18yrs in ZugWynn1986)';
metaData.bibkey.F4 = {'BjorBolt2000','Spot2004','ZugWynn1986'};
F5 = 'Reproduction in clutches (2-5 per reproduction season according to night watches, 3-8 according to satellite telemetry, Tuck2010) with 2-3 years remigration periods between reproduction seasons';
metaData.bibkey.F5 = {'BjorBolt2000','Tuck2010'};
F6 = 'Allocation to reproduction starts (maturity reached) before first nesting';
metaData.bibkey.F6 = 'MillLimp2003';
F7 = 'Mean temperature experienced: 21.8 C, range between 18.2 and 29.2C ';
metaData.bibkey.F7 = 'HawkLucy2011';
metaData.facts = struct('F1',F1, 'F2',F2, 'F3',F3, 'F4',F4, 'F5',F5, 'F6',F6, 'F7',F7);

%% Links
metaData.links.id_CoL = '69BHK'; % Cat of Life
metaData.links.id_ITIS = '173830'; % ITIS
metaData.links.id_EoL = '46559466'; % Ency of Life
metaData.links.id_Wiki = 'Caretta_caretta'; % Wikipedia
metaData.links.id_ADW = 'Caretta_caretta'; % ADW
metaData.links.id_Taxo = '48469'; % Taxonomicon
metaData.links.id_WoRMS = '137205'; % WoRMS
metaData.links.id_ReptileDB = 'genus=Caretta&species=caretta'; % ReptileDB
metaData.links.id_AnAge = 'Caretta_caretta'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = [...
    'note = {Accessed : 2018-05-17},' ...
    'howpublished = {\url{http://en.wikipedia.org/wiki/Caretta_caretta}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Kooy2010'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
    'author = {Kooijman, S.A.L.M.}, ' ...
    'year = {2010}, ' ...
    'title  = {Dynamic Energy Budget theory for metabolic organisation}, ' ...
    'publisher = {Cambridge Univ. Press, Cambridge}, ' ...
    'pages = {Table 4.2 (page 150), 8.1 (page 300)}, ' ...
    'howpublished = {\url{../../../bib/Kooy2010.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Acke1981gr'; type = 'Article'; bib = [ ...
    'author = {Ackerman, R.A.}, ' ...
    'year = {1981}, ' ...
    'title = {Growth and Gas Exchange of Embryonic Sea turtles}, ' ...
    'journal = {Copeia}, ' ...
    'volume = {4}, ' ...
    'pages = {757--765}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'BennTapl1986'; type = 'Article'; bib = [ ...
    'author = {Bennett, J. M. and Taplin, L. E. and Grigg, G. C.}, ' ...
    'year = {1986}, ' ...
    'title = {Sea Water Drinking as a Homeostatic Response to Dehydration in Hatchling Loggerhead Turtles \textit{Caretta caretta}.}, ' ...
    'journal = {Comparative Biochemistry and Physiology Part A: Physiology}, ' ...
    'volume = {83}, ' ...
    'pages = {507--513}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'BjorBolt2000'; type = 'Article'; bib = [ ...
    'author = {K. A. Bjorndal and A. B. Bolten and H. R. Martins}, ' ...
    'year = {2000}, ' ...
    'title = {Somatic growth model of juvenile loggerhead sea turtles \textit{Caretta caretta}: duration of pelagic stage.}, ' ...
    'journal = {Marine Ecology Progress Series}, ' ...
    'volume = {202}, ' ...
    'pages = {265--272}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'BjorSchr2013'; type = 'Article'; bib = [ ...
    'author = {Karen A. Bjorndal and Barbara A. Schroeder and Allen M. Foley and Blair E. Witherington and Michael Bresette and David Clark and Richard 	M. Herren and Michael D. Arendt and Jeffrey R. Schmid and Anne B. 	Meylan and Peter A. Meylan and Jane A. Provancha and Kristen M. Hart 	and Margaret M. Lamont and Raymond R. Carthy and Alan B. Bolten}, ' ...
    'year = {2013}, ' ...
    'title = {Temporal, spatial, and body size effects on growth rates of loggerhead sea turtles (\textit{Caretta caretta}) in the {N}orthwest {A}tlantic}, ' ...
    'journal = {Marine Biology}, ' ...
    'volume = {160}, ' ...
    'pages = {2711--2721},' ...
    'number={10}, ' ...
    'doi = {10.1007/s00227-013-2264-y},' ...
    'issn = {0025-3162},' ...
    'publisher = {Springer-Verlag}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'BrauEppe2008'; type = 'Article'; bib = [ ...
    'author = {Joanne Braun-Mc{N}eill and Sheryan P. Epperly and Larisa Avens and Melissa L. Snover and J. Christopher Taylor}, ' ...
    'year = {2008}, ' ...
    'title = {Growth rates of loggerhead sea turtles (\textit{Caretta caretta}) from the western {N}orth {A}tlantic}, ' ...
    'journal = {Herpetological Conservation and Biology}, ' ...
    'volume = {3}, ' ...
    'number = {2},' ...
    'pages = {273--281}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ByrdMurp2005'; type = 'Article'; bib = [ ...
    'author = {J. Byrd and S. Murphy and A. von Harten}, ' ...
    'year = {2005}, ' ...
    'title = {Morphometric Analysis of the Northern Subpopulation of \textit{Caretta caretta} in {S}outh {C}arolina, {U}{S}{A}.}, ' ...
    'journal = {Marine Turtle Newsletter}, ' ...
    'volume = {107}, ' ...
    'pages = {1--4}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EhrhYode1978'; type = 'Article'; bib = [ ...
    'author = {Ehrhart, L. M. and Yoder, R. G. }, ' ...
    'year = {1978}, ' ...
    'title = {Marine turtles of {M}erritt island national wildlife refuge, {K}ennedy space center, {F}lorida}, ' ...
    'note = {Proceedings of the Florida and interregional conference on sea turtles, July 1976, Jensen Beach, Florida, USA}, ' ...
    'volume = {33}, ' ...
    'journal = {Florida Marine Research Publication}, ' ...
    'pages = {25--30}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'GodfMros1997'; type = 'Article'; bib = [ ...
    'author = {Godfrey, M. H. and Mrosovsky, N.}, ' ...
    'year = {1997}, ' ...
    'title = {Estimating the time between hatching of sea turtles and their emergence from the nest.}, ' ...
    'journal = {Chelonian Conservation and Biology}, ' ...
    'volume = {2}, ' ...
    'pages = {581--585}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'HaysSpea1991'; type = 'Article'; bib = [ ...
    'author = {Hays, G. C. and Speakman, J. R. },'...
    'title = {Reproductive Investment and Optimum Clutch Size of Loggerhead Sea Turtles (\textit{Caretta caretta})},'...
    'journal = {Journal of Animal Ecology},'...
    'year = {1991},'...
    'volume = {60},'...
    'pages = {455--462},'...
    'number = {2},'...
    'month = {Jun},'...
    'publisher = {British Ecological Society},'...
    'howpublished = {\url{http://www.jstor.org/stable/5290}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'HawkBrod2005'; type = 'Article'; bib = [ ...
    'author = {Hawkes, L.A. and Broderick, A.C. and Godfrey, M.H. and Godley, B.J.},'...
    'title = {Status of nesting loggerhead turtles \textit{Caretta caretta} at {B}ald {H}ead Island ({N}orth {C}arolina, {U}{S}{A}) after 24 years of intensive monitoring and conservation.},'...
    'journal = {Oryx},'...
    'year = {2005},'...
    'volume = {39},'...
    'pages = {65--72}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'HawkLucy2011'; type = 'Article'; bib = [ ...
    'author = {Hawkes, L. A. and Witt, M. J. and Broderick, A. C. and Coker, J. W. and Coyne, M. S. and Dodd, M. and Frick, M. G. and Godfrey, M. H. and Griffin, D. B. and Murphy, S. R. and Murphy, T. M. and Williams, K. L. and Godley, B. J.}, ' ...
    'year = {2011}, ' ...
    'title = {Home on the range: spatial ecology of loggerhead turtles in {A}tlantic waters of the {U}{S}{A} }, ' ...
    'journal = {Diversity and Distributions}, ' ...
    'volume = {17}, ' ...
    'pages = {624--640}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'HildHats1927'; type = 'Article'; bib = [ ...
    'author = {Hildebrand, S. F.  and  Hatsel, C.},'...
    'title = {On the Growth, Care and Behavior of Loggerhead Turtles in Captivity},'...
    'journal = {Proceedings of the National Academy of Sciences of the United States of America},'...
    'year = {1927},'...
    'volume = {13},'...
    'pages = {374--377},'...
    'number = {6},'...
    'publisher = {National Academy of Sciences},'...
    'howpublished = {\url{http://www.jstor.org/stable/84927}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'KraeBenn1981'; type = 'Article'; bib = [ ...
    'author = {J. E. Kraemer and S. H. Bennett}, ' ...
    'year = {1981}, ' ...
    'title = {Utilization of Posthatching Yolk in Loggerhead Sea Turtles, \textit{Caretta caretta}.}, ' ...
    'journal = {Copeia}, ' ...
    'volume = {2}, ' ...
    'pages = {406--411}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'MarnKlan2015'; type = 'Article'; bib = [ ...
    'author = {Marn, Nina and Klanjs\v{c}ek, Tin and Stokes, Lesley and Jusup, Marko}, ' ...
    'year = {2015}, ' ...
    'title = {Size scaling in western {N}orth {A}tlantic loggerhead turtles permits extrapolation between regions, but not life stages}, ' ...
    'journal = {PLOS ONE}, ' ...
    'volume = {10}, ' ...
    'number = {12},'...
    'publisher = {Public Library of Science}, ' ...
    'doi = {10.1371/journal.pone.0143747}, ' ...
    'pages = {e0143747}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Marn2016'; type = 'phdthesis'; bib = [ ...
    'author = {Nina Marn}, ' ...
    'year = {2016}, ' ...
    'title = {Life cycle and ecology of the loggerhead turtle (\textit{Caretta caretta}, Linnaeus, 1758): Development and application of the Dynamic Energy Budget model}, ' ...
    'school={Faculty of Science, University of Zagreb (HR) \& Faculty of Earth and Life Sciences,  Vrije Universiteit Amsterdam (NL)}' ...
    ];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'MarnKooy2017'; type = 'Article'; bib = [ ...
    'author = {Nina Marn and S.A.L.M. Kooijman and Marko Jusup and Tarzan Legovi\''{c} and Tin Klanjs\v{c}ek}, ' ...
    'year = {2017}, ' ...
    'title = {Inferring physiological energetics of loggerhead turtle (\textit{Caretta caretta}) from existing data using a general metabolic theory }, ' ...
    'journal = {Marine Environmental Research}, ' ...
    'volume = {126}, ' ...
    'issn = {0141-1136}, ' ...
    'doi = {10.1016/j.marenvres.2017.01.003}, ' ...
    'pages = {14 - 25}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'MillLimp2003'; type = 'Incollection'; bib = [...
    'author = {Miller, J. D. and Limpus, C. L. and Godfrey, M. H.}, '...
    'title = {Nest site selection, oviposition, eggs, development, hatching, and emergence of loggerhead sea turtles}, '...
    'booktitle = {Ecology and Conservation of Loggerhead Sea Turtles}, '...
    'publisher = {University Press of Florida}, '...
    'year = {2003}, '...
    'editor = {Bolten, A.B. and Witherington, B.E.}, '...
    'pages = {125--143}, '...
    'address = {Gainesville, Florida}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Nort2005'; type = 'Article'; bib = [ ...
    'author = {Norton, T. M.},' ...
    'year = {2005},' ...
    'title = {Sea turtle conservation in {G}eorgia and an overview of the {G}eorgia Sea Turtle Center on {J}ekyll Island, {G}eorgia },' ...
    'journal = {Georgia Journal of Science},' ...
    'volume = {63},' ...
    'pages = {287--289}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Park1926'; type = 'Article'; bib = [...
    'author = {G. H. Parker}, '...
    'title = {The Growth of Turtles}, '...
    'journal = {Proceedings of the National Academy of Sciences}, '...
    'year = {1926}, '...
    'volume = {12}, '...
    'pages = {422--424}, '...
    'number = {7}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Park1929'; type = 'Article'; bib = [...
    'author = {G. H. Parker},'...
    'title = {The Growth of the Loggerhead Turtle},'...
    'journal = {The American Naturalist},'...
    'year = {1929},'...
    'volume = {63},'...
    'pages = {367--373},'...
    'number = {687},'...
    'publisher = {The University of Chicago Press},'...
    'howpublished = {\url{http://www.jstor.org/stable/2456979}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ReicBjor2008'; type = 'Article'; bib = [ ...
    'author = {K. J. Reich and K. A. Bjorndal and C. Martinez del Rio}, ' ...
    'year = {2008}, ' ...
    'title = {Effects of growth and tissue type on the kinetics of 13{C} and 15{N} incorporation in a rapidly growing ectotherm}, ' ...
    'journal = {Oecologia}, ' ...
    'volume = {155}, ' ...
    'pages = {651--663}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'SCDNR'; type = 'Misc'; bib = [ ...
    'howpublished = {\url{http://www.dnr.sc.gov/seaturtle/index.htm}}, ' ...
    'title = {South {C}arolina {D}epartment of {N}atural {R}esources webpage (data for {N}orth {A}tlantic population)}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ScotMars2012'; type = 'Article'; bib = [ ...
    'author = {Scott, Rebecca and Marsh, Robert and Hays, Graeme C.}, ' ...
    'year = {2012}, ' ...
    'title = {Life in the really slow lane: loggerhead sea turtles mature late relative to other reptiles}, ' ...
    'journal = {Functional Ecology}, ' ...
    'volume = {26}, ' ...
    'pages = {227--235}, ' ...
    'number = {1},' ...
    'doi = {10.1111/j.1365-2435.2011.01915.x},' ...
    'issn = {1365-2435},'...
    'publisher = {Blackwell Publishing Ltd}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'SnovAven2007'; type = 'Article'; bib = [ ...
    'author = {Melissa L. Snover and Larisa Avens and Aleta A. Hohn}, ' ...
    'year = {2007}, ' ...
    'title = {Back-calculating length from skeletal growth marks in loggerhead	sea turtles \textit{Caretta caretta}}, ' ...
    'journal = {Endang Species Res}, ' ...
    'volume = {3}, ' ...
    'pages = {95--104}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Spot2004'; type = 'Book'; bib = [ ...
    'author = {Spotila, J. R.}, ' ...
    'year = {2004}, ' ...
    'title = {Sea Turtles: A Complete Guide to their Biology, Behavior, and Conservation}, ' ...
    'publisher = {The Johns Hopkins University Press and Oakwood Arts.}, ' ...
    'address = {Baltimore, Maryland}, ' ...
    'isbn = {0-8018-8007-6}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'StokWyne2006'; type = 'Article'; bib = [ ...
    'author = {Stokes, L. and Wyneken, J. and Crowder, L. B. and Marsh, J.}, ' ...
    'year = {2006}, ' ...
    'title = {The influence of temporal and spatial origin on size and early growth rates in captive loggerhead sea turtles (\textit{Caretta caretta}) in the {U}nited {S}tates.}, ' ...
    'journal = {Herpetological Conservation and Biology}, ' ...
    'volume = {1}, ' ...
    'pages = {71--80}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Stok2014'; type = 'Misc'; bib = [...
    'author = {Stokes, L},'...
    'year = {2014},'...
    'howpublished = {personal communication}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Ston1980'; type = 'Article'; bib = [ ...
    'author = {D. L. Stoneburner}, ' ...
    'year = {1980}, ' ...
    'title = {Body Depth: An Indicator of Morphological Variation among Nesting Groups of Adult Loggerhead Sea Turtles (\textit{Caretta caretta})}, ' ...
    'journal = {Journal of Herpetology}, ' ...
    'volume = {14}, ' ...
    ' pages = {205--206},'...
    ' number = {2},'...
    ' publisher = {Society for the Study of Amphibians and Reptiles}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'TiwaBjor2000'; type = 'Article'; bib = [ ...
    'author = {Tiwari, M.  and Bjorndal, K. A. },'...
    'title = {Variation in morphology and reproduction in loggerheads, \textit{Caretta caretta}, nesting in the {U}nited {S}tates, {B}razil, and {G}reece},'...
    'journal = {Herpetologica},'...
    'year = {2000},'...
    'pages = {343--356},'...
    'volume = {56},'...
    'number ={3}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Tuck2010'; type = 'Article'; bib = [ ...
    'author = {A. D. Tucker}, ' ...
    'year = {2010}, ' ...
    'title = {Nest site fidelity and clutch frequency of loggerhead turtles are better elucidated by satellite telemetry than by nocturnal tagging efforts: Implications for stock estimation.}, ' ...
    'journal = {Journal of Experimental Marine Biology and Ecology}, ' ...
    'volume = {383}, ' ...
    'pages = {48--55}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'WabnPaul2008'; type = 'Incollection'; bib = [ ...
    'author = {Wabnitz, C. and Pauly, D.}, ' ...
    'year = {2008}, ' ...
    'title = {Length-weight relationships  and additional growth parameters for sea turtles.}, ' ...
    'booktitle = {Von Bertalanffy growth parameters of non-fish marine organisms}, ' ...
    'editor = { M. L. D. Palomares and D. Pauly}, ' ...
    'publisher = {Fisheries centre research report}, ' ...
    'volume = {16}, ' ...
    'series = {10}, ' ...
    'pages = {138}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ZugWynn1986'; type = 'Article'; bib = [ ...
    'author = {G. R. Zug and A. H. Wynn and C. Ruckdeschel}, ' ...
    'year = {1986}, ' ...
    'title = {Age Determination of Loggerhead Sea Turtles, \textit{Caretta caretta}, by Incremental Growth Marks in the Skeleton.}, ' ...
    'journal = {Smithsonian contribution to zoology}, ' ...
    'publisher = {Smithsonian Institution Press}, ' ...
    'volume = {427}, '...
    'address = {Washington D.C.}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

