function [data, auxData, metaData, txtData, weights] = mydata_Epinephelus_multinotatus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Serranidae';
metaData.species    = 'Epinephelus_multinotatus'; 
metaData.species_en = 'White-blotched grouper'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MI'};
metaData.ecoCode.habitat = {'0jMp', 'jiMr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCvf'};
metaData.ecoCode.gender  = {'Hsff'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27.3); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'GSI'}; 
metaData.data_1     = {'t-L'; 't-Ww'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 12 29];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 12 29];

%% set data
% zero-variate data

data.ab = 5; units.ab = 'd';    label.ab = 'age at birth';              bibkey.ab = 'guess';   
  temp.ab = C2K(27.3);  units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.am = 27 * 365;  units.am = 'd';    label.am = 'life span';                 bibkey.am = 'fishbase';   
  temp.am = C2K(27.3); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 50;       units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'guess'; 
data.Li  = 100;      units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase';

data.Wwb = 4.5e-4;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.95 mm: pi/6*0.095^3';
data.Wwp = 1221;      units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';    bibkey.Wwp = {'guess','fishbase'};
  comment.Wwp = 'based on 0.00977*Lp^3.00, see F1';
data.Wwi = 9770;    units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00977*Li^3.00, see F1; max. published weight: 9 kg';

data.GSI = 0.045; units.GSI = 'g/g';  label.GSI = 'gonado somatic index';    bibkey.GSI = 'guess';
  temp.GSI = C2K(27.3); units.temp.GSI = 'K'; label.temp.GSI = 'temperature';
 
% uni-variate data
% time-length
data.tL = [ ... % time since birth (yr), total length (cm)
5.875	44.607
5.971	51.677
7.928	45.805
7.944	56.714
8.109	52.673
8.792	52.062
8.961	51.051
9.044	49.434
9.904	53.065
9.983	48.014
9.994	56.296
10.077	54.276
10.158	51.245
10.842	51.038
10.929	52.048
11.007	47.199
11.872	54.668
11.951	49.616
11.963	58.101
12.039	51.434
12.041	53.252
12.977	50.014
12.980	52.438
12.993	61.327
13.070	55.670
13.915	48.795
15.041	58.889
15.045	61.919
17.865	61.092
27.094	60.424];
data.tL(:,1) = (0.95+data.tL(:,1)) * 365;
for i=2:size(data.tL,1); if data.tL(i,1)<=data.tL(i-1,1);data.tL(i,1)=data.tL(i-1,1)+1e-3;end;end
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(27.3);  units.temp.tL = 'K'; label.temp.tLW = 'temperature';
bibkey.tL = 'Gran2005'; 

% length-weight
data.LW = [ ... % total length (cm), weight (g)
44.896	1515.844
45.666	1854.766
47.215	2214.337
48.511	2317.196
49.417	2440.532
49.680	2327.634
49.943	2194.203
50.453	2543.354
51.368	2327.882
51.623	2512.724
51.756	2410.074
52.147	2327.996
52.262	2923.496
52.863	4761.366
52.915	2769.587
53.441	2523.258
53.567	2667.014
54.208	2995.650
54.975	3468.041
55.763	3129.348
56.399	3622.255
56.669	3232.150
58.074	4135.847
59.249	3930.681
60.037	3581.720
61.438	4639.421
61.834	4393.072];    
units.LW   = {'cm', 'g'};  label.LW = {'total length', 'weight'};  
bibkey.LW = 'Gran2005'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.ab = 0 * weights.ab;
weights.Wwp = 0 * weights.Wwp;
weights.Wwi = 0 * weights.Wwi;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.1;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.00977*(TL in cm)^3.00'; 
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6G5Q9'; % Cat of Life
metaData.links.id_ITIS = '551080'; % ITIS
metaData.links.id_EoL = '46579648'; % Ency of Life
metaData.links.id_Wiki = 'Epinephelus'; % Wikipedia
metaData.links.id_ADW = 'Epinephelus_multinotatus'; % ADW
metaData.links.id_Taxo = '105877'; % Taxonomicon
metaData.links.id_WoRMS = '218237'; % WoRMS
metaData.links.id_fishbase = 'Epinephelus-multinotatus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Epinephelus}}';
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
bibkey = 'Gran2005'; type = 'article'; bib = [ ... 
'author = {Grandcourt, E.}, ' ... 
'year = {2005}, ' ...
'title = {Demographic characteristics of selected epinepheline groupers (Family: {S}erranidae; Subfamily: {E}pinephelinae) from {A}ldabra {A}toll, {S}eychelles}, ' ...
'journal = {Atoll Res. Bull.}, ' ...
'volume = {539}, '...
'pages = {200-216}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Epinephelus-multinotatus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

