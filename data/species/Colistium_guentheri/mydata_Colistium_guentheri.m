function [data, auxData, metaData, txtData, weights] = mydata_Colistium_guentheri
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Pleuronectiformes'; 
metaData.family     = 'Pleuronectidae';
metaData.species    = 'Colistium_guentheri'; 
metaData.species_en = 'New Zealand brill'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MPSW'};
metaData.ecoCode.habitat = {'0jMp', 'jiMcd'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(16.6); % in K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'GSI'};  
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
data.am = 17*365;     units.am = 'd';    label.am = 'life span';                    bibkey.am = 'fishbase';  
  temp.am = C2K(16.6); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 25;   units.Lp = 'cm';   label.Lp = 'total length at puberty';          bibkey.Lp = 'TaitHick2001';
data.Li = 90;    units.Li = 'cm';   label.Li = 'ultimate total length';            bibkey.Li = 'fishbase';

data.Wwb = 5.08e-4;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';        bibkey.Wwb = 'TaitHick2001';
  comment.Wwb = 'based on egg diameter of 0.99 mm: pi/6*0.099^3';
data.Wwp = 258;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';         bibkey.Wwp = 'fishbase';  
  comment.Wwp = 'based on 0.01820*Lp^2.97, see F4';
data.Wwi = 12.1e3; units.Wwi = 'g';   label.Wwi = 'ultimate female wet weight';      bibkey.Wwi = 'fishbase';     
  comment.Wwi = 'based on 0.01820*Li^2.97, see F4; max published weight 1.2 kg';

data.GSI = 0.07;    units.GSI = '-';    label.GSI = 'gonadic somatic index'; bibkey.GSI = 'TaitHick2001';
  temp.GSI = C2K(16.6);  units.temp.GSI = 'K'; label.temp.GSI = 'temperature';

% uni-variate data
% time-length
data.tL_f = [ ... % age (years) ~ Length (cm) 
0.045	6.521
0.161	8.983
0.256	4.678
0.256	3.694
0.277	10.461
0.395	8.494
0.467	3.820
0.582	7.389
0.607	2.714
0.721	11.573
0.817	5.300
0.886	8.254
2.958	38.174
3.658	43.841
3.941	37.079
4.149	45.447
4.287	50.000
4.663	47.175
4.804	44.840
4.825	50.007
4.826	48.777
4.871	51.976
4.896	47.178
5.035	52.593
5.037	47.918
5.059	50.994
5.129	51.979
5.246	49.766
5.270	47.921
5.387	48.538
5.434	49.522
5.806	54.694
5.877	52.357
5.878	48.790
5.901	51.865
5.902	47.437
6.042	48.054
6.112	50.392
6.158	52.484
6.182	51.623
6.226	59.005
6.252	49.655
6.274	54.577
6.322	52.117
6.345	53.101
6.697	50.522
6.718	54.828
6.719	53.352
6.744	49.415
6.836	53.230
6.883	52.370
6.908	47.449
6.954	51.263
6.999	54.339
7.072	48.189
7.188	50.405
7.210	52.497
7.257	53.358
7.282	47.085
7.466	59.143
7.678	53.487
7.773	50.412
7.936	51.644
8.099	54.722
8.099	53.738
8.238	57.061
8.263	52.264
8.332	55.463
8.543	54.728
8.660	53.376
8.800	57.068
8.824	53.501
9.219	62.609
10.181	52.164
10.250	56.102
10.322	51.305
10.953	53.527
11.116	54.513
11.208	59.558
11.232	58.574
11.421	53.902
11.676	59.933
12.190	60.062
12.823	57.856
14.087	54.919
14.272	60.949
14.787	59.602
16.377	61.098];
data.tL_f(:,1) = 365 * (0.6+data.tL_f(:,1)); % convert yr to d
for i=2:size(data.tL_f,1); if data.tL_f(i,1)<=data.tL_f(i-1,1);data.tL_f(i,1)=data.tL_f(i-1,1)+1e-3;end;end
units.tL_f = {'d', 'cm'}; label.tL_f = {'time since birth', 'total length','females'};  
temp.tL_f = C2K(16.6);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'StevFran2005'; 
%
data.tL_m = [ ... % age (years) ~ Length (cm) 
1.188	15.024
1.211	16.500
1.233	18.961
2.189	29.184
2.262	22.049
3.076	36.207
3.123	33.501
3.194	31.779
3.239	37.070
3.333	36.702
3.942	34.495
4.010	39.048
4.150	39.911
4.267	40.896
4.503	33.395
4.665	40.409
4.758	42.871
4.923	39.182
4.968	42.873
5.039	42.136
5.039	39.430
5.366	43.370
5.436	44.109
5.484	39.066
5.600	42.266
5.648	39.191
5.880	44.730
6.045	40.918
6.160	47.071
6.184	43.503
6.184	42.765
6.209	39.567
6.231	42.274
6.301	43.136
6.394	44.736
6.654	37.481
6.722	43.141
6.724	39.450
6.746	41.788
6.933	41.913
7.003	44.744
7.003	43.021
7.284	43.517
7.377	44.625
7.659	40.446
7.681	45.490
7.867	47.092
8.009	42.911
8.240	51.525
8.732	49.809
8.826	48.334
8.874	43.537
9.105	52.643
9.527	51.049
9.901	50.069
10.183	46.997
10.207	44.168
10.862	46.760
11.117	51.684
11.633	47.138
11.703	47.385
12.310	51.206
12.756	47.767
13.736	55.037];
data.tL_m(:,1) = 365 * (0.6+data.tL_m(:,1)); % convert yr to d
for i=2:size(data.tL_m,1); if data.tL_m(i,1)<=data.tL_m(i-1,1);data.tL_m(i,1)=data.tL_m(i-1,1)+1e-3;end;end
units.tL_m = {'d', 'cm'}; label.tL_m = {'time since birth', 'total length', 'males'};  
temp.tL_m = C2K(16.6);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
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
metaData.links.id_CoL = '5ZLQP'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '66149181'; % Ency of Life
metaData.links.id_Wiki = 'Colistium_guentheri'; % Wikipedia
metaData.links.id_ADW = 'Colistium_guentheri'; % ADW
metaData.links.id_Taxo = '46978'; % Taxonomicon
metaData.links.id_WoRMS = '280358'; % WoRMS
metaData.links.id_fishbase = 'Colistium-guentheri'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Colistium_guentheri}}';
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
'howpublished = {\url{https://www.fishbase.se/summary/Colistium-guentheri.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
