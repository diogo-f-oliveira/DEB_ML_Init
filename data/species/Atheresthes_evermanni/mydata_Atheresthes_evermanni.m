function [data, auxData, metaData, txtData, weights] = mydata_Atheresthes_evermanni

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Pleuronectiformes'; 
metaData.family     = 'Pleuronectidae';
metaData.species    = 'Atheresthes_evermanni'; 
metaData.species_en = 'Kamchatka flounder'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MPN'};
metaData.ecoCode.habitat = {'0jMp', 'jiMcd'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(1.7); % K, body temp
metaData.data_0     = {'ap'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 09 10];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 09 10];

%% set data
% zero-variate data

data.ab = 15;    units.ab = 'd';  label.ab = 'age at birth';  bibkey.ab = 'guess';   
  temp.ab = C2K(1.7); units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.am = 33*365;    units.am = 'd';  label.am = 'life span';                bibkey.am = 'fishbase';   
  temp.am = C2K(1.7); units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 45;  units.Lp  = 'cm';  label.Lp  = 'length at puberty for females';  bibkey.Lp  = 'guess';
data.Li  = 100;   units.Li  = 'cm';  label.Li  = 'ultimate total length for females';   bibkey.Li  = 'fishbase';

data.Wwb = 2.8e-3; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'BlooMata2007';
  comment.Wwb = 'based on egg diameter 1.64–1.9 mm: pi/6*0.175^3';
data.Wwi = 8.7e3;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00759*Li^3.03, see F1; max published weight 8.5 kg';
  
data.Ri  = 5e5/365; units.Ri  = '#/d'; label.Ri  = 'max reprod rate';   bibkey.Ri  = 'Zimm1997';   
  temp.Ri = C2K(1.7);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on max fecundity of 5e5, which is much lower than for Atheresthes_stomias';
  
% uni-variate data
% time-length
data.tL_f = [ ... % time since birth (yr), total length (cm)
4.235	38.655
5.197	37.607
7.146	48.278
7.159	42.746
7.181	50.938
7.197	49.024
8.146	53.082
8.148	56.912
8.166	58.083
8.175	47.125
8.210	48.828
8.231	54.041
9.107	50.758
9.141	51.610
9.160	55.440
9.163	59.589
9.164	61.185
9.166	64.163
9.167	65.440
9.171	45.972
9.175	52.568
9.178	56.504
9.178	57.249
9.179	58.525
9.183	63.419
9.186	42.887
9.190	49.908
9.193	53.206
9.199	62.249
10.137	51.201
10.141	57.478
10.177	60.989
10.181	66.202
11.156	60.580
11.158	63.346
11.162	68.559
11.174	61.963
11.176	63.984
11.186	53.985
11.205	57.070
11.206	59.410
11.210	65.262
11.219	53.028
12.142	69.426
12.173	65.065
12.178	73.363
12.205	62.300
13.167	61.252
13.172	69.444
13.192	73.593
13.204	66.146];
data.tL_f(:,1) = 365 * (.75 + data.tL_f(:,1)); 
for i=2:size(data.tL_f,1); if data.tL_f(i,1)<=data.tL_f(i-1,1);data.tL_f(i,1)=data.tL_f(i-1,1)+1e-3;end;end
units.tL_f = {'d', 'cm'}; label.tL_f = {'time since birth', 'total length', 'females'};  
temp.tL_f = C2K(1.7); units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'ZimmGodd1996'; 
%
data.tL_m = [ ... % time since birth (yr), total length (cm)
2.798	35.971
3.811	35.669
3.812	37.903
4.759	38.983
4.790	35.685
4.792	38.026
4.822	32.813
4.842	36.963
5.772	39.957
5.791	42.830
5.795	48.255
5.805	37.936
5.809	43.788
5.810	45.702
5.826	44.745
5.828	46.873
6.757	46.995
6.773	45.931
6.774	47.740
6.775	49.123
6.778	53.272
6.788	42.740
7.738	50.309
7.754	49.033
7.768	44.140
7.786	45.204
7.787	47.970
7.825	53.822
8.753	52.880
8.765	45.859
8.768	49.688
8.772	55.114
8.783	46.497
8.786	50.540
8.800	47.668
8.803	52.029
8.822	54.264
9.749	51.939
9.764	49.067
9.784	54.174
9.796	47.153
9.815	50.025];
data.tL_m(:,1) = 365 * (.75 + data.tL_m(:,1)); 
for i=2:size(data.tL_m,1); if data.tL_m(i,1)<=data.tL_m(i-1,1);data.tL_m(i,1)=data.tL_m(i-1,1)+1e-3;end;end
units.tL_m = {'d', 'cm'}; label.tL_m = {'time since birth', 'total length', 'males'};  
temp.tL_m = C2K(1.7); units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'ZimmGodd1996'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 5 * weights.tL_f;
weights.tL_m = 5 * weights.tL_m;
weights.Li = 10 * weights.Li;
weights.Wwi = 3 * weights.Wwi;
weights.Wwb = 3 * weights.Wwb;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_f', 'tL_m'};  subtitle1 = {'Data for female, male'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'length-weight: Ww in g = 0.00759*(TL in cm)^3.03';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '67VBV'; % Cat of Life
metaData.links.id_ITIS = '172861'; % ITIS
metaData.links.id_EoL = '46570138'; % Ency of Life
metaData.links.id_Wiki = 'Atheresthes_evermanni'; % Wikipedia
metaData.links.id_ADW = 'Atheresthes_evermanni'; % ADW
metaData.links.id_Taxo = '46935'; % Taxonomicon
metaData.links.id_WoRMS = '279791'; % WoRMS
metaData.links.id_fishbase = 'Atheresthes-evermanni'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Atheresthes_evermanni}}';
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
bibkey = 'ZimmGodd1996'; type = 'Article'; bib = [ ... 
'author = {Mark Zimmermann and Pamela Goddard}, ' ... 
'year = {1996}, ' ...
'title = {Biology and distribution of arrowtooth, \emph{Atheresthes stomias}, and {K}amchatka, \emph{A. evermanni}, flounders in {A}laskan waters}, ' ...
'journal = {Fishery Bulletin}, ' ...
'volume = {94}, ' ...
'pages = {358--370}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'BlooMata2007'; type = 'techreport'; bib = [ ... 
'author = {Blood, Deborah M. and Ann C. Matarese and Morgan S. Busby.}, ' ... 
'year = {2007}, ' ...
'title = {Spawning, egg development, and early life history dynamics of arrowtooth flounder (\emph{Atheresthes stomias}) in the {G}ulf of {A}laska}, ' ...
'institution = {NOAA Professional Paper NMFS}, ' ...
'volume = {7}, ' ...
'howpublished = {\url{http://spo.nmfs.noaa.gov}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Zimm1997'; type = 'Article'; bib = [ ... 
'author = {Mark Zimmermann}, ' ... 
'year = {1997}, ' ...
'title = {Maturity and fecundity of arrowtooth flounder \emph{Atheresthes stomias}, from the {G}ulf of {A}laska}, ' ...
'journal = {Fishery Bulletin}, ' ...
'volume = {95}, ' ...
'pages = {598--611}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.de/summary/Atheresthes-evermanni.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

