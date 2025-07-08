function [data, auxData, metaData, txtData, weights] = mydata_Vampyroteuthis_infernalis

%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Cephalopoda'; 
metaData.order      = 'Vampyromorpha'; 
metaData.family     = 'Vampyroteuthidae';
metaData.species    = 'Vampyroteuthis_infernalis'; 
metaData.species_en = 'Vampire squid'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MC'};
metaData.ecoCode.habitat = {'0iMp'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biD'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'Os'};

metaData.T_typical  = C2K(6); % K, body temp
metaData.data_0     = {'am'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ni'}; 
metaData.data_1     = {'t-L'; 't-Ww'}; 

metaData.COMPLETE = 2.3; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2021 03 22];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2021 03 22]; 

%% set data
% zero-variate data

data.am = 375;   units.am = 'd';    label.am = 'life span for female';        bibkey.am = 'SchwPist2020';   
  temp.am = C2K(6); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb  = 0.0141;  units.Wwb  = 'g'; label.Wwb  = 'wet weight at birth';     bibkey.Wwb  = 'SchwPist2020';
  comment.Wwb = 'based on egg of 3.2 mm length, 2.9 mm width: pi/6*0.32*0.29^2';
data.Wwp  = 19;  units.Wwp  = 'g'; label.Wwp  = 'wet weight at puberty';     bibkey.Wwp  = 'SchwPist2020';
data.Wwi  = 286;  units.Wwi  = 'g'; label.Wwi  = 'wet weight at 220 d';     bibkey.Wwi  = 'SchwPist2020';

data.Ni  = 1640; units.Ni  = '#';  label.Ni  = 'fecundity';    bibkey.Ni  = 'guess';   
  temp.Ni = C2K(6);  units.temp.Ni = 'K'; label.temp.Ni = 'temperature';
  comment.Ni = 'based on kap=0.95';
  
% uni-variate data

% time-length
data.tL_f = [ ... % upper beak length (cm), time since birth (d) 
0.281	 90.735
0.286	139.048
0.373	150.365
0.475	167.357
0.485	181.562
0.499	135.132
0.509	179.653
0.524	188.170
0.525	195.749
0.601	172.019
0.771	268.550
0.844	241.981
0.887	282.692
0.888	205.008
0.941	317.713
0.984	282.634
0.989	271.263
1.207	272.081
1.241	381.956
1.290	284.348
1.314	249.281
1.324	347.802
1.348	298.524
1.372	303.247
1.571	356.182
1.600	275.638];
data.tL_f = data.tL_f(:,[2 1]); [~, ind] = sort(data.tL_f(:,1)); data.tL_f = data.tL_f(ind,:);
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since birth', 'upper beak length', 'female'};  
temp.tL_f    = C2K(6);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'SchwPist2020';
comment.tL_f = 'Data for females';
%
data.tL_m = [ ... % upper beak length (cm), time since birth (d)
0.771	241.077
1.023	243.769
1.047	330.913
1.198	263.561
1.251	368.687
1.290	384.769
1.295	303.293
1.304	264.445
1.319	268.226
1.333	264.428
1.377	280.507
1.392	323.130
1.411	279.540
1.450	297.517
1.478	286.131
1.479	280.447
1.484	312.655
1.566	326.816
1.590	349.539
1.595	290.799
1.619	334.364
1.663	291.706
1.697	343.791];
data.tL_m = data.tL_m(:,[2 1]); [~, ind] = sort(data.tL_m(:,1)); data.tL_m = data.tL_m(ind,:);
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time since birth', 'upper beak length', 'male'};  
temp.tL_m    = C2K(6);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'SchwPist2020';
comment.tL_m = 'Data for males';

% time-weight
data.tWw_f = [ ... % time since birth (d), wet weight (g)
51.144	0.812
60.929	1.465
76.155	4.002
81.033	0.282
84.838	0.294
90.282	2.801
97.356	5.312
100.089	9.678
104.430	7.824
109.333	10.951
114.220	9.722
149.036	19.166
151.479	93.240
153.962	28.518
156.172	38.483
157.238	32.885
159.509	59.655
167.842	109.474
170.970	72.761
171.461	58.448
176.727	11.784
189.446	72.197
193.859	240.260
201.096	287.586
215.775	138.876];
units.tWw_f   = {'d', 'g'};  label.tWw_f = {'time since birth', 'wet weight', 'female'};  
temp.tWw_f    = C2K(6);  units.temp.tWw_f = 'K'; label.temp.tWw_f = 'temperature';
bibkey.tWw_f = 'SchwPist2020';
comment.tWw_f = 'Data for females';
%
data.tWw_m = [ ... % time since birth (d), wet weight (g)
134.908	19.745
137.098	24.108
147.435	27.253
147.853	142.399
148.078	54.640
155.687	54.664
155.700	58.399
157.360	66.495
159.067	87.662
163.169	169.833
165.413	189.134
168.250	72.131
170.005	106.368
175.514	276.925
179.740	93.328
184.618	89.609
185.592	208.492
187.949	258.914
190.695	117.014
196.707	126.369
207.124	151.297
216.176	99.666];
units.tWw_m   = {'d', 'g'};  label.tWw_m = {'time since birth', 'wet weight', 'male'};  
temp.tWw_m    = C2K(6);  units.temp.tWw_m = 'K'; label.temp.tWw_m = 'temperature';
bibkey.tWw_m = 'SchwPist2020';
comment.tWw_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 5 * weights.tL_f;
weights.tL_m = 5 * weights.tL_m;
weights.am = 10 * weights.am;
weights.Wwi = 5 * weights.Wwi;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.p_M = 5 * weights.psd.p_M;
weights.psd.v = 3 * weights.psd.v;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
set2 = {'tWw_f','tWw_m'}; subtitle2 = {'Data for females, males'};
metaData.grp.sets = {set1,set2};
metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points
D1 = 'Males are assumed not to differ from females';
D2 = 'Temperatures are guessed';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Facts
F1 = 'Programmed death, not by ageing';
metaData.bibkey.F1 = 'Wiki'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '7FDVH'; % Cat of Life
metaData.links.id_ITIS = '82587'; % ITIS
metaData.links.id_EoL = '492277'; % Ency of Life
metaData.links.id_Wiki = 'Vampyroteuthis_infernalis'; % Wikipedia
metaData.links.id_ADW = 'Vampyroteuthis_infernalis'; % ADW
metaData.links.id_Taxo = '40375'; % Taxonomicon
metaData.links.id_WoRMS = '141887'; % WoRMS
metaData.links.id_molluscabase = '141887'; % MolluscaBase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Vampyroteuthis_infernalis}}';
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
bibkey = 'SchwPist2020'; type = 'article'; bib = [ ... 
'author = {Richard Schwarz and Uwe Piatkowski and Bruce H. Robison and Vladimir V. Laptikhovsky and Henk-Jan Hoving}, ' ... 
'year = {2020}, ' ...
'title = {Life history traits of the deep-sea pelagic cephalopods \emph{Japetella diaphana} and \emph{Vampyroteuthis infernalis}}, ' ...
'journal = {Deep-Sea Research I}, ' ...
'volume = {164}, ' ...
'pages = {103365}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'sealifebase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.sealifebase.ca/summary/Vampyroteuthis-infernalis.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

