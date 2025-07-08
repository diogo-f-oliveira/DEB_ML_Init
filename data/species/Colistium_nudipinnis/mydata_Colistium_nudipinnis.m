function [data, auxData, metaData, txtData, weights] = mydata_Colistium_nudipinnis
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Pleuronectiformes'; 
metaData.family     = 'Pleuronectidae';
metaData.species    = 'Colistium_nudipinnis'; 
metaData.species_en = 'New Zealand turbot'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MPSW'};
metaData.ecoCode.habitat = {'0jMp', 'jiMcd'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(17.5); % in K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.4; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 06 16];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 06 16];

%% set data
% zero-variate data
data.ab = 7.5;      units.ab = 'd';    label.ab = 'age at birth';                     bibkey.ab = 'TaitHick2001';    
  temp.ab = C2K(14); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 21*365;     units.am = 'd';    label.am = 'life span';                    bibkey.am = 'fishbase';  
  temp.am = C2K(17.5); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 25;   units.Lp = 'cm';   label.Lp = 'total length at puberty';          bibkey.Lp = 'TaitHick2001';
data.Li = 91.4;    units.Li = 'cm';   label.Li = 'ultimate total length';            bibkey.Li = 'fishbase';

data.Wwb = 4.78e-4;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';        bibkey.Wwb = 'TaitHick2001';
  comment.Wwb = 'based on egg diameter of 0.97 mm: pi/6*0.097^3';
data.Wwp = 258;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';         bibkey.Wwp = 'fishbase';  
  comment.Wwp = 'based on 0.01820*Lp^2.97, see F4';
data.Wwi = 12.1e3; units.Wwi = 'g';   label.Wwi = 'ultimate female wet weight';      bibkey.Wwi = 'fishbase';     
  comment.Wwi = 'based on 0.01820*Li^2.97, see F4; max published weight 1.2 kg';

data.GSI = 0.05;    units.GSI = '-';    label.GSI = 'gonadic somatic index'; bibkey.GSI = 'TaitHick2001';
  temp.GSI = C2K(17.5);  units.temp.GSI = 'K'; label.temp.GSI = 'temperature';

% uni-variate data
% time-length
data.tL_f = [ ... % age (years) ~ Length (cm) 
2.044	26.700
4.680	38.888
4.680	36.947
4.877	37.501
5.099	39.995
5.148	38.516
5.172	39.070
5.172	37.314
5.197	40.826
5.246	38.238
5.271	40.549
5.517	39.531
5.542	42.673
5.665	38.421
5.739	39.068
5.813	40.546
5.887	38.143
5.961	38.974
6.010	39.991
6.207	37.587
6.281	41.191
6.305	38.603
6.404	37.586
6.576	40.265
6.798	38.508
6.823	40.449
6.823	43.037
6.946	43.683
6.995	38.045
6.995	36.751
7.020	41.095
7.241	39.985
7.340	38.598
7.365	40.262
7.389	39.615
7.438	37.396
7.463	42.295
7.783	37.857
7.808	36.470
7.882	40.444
8.128	40.443
8.202	39.796
8.202	42.014
8.350	38.686
8.374	41.181
8.768	40.255
8.867	38.499
9.360	40.160
9.729	43.578
9.828	39.696
9.828	41.082
10.123	39.510
10.197	39.971
10.493	42.835
10.690	41.448
10.936	40.430
11.059	40.429
11.059	39.413
11.256	44.033
11.256	38.673
11.330	40.151
11.429	40.613
11.921	42.182
12.069	43.105
12.340	43.104
12.709	39.498
12.931	41.622
13.103	42.176
14.360	40.229
14.360	43.372
14.828	44.756
14.852	39.580
14.975	43.092
15.542	43.551];
data.tL_f(:,1) = 365 * (0.6+data.tL_f(:,1)); % convert yr to d
for i=2:size(data.tL_f,1); if data.tL_f(i,1)<=data.tL_f(i-1,1);data.tL_f(i,1)=data.tL_f(i-1,1)+1e-3;end;end
units.tL_f = {'d', 'cm'}; label.tL_f = {'time since birth', 'total length','females'};  
temp.tL_f = C2K(17.5);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'StevFran2005'; 
%
data.tL_m = [ ... % age (years) ~ Length (cm) 
3.079	31.964
3.202	34.274
3.300	30.207
3.719	33.624
4.163	36.025
5.148	33.710
5.172	36.113
5.690	36.573
5.739	37.034
5.911	36.572
6.084	36.940
6.182	38.141
6.182	36.016
6.232	34.722
6.305	33.890
6.330	35.923
6.404	35.275
6.626	34.812
6.626	37.770
6.700	35.551
6.700	37.307
6.872	36.382
7.069	38.507
7.069	36.104
7.241	36.103
7.611	37.118
7.808	39.705
8.350	36.930
8.571	38.685
8.719	36.559
9.236	37.388
10.049	38.863
10.394	37.567
11.084	37.934
11.108	35.623
11.650	37.192
11.675	40.057
11.921	39.501
12.217	37.282
12.315	36.542
12.389	38.852
13.867	37.274
14.163	41.062
14.729	39.026
14.901	38.656
17.044	39.385
17.414	38.921
17.660	38.181
19.163	38.728];
data.tL_m(:,1) = 365 * (0.6+data.tL_m(:,1)); % convert yr to d
for i=2:size(data.tL_m,1); if data.tL_m(i,1)<=data.tL_m(i-1,1);data.tL_m(i,1)=data.tL_m(i-1,1)+1e-3;end;end
units.tL_m = {'d', 'cm'}; label.tL_m = {'time since birth', 'total length', 'males'};  
temp.tL_m = C2K(17.5);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'StevFran2005'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 3 * weights.tL_f;
weights.tL_m = 3 * weights.tL_m;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} only ';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'Length-Weight relationship: W in g = 0.01820*(TL in cm)^2.97';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = 'X2LV'; % Cat of Life
metaData.links.id_ITIS = '616301'; % ITIS
metaData.links.id_EoL = '46570220'; % Ency of Life
metaData.links.id_Wiki = 'Colistium_nudipinnis'; % Wikipedia
metaData.links.id_ADW = 'Colistium_nudipinnisi'; % ADW
metaData.links.id_Taxo = '171579'; % Taxonomicon
metaData.links.id_WoRMS = '280359'; % WoRMS
metaData.links.id_fishbase = 'Colistium-nudipinnis'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Colistium_nudipinnis}}';
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
bibkey = 'StevFran2005'; type = 'article'; bib = [ ...
'author = {D. W. Stevens and M. P. Francis and P. C. Shearer and R. P. McPhee and R. W. Hickman and M. J. Tait}, ' ...
'year   = {2005}, ' ...
'title  = {Age and growth of two endemic flatfish (\emph{Colistium guntheri} and \emph{C. nudipinnis}) in central {N}ew {Z}ealand waters}, ' ... 
'journal = {Marine and Freshwater Research}, ' ...
'page = {143–151}, ' ...
'volume = {56}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'TaitHick2001'; type = 'article'; bib = [ ...
'doi = {10.1046/j.1355-557x.2001.00609.x}, ' ...
'author = {M. J. Tait and R. W. Hickman}, ' ...
'year   = {2001}, ' ...
'title  = {Reproduction, gamete supply and larval rearing of {N}ew {Z}ealand turbot \emph{Colistium nudipinnis} ({W}aite 1910) and brill \emph{Colistium guntheri} ({H}utton 1873): a potential new aquaculture species}, ' ... 
'journal = {Aquaculture Research}, ' ...
'page = {717–725}, ' ...
'volume = {32(9)}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Colistium-nudipinnis.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
