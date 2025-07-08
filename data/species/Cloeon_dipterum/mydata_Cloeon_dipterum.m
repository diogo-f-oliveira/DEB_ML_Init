function [data, auxData, metaData, txtData, weights] = mydata_Cloeon_dipterum
global tT_g tT_c tT_w

%% set metaData
metaData.phylum     = 'Arthropoda';
metaData.class      = 'Insecta';
metaData.order      = 'Ephemeroptera';
metaData.family     = 'Baetidae';
metaData.species    = 'Cloeon_dipterum';
metaData.species_en = 'Mayfly';

metaData.ecoCode.climate = {'Cfb', 'Dfb', 'Dfc'};
metaData.ecoCode.ecozone = {'TH'};
metaData.ecoCode.habitat = {'0eFl', '0eFp', '0eFm', 'eiTg'};
metaData.ecoCode.embryo  = {'Fv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'beH', 'beD', 'beS'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'Os'};

metaData.T_typical  = C2K(20); % K, body temp
metaData.data_0     = {'ab'; 'aj_T';'am'; 'L0'; 'Lb'; 'Lj'; 'Wd0'; 'Wdb'; 'Wwj'};
metaData.data_1     = {'t-L'; 't-Ww'; 'Ww-JO'; 'T-tj'; 'L-Wd'; 'L-N'; 'T-Wd'; 't-S'};

metaData.COMPLETE = 4; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};
metaData.date_subm = [2016 05 12];
metaData.email    = {'bas.kooijman@vu.nl'};
metaData.address  = {'VU University Amsterdam'};

metaData.author_mod_1   = {'Bas Kooijman', 'Starrlight Augustine'};
metaData.date_mod_1 = [2017 04 05];
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};
metaData.address_mod_1  = {'VU University Amsterdam'};

metaData.author_mod_2   = {'Kim Rakel', 'Dino Liesy', 'Andre Gergs'};
metaData.date_mod_2 = [2020 10 02];
metaData.email_mod_2    = {'rakel@gaiac-eco.de'};
metaData.address_mod_2  = {'gaiac - Research Institute for Ecosystem Analysis and Assessment, Aachen, Germany, Bayer AG'};

metaData.curator     = {'Bas Kooijman'};
metaData.email_cur   = {'bas.kooijman@vu.nl'}; 
metaData.date_acc    = [2020 10 02]; 

%% set data
% zero-variate data
data.ab = 10;      units.ab = 'd';      label.ab = 'age at birth';                bibkey.ab = 'Wiki';
    temp.ab = C2K(20);   units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tj_26 = 23;   units.tj_26 = 'd';      label.tj_26 = 'time since birth at emergence at 26 C'; bibkey.tj_26 = 'gaia2019';
    temp.tj_26 = C2K(26);   units.temp.tj_26 = 'K'; label.temp.tj_26 = 'temperature';
data.tj_22 = 30;   units.tj_22 = 'd';      label.tj_22 = 'time since birth at emergence at 22 C'; bibkey.tj_22 = 'gaia2019';
    temp.tj_22 = C2K(22);   units.temp.tj_22 = 'K'; label.temp.tj_22 = 'temperature';
data.tj_18 = 47;   units.tj_18 = 'd';      label.tj_18 = 'time since birth at emergence at 18 C'; bibkey.tj_18 = 'gaia2019';
    temp.tj_18 = C2K(18);   units.temp.tj_18 = 'K'; label.temp.tj_18 = 'temperature';
data.tj_13 = 142;   units.tj_13 = 'd';      label.tj_13 = 'time since birth at emergence at 13 C'; bibkey.tj_13 = 'gaia2019';
    temp.tj_13 = C2K(13);   units.temp.tj_13 = 'K'; label.temp.tj_13 = 'temperature';
data.am = 21;      units.am = 'd';      label.am = 'life span as (sub)imago';     bibkey.am = 'Wiki';
    temp.am = C2K(20);   units.temp.am = 'K'; label.temp.am = 'temperature';
    comment.am = 'total life span considering an age at emergence of 30 days and life span as imago of 3 weeks.';

data.L0  = 0.0167;   units.L0  = 'cm';   label.L0  = 'egg length';     bibkey.L0  = 'Degr1960';
    comment.L0 = 'original unit um; egg diameter between 143-191 um';
data.Lb = 0.0554; units.Lb  = 'cm';   label.Lb  = 'length at hatching';     bibkey.Lb  = 'Degr1960';
    comment.Lb = 'original unit um';
data.Lj  = 0.93;  units.Lj  = 'cm';     label.Lj  = 'body length female imago';    bibkey.Lj  = 'Cian1979';
data.Lj_m = 0.84; units.Lj_m  = 'cm';   label.Lj_m  = 'body length male imago';    bibkey.Lj_m  = 'Cian1979';
data.Lj_w = 1.03; units.Lj_w = 'cm';    label.Lj_w = 'wing length female imago';   bibkey.Lj_w = 'Swee2018';

data.Wd0 = 1.5/2500;  units.Wd0 = 'mg'; label.Wd0 = 'initial dry weight';          bibkey.Wd0 = {'guess'};
    comment.Wd0 = 'Guess based on Ecdyonurus_dispar';
data.Wdb = 0.0009; units.Wdb = 'mg';    label.Wdb = 'dry weight at birth'; bibkey.Wdb = 'Swee2018';
data.Wwj  = 13.6; units.Wwj  = 'mg';    label.Wwj  = 'wet weight female subimago'; bibkey.Wwj  = 'Cian1979';
data.Wwj_m = 8.2; units.Wwj_m  = 'mg';  label.Wwj_m  = 'wet weight male subimago'; bibkey.Wwj_m  = 'Cian1979';

% length per instar
data.L1 = 0.1962; units.L1 = 'cm'; label.L1 = 'body length of instar 1'; bibkey.L1 = 'gaia2019';
data.L2 = 0.2630; units.L2 = 'cm'; label.L2 = 'body length of instar 2'; bibkey.L2 = 'gaia2019';
data.L3 = 0.3654; units.L3 = 'cm'; label.L3 = 'body length of instar 3'; bibkey.L3 = 'gaia2019';
data.L4 = 0.4988; units.L4 = 'cm'; label.L4 = 'body length of instar 4'; bibkey.L4 = 'gaia2019';
data.L5 = 0.6015; units.L5 = 'cm'; label.L5 = 'body length of instar 5'; bibkey.L5 = 'gaia2019';
data.L6 = 0.6845; units.L6 = 'cm'; label.L6 = 'body length of instar 6'; bibkey.L6 = 'gaia2019';
data.L7 = 0.6703; units.L7 = 'cm'; label.L7 = 'body length of instar 7'; bibkey.L7 = 'gaia2019';
data.L8 = 0.6745; units.L8 = 'cm'; label.L8 = 'body length of Nymph instar 1'; bibkey.L8 = 'gaia2019';
data.L9 = 0.6695; units.L9 = 'cm'; label.L9 = 'body length of Nymph instar 2'; bibkey.L9 = 'gaia2019';

% dry weight per instar
data.Wd1 = 0.02078;  units.Wd1 = 'mg'; label.Wd1 = 'dry weight of instar 1'; bibkey.Wd1 = 'gaia2019';
data.Wd2 = 0.06111;  units.Wd2 = 'mg'; label.Wd2 = 'dry weight of instar 2'; bibkey.Wd2 = 'gaia2019';
data.Wd3 = 0.11754;  units.Wd3 = 'mg'; label.Wd3 = 'dry weight of instar 3'; bibkey.Wd3 = 'gaia2019';
data.Wd4 = 0.32165;  units.Wd4 = 'mg'; label.Wd4 = 'dry weight of instar 4'; bibkey.Wd4 = 'gaia2019';
data.Wd5 = 0.85538;  units.Wd5 = 'mg'; label.Wd5 = 'dry weight of instar 5'; bibkey.Wd5 = 'gaia2019';
data.Wd6 = 1.09150;  units.Wd6 = 'mg'; label.Wd6 = 'dry weight of instar 6'; bibkey.Wd6 = 'gaia2019';
data.Wd7 = 1.10490;  units.Wd7 = 'mg'; label.Wd7 = 'dry weight of instar 7'; bibkey.Wd7 = 'gaia2019';
data.Wd8 = 1.02448;  units.Wd8 = 'mg'; label.Wd8 = 'dry weight of Nymph instar 1'; bibkey.Wd8 = 'gaia2019';
data.Wd9 = 0.91994;  units.Wd9 = 'mg'; label.Wd9 = 'dry weight of Nymph instar 2'; bibkey.Wd9 = 'gaia2019';

% head length per instar
data.Lh1 = 0.0330; units.Lh1 = 'cm'; label.Lh1 = 'head length of instar 1'; bibkey.Lh1 = 'gaia2019';
data.Lh2 = 0.0422; units.Lh2 = 'cm'; label.Lh2 = 'head length of instar 2'; bibkey.Lh2 = 'gaia2019';
data.Lh3 = 0.0584; units.Lh3 = 'cm'; label.Lh3 = 'head length of instar 3'; bibkey.Lh3 = 'gaia2019';
data.Lh4 = 0.0732; units.Lh4 = 'cm'; label.Lh4 = 'head length of instar 4'; bibkey.Lh4 = 'gaia2019';
data.Lh5 = 0.0992; units.Lh5 = 'cm'; label.Lh5 = 'head length of instar 5'; bibkey.Lh5 = 'gaia2019';
data.Lh6 = 0.1092; units.Lh6 = 'cm'; label.Lh6 = 'head length of instar 6'; bibkey.Lh6 = 'gaia2019';
data.Lh7 = 0.1153; units.Lh7 = 'cm'; label.Lh7 = 'head length of instar 7'; bibkey.Lh7 = 'gaia2019';
data.Lh8 = 0.1092; units.Lh8 = 'cm'; label.Lh8 = 'head length of Nymph instar 1'; bibkey.Lh8 = 'gaia2019';
data.Lh9 = 0.1153; units.Lh9 = 'cm'; label.Lh9 = 'head length of Nymph instar 2'; bibkey.Lh9 = 'gaia2019';

% uni-variate data --------------------------------------------------------

% time - length 
tL = [... % instar, duration (d), body length (mm),
    1  2.0 0.63
    2  5.0 0.90
    3  4.3 1.38
    4  2.5 1.89
    5  1.9 2.39
    6  2.4 2.80
    7  3.8 3.16
    8  3.2 3.54
    9  2.8 3.92
    10  2.8 4.22
    11  2.9 4.20
    12  2.9 4.29
    13  3.7 4.15
    14  2.6 4.37];
data.tL = [cumsum(tL(:,2)), tL(:,3)/10];
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'length'};
temp.tL    = C2K(18);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL  = 'GuptMich1993';
comment.tL = 'most sub-adults emerged at instar 10; in the field they typically need more instars';
%
% development data on ditritus (Spirogyra was less nutritious)
% stage, duration (d),
%  body length female (mm), male (mm),
%  wet weight female (mg), male (mg),
%  O2 consumption female (mul O2/h), male (mul O2/h)
% Perhaps 12.99 days for nymph 1 includes nymph 2
StLWJ = [ ...
    1	 9.93 2.542 2.542  0.147  0.147  0.161  0.161   % larva 1
    2	13.90 3.058 3.058  0.315  0.315  0.228  0.228   % larva 2
    3	18.72 3.662 3.662  0.608  0.608  0.390  0.390   % larva 3
    4	22.18 4.242 4.242  1.091  1.091  0.505  0.505   % larva 4
    5	23.68 5.262 5.262  2.350  2.350  0.795  0.795   % larva 5
    6	23.15 6.409 6.409  4.112  4.112  1.308  1.308   % larva 6
    7	19.47 7.329 7.329  6.420  6.420  2.379  2.379   % larva 7
    8	12.99 8.729 7.707 12.608  8.329  5.824  4.948   % nymph 1
    9    0    9.131 8.071 16.091  9.524 10.497  6.895   % nymph 2
    10   0    9.206 8.196 13.552  8.182  4.205  4.572   % subimago
    11  14    9.305 8.447 10.238  4.783  3.125  3.253]; % imago
data.tL_f = [cumsum(StLWJ(1:8,2)), StLWJ(1:8,3)/10];
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time', 'length', 'female'};
temp.tL_f    = C2K(20);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'Cian1979';
comment.tL_f = 'Data for females; 14 d for imago comes from Wiki';
%
data.tL_m = [cumsum(StLWJ(1:8,2)), StLWJ(1:8,4)/10];
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time', 'length', 'male'};
temp.tL_m    = C2K(20);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'Cian1979';
comment.tL_m = 'Data for males';

% time - weight
data.tW_f = [cumsum(StLWJ(1:8,2)), StLWJ(1:8,5).^(1/3)];
units.tW_f   = {'d', 'mg^{1/3}'};  label.tW_f = {'time', 'wet weight^{1/3}', 'female'};
temp.tW_f    = C2K(20);  units.temp.tW_f = 'K'; label.temp.tW_f = 'temperature';
bibkey.tW_f = 'Cian1979';
comment.tW_f = 'Data for females';
%
data.tW_m = [cumsum(StLWJ(1:8,2)), StLWJ(1:8,6).^(1/3)];
units.tW_m   = {'d', 'mg^{1/3}'};  label.tW_m = {'time', 'wet weight^{1/3}', 'male'};
temp.tW_m    = C2K(20);  units.temp.tW_m = 'K'; label.temp.tW_m = 'temperature';
bibkey.tW_m = 'Cian1979';
comment.tW_m = 'Data for males';

% weight - respiration
data.WJO_f = StLWJ(1:9,[5 7]);
units.WJO_f   = {'mg', 'mul O_2/h'};  label.WJO_f = {'wet weight', 'O_2 consumption', 'female'};
temp.WJO_f    = C2K(20);  units.temp.WJO_f = 'K'; label.temp.WJO_f = 'temperature';
bibkey.WJO_f = 'Cian1979';
comment.WJO_f = 'Data for females';
%
data.WJO_m = StLWJ(1:9,[6 8]);
units.WJO_m   = {'mg', 'mul O_2/h'};  label.WJO_m = {'wet weight', 'O_2 consumption', 'male'};
temp.WJO_m    = C2K(20);  units.temp.WJO_m = 'K'; label.temp.WJO_m = 'temperature';
bibkey.WJO_m = 'Cian1979';
comment.WJO_m = 'Data for males';

% NEW UNIVARIATE DATA
data.tL_f1 = [... Time (d), length female(cm),
    0	0.208
    3	0.306
    8	0.545
    11	0.676
    14	0.739
    18	0.799
    21	0.813];
units.tL_f1   = {'d', 'cm'};  label.tL_f1 = {'time since start of experiment', 'length', 'female, high food'};
temp.tL_f1    = C2K(20);  units.temp.tL_f1 = 'K'; label.temp.tL_f1 = 'temperature';
bibkey.tL_f1 = 'gaia2016';
comment.tL_f1 = 'Data for females; high food level';

data.tL_m1 = [... Time (d), length male (cm),
    0	0.216
    3	0.310
    8	0.546
    11	0.648
    14	0.698
    18	0.698];
units.tL_m1   = {'d', 'cm'};  label.tL_m1 = {'time since start of experiment', 'length', 'male, high food'};
temp.tL_m1    = C2K(20);  units.temp.tL_m1 = 'K'; label.temp.tL_m1 = 'temperature';
bibkey.tL_m1 = 'gaia2016';
comment.tL_m1 = 'Data for males; high food level';

data.tL_c = [... Time (d) length (cm)
    0	0.268
    21	0.467
    42	0.561
    63	0.601
    84	0.634
    116	0.606
    137	0.616
    151	0.629
    172	0.649
    194	0.666
    215	0.763
    236	0.897];
units.tL_c   = {'d','cm'};  label.tL_c = {'time', 'length', 'cool conditions'};

% temp for tL_c is vaying, as specified below
tT_c = [ ... time (d), temperature (C)
    0	15.1
    1	15.2
    2	16.4
    3	17.1
    4	14.8
    5	14.7
    6	14.6
    7	15.4
    8	15.3
    9	14.6
    10	14.5
    11	14.4
    12	13.1
    13	13.8
    14	14.3
    15	13.4
    16	13.1
    17	12.8
    18	12.6
    19	12.4
    20	11.8
    21	11.1
    22	11.5
    23	12.7
    24	12.9
    25	14.3
    26	14.4
    27	13.6
    28	13.3
    29	13
    30	11.9
    31	10.6
    32	9.3
    33	8.4
    34	7.8
    35	7.9
    36	8.2
    37	8.8
    38	9
    39	9.3
    40	10
    41	10.6
    42	10.6
    43	10.9
    44	11.1
    45	10.7
    46	10.1
    47	10
    48	10.3
    49	9.5
    50	8.8
    51	8.2
    52	7.6
    53	7.6
    54	9.3
    55	10.8
    56	12.5
    57	14.1
    58	13.3
    59	13
    60	11.9
    61	11.1
    62	11.2
    63	11
    64	9.6
    65	10.3
    66	10.7
    67	11.1
    68	10.9
    69	10.7
    70	9.8
    71	8.3
    72	7.1
    73	5.9
    74	5
    75	5.4
    76	5
    77	4.3
    78	4.5
    79	5.4
    80	6.7
    81	7.7
    82	7.9
    83	7.2
    84	7.1
    85	6.3
    86	6.3
    87	7.3
    88	7.1
    89	7.1
    90	5.7
    91	5.6
    92	6.2
    93	6.7
    94	6.4
    95	6.4
    96	7.3
    97	8.6
    98	9.2
    99	9
    100	9.2
    101	8.9
    102	9.5
    103	9.2
    104	8.6
    105	8.6
    106	8.9
    107	8.4
    108	7.4
    109	6.9
    110	6.1
    111	6.1
    112	5.8
    113	6
    114	6.3
    115	6.2
    116	6
    117	6.1
    118	5.6
    119	4.7
    120	4.7
    121	4.8
    122	4.6
    123	4.8
    124	4.7
    125	4.2
    126	3.8
    127	3.8
    128	3.5
    129	2.8
    130	1.7
    131	2.1
    132	3.1
    133	3.6
    134	5.3
    135	6.5
    136	8.4
    137	7.9
    138	7.8
    139	7.1
    140	5.9
    141	6.3
    142	5.6
    143	7.4
    144	8
    145	6.1
    146	5.4
    147	5.7
    148	6.5
    149	6.5
    150	6.3
    151	5.8
    152	4.9
    153	4.9
    154	4.7
    155	4.3
    156	4.4
    157	4.1
    158	3.6
    159	2.9
    160	3.2
    161	3.4
    162	3.9
    163	5.7
    164	6.8
    165	6.2
    166	5.6
    167	4.8
    168	4.7
    169	4.7
    170	4.3
    171	4.1
    172	3.6
    173	4.4
    174	4.4
    175	4.2
    176	4.3
    177	4.2
    178	4.4
    179	4.3
    180	4.7
    181	4.8
    182	4.9
    183	5.2
    184	5.3
    185	5.5
    186	5.3
    187	5.3
    188	5.5
    189	5
    190	5.3
    191	5.8
    192	6.5
    193	6.9
    194	7.4
    195	7.5
    196	7.5
    197	8.1
    198	9.2
    199	9.2
    200	9.1
    201	9.5
    202	9.2
    203	9.1
    204	9.9
    205	11.3
    206	12.4
    207	12.4
    208	11.9
    209	11.3
    210	10.9
    211	10.8
    212	11.5
    213	12.1
    214	12.7
    215	12
    216	11.9
    217	13
    218	12.5
    219	12
    220	11.5
    221	11.7
    222	11.7
    223	12.1
    224	12.9
    225	12.3
    226	11
    227	10.1
    228	9
    229	8.2
    230	8.5
    231	8.7
    232	9.1
    233	9.9
    234	11
    235	12.4
    236	12.5];
tT_c = [tT_c(:,1), C2K(tT_c(:,2))];
bibkey.tL_c = 'gaia2016'; % semi field winter
comment.tL_c = 'semifield study was conducted at gaiac; ambient temperature';

%
data.tL_w = [... Time (d) length (cm)
    0	0.268
    21	0.479
    42	0.572
    63	0.622
    84	0.679
    116	0.691
    137	0.653
    151	0.720
    172	0.736
    194	0.789
    215	0.940
    ];
units.tL_w   = {'d','cm'};  label.tL_w = {'time', 'length', 'warm conditions'};

% temp for tL_w is vaying, as specified below
tT_w = [ ... time (d), temperature (C)
    0	14.5
    1	14.6
    2	15.8
    3	16.8
    4	14.6
    5	14.4
    6	14.4
    7	14.7
    8	15.1
    9	14.5
    10	15.2
    11	16.7
    12	15.5
    13	15.4
    14	16.8
    15	16.5
    16	15.5
    17	15.1
    18	15.3
    19	15.2
    20	14.6
    21	13.7
    22	14.3
    23	16
    24	16.6
    25	18
    26	18
    27	17.1
    28	16.8
    29	16.6
    30	14.9
    31	13.4
    32	12
    33	11
    34	10.5
    35	10.7
    36	11.1
    37	12.2
    38	12.2
    39	12.1
    40	12.8
    41	13.2
    42	12.7
    43	13.1
    44	13.7
    45	13.5
    46	12.8
    47	12.6
    48	12.8
    49	12.2
    50	11.4
    51	10.8
    52	10.2
    53	9.8
    54	11.4
    55	13.3
    56	14.6
    57	15.8
    58	15.4
    59	15.1
    60	14.2
    61	13.8
    62	13.8
    63	13.6
    64	11.7
    65	12.2
    66	12.7
    67	13
    68	12.7
    69	12.5
    70	11.8
    71	10.2
    72	9.1
    73	8.1
    74	7.2
    75	7.2
    76	7.3
    77	6.6
    78	6.7
    79	7.6
    80	9.1
    81	9.8
    82	9.9
    83	9.7
    84	9.4
    85	8.5
    86	8.4
    87	10
    88	10.1
    89	9.8
    90	8.2
    91	7.7
    92	8.5
    93	9.1
    94	9.2
    95	8.7
    96	10
    97	11.5
    98	11.9
    99	11
    100	11.6
    101	11.3
    102	11.5
    103	11.6
    104	10.9
    105	10.9
    106	11.1
    107	10.6
    108	9.8
    109	9.3
    110	8.6
    111	8.4
    112	8.3
    113	8.6
    114	9.1
    115	8.8
    116	8.6
    117	8.9
    118	8.4
    119	7.2
    120	7.1
    121	7.4
    122	7.1
    123	7.2
    124	6.8
    125	6
    126	5.4
    127	5.5
    128	5.1
    129	4.4
    130	4
    131	3.9
    132	4.8
    133	4.5
    134	6.1
    135	7.4
    136	9.5
    137	10.1
    138	9.9
    139	9.6
    140	7.7
    141	8.3
    142	7.3
    143	9.6
    144	10.3
    145	8.4
    146	7.2
    147	7.8
    148	9.1
    149	9.3
    150	8.4
    151	7.8
    152	6.9
    153	7
    154	6.9
    155	6
    156	6.5
    157	5.3
    158	4.7
    159	4.4
    160	4.8
    161	5.2
    162	6.1
    163	9.5
    164	10.3
    165	8.6
    166	7.6
    167	6.4
    168	6.7
    169	6.9
    170	5.6
    171	5.3
    172	5
    173	7
    174	6.7
    175	6.1
    176	6.9
    177	6.8
    178	7.1
    179	6.7
    180	7.3
    181	7.7
    182	7.5
    183	7.7
    184	8.2
    185	8.5
    186	8
    187	8
    188	8
    189	7.3
    190	7.8
    191	8.8
    192	10
    193	10.4
    194	10.9
    195	10.9
    196	10.4
    197	10.4
    198	12.1
    199	12.1
    200	11.6
    201	12.4
    202	12.3
    203	11.8
    204	13.7
    205	16
    206	17
    207	16.4
    208	14.6
    209	13.3
    210	12.9
    211	13
    212	14.5
    213	15.5
    214	16.4
    215	14.6];
tT_w(:,2) = C2K(tT_w(:,2));
bibkey.tL_w = 'gaia2016'; % semi field winter
comment.tL_w = 'semifield study was conducted at gaiac; temperature about 2K above ambient temperature';

data.tL_g = [... Time (d) length (cm)
    0	0.357
    14	0.562
    21	0.648
    28	0.678
    35	0.763];
units.tL_g   = {'d','cm'};  label.tL_g = {'time', 'length'};

% temp for tL is vaying, as specified below
tT_g = [ ... time (d), temperature (C)
    0	22.6
    1	20.5
    2	20.2
    3	19.5
    4	18.7
    5	19.2
    6	19.8
    7	19.1
    8	19.9
    9	21.3
    10	22.1
    11	24.1
    12	23.9
    13	21.5
    14	19.6
    15	18.8
    16	18.3
    17	19.3
    18	21.0
    19	22.5
    20	23.5
    21	24.5
    22	25.4
    23	24.7
    24	23.7
    25	23.5
    26	23.8
    27	22.7
    28	22.3
    29	22.0
    30	21.5
    31	21.6
    32	20.7
    33	20.2
    34	19.7
    35	19.2];
tT_g = [tT_g(:,1), C2K(tT_g(:,2))];
bibkey.tL_g = 'gaia2016'; % semi field summer
comment.tL_g = 'semifield study was conducted at gaiac; ambient temperature';

% temperature - age at emergence
data.Ttj_g = [... % Temperature (C), time since birth at emergence (d)
    13	126.8
    18  36.9
    22  25.1
    26  19.5];
units.Ttj_g   = {'C', 'd'};  label.Ttj_g = {'Temperature', 'time since birth at emergence'};
bibkey.Ttj_g  = 'gaia2019';

% time - head length for different temperatures
data.tL_h1 = [... % time since start of experiment (d), head length (cm),
    0	0.033015517
    2	0.035311138
    6	0.0692815
    8	0.0888024
    10	0.095692641
    13	0.110781419
    15	0.113855955
    17	0.114118833
    20	0.118914932];
units.tL_h1   = {'d', 'cm'};  label.tL_h1 = {'time since start of experiment', 'head length', '26 C'};
temp.tL_h1    = C2K(26);  units.temp.tL_h1 = 'K'; label.temp.tL_h1 = 'temperature';
bibkey.tL_h1  = 'gaia2019';
%
data.tL_h2 = [... % time since start of experiment (d), head length (cm),
    0	0.033015517
    2	0.03439289
    6	0.0500994
    8	0.0728012
    10	0.078187824
    13	0.091099147
    15	0.100442755
    17	0.106867153
    20	0.113014528
    22	0.114598957
    24	0.118237492
    27	0.119507692];
units.tL_h2   = {'d', 'cm'};  label.tL_h2 = {'time since start of experiment', 'head length', '22 C'};
temp.tL_h2    = C2K(22);  units.temp.tL_h2 = 'K'; label.temp.tL_h2 = 'temperature';
bibkey.tL_h2  = 'gaia2019';
%
data.tL_h3 = [... % time since start of experiment(d), head length (cm),
    0	0.033015517
    2	0.03439289
    6	0.040361503
    8	0.0494988
    10	0.0619866
    13	0.0686107
    15	0.081095947
    17	0.082392647
    20	0.095805149
    22	0.099821148
    24	0.107573487
    27	0.10946029
    29	0.112651156
    31	0.115685732
    34	0.116907964
    36	0.115019548
    38	0.112620211
    41	0.117729412
    43	0.119507692
    45	0.119507692];
units.tL_h3   = {'d', 'cm'};  label.tL_h3 = {'time since start of experiment', 'head length', '18'};
temp.tL_h3    = C2K(18);  units.temp.tL_h3 = 'K'; label.temp.tL_h3 = 'temperature';
bibkey.tL_h3  = 'gaia2019';
%
data.tL_h4 = [... % time since start of experiment (d), head length (cm),
    0	0.033015517
    8	0.03668851
    15	0.038984131
    22	0.044172476
    29	0.0511212
    36	0.054582667
    43	0.060218111
    50	0.065030222
    57	0.076584778
    64	0.085677438
    71	0.08985749
    78	0.093583741
    85	0.098805113
    94	0.102085002
    111	0.106635046
    119	0.114365603
    128	0.114377363
    134	0.11587341];
units.tL_h4   = {'d', 'cm'};  label.tL_h4 = {'time since start of experiment', 'head length', '13 C'};
temp.tL_h4    = C2K(13);  units.temp.tL_h4 = 'K'; label.temp.tL_h4 = 'temperature';
bibkey.tL_h4  = 'gaia2019';
%
data.tL_h5 = [... % time since start of experiment (d), head length (cm),
    0	0.033015517
    8	0.033498806
    15	0.034239848
    22	0.034852014
    29	0.036294975
    36	0.036294975
    43	0.037606759
    50	0.037959931
    57	0.037959931
    64	0.038666276
    71	0.038666276
    78	0.038666276
    85	0.038666276
    94	0.038666276
    111	0.038371966
    119	0.038525007
    128	0.038525007
    134	0.041065655
    141	0.041065655
    142	0.041065655];
units.tL_h5   = {'d', 'cm'};  label.tL_h5 = {'time since start of experiment', 'head length', '8 C'};
temp.tL_h5    = C2K(8);  units.temp.tL_h5 = 'K'; label.temp.tL_h5 = 'temperature';
bibkey.tL_h5  = 'gaia2019';

% length-weight
data.Lw_Wd = [... % female  length (mm), dry weight (mg),
    5.67	0.96
    5.67	1.12
    5.67	1.35
    5.75	1.22
    5.84	1.20
    5.84	1.29
    5.92	0.91
    6.00	1.34
    6.17	1.49
    6.42	1.15
    6.50	1.58
    6.51	1.11
    6.58	1.21
    6.58	1.74
    6.59	1.45
    6.67	1.29
    6.67	1.26
    6.67	1.39
    6.67	1.80
    6.75	1.44
    6.75	2.02
    6.77	1.94
    6.83	1.37
    6.83	1.44
    6.83	1.87
    6.83	1.99
    6.84	2.14
    6.91	1.23
    6.91	1.28
    7.00	1.47
    7.00	1.55
    7.00	1.91
    7.08	1.61
    7.17	2.20
    7.25	1.82
    7.25	1.98
    7.42	2.10
    7.50	2.29
    7.51	2.23
    7.58	2.25
    7.59	2.17
    7.67	2.29
    7.67	2.38
    7.67	2.45
    7.75	2.58
    7.83	2.25
    7.83	2.56
    7.91	2.44
    7.91	2.61
    7.99	2.56
    8.00	3.02
    8.01	2.44
    8.01	2.51
    8.01	2.67
    8.08	2.69
    8.09	2.62
    8.09	2.80
    8.17	2.31
    8.17	2.75
    8.17	2.81
    8.17	2.71
    8.25	2.89
    8.26	2.62
    8.26	2.99
    8.30	2.69
    8.33	2.23
    8.33	2.62
    8.34	2.78
    8.41	2.69
    8.42	2.79
    8.42	2.83
    8.50	2.67
    8.51	3.56
    8.67	2.71
    8.67	2.81
    8.83	3.09
    8.91	3.28
    8.92	3.11
    8.93	3.41
    9.00	3.08
    9.00	3.17
    9.07	2.94
    9.17	3.40
    9.17	3.33
    9.18	3.25
    9.34	3.29
    9.34	3.35
    9.34	3.50
    9.43	3.56
    9.43	3.69
    9.50	3.44
    9.50	3.51
    9.51	3.67
    9.59	3.61
    9.83	4.05
    9.84	3.88
    10.01	4.48];
data.Lw_Wd(:,1) = data.Lw_Wd(:,1)/ 10; % convert to cm
units.Lw_Wd   = {'cm', 'mg'};  label.Lw_Wd = {' length female imago', 'dry weight'};
temp.Lw_Wd   = C2K(22);  units.temp.Lw_Wd = 'K'; label.temp.Lw_Wd = 'temperature';
bibkey.Lw_Wd = 'Swee2018'; comment.Lw_Wd = 'weight of females measured after egg deposition';

% length - fecundity
data.Lw_N = [... % female wing length (mm), number of hatchlings (#),
    5.42	0
    5.50	0
    5.58	0
    5.66	0
    5.74	0
    5.83	0
    6.00	436
    6.07	500
    6.08	0
    6.13	503
    6.16	0
    6.16	323
    6.16	168
    6.17	269
    6.17	363
    6.25	396
    6.25	235
    6.33	339
    6.42	0
    6.50	525
    6.50	74
    6.50	622
    6.50	232
    6.57	686
    6.57	488
    6.58	424
    6.66	442
    6.67	796
    6.67	184
    6.67	135
    6.74	455
    7.00	616
    7.07	744
    7.08	558
    7.17	668
    7.17	823
    7.25	662
    7.25	482
    7.42	924
    7.49	1006
    7.50	805
    7.57	778
    7.57	1088
    7.58	1034
    7.67	1091
    7.67	958
    7.74	1110
    7.83	787
    7.91	1025
    7.91	1134
    7.91	818
    8.00	839
    8.08	754
    8.08	1226
    8.13	994
    8.17	1101
    8.23	1271
    8.32	927
    8.32	1427
    8.32	1284
    8.41	1479
    8.41	906
    8.41	961
    8.42	1329
    8.42	1308
    8.49	1177
    8.49	1080
    8.58	1363
    8.66	1336
    8.67	1509
    8.67	1058
    8.75	1256
    8.82	900
    8.82	1427
    8.82	1461
    8.84	1257
    8.91	909
    8.91	1503
    9.00	1835
    9.00	970
    9.07	1543
    9.32	1144
    9.66	1878
    9.74	2125
    9.75	1111
    9.83	1586
    9.99	1744
    10.07	2219
    10.17	2378
    10.17	1979
    10.25	1641
    10.33	2433];
data.Lw_N(:,1) = data.Lw_N(:,1)/ 10; % convert to cm
units.Lw_N   = {'cm', '#'};  label.Lw_N = {' length female imago', 'No. of hatchlings'};
temp.Lw_N   = C2K(22);  units.temp.Lw_N = 'K'; label.temp.Lw_N = 'temperature';
bibkey.Lw_N = 'Swee2018';

% time - age at emergence
data.Ttj = [... % Temperature (C), time since birth at emergence (d)
    12.1	110
    14.3	72
    16.2	47
    20.2	29
    21.2	25
    23.9	20
    27.8	16
    30.0	14
    31.7	17];
units.Ttj   = {'C', 'd'};  label.Ttj = {'Temperature', 'time since birth at emergence'};
bibkey.Ttj  = 'Swee2018';


% time - survival
% Wagenfuehr data grouped
data.tS = [... % time (d), survival (-),
    0	1
    1	0.96
    2	0.96
    3	0.96
    4	0.96
    5	0.96
    6	0.91
    7	0.73
    8	0.65
    9	0.58
    10	0.58
    11	0.58
    12	0.47
    13	0.31
    14	0.32
    15	0.26
    16	0.16
    17	0.16
    18	0.11
    19	0
    20	0
    21	0];
units.tS   = {'d', '-'};  label.tS = {'starvation time', 'survival', 'data grouped'};
temp.tS    = C2K(20);  units.temp.tS = 'K'; label.temp.tS = 'temperature';
bibkey.tS  = 'Wage2015';

% Wagenfuehr data single
data.tS_2 = [... % time (d), survival (-),
    0	1
    1	1
    2	1
    3	1
    4	1
    5	1
    6	0.95
    7	0.89
    8	0.76
    9	0.71
    10	0.71
    11	0.59
    12	0.59
    13	0.41
    14	0.29
    15	0.12
    16	0.12
    17	0.06
    18	0
    19	0
    20	0
    21	0];
units.tS_2   = {'d', '-'};  label.tS_2 = {'starvation time', 'survival', 'data single'};
temp.tS_2    = C2K(20);  units.temp.tS_2 = 'K'; label.temp.tS_2 = 'temperature';
bibkey.tS_2  = 'Wage2015';

% Wagenfuehr data Control
data.tS_3 = [... % time (d), survival (-),
    0	1
    1	1
    2	1
    3	1
    4	1
    5	1
    6	1
    7	1
    8	1
    9	1
    10	1
    11	1
    12	1
    13	1
    14	1
    15	1
    16	1
    17	1
    18	1
    19	0.89
    20	0.89
    21	0.89];
units.tS_3   = {'d', '-'};  label.tS_3 = {'starvation time', 'survival', 'data control'};
temp.tS_3    = C2K(20);  units.temp.tS_3 = 'K'; label.temp.tS_3 = 'temperature';
bibkey.tS_3  = 'Wage2015';


%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males - Cian1993'};
set2 = {'tW_f','tW_m'}; subtitle2 = {'Data for females, males - Cian1993'};
set3 = {'WJO_f','WJO_m'}; subtitle3 = {'Data for females, males - Cian1993'};
set4 = {'tL_f1','tL_m1'}; subtitle4 = {'Data for females, males - gaia2016'};
set5 = {'tL_c','tL_w'}; subtitle5 = {'Data for cold, warm temperatures (semi-field) - gaia2016'};
set6 = {'tL_h1','tL_h2','tL_h3','tL_h4','tL_h5'}; subtitle6 = {'Data for different temperatures - gaia2019'};
set7 = {'tS', 'tS_2', 'tS_3'}; subtitle7 = {'Data for single and grouped individuals - Wage2015'};
metaData.grp.sets = {set1,set2,set3,set4,set5,set6,set7};
metaData.grp.subtitle = {subtitle1,subtitle2,subtitle3,subtitle4,subtitle5,subtitle6,subtitle7};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
D2 = 'tL and tW data are from wild-catch of unknown time since birth';
D3 = 'Food (periphyton) in experiments of gaia2016 was of high quality and therefore f = 1 was assumed';
D4 = 'hep-model is not entirely able to represent the sigmoidal growth of Cloeon larvae: late instars larvae do not grow in lenght anymore probably due to decreased feeding';
D5 = 'At low food, larval development time is prolonged, and size at emergence seems rather conserved across food levels';
D6 = 'Dry weight over temperature (Swee2018 data) cannot be predicted by the model';
D7 = 'mod_2: Many new data sets added';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3, 'D4',D4, 'D5',D5, 'D6',D6, 'D7',D7);

%% Facts
F1 = 'The only ovoviviparous ephemeropteran species in Europe; Females lay eggs 10-14 days after mating, and the eggs hatch as soon as they hit the water';
metaData.bibkey.F1 = 'Wiki';
F2 = 'Dry weight in mg = 0.001 * (body length in mm)^3.6802';
metaData.bibkey.F2 = 'Cian1979';
F3 = 'Females are 10% longer then males after larval stage 7';
metaData.bibkey.F3 = 'Cian1979';
F4 = 'Weights-at-stages and moulting frequency are unaffected by food quality, but duration is (so is the total number of moults)';
metaData.bibkey.F4 = 'Cian1979';
F5 = 'Larval moults are 5% of dry body mass, 7.5% (female) or 11.5% (male) in N2, 13% (f) or 16% (m) in subimago';
metaData.bibkey.F5 = 'Cian1979';
F6 = 'Wet/dry weight ratio is about 3';
metaData.bibkey.F6 = 'Cian1979';
metaData.facts = struct('F1',F1, 'F2',F2, 'F3',F3, 'F4',F4, 'F5',F5, 'F6',F6);

%% Links
metaData.links.id_CoL = '5ZC6V'; % Cat of Life
metaData.links.id_ITIS = '100761'; % ITIS
metaData.links.id_EoL = '2762484'; % Ency of Life
metaData.links.id_Wiki = 'Cloeon_dipterum'; % Wikipedia
metaData.links.id_ADW = 'Cloeon_dipterum'; % ADW
metaData.links.id_Taxo = '17374'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Cloeon_dipterum}}';
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
bibkey = 'GuptMich1993'; type = 'Article'; bib = [ ...
'author = {S. Gupta and R. G. Michael and A. Gupta}, ' ...
'year = {1993}, ' ...
'title = {Laboratory studies on the life cycle and growth of \emph{Cloeon sp.} ({E}phemeroptera: {B}aetidae) in {M}eghalaya {S}tate, {I}ndia}, ' ...
'howpublished = {\url{http://www.ephemeroptera-galactica.com/pubs/pub_g/pubguptas1993p49.pdf}}, ' ...
'journal = {Aquatic Insects}, ' ...
'volume = {15}, ' ...
'pages = {49--55}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Cian1979'; type = 'Inproceedings'; bib = [ ...
'author = {S. Cianciara}, ' ...
'year = {1979}, ' ...
'title = {Some study on the biology and bioenergetics of \emph{Cloeon dipterum} ({L}.)}, ' ...
'proceeding = {Second International Conference on {E}phemeroptera, {K}rakow, {P}oland, August 23-26, 1975}, ' ...
'pages = {175-192}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'gaia2019'; type = 'Article'; bib = [ ...
'author = {Research institue gaiac, Aachen}, ' ...
'year = {2019}, ' ...
'title = {Studies with, \emph{Cloeon dipterum} (unpublished)}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'gaia2016'; type = 'Article'; bib = [ ...
'author = {Research institue gaiac, Aachen}, ' ...
'year = {2016}, ' ...
'title = {Studies with, \emph{Cloeon dipterum} (unpublished)}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Swee2018'; type = 'Article'; bib = [ ...
'author = {B.W. Sweeney and D.H. Funk and A.A. Camp and D.B. Buchwalter and J.K. Jackson}, ' ...
'year = {2018}, ' ...
'title = {Why adult mayflies of \emph{Cloeon dipterum} ({E}phemeroptera: {B}aetidae) become smaller as temperature warms}, ' ...
'journal = {Freshwater Science}, ' ...
'volume = {37}, ' ...
'number = {1}, '...
'pages = {64-81}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Wage2015'; type = 'mastersthesis'; bib = [ ...
'author = {Wagenf\"{u}hr, L.M.}, ' ...
'year = {2015}, ' ...
'title = {Individual-based population modelling for \emph{Cloeon dipterum} (Ephemeroptera)}, ' ...
'institution = {Institut fuer Umweltforschung, Biologie V, RWTH Aachen University}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Degr1960'; type = 'Article'; bib = [ ...
'author = {Degrange, C.},'...
'year = {1960},'...
'title = {Recherches sur la Reproduction des Ephemeropteres},'...
'journal = {Travaux du Labotoire d''Hydrobiologie et de Pisciculture},'...
'volume = {50/51}, '...
'pages = {7-193}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
