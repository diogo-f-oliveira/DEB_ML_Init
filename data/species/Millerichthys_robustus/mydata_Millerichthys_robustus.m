  function [data, auxData, metaData, txtData, weights] = mydata_Millerichthys_robustus
  %% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cyprinodontiformes'; 
metaData.family     = 'Rivulidae';
metaData.species    = 'Millerichthys_robustus'; 
metaData.species_en = 'Mexican Rivulus'; 

metaData.ecoCode.climate = {'Aw'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFp'};
metaData.ecoCode.embryo  = {'Fnm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(24); % K, body temp
metaData.data_0     = {'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwi'; 'Ni'};  
metaData.data_1     = {'t-L'; 't-Ww'}; 

metaData.COMPLETE = 2.6; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};                             
metaData.date_subm = [2020 10 01];                          
metaData.email     = {'bas.kooijman@vu.nl'};                 
metaData.address   = {'VU Univ. Amsterdam'};      

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 06];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 06];

%% set data
% zero-variate data
data.tp = 24.5;        units.tp = 'd';  label.tp = 'time since birth at puberty';        bibkey.tp = 'DomiUrib2017';
  temp.tp = C2K(24); units.temp.tp = 'K'; label.temp.tp = 'temperature'; 
data.am = 0.9*365;        units.am = 'd';  label.am = 'maximum life span';        bibkey.am = 'DomiUrib2017';
  temp.am = C2K(24); units.temp.am = 'K'; label.temp.am = 'temperature';
  
data.Lb  = 0.51;   units.Lb  = 'cm';  label.Lb  = 'total length at birth';    bibkey.Lb  = 'guess';  
  comment.Lb = 'based on Kryptolebias_marmoratus';
data.Lp = 3.1;     units.Lp = 'cm';     label.Lp = 'ultimate total length';  bibkey.Lp = 'DomiUrib2017';
data.Li = 4.4;     units.Li = 'cm';     label.Li = 'ultimate total length';  bibkey.Li = 'DomiUrib2017';

data.Wwp = 0.36; units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';  bibkey.Wwp = 'DomiUrib2017';
data.Wwi = 0.90; units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';  bibkey.Wwi = 'DomiUrib2017';
   
data.Ni = 370;  units.Ni = '#'; label.Ni = 'cum # eggs at 189 d';   bibkey.Ni = 'DomiUrib2017';
  temp.Ni = C2K(24); units.temp.Ni = 'K'; label.temp.Ni = 'temperature'; 
  comment.Ni = 'upto 37 eggs per brood, 10 broods assumed';

% uni-variate data
  
% time-length
data.tL_f = [ ... % time since birth (d), total length (cm)
6.512	1.072
6.919	0.865
6.919	0.934
13.023	1.314
13.023	1.401
13.023	1.504
13.430	1.625
13.837	1.210
19.942	1.677
19.942	1.591
27.674	2.438
27.674	2.369
41.919	4.496
42.326	3.994
42.326	4.081
42.326	4.184
42.326	4.669
42.326	4.841
42.733	4.357
69.593	3.614
69.593	4.461
70.000	4.046
70.000	4.115
70.000	4.271
70.407	4.634
98.081	3.441
98.081	4.323
98.081	4.893
98.488	4.444
126.163	4.236
126.163	4.375
126.163	4.478
153.837	4.133
153.837	4.288
154.651	4.012
154.651	4.427
155.058	4.513
190.058	3.908
190.058	4.219
190.058	4.340
190.058	4.444
190.058	4.565];
units.tL_f = {'d', 'cm'}; label.tL_f = {'time since birth', 'total length', 'female'};  
temp.tL_f = C2K(24);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'DomiUrib2017';
comment.tL_f = 'Data for females';
%
data.tL_m = [ ... % time since birth (d), std length (cm)
6.512	1.075
6.512	0.974
6.512	0.893
14.244	1.643
14.244	1.522
14.245	1.441
14.246	1.319
14.247	1.238
20.349	2.901
20.756	2.719
20.756	2.658
21.163	2.557
27.674	3.591
28.895	3.307
42.326	4.200
42.327	4.180
69.593	5.052
70.407	4.768
70.408	4.890
98.081	4.788
98.082	4.890
98.083	5.012
125.756	4.849
125.757	4.991
126.163	4.707
154.651	4.707
154.652	4.829
154.653	4.991
188.837	4.809
188.838	4.930
189.244	4.728];
units.tL_m = {'d', 'cm'}; label.tL_m = {'time since birth', 'total length', 'male'};  
temp.tL_m = C2K(24);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'DomiUrib2017';
comment.tL_m = 'Data for males';
  
% time-weight
data.tWw_f = [ ... % time since birth (d), wet weight (g)
7.094	0.024
7.103	0.010
13.527	0.048
13.944	0.028
20.272	0.207
20.719	0.142
21.539	0.121
21.556	0.097
27.534	0.197
27.553	0.169
27.567	0.149
40.767	0.899
40.781	0.878
40.800	0.851
41.131	0.958
41.219	0.827
41.231	0.809
41.272	0.747
41.696	0.716
69.056	0.788
69.443	0.813
69.742	0.968
69.749	0.958
69.760	0.941
69.828	0.840
70.599	0.892
97.223	0.861
97.318	0.719
97.651	0.823
97.688	0.768
98.061	0.813
98.881	0.792
126.684	0.806
126.700	0.782
127.045	0.868
127.120	0.757
127.129	0.744
127.143	0.723
154.067	0.844
155.297	0.813
155.307	0.799
155.323	0.775
155.339	0.750
155.358	0.723
190.779	0.795
190.802	0.761
190.814	0.744
190.828	0.723
190.847	0.695
191.166	0.820];
units.tWw_f = {'d', 'g'}; label.tWw_f = {'time since birth', 'wet weight', 'female'};  
temp.tWw_f = C2K(24);  units.temp.tWw_f = 'K'; label.temp.tWw_f = 'temperature';
bibkey.tWw_f = 'DomiUrib2017';
comment.tWw_f = 'Data for females';
%
data.tWw_m = [ ... % time since birth (d), std length (cm)
 6.454	0.021
13.711	0.031
13.715	0.047
19.805	0.245
20.214	0.271
26.324	0.557
26.720	0.525
27.948	0.609
40.941	1.030
40.951	1.077
40.962	1.124
41.338	1.004
41.403	1.295
69.601	1.217
70.011	1.249
70.019	1.285
70.434	1.337
97.788	1.092
97.873	1.472
97.881	1.509
98.242	1.321
98.248	1.347
98.257	1.389
98.263	1.415
125.271	1.425
125.657	1.347
126.083	1.451
126.442	1.254
126.449	1.285
126.455	1.311
153.064	1.342
153.074	1.384
153.862	1.306
153.887	1.415
154.704	1.462
188.509	1.228
188.882	1.092
188.896	1.155
188.903	1.186
189.277	1.056];
units.tWw_m = {'d', 'g'}; label.tWw_m = {'time since birth', 'wet weight', 'male'};  
temp.tWw_m = C2K(24);  units.temp.tWw_m = 'K'; label.temp.tWw_m = 'temperature';
bibkey.tWw_m = 'DomiUrib2017';
comment.tWw_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 5 * weights.tL_f;
weights.tL_m = 5 * weights.tL_m;
weights.Lb = 5 * weights.Lb;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.p_M = 5 * weights.psd.p_M;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_f', 'tL_m'}; subtitle1 = {'Data for females, males'};
set2 = {'tWw_f', 'tWw_m'}; subtitle2 = {'Data for females, males'};
metaData.grp.sets = {set2,set1};
metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
D2 = 'mean temperatures are guessed';
D3 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);

%% Discussion points
D1 = 'weight length relationship: Ww in g = 0.01175 * (TL in cm)^3.04'; 
  metaData.bibkey.D1 = 'fishbase';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'Most northern anual killifish'; 
metaData.bibkey.F1 = 'DomiUrib2017'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '43D34'; % Cat of Life
metaData.links.id_ITIS = '647403'; % ITIS
metaData.links.id_EoL = '217223'; % Ency of Life
metaData.links.id_Wiki = 'Millerichthys_robustus'; % Wikipedia
metaData.links.id_ADW = 'Millerichthys_robustus'; % ADW
metaData.links.id_Taxo = '180132'; % Taxonomicon
metaData.links.id_WoRMS = '1012921'; % WoRMS
metaData.links.id_fishbase = 'Millerichthys-robustus'; % fishbase


%% References
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Millerichthys-robustus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Millerichthys_robustus}}';
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
bibkey = 'DomiUrib2017'; type = 'Article'; bib = [ ...
'doi = {10.1007/s10641-017-0617-y}, ' ...
'author = {Omar Dominguez-Castanedo and Mari Carmen Uribe and Ana Maria Rosales-Torres}, ' ...
'year = {2017}, ' ...
'title = {Life history strategies of annual killifish \emph{Millerichthys robustus} ({C}yprinodontiformes: {C}ynolebiidae) in a seasonally ephemeral water body in {V}eracruz, {M}\''{e}xico}, ' ...
'journal = {Environ Biol Fish}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

