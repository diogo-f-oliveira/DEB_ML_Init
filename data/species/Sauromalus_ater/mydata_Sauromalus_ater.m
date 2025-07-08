function [data, auxData, metaData, txtData, weights] = mydata_Sauromalus_ater

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Squamata'; 
metaData.family     = 'Iguanidae';
metaData.species    = 'Sauromalus_ater'; 
metaData.species_en = 'Common chuckwalla';  

metaData.ecoCode.climate = {'BWh'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iTd'};
metaData.ecoCode.embryo  = {'Tnt'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biH'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(32); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Ri'}; 
metaData.data_1     = {'L-dL_f'; 'L-Ww'}; 

metaData.COMPLETE = 2.6; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2023 01 14];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 01 14];

%% set data
% zero-variate data

data.ab = 35;  units.ab = 'd';    label.ab = 'age at birth';         bibkey.ab = 'ADW';   
  temp.ab = C2K(39); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 9.3*365;  units.am = 'd';    label.am = 'life span';            bibkey.am = 'AnAge';   
  temp.am = C2K(23); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 7.0;    units.Lb  = 'cm';  label.Lb  = 'SVL at hatching';      bibkey.Lb  = 'John1965';  
data.Lp  = 13.5;    units.Lp  = 'cm';  label.Lp  = 'SVL at puberty';      bibkey.Lp  = 'John1965';  
data.Lpm  = 12.5;    units.Lpm  = 'cm';  label.Lpm  = 'SVL at puberty males';      bibkey.Lpm  = 'John1965';  
data.Li  = 18.6;     units.Li  = 'cm';  label.Li  = 'ultimate SVL';         bibkey.Li  = 'John1965';  
data.Lim  = 19.9;     units.Lim  = 'cm';  label.Lim  = 'ultimate SVL males';         bibkey.Lim  = 'John1965';  

data.Wwb  = 7.5;    units.Wwb  = 'g';  label.Wwb  = 'wet weight at hatching';      bibkey.Wwb  = 'ADW';  
  comment.Wwb = '6-9.6 g';

data.Ri  = 8/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'ADW';   
  temp.Ri = C2K(23);   units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% univariate data
% length-weight
data.LW_f = [ ... % SVL (mm), wet weight (g) 
7.895	24.406
8.134	23.205
9.067	25.207
9.577	34.421
10.620	46.438
10.813	64.063
11.018	41.230
11.096	36.824
11.476	56.052
11.694	68.469
11.849	56.052
12.552	83.691
12.846	86.495
12.921	73.677
13.115	94.506
13.243	80.486
13.321	75.279
13.461	93.305
13.576	114.535
13.683	116.939
13.830	82.489
14.151	86.094
14.202	79.285
14.318	106.123
14.505	106.123
14.767	96.109
15.067	114.134
15.072	126.152
15.109	154.192
15.271	161.001
15.306	112.933
15.391	126.152
15.407	167.411
15.433	165.408
15.442	190.243
15.678	109.728
15.723	158.197
15.807	168.212
15.946	182.632
15.954	134.564
16.111	127.754
16.126	167.010
16.133	116.538
16.135	189.442
16.247	134.564
16.366	166.609
16.637	180.629
17.020	207.868
17.405	167.411
17.789	197.854
18.308	162.203
18.312	243.119
18.370	254.735
18.581	249.127];   
units.LW_f = {'cm', 'g'};     label.LW_f = {'SVL', 'wet weight'};  
bibkey.LW_f = 'John1965';
comment.LW_f = 'Data for females'; 
% males
data.LW_m = [ ... % SVL (mm), wet weight (g) 
11.293	65.265
12.146	67.268
12.934	107.325
13.702	96.910
13.923	117.740
14.862	134.964
14.868	80.486
14.897	156.996
15.129	136.567
15.130	138.970
15.453	148.584
15.472	127.754
15.563	156.595
15.565	163.004
15.782	173.019
16.039	148.584
16.183	177.024
16.184	179.428
16.365	165.007
16.369	174.621
16.399	185.436
16.400	188.240
16.414	153.391
16.529	175.021
16.563	194.650
16.646	203.062
16.798	184.235
16.803	196.652
16.913	204.263
17.025	218.684
17.117	180.229
17.450	216.280
17.806	242.318
17.983	216.681
18.318	257.940
18.320	263.949
18.420	246.724
19.035	252.732
19.042	270.758
19.264	223.491
19.281	268.755
19.338	279.971
19.802	237.511];   
units.LW_m = {'cm', 'g'};     label.LW_m = {'SVL', 'wet weight'};  
bibkey.LW_m = 'John1965';
comment.LW_m = 'Data for males'; 

% length-change in length
data.LdL_SMf = [ ... % initial SVL (cm), change in SVL (cm/d)
12.60471	0.00220
13.93543	0.00111
14.21902	0.00001
14.32810	0.00001
15.11344	0.00083];
units.LdL_SMf  = {'cm', 'cm/d'};  label.LdL_SMf = {'SVL', 'change in SVL'};  
temp.LdL_SMf   = C2K(23);  units.temp.LdL_SMf = 'K'; label.temp.LdL_SMf = 'temperature';
bibkey.LdL_SMf = 'SullKwia2004'; comment.LdL_SMf = 'females from South Mountains, Phoenix';
%
data.LdL_SMm = [ ... % initial SVL (cm), change in SVL (cm/d)
14.48080	0.00343
15.46248	0.00097
15.78970	0.00152
15.78970	0.00152
16.22600	0.00259
16.66230	0.00167
18.16754	0.00110
19.89093	0.00042
20.89442	0.00001];
units.LdL_SMm  = {'cm', 'cm/d'};  label.LdL_SMm = {'SVL', 'change in SVL'};  
temp.LdL_SMm   = C2K(23);  units.temp.LdL_SMm = 'K'; label.temp.LdL_SMm = 'temperature';
bibkey.LdL_SMm = 'SullKwia2004'; comment.LdL_SMm =  'males from South Mountains, Phoenix';
%
data.LdL_LOf = [ ... % initial SVL (cm), change in SVL (cm/d)
10.11780	0.00265
14.15358	0.00014
14.56806	0.00090
14.76440	0.00118
15.09162	0.00028
15.65881	0.00009
15.96422	0.00014
16.44415	0.00001
16.77138	0.00019];
units.LdL_LOf  = {'cm', 'cm/d'};  label.LdL_LOf = {'SVL', 'change in SVL'};  
temp.LdL_LOf   = C2K(23);  units.temp.LdL_LOf = 'K'; label.temp.LdL_LOf = 'temperature';
bibkey.LdL_LOf = 'SullKwia2004'; comment.LdL_LOf = 'females from Lookout Mountain, Phoenix';
%
data.LdL_LOm = [ ... % initial SVL (cm), change in SVL (cm/d)
12.60471	0.00220
13.95724	0.00111
14.28447	0.00001
15.09162	0.00082];
units.LdL_LOm  = {'cm', 'cm/d'};  label.LdL_LOm = {'SVL', 'change in SVL'};  
temp.LdL_LOm   = C2K(23);  units.temp.LdL_LOm = 'K'; label.temp.LdL_LOm = 'temperature';
bibkey.LdL_LOm = 'SullKwia2004'; comment.LdL_LOm =  'males from Lookout Mountain, Phoenix';

%% set weights for all real data
weights = setweights(data, []);
weights.Li = 5 * weights.Li;
weights.Lim = 5 * weights.Lim;

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
set2 = {'LdL_SMf','LdL_SMm'}; subtitle2 = {'Data for females, males, South mountains'};
set3 = {'LdL_LOf','LdL_LOm'}; subtitle3 = {'Data for females, males, Loukout mountain'};
metaData.grp.sets = {set1,set2,set3};
metaData.grp.subtitle = {subtitle1,subtitle2,subtitle3}; 

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
D2 = 'Mean times between captures in LdL data is 2.5 yr, active between mar and aug, so mean temp of 35 C reduced to 23 C to correct of winter torpor';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Links
metaData.links.id_CoL = '79RLW'; % Cat of Life
metaData.links.id_ITIS = '564596'; % ITIS
metaData.links.id_EoL = '790754'; % Ency of Life
metaData.links.id_Wiki = 'Sauromalus_ater'; % Wikipedia
metaData.links.id_ADW = 'Sauromalus_ater'; % ADW
metaData.links.id_Taxo = '572094'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_ReptileDB = 'genus=Sauromalus&species=ater'; % ReptileDB
metaData.links.id_AnAge = 'Sauromalus_ater'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Sauromalus_ater}}';   
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
bibkey = 'John1965'; type = 'Article'; bib = [ ... 
'author = {Shelly R. Johnson}, ' ...
'title = {An Ecological Study of the Chuckwalla, \emph{Sauromalus obesus} {B}aird, in the Western {M}ojave Desert}, ' ...
'journal = {The American Midland Naturalist}, ' ...
'volume = {73(1)}, ' ...
'pages = {1-29}, ' ...
'year = {1965}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'SullKwia2004'; type = 'Article'; bib = [ ... 
'author = {Brian K. Sullivan and Matthew A. Kwiatkowski and Paul S. Hamilton}, ' ...
'title = {GROWTH IN SONORAN DESERT POPULATIONS OF THE COMMON CHUCKWALLA (\emph{Sauromalus obesus})}, ' ...
'journal = {Western North American Naturalist}, ' ...
'volume = {64(1)}, ' ...
'pages = {137–140}, ' ...
'year = {2004}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{https://genomics.senescence.info/species/entry.php?species=Sauromalus_ater}}';   
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{https://animaldiversity.org/accounts/Sauromalus_ater/}}';   
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
