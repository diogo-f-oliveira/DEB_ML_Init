function [data, auxData, metaData, txtData, weights] = mydata_Gerres_filamentosus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Gerreiformes'; 
metaData.family     = 'Gerreidae';
metaData.species    = 'Gerres_filamentosus'; 
metaData.species_en = 'Whipfin silver-biddy'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MPW','MI'};
metaData.ecoCode.habitat = {'0jMp', 'jiMd'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Ma'};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27.3); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'GSI'}; 
metaData.data_1     = {'t-L'; 't-Ww'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2025 01 26];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 01 26];

%% set data
% zero-variate data

data.am = 14*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'EspiGall2014';   
  temp.am = C2K(27.3);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 19;  units.Lp  = 'cm';  label.Lp  = 'standard length at puberty'; bibkey.Lp  = 'EspiGall2015'; 
  comment.Lp = 'based on SL 13.9 cm and F2';
data.Li  = 39;  units.Li  = 'cm';  label.Li  = 'ultimate standard length'; bibkey.Li  = 'fishbase';

data.Wwb = 1.56e-5; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'EspiGall2015';
  comment.Wwb = 'based guessed egg diameter of 0.31 mm of Gerres cinereus: pi/6*0.031^3'; 
data.Wwp = 97.7; units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';   bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.01230*Lp^3.05, see F1';
data.Wwi = 876; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01230*Li^3.05, see F1';

data.GSI = 0.08;   units.GSI = '-';  label.GSI = 'gonado somatic index';    bibkey.GSI = 'guess';
  temp.GSI = C2K(27.3); units.temp.GSI = 'K'; label.temp.GSI = 'temperature';
  comment.GSI = 'based on Gerres_cinereus';
  
% uni-variate data
% time-length
data.tL_fm = [  ... % time since birth (yr), total length (cm)
    1 10.45  8.98
    2 18.66 16.94
    3 24.79 23.68
    4 28.90 27.93
    5 32.26 31.62
    6 34.34 33.65
    7 36.50 NaN
    8 38.18 NaN];
data.tL_fm(:,1) = 365 * (0.3 + data.tL_fm(:,1)); % convert yr to d
units.tL_fm = {'d', 'cm'};  label.tL_fm = {'time since birth', 'total length'};  
temp.tL_fm = C2K(27.3);  units.temp.tL_fm = 'K'; label.temp.tL_fm = 'temperature';
bibkey.tL_fm = 'ElNa2017'; treat.tL_fm = {1 {'females','males'}};

% time-weight
data.tW_fm = [  ... % time since birth (yr), weight (g)
    1  17.15  10.30
    2  87.98  62.43
    3 196.68 167.92
    4 308.16 271.34
    5 424.61 391.56
    6 509.07 391.56
    7 609.55 NaN
    8 695.71 NaN];
data.tW_fm(:,1) = 365 * (0.3 + data.tW_fm(:,1)); % convert yr to d
units.tW_fm = {'d', 'g'};  label.tW_fm = {'time since birth', 'weight'};  
temp.tW_fm = C2K(27.3);  units.temp.tW_fm = 'K'; label.temp.tW_fm = 'temperature';
bibkey.tW_fm = 'ElNa2017'; treat.tW_fm = {1 {'females','males'}};

% length-weight
data.LW_f = [  ... % total length (cm), weight (g)
11.306	23.551
12.761	26.916
13.657	33.645
14.328	37.009
15.336	42.056
16.455	50.467
17.239	57.196
18.022	67.290
19.366	87.477
20.149	104.299
21.269	114.393
21.828	129.533
22.612	146.355
23.619	163.178
25.187	186.729
25.970	220.374
27.090	247.290
28.321	274.206
29.104	294.393
29.888	322.991
31.231	344.860
32.015	391.963
33.022	437.383
34.030	497.944
35.149	546.729
35.933	597.196
37.052	652.710
38.060	733.458
38.955	788.97];
units.LW_f = {'cm', 'g'};  label.LW_f = {'total length', 'weight', 'females'};  
bibkey.LW_f = 'ElNa2017'; 
%
data.LW_m = [  ... % total length (cm), weight (g)
14.093	35.141
15.105	39.357
15.949	50.602
16.709	57.631
17.637	68.876
18.312	80.120
19.072	89.960
19.831	98.394
20.591	111.044
21.266	120.884
22.110	133.534
23.207	146.185
24.051	172.892
25.232	192.570
26.245	217.871
27.257	254.418
28.270	278.313
29.367	305.020
29.958	319.076
31.224	335.944
32.152	392.169
33.080	431.526
34.008	497.590
35.105	552.410
35.949	603.012];
units.LW_m = {'cm', 'g'};  label.LW_m = {'total length', 'weight', 'males'};  
bibkey.LW_m = 'ElNa2017'; 

%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.1;

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'LW_f','LW_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'weight-length relationship: W in g = 0.01230*(TL in cm)^3.05';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '3FX2R'; % Cat of Life
metaData.links.id_ITIS = '169041'; % ITIS
metaData.links.id_EoL = '46580891'; % Ency of Life
metaData.links.id_Wiki = 'Gerres_filamentosus'; % Wikipedia
metaData.links.id_ADW = 'Gerres_filamentosus'; % ADW
metaData.links.id_Taxo = '174884'; % Taxonomicon
metaData.links.id_WoRMS = '218524'; % WoRMS
metaData.links.id_fishbase = 'Gerres-filamentosus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Gerres_filamentosus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ElNa2017'; type = '169041Article'; bib = [ ... 
'author = {Taher Mohamed Ahmed Abu El-Nasr}, ' ... 
'year = {2017}, ' ...
'title = {Age and growth of the fish, \emph{Gerres filamentosus} ({C}uvier, 1829) from {H}urghada {R}ed {S}ea, {E}gypt}, ' ...
'journal = {Egyptian Journal of Aquatic Research}, ' ...
'volume = {43}, ' ...
'pages = {219–227}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EspiGall2015'; type = 'Article'; bib = [ ... 
'author = {Elaine Espino-Barr and Manuel Gallardo-Cabello and Esther G. Cabral-Sol\''{i}s and Marcos Puente-G\''{o}mez and A. Garcia-Boa}, ' ... 
'year = {2015}, ' ...
'title = {Reproduction of \emph{Gerres cinereus} ({P}ercoidei: {G}erreidae) off the {M}exican {P}acific coast}, ' ...
'journal = {Revista Ciencias Marinas y Costeras}, ' ...
'volume = {7}, ' ...
'pages = {83-98}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Gerres-filamentosus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

