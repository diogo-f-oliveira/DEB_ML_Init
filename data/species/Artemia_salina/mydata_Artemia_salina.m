function [data, auxData, metaData, txtData, weights] = mydata_Artemia_salina
%% set metaData
metaData.phylum     = 'Arthropoda'; 
metaData.class      = 'Branchiopoda'; 
metaData.order      = 'Anostraca'; 
metaData.family     = 'Artemiidae';
metaData.species    = 'Artemia_salina'; 
metaData.species_en = 'Brine shrimp'; 

metaData.ecoCode.climate = {'B'};
metaData.ecoCode.ecozone = {'TH'};
metaData.ecoCode.habitat = {'0iSl'};
metaData.ecoCode.embryo  = {'Fbf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biPp', 'biD'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'Apf'};

metaData.T_typical  = C2K(25); % K, body temp
metaData.data_0     = {'ap'; 'am'; 'Wwb'; 'Wdi'; 'Ri'}; 
metaData.data_1     = {'t-L'; 'T-tR'; 'L-Wd_f'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2024 01 06];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 01 06]; 

%% set data
% zero-variate data

data.tp = 7;     units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'WurtGliw2001';
  temp.tp = C2K(25);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 90;   units.am = 'd';    label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(30);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 0.6;  units.Lp = 'cm';  label.Lp  = 'carapace length at puberty'; bibkey.Lp  = 'WurtGliw2001';
data.Li  = 1.0;  units.Li = 'cm';  label.Li  = 'ultimate carapace length';   bibkey.Li  = 'WurtGliw2001';
  comment.Li = 'ADW: till 1.5 cm';

data.Wwb  = 3.6e-6; units.Wwb  = 'g';  label.Wwb  = 'wet weight at birth';   bibkey.Wwb  = 'algova';
  comment.Wwb = 'based on egg diameter of 261 mum: pi/6*261-4^3';
data.Wdi  = 1.6e-3;  units.Wdi  = 'g';  label.Wdi  = 'ultimate dry weight';   bibkey.Wdi  = 'GliwWurs2010';

data.Ri  = 170/4;  units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'WurtGliw2001';   
  temp.Ri = C2K(25);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'ADW: clutches of 300 each 4 d';
 
% uni-variate data

% time-length
data.tL = [ ... % time since birth (d), length (cm)
0.000	0.046
0.479	0.044
0.873	0.063
1.763	0.115
3.012	0.181
3.851	0.262
4.501	0.333
5.545	0.482
7.017	0.609
7.873	0.579
9.619	0.677
10.800	0.704
12.528	0.965
13.863	0.893];
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'total length'};  
temp.tL = C2K(25); units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'WurtGliw2001';

% temperature-brood interval
data.TtR = [ ... % temperature (C), brood interval (#/d)
9.492	17.191
9.501	24.513
9.776	10.408
9.847	21.302
9.994	11.661
10.193	17.913
10.203	25.145
10.253	21.574
10.294	20.414
10.313	15.325
10.348	26.039
10.383	16.397
10.399	12.111
14.449	8.762
14.475	11.530
14.621	12.246
14.637	7.960
14.650	14.300
14.804	12.784
14.856	8.677
14.860	7.695
14.867	15.909
14.965	9.303
14.998	10.464
15.176	12.341
15.220	20.556
15.300	9.039
15.411	18.862
15.442	10.558
15.453	17.612
15.455	7.076
15.579	13.506
19.345	6.672
19.352	4.975
19.429	4.083
19.571	5.870
19.640	7.121
19.683	5.604
19.781	8.998
19.860	7.659
19.876	3.284
19.941	5.964
19.943	5.249
20.019	4.893
20.058	4.179
20.134	13.644
20.160	6.770
20.208	3.824
20.342	7.575
20.347	6.147
20.424	5.344
20.531	6.595
20.537	4.988
20.556	9.720
24.455	7.173
24.601	7.621
24.609	5.478
24.612	4.585
24.616	3.692
24.691	3.336
24.721	5.122
24.731	2.533
24.781	8.962
24.864	6.641
24.983	4.411
24.987	3.428
25.165	5.395
25.170	4.055
25.246	3.520
25.400	1.826
25.425	5.130
25.615	3.971
25.618	3.167
25.659	2.096];
units.TtR = {'C', 'd'}; label.TtR = {'temperature', 'brood interval'};  
bibkey.TtR = 'WurtGliw2001';
comment.TtR = 'at different food levels';

% length-dry weight
data.LWd_high = [ ... % length (cm), dry weight (mg)
0.239	0.059
0.299	0.078
0.321	0.066
0.345	0.142
0.483	0.231
0.498	0.187
0.521	0.181
0.600	0.276
0.630	0.489
0.650	0.396
0.677	0.590
0.699	0.509
0.746	0.647
0.755	0.748
0.775	0.742
0.795	0.830
0.814	0.717
0.900	1.119
0.947	1.182
0.995	1.622
1.156	2.194];
units.LWd_high = {'cm', 'mg'}; label.LWd_high = {'length', 'dry weight','high food'};  
bibkey.LWd_high = 'GliwWurs2010';
comment.LWd_high = 'Data at 20-30 mug chlorophyll/L';
%
data.LWd_low = [ ... % length (cm), dry weight (mg)
0.278	0.066
0.520	0.212
0.601	0.188
0.601	0.150
0.628	0.257
0.654	0.283
0.679	0.459
0.680	0.233
0.696	0.340
0.702	0.264
0.737	0.497
0.779	0.522
0.797	0.247
0.800	0.410
0.838	0.535
0.849	0.435
0.866	0.548
0.868	0.310
0.879	0.573
0.898	0.486
0.917	0.524
0.947	0.399
0.951	0.549
0.979	0.593
1.000	0.412
1.047	0.676
1.047	0.613
1.047	0.556
1.080	0.732
1.138	0.827];
units.LWd_low = {'cm', 'mg'}; label.LWd_low = {'length', 'dry weight','low food'};  
bibkey.LWd_low = 'GliwWurs2010';
comment.LWd_low = 'Data at <0.5 mug chlorophyll/L';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 8 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'LWd_high','LWd_low'}; subtitle1 = {'Data at high, loow food'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

% %% Discussion points
% D1 = '';   
% metaData.discussion = struct('D1',D1);

% %% Facts
% F1 = '';
% metaData.bibkey.F1 = ''; 
% metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = 'GVWB'; % Cat of Life
metaData.links.id_ITIS = '83691'; % ITIS
metaData.links.id_EoL = '1020243'; % Ency of Life
metaData.links.id_Wiki = 'Artemia_salina'; % Wikipedia
metaData.links.id_ADW = 'Artemia_salina'; % ADW
metaData.links.id_Taxo = '33064'; % Taxonomicon
metaData.links.id_WoRMS = '480246'; % WoRMS

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Artemia_salina}}';
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
bibkey = 'WurtGliw2001'; type = 'Article'; bib = [ ... 
'author = {Wayne A. Wurtsbaugh and Z. Maciej Gliwicz}, ' ... 
'year = {2001}, ' ...
'title = {Limnological control of brine shrimp population dynamics and cyst production in the {G}reat {S}alt {L}ake, {U}tah}, ' ...
'journal = {Hydrobiologia}, ' ...
'volume = {466}, ' ...
'pages = {119–132}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{https://animaldiversity.org/accounts/Artemia_salina/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'algova'; type = 'Misc'; bib = ...
'howpublished = {\url{https://blog.algova.com/2018/01/04/artemia-nauplii-and-egg-sizes/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'KulaKath2003'; type = 'techreport'; bib = [ ... 
'author = {S. Kulaseurapandian and M. Kathirvel}, ' ... 
'year = {2003}, ' ...
'title = {Biology and distribution of Artemia}, ' ...
'institute = {Central institute of Brackishwater Aquaculb.ure, Chennai}, ' ...
'howpublished = {\url{http://www.ciba.res.in/Books/ciba0170.pdf}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'GliwWurs2010'; type = 'Article'; bib = [ ... 
'author = {Z. Maciej Gliwicz and Wayne A. Wursbaugh and Ewa Szymanska}, ' ... 
'year = {2010}, ' ...
'title = {Absence of predation eliminates coexistence: experience from the fish–zooplankton interface}, ' ...
'journal = {Hydrobiologia}, ' ...
'volume = {653}, ' ...
'pages = {103–117}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

