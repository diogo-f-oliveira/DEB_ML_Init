function [data, auxData, metaData, txtData, weights] = mydata_Acipenser_fulvescens

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Acipenseriformes'; 
metaData.family     = 'Acipenseridae';
metaData.species    = 'Acipenser_fulvescens'; 
metaData.species_en = 'Lake sturgeon'; 

metaData.ecoCode.climate = {'Dfa','Dfb'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFr'};
metaData.ecoCode.embryo  = {'Fg'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'biCi', 'biCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(13); % K, body temp - this is not sure as the species  migrates from sea to fresh water
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Ri'}; 
metaData.data_1     = {'t-L','L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman','Starrlight Augustine'};                             
metaData.date_subm = [2020 07 13];                          
metaData.email     = {'sta@akvaplan.niva.no'};                 
metaData.address   = {'Akvaplan-niva, FRAM, Tromso, Norway'};      

metaData.curator     = {'Bas Kooijman'};
metaData.email_cur   = {'bas.kooijman@vu.nl'}; 
metaData.date_acc    = [2020 07 13]; 

%% set data
% zero-variate data;
data.ab = 11; units.ab = 'd';      label.ab = 'age at birth';   bibkey.ab = 'Wiki';    
  temp.ab = C2K(13); units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = '8-14 d';
data.tp = 24.5*365; units.tp = 'd';  label.tp = 'time since birth at puberty';      bibkey.tp = 'Haug1969';   
  temp.tp = C2K(13);units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tpm = 19*365; units.tpm = 'd';  label.tpm = 'time since birth at puberty for males'; bibkey.tpm = 'Haug1969';   
  temp.tpm = C2K(13);units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
data.am = 150*365; units.am = 'd';  label.am = 'life span';      bibkey.am = 'Wiki';   
  temp.am = C2K(13);units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp  = 120;      units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'fishbase';
data.Li  = 274;      units.Li  = 'cm';  label.Li  = 'ultimate total length'; bibkey.Li  = 'fishbase';

data.Wwb = 1.08e-2;    units.Wwb = 'g';   label.Wwb = 'wet weight birth';   bibkey.Wwb = 'BrucMill2006';
  comment.Wwb = 'based on egg diameter of 2.74 mm: pi/6*0.274^3';
 
data.R170  = 607400/365/4; units.R170  = '#/d'; label.R170  = 'reprod rate at TL 170.5 cm';   bibkey.R170  = 'Haug1969';   
  temp.R170 = C2K(13);  units.temp.R170 = 'K'; label.temp.R170 = 'temperature';
  comment.R170 = 'Wiki: spawn each 4 to 9 yr';
data.R135  = 117450/365/4; units.R135  = '#/d'; label.R135  = 'reprod rate at TL 135 cm';   bibkey.R135  = 'Haug1969';   
  temp.R135 = C2K(13);  units.temp.R135 = 'K'; label.temp.R135 = 'temperature';
  comment.R135 = 'Wiki: spawn each 4 to 9 yr';
  
% uni-variate data
% time-length
data.tL = [ ... % time since birth, (yr), total length (cm)
    2   21.2
    3   47.5
    4   58.6
    5   64.0
    6   73.9
    7   80.3
    8   85.3
    9   90.7
    10  97.6
    11 103.7
    12 100.3
    13 102.5
    14 117.6
    15 113.7
    16 111.5
    17 112.2
    18 116.7
    19 126.5
    20 129.1
    21 130.6
    25 135.6
    26 135.0
    27 138.8
    28 130.5
    29 145.0
    30 146.7
    33 158.0
    34 135.0
    35 145.2
    37 148.9
    38 160.0
    41 147.6
    42 135.0
    48 154.8
    49 150.0
    50 165.0
    51 170.5];
data.tL(:,1) = 365 *data.tL(:,1); % convert yr to d
units.tL = {'d', 'cm'};     label.tL = {'time since birth', 'total length'};  
  temp.tL = C2K(13);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Haug1969';
comment.tL = 'Data from South Saskatchewan River';

data.LWw = [ ... % total length (cm), wet weight (g)
53.69	908.52
57.09	738.17
64.27	965.30
66.93	1362.78
73.36	1873.82
73.37	2328.08
76.78	2498.42
79.43	2895.90
83.23	3690.85
87.76	3747.63
90.43	4656.15
94.59	4656.15
97.24	5280.76
98.79	6643.53
102.54	5507.89
104.83	6473.19
106.74	7552.05
110.91	7949.53
116.60	9028.39
118.51	9823.34
123.08	11810.73
130.29	12832.81
131.83	14479.50
138.28	15728.71
138.72	18340.69
142.52	19305.99
147.82	19987.38
150.49	20895.90
150.51	21804.42
152.08	24643.53
157.04	27198.74
158.14	25211.36
160.89	30435.33
168.12	32479.50];
units.LWw = {'cm', 'g'};     label.LWw = {'total length', 'wet weight'};  
bibkey.LWw = 'Haug1969';
comment.LWw = 'Data from South Saskatchewan River, Alberta';

%% set weights for all real data
weights = setweights(data, []);
weights.Lp = 0 * weights.Lp;
weights.tL = 5 * weights.tL;
weights.ab = 0 * weights.ab;
weights.Wwb = 5 * weights.Wwb;
weights.Li = 5 * weights.Li;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.p_M = 5 * weights.psd.p_M;
 
%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;


%% Discussion points
D1 = 'Males are supposed to differ from females by E_Hp only; they are somewhat smaller than females, but data is lacking';
metaData.discussion = struct('D1', D1);

%% Links
metaData.links.id_CoL = '9C5B'; % Cat of Life
metaData.links.id_ITIS = '161071'; % ITIS
metaData.links.id_EoL = '46561177'; % Ency of Life
metaData.links.id_Wiki = 'Acipenser_fulvescens'; % Wikipedia
metaData.links.id_ADW = 'Acipenser_fulvescens'; % ADW
metaData.links.id_Taxo = '42429'; % Taxonomicon
metaData.links.id_WoRMS = '271694'; % WoRMS
metaData.links.id_fishbase = 'Acipenser-fulvescens'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Acipenser_fulvescens}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Haug1969'; type = 'phdthesis'; bib = [ ...  
'author = {Gordon Neal Haugen}, ' ...
'year = {1969}, ' ...
'title = {Life history, habitat and distribution of the lake sturgeon \emph{Acipenser fulvescens} in the {S}outh {S}askatchewan {R}iver, {A}lberta}, ' ... 
'school = {Montana state University}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'BrucMill2006'; type = 'Article'; bib = [ ...  
'author = {Ronald M. Bruch and Glenn Miller and Michael J. Hansen}, ' ...
'year = {2006}, ' ...
'title = {Fecundity of Lake Sturgeon (\emph{Acipenser fulvescens}, {R}afinesque) in {L}ake {W}innebago, {W}isconsin, {U}{S}{A}}, ' ... 
'journal = {J. Appl. Ichthyol.}, ' ...
'volume = {22 (Suppl 1)}, ' ...
'pages = {116-118}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Acipenser-fulvescens.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

