function [data, auxData, metaData, txtData, weights] = mydata_Microstomus_achne
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Pleuronectiformes'; 
metaData.family     = 'Pleuronectidae';
metaData.species    = 'Microstomus_achne'; 
metaData.species_en = 'Slime flounder'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MPNW'};
metaData.ecoCode.habitat = {'0jMp', 'jiMcd'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(8.6); % in K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'};  
metaData.data_1     = {'t-L'; 't-Ww'; 'L-N'}; 

metaData.COMPLETE = 2.4; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 05 16];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 05 16];

%% set data
% zero-variate data
data.ab = 19;      units.ab = 'd';    label.ab = 'age at birth';                     bibkey.ab = 'fishbase';    
  temp.ab = C2K(8.6); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 15*365;     units.am = 'd';    label.am = 'life span';                    bibkey.am = 'DagaChan1992';  
  temp.am = C2K(8.6); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 25;  units.Lp = 'cm';   label.Lp = 'total length at puberty';          bibkey.Lp = 'DagaChan1992';
data.Li = 60;    units.Li = 'cm';   label.Li = 'ultimate total length';            bibkey.Li = 'fishbase';

data.Wwb = 1.13e-4;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';             bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.6 mm: pi/6*0.06^3';
data.Wwp = 304;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';           bibkey.Wwp = 'fishbase';  
  comment.Wwp = 'based on 0.01202*Lp^3.15, see F4';
data.Wwi = 4.8e3; units.Wwi = 'g';   label.Wwi = 'ultimate female wet weight';      bibkey.Wwi = 'fishbase';     
  comment.Wwi = 'based on 0.01202*Li^3.15, see F4; max published weight 1.8 kg';

% uni-variate data
% time-length
data.tL_fm = [ ... % age (years) ~ Length (cm) 
 2	14.670 13.003
 3	20.606 18.245
 4	23.359 21.969
 5	26.383 24.579
 6  30.244 NaN
 7  34.800 NaN
 8  35.466 NaN
 9  37.667 NaN
10  41.112 NaN
11  42.188 NaN
12  44.658 NaN
13  47.824 NaN];
data.tL_fm(:,1) = 365 * (0+data.tL_fm(:,1)); % convert yr to d
units.tL_fm = {'d', 'cm'}; label.tL_fm = {'time since birth', 'total length'};  
temp.tL_fm = C2K(8.6);  units.temp.tL_fm = 'K'; label.temp.tL_fm = 'temperature';
bibkey.tL_fm = 'DagaChan1992'; treat.tL_fm = {1 {'females','males'}};

% time-weight
data.tW_fm = [ ... % age (years) ~ weight (g)
 2	 65.285  75.657
 3	170.266 149.411
 4	290.752 233.864
 5	370.182 323.394
 6  449.067 423.298
 7  611.154 574.849
 8  804.632 690.475
 9 1028.848 NaN
10 1346.639 NaN
11 1591.927 NaN
12 1645.261 NaN
13 1791.408 NaN];
data.tW_fm(:,1) = 365 * (0+data.tW_fm(:,1)); % convert yr to d
units.tW_fm = {'d', 'g'}; label.tW_fm = {'time since birth', 'weight'};  
temp.tW_fm = C2K(8.6);  units.temp.tW_fm = 'K'; label.temp.tW_fm = 'temperature';
bibkey.tW_fm = 'DagaChan1992'; treat.tW_fm = {1 {'females','males'}};

% length-fecundity
data.LN = [ ... % total length (cm), fecundity (#)
25.170	335178.722
25.415	390077.510
26.655	353068.354
26.710	485553.216
27.702	463733.899
27.835	292600.420
27.883	573048.758
28.934	605838.398
28.947	333273.773
28.991	707173.094
29.066	434704.906
29.292	863406.578
30.098	856873.029
30.165	747943.406
30.174	568829.764
30.225	779189.996
30.230	685739.536
31.101	609213.794
31.156	733911.367
31.166	539222.125
31.207	959847.211
31.274	850917.589
31.568	1178477.439
32.387	883803.665
32.515	806121.155
32.743	1211459.952
32.752	1024558.510
33.003	962643.962
33.494	1033503.600
33.605	1298473.298
33.687	901404.497
33.920	1197717.248
34.788	1175705.045
34.833	1518454.225
34.914	1121384.902
34.984	965730.049
35.044	1004764.439
35.062	638748.832
35.087	1386451.049
35.090	1324150.743
36.941	1459432.356
37.070	1350599.693
37.123	1537597.585
38.337	2030142.601
38.409	1812187.442
38.731	1579042.456
39.712	1767486.935
39.905	1627600.569
39.948	2001499.889
41.678	2074288.323];
units.LN = {'cm', '#'}; label.LN = {'total length', 'fecundity'};  
temp.LN = C2K(8.6);  units.temp.LN = 'K'; label.temp.tL = 'temperature';
bibkey.LN = 'DagaChan1992'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tL_fm = 5 * weights.tL_fm;
weights.tW_fm = 5 * weights.tW_fm;
weights.ab = 0 * weights.ab;
weights.Wwp = 0 * weights.Wwp;
weights.Wwi = 0 * weights.Wwi;
weights.Wwb = 3 * weights.Wwb;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} only ';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'Length-Weight relationship: W in g = 0.01202*(TL in cm)^3.15';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '437HB'; % Cat of Life
metaData.links.id_ITIS = '172890'; % ITIS
metaData.links.id_EoL = ''; % Ency of Life
metaData.links.id_Wiki = 'Microstomus_achne'; % Wikipedia
metaData.links.id_ADW = 'Microstomus_achne'; % ADW
metaData.links.id_Taxo = '180118'; % Taxonomicon
metaData.links.id_WoRMS = '274293'; % WoRMS
metaData.links.id_fishbase = 'Microstomus-achne'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Microstomus_achne}}';
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
bibkey = 'DagaChan1992'; type = 'article'; bib = [ ...
'author = {Chen Dagang and Liu Changan and Dou Shuozeng}, ' ...
'year   = {1992}, ' ...
'title  = {THE BIOLOGY OF FLATFISH ({P}LEURONECTINAE) IN THE COASTAL WATERS OF {C}HINA}, ' ... 
'journal = {Netherlands Journal of Sea Research}, ' ...
'page = {215-221}, ' ...
'volume = {29(1-3)}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Microstomus-achne}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
