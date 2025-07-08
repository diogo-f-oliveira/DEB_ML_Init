function [data, auxData, metaData, txtData, weights] = mydata_Zygodontomys_brevicauda
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Rodentia'; 
metaData.family     = 'Cricetidae';
metaData.species    = 'Zygodontomys_brevicauda'; 
metaData.species_en = 'Common cane mouse'; 

metaData.ecoCode.climate = {'Aw'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'0iTg'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {'TT'};
metaData.ecoCode.food    = {'bxM', 'xiHs'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(36.2); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2021 11 13];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University, Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 14];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 14];

%% set data
% zero-variate data

data.tg = 25;    units.tg = 'd';     label.tg = 'gestation time';             bibkey.tg = 'ADW';   
  temp.tg = C2K(36.2);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 10;    units.tx = 'd';     label.tx = 'time since birth at weaning'; bibkey.tx = 'ADW';   
  temp.tx = C2K(36.2);  units.temp.tx = 'K'; label.temp.tx = 'temperature';   
  comment.tx = '9-11 d';
data.tp = 25.6;  units.tp = 'd';     label.tp = 'time since birth at puberty for female'; bibkey.tp = 'Agui1985';
  temp.tp = C2K(36.2); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tpm = 42.3;  units.tpm = 'd';     label.tpm = 'time since birth at puberty for male'; bibkey.tpm = 'Agui1985';
  temp.tpm = C2K(36.2); units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
data.am = 5*365;    units.am = 'd'; label.am = 'life span';                bibkey.am = 'ADW';   
  temp.am = C2K(36.2); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Wwb = 3.5;   units.Wwb = 'g';     label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'ADW';
data.Wwi = 50;     units.Wwi = 'g';  label.Wwi = 'ultimate wet weight for females';     bibkey.Wwi = 'Agui1985';
data.Wwim = 55;     units.Wwim = 'g';  label.Wwim = 'ultimate wet weight for males';     bibkey.Wwim = 'Agui1985';

data.Ri  = 5/365;  units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'ADW';   
  temp.Ri = C2K(36.2); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '1-11 pups per litter; 1 litter per yr assumed';

% uni-variate data
% time-weight
data.tWw_f = [ ... % time since birth (d), weight (g)
1.036	3.302
1.942	3.598
2.970	4.193
4.056	3.510
5.114	4.557
5.931	5.830
6.958	5.824
8.074	5.141
9.013	7.166
10.102	8.363
11.039	8.508
11.916	9.254
12.975	10.602
13.970	10.145
14.938	11.041
15.969	14.043
16.966	14.263
17.938	17.716
18.870	15.455
20.021	17.629
20.898	18.526
21.921	16.114
23.014	19.942
23.890	20.012
24.946	19.329
25.885	21.053
26.912	21.198
7.266	4.300
14.693	8.488
35.060	21.500
35.481	26.247
42.017	25.122
49.122	29.649
56.123	29.542
77.127	42.555
83.248	36.233
98.030	50.709
104.518	53.653
118.895	35.361];
units.tWw_f = {'d', 'g'};  label.tWw_f = {'time since birth', 'wet weight', 'female'};  
temp.tWw_f  = C2K(36.3);  units.temp.tWw_f = 'K'; label.temp.tWw_f = 'temperature';
bibkey.tWw_f = 'Agui1985';
comment.tWw_f = 'Data for females';
%
data.tWw_m = [ ... % time since birth (d), weight (g)
0.961	3.245
2.017	4.075
2.922	4.374
3.919	4.064
4.975	4.894
5.910	5.649
6.996	6.404
7.963	5.713
8.957	7.076
9.924	6.995
10.919	7.902
11.884	8.504
12.879	9.715
13.906	9.709
14.870	10.996
15.772	13.729
16.859	13.646
17.790	17.139
18.850	15.079
19.840	19.332
20.861	23.129
21.865	18.484
22.859	20.151
23.854	21.210
24.942	20.367
25.846	21.654
26.811	22.713
14.066	7.696
21.763	15.952
28.554	20.139
35.802	26.021
42.430	30.547
49.715	33.265
56.599	29.655
63.537	34.859
70.137	41.758
76.124	46.622
84.538	48.098
97.844	52.969
105.124	56.139
112.016	51.852
119.264	57.734
125.467	57.853];
units.tWw_m = {'d', 'g'};  label.tWw_m = {'time since birth', 'wet weight', 'male'};  
temp.tWw_m  = C2K(36.3);  units.temp.tWw_m = 'K'; label.temp.tWw_m = 'temperature';
bibkey.tWw_m = 'Agui1985';
comment.tWw_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tWw_f = 5 * weights.tWw_f;
weights.tWw_m = 5 * weights.tWw_m;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
data.psd.t_0 = 0;  units.psd.t_0 = 'd'; label.psd.t_0 = 'time at start development';
weights.psd.t_0 = 0.1;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tWw_f','tWw_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} and E_Hp only';
D2 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Links
metaData.links.id_CoL = '5DB65'; % Cat of Life
metaData.links.id_ITIS = '633402'; % ITIS
metaData.links.id_EoL = '1180180'; % Ency of Life
metaData.links.id_Wiki = 'Zygodontomys_brevicauda'; % Wikipedia
metaData.links.id_ADW = 'Zygodontomys_brevicauda'; % ADW
metaData.links.id_Taxo = '88747'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '13000978'; % MSW3
metaData.links.id_AnAge = ''; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Zygodontomys_brevicauda}}';
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
bibkey = 'Agui1985'; type = 'Article'; bib = [ ...  
'doi = {10.1515/mamm.1985.49.1.75}, ' ...
'author = {Aguilera, M. M.}, ' ...
'year = {1985}, ' ...
'title  = {Growth and reproduction in \emph{Zygodontomys microtinus} ({R}odentia, {C}ricetidae) from {V}enezuela in a laboratory colony}, ' ...
'journal = {Mammalia}, ' ...
'volume = {49(1)}, ' ...
'pages = {75-83}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{https://animaldiversity.org/accounts/Zygodontomys_brevicauda/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

