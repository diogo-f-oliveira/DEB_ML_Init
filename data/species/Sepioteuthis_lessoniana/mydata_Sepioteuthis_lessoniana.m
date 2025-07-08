function [data, auxData, metaData, txtData, weights] = mydata_Sepioteuthis_lessoniana

%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Cephalopoda'; 
metaData.order      = 'Myopsida'; 
metaData.family     = 'Loliginidae';
metaData.species    = 'Sepioteuthis_lessoniana'; 
metaData.species_en = 'Bigfin reef squid'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MISE'};
metaData.ecoCode.habitat = {'0iMr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'Os'};

metaData.T_typical  = C2K(28); % K, body temp
metaData.data_0     = {'am'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ni'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2021 03 13];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 03 27];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 03 27];

%% set data
% zero-variate data

data.am = 210;   units.am = 'd';    label.am = 'life span for female';      bibkey.am = 'Peel2000';   
  temp.am = C2K(28); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb  = 0.22; units.Wwb  = 'g'; label.Wwb  = 'wet weight at birth'; bibkey.Wwb  = 'Peel2000';
  comment.Wwb = 'based on egg diameter of 5-10 mm: pi/6*0.75^3';
data.Wwp  = 100; units.Wwp  = 'g'; label.Wwp  = 'wet weight at puberty'; bibkey.Wwp  = 'Peel2000';
data.Wwi  = 1000; units.Wwi  = 'g'; label.Wwi  = 'wet weight at death'; bibkey.Wwi  = 'Peel2000';

data.Ni  = 300; units.Ni  = '#';      label.Ni  = 'cum reprod at death';      bibkey.Ni  = 'Peel2000';   
  temp.Ni = C2K(28); units.temp.Ni = 'K'; label.temp.Ni = 'temperature';
  
% uni-variate data

% time-weight
data.tW_f = [ ... % time since birth (month), wet weight (g)
5.340	0.060
8.738	0.084
10.680	0.102
12.136	0.116
15.534	0.168
18.447	0.177
18.932	0.182
21.359	0.205
24.272	2.152
27.184	2.180
30.583	2.213
34.466	4.170
40.291	4.225
79.612	44.910
110.680	89.354
111.165	47.132
118.447	329.352
137.864	177.907
141.748	191.380
148.544	435.207
149.029	417.937
150.000	314.299
151.456	266.329
157.767	341.245
160.680	444.920
162.136	312.497
164.078	515.970
164.079	527.486
164.563	550.524
165.049	429.607
169.903	373.991
173.301	377.863
173.786	471.917
173.787	510.305
175.728	961.379
177.184	539.128
178.155	335.683
183.010	740.720
185.437	496.981];
units.tW_f   = {'d', 'g'};  label.tW_f = {'time since birth', 'wet weight', 'female'};  
temp.tW_f    = C2K(28);  units.temp.tW_f = 'K'; label.temp.tW_f = 'temperature';
bibkey.tW_f = 'Peel2000';
comment.tW_f = 'data for females off Brisbane'; 
%
data.tW_m = [ ... % time since birth (month), weight (g)
121.845	156.640
132.039	218.158
134.466	143.325
135.437	223.949
135.922	254.663
138.835	337.225
139.806	465.833
140.777	375.631
142.233	421.710
142.234	277.757
148.544	170.332
149.029	210.643
151.456	512.010
151.457	300.878
152.913	329.682
153.398	360.397
153.883	350.805
155.825	425.680
156.311	258.698
157.282	759.667
158.252	504.398
160.194	410.367
162.621	295.227
169.417	535.215
170.388	512.192
170.389	354.802
171.845	633.127
173.786	542.935
175.243	861.567
175.728	527.598
181.068	512.294
186.893	790.661
186.894	729.241
186.895	564.174
189.320	552.681
190.291	982.632
202.913	921.333];
units.tW_m   = {'d', 'g'};  label.tW_m = {'time since birth', 'wet weight', 'male'};  
temp.tW_m    = C2K(28);  units.temp.tW_m = 'K'; label.temp.tW_m = 'temperature';
bibkey.tW_m = 'Peel2000';
comment.tW_m = 'data for males'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tW_f = 3 * weights.tW_f; 
weights.tW_m = 3 * weights.tW_m; 
weights.Wwp = 10 * weights.Wwp; 

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tW_f','tW_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed not to differ from females';
D2 = 'mod_1: males have equal state variables as females at b';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Facts
F1 = 'Programmed death, not by ageing';
metaData.bibkey.F1 = 'Wiki'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6YFXW'; % Cat of Life
metaData.links.id_ITIS = '556118'; % ITIS
metaData.links.id_EoL = '491773'; % Ency of Life
metaData.links.id_Wiki = 'Sepioteuthis_lessoniana'; % Wikipedia
metaData.links.id_ADW = 'Sepioteuthis_lessoniana'; % ADW
metaData.links.id_Taxo = '157886'; % Taxonomicon
metaData.links.id_WoRMS = '220317'; % WoRMS
metaData.links.id_molluscabase = '220317'; % molluscabase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Sepioteuthis_lessoniana}}';
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
bibkey = 'Peel2000'; type = 'phdthesis'; bib = [ ... 
'author = {Gretta Peel}, ' ... 
'year = {2000}, ' ...
'title = {Camparative life history of tropical and temperate \emph{Seriotheusis} squids in {A}ustralian waters}, ' ...
'school = {James Cook University}, ' ...
'howpublished = {\url{http://eprints.jcu.edu.au/24094}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'sealifebase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.sealifebase.ca/summary/Sepioteuthis-lessoniana.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

