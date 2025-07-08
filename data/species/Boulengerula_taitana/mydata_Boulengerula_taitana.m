function [data, auxData, metaData, txtData, weights] = mydata_Boulengerula_taitana

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Amphibia'; 
metaData.order      = 'Gymnophiona'; 
metaData.family     = 'Herpelidae';
metaData.species    = 'Boulengerula_taitana'; 
metaData.species_en = 'Taita African caecilian'; 

metaData.ecoCode.climate = {'BSh'};
metaData.ecoCode.ecozone = {'TPa'};
metaData.ecoCode.habitat = {'0iTf'};
metaData.ecoCode.embryo  = {'Tnsf'};
metaData.ecoCode.migrate = {'TW'};
metaData.ecoCode.food    = {'bjTva', 'jiCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(23); % K, body temp
metaData.data_0     = {'am'; 'Lb'; 'Lj'; 'Lp'; 'Li'; 'Wwb'; 'Wwj'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2019 06 21];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2019 06 21];


%% set data
% zero-variate data

data.am = 10*365;  units.am = 'd';    label.am = 'life span';                 bibkey.am = 'guess';   
  temp.am = C2K(23);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'based on other caecilians as given in AnAge';

data.Lb  = 7.28;    units.Lb  = 'cm';  label.Lb  = 'total length at birth';    bibkey.Lb  = 'MalaMeas2005';  
data.Lj  = 14.27;   units.Lj  = 'cm';  label.Lj  = 'total length at metam';    bibkey.Lj  = 'KupfKram2004';  
data.Lp  = 24.00;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'MalaMeas2005';
data.Li  = 33.4;    units.Li = 'cm';   label.Li = 'ultimate total length for females'; bibkey.Li  = 'MalaMeas2005';
data.Lim = 31.8;    units.Lim = 'cm';  label.Lim = 'ultimate total length for males'; bibkey.Lim  = 'MalaMeas2005';

data.Wwb = 0.25;    units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'MalaMeas2005';
data.Wwj = 0.923;   units.Wwj = 'g';   label.Wwj = 'wet weight at metam';      bibkey.Wwj = 'MalaMeas2005';
data.Wwp = 3.713;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'MalaMeas2005';
data.Wwi = 10.65;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';      bibkey.Wwi = 'MalaMeas2005';
data.Wwim = 9.02;   units.Wwim = 'g';  label.Wwim = 'ultimate wet weight for males';      bibkey.Wwim = 'MalaMeas2005';

data.Ri  = 16/365;    units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';   bibkey.Ri  = 'MalaMeas2005';   
  temp.Ri = C2K(23);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '4 to 16 eggs per brood';

% uni-variate data

% time - length
data.tL = [ ... % time since birth (d), length (cm)
      0  7.9
     60  8.7
    120  9.3
    180 11.1
    240 12.6
    300 14.3
    360 15.9
    420 16.5
    480 17.1
    540 19.1
    600 20.4
    660 22.1
    720 23.9];
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(27);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'MalaMeas2005';

% length-weight
data.LW_f = [ ... % total length^3 (cm^3), weight(g)
0.076	0.255
0.076	0.412
0.107	0.334
0.121	0.471
0.156	0.608
0.188	0.570
0.232	0.766
0.233	0.883
0.594	1.846
0.617	1.709
0.617	2.042
0.666	1.749
0.711	2.395
0.778	2.337
0.867	2.436
0.974	2.887
1.041	2.535
1.063	2.849
1.207	3.457
1.247	3.242
1.278	3.536
1.287	3.145
1.287	3.340
1.349	3.263
1.443	4.223
1.528	3.676
1.537	3.480
1.556	5.046
1.604	4.166
1.747	4.461
1.926	5.246
1.966	5.442
2.014	3.857
2.037	4.914
2.087	6.578
2.126	5.032
2.409	7.286
2.462	6.856
2.604	6.211
3.571	10.508
3.709	10.705];
data.LW_f(:,1) = (data.LW_f(:,1)*1e7).^(1/3)/10; % convert to cm
units.LW_f   = {'cm', 'g'};  label.LW_f = {'total length', 'weight', 'female'};  
bibkey.LW_f = 'MalaMeas2005';
comment.LW_f = 'data for females';
%
data.LW_m = [ ... % total length^3 (cm^3), weight(g)
0.523	1.454
0.778	2.259
0.903	2.378
0.992	3.044
0.996	2.809
1.077	3.417
1.099	3.025
1.189	3.202
1.189	3.555
1.220	3.046
1.296	3.830
1.336	3.654
1.474	3.734
1.537	4.224
1.569	4.459
1.752	5.087
1.805	4.187
1.841	4.599
1.881	5.323
1.944	5.774
1.952	5.011
1.958	6.499
2.015	5.325
2.123	5.972
2.158	5.972
2.176	6.403
2.247	5.503
2.288	7.089
2.319	5.935
2.319	6.209
2.320	7.090
2.372	5.857
2.503	7.600
2.573	6.368
2.707	6.271
2.785	8.876
2.900	8.250
3.225	7.764];
data.LW_m(:,1) = (data.LW_m(:,1)*1e7).^(1/3)/10; % convert to cm
units.LW_m   = {'cm', 'g'};  label.LW_m = {'total length', 'weight', 'male'};  
bibkey.LW_m = 'MalaMeas2005';
comment.LW_m = 'data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 3 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'LW_f','LW_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'Neonates feed on the skin of the mother: dermatophagy';
metaData.bibkey.F1 = 'Wiki'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = 'MR72'; % Cat of Life
metaData.links.id_ITIS = '668421'; % ITIS
metaData.links.id_EoL = '1019807'; % Ency of Life
metaData.links.id_Wiki = 'Boulengerula_taitana'; % Wikipedia
metaData.links.id_ADW = 'Boulengerula_taitana'; % ADW
metaData.links.id_Taxo = '137482'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_amphweb = 'Boulengerula+taitana'; % AmphibiaWeb


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Boulengerula_taitana}}';
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
bibkey = 'MalaMeas2005'; type = 'Article'; bib = [ ...
'author = {P.K. Malanza and G.J. Measey}, ' ... 
'year = {2005}, ' ...
'title = {Life history of an {A}frican caecilian: \emph{Boulengerula taitanus} {L}overidge 1935 ({A}mphibia {G}ymnophiona {C}aeciilidae)}, ' ...
'journal = {Tropical Zoology}, ' ...
'volume = {18}, ' ...
'pages = {49-66}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'KupfKram2004'; type = 'Article'; bib = [ ... 
'author = {Kupfer, A. and Kramer, A. and Himstedt, W.}, ' ... 
'year = {2004}, ' ...
'title = {Sex-related growth patterns in a caecilian amphibian (genus \emph{Ichthyophis}): evidence from laboratory data}, ' ...
'journal = {J. Zool., Lond.}, ' ...
'volume = {262}, ' ...
'pages = {173--178}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
