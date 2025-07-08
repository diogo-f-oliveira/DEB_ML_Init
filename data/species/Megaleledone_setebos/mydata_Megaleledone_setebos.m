function [data, auxData, metaData, txtData, weights] = mydata_Megaleledone_setebos
%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Cephalopoda'; 
metaData.order      = 'Octopoda'; 
metaData.family     = 'Megaleledonidae';
metaData.species    = 'Megaleledone_setebos'; 
metaData.species_en = 'Giant Antarctic octopus'; 

metaData.ecoCode.climate = {'ME'};
metaData.ecoCode.ecozone = {'MS'};
metaData.ecoCode.habitat = {'0iMb'};
metaData.ecoCode.embryo  = {'Mb'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'Os'};

metaData.T_typical  = C2K(4); % K, body temp
metaData.data_0     = {'am'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ni'}; 
metaData.data_1     = {'L-Ww'; 't-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2021 03 25];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2021 03 25]; 

%% set data
% zero-variate data

data.am = 910;   units.am = 'd';    label.am = 'life span for female';        bibkey.am = 'SchwHovi2019';   
  temp.am = C2K(4); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb  = 3.8e-4;  units.Wwb  = 'g'; label.Wwb  = 'wet weight at birth';     bibkey.Wwb  = 'SchwHovi2019';
  comment.Wwb = 'based on egg length of 1-2 mm and assumed width of 0.7 mm : pi/6*0.15*0.07^2';
data.Wwp  = 46;  units.Wwp  = 'g'; label.Wwp  = 'wet weight at puberty';     bibkey.Wwp  = 'SchwHovi2019';
data.Wwi  = 6200;  units.Wwi  = 'g'; label.Wwi  = 'wet weight at 910 d';     bibkey.Wwi  = 'SchwHovi2019';
  comment.Wwi = 'reports exist of 18.3 kg';

data.Ni  = 1e4; units.Ni  = '#';  label.Ni  = 'fecundity';    bibkey.Ni  = 'guess';   
  temp.Ni = C2K(4);  units.temp.Ni = 'K'; label.temp.Ni = 'temperature';
  
% uni-variate data

% length-weight
data.LWw_f = [ ... % mantle length (cm), wet weight (g)
1.646	55.861
2.094	84.280
2.467	83.737
3.064	82.870
3.661	169.210
4.632	196.870
5.079	79.941
5.154	225.180
5.528	224.637
7.395	512.620
9.038	684.651
12.924	1347.608
15.771	2855.097];
units.LWw_f   = {'d', 'g'};  label.LWw_f = {'mantle length', 'wet weight', 'female'};  
bibkey.LWw_f = 'SchwHovi2019';
comment.LWw_f = 'Data for females';
%
data.LWw_m = [ ... % mantle length (cm), wet weight (g)
1.049	56.729
1.646	143.069
2.318	113.024
2.840	112.265
3.810	52.716
4.333	139.165
5.900	165.956
6.573	252.188
6.873	455.241
7.320	454.590
8.591	743.440
10.234	915.471
12.327	1290.337
13.376	1957.415
14.571	2042.888
15.104	3408.393
20.266	5116.007
23.359	9704.533];
units.LWw_m   = {'d', 'g'};  label.LWw_m = {'mantle length', 'wet weight', 'male'};  
bibkey.LWw_m = 'SchwHovi2019';
comment.LWw_m = 'Data for males';

% time-weight
data.tWw = [ ... % time since birth (d), wet weight (g)
101.175	26.923
117.056	38.462
124.992	38.462
144.834	38.462
152.763	76.923
162.676	115.385
174.580	115.385
182.517	115.385
190.453	115.385
200.374	115.385
210.279	192.308
216.239	153.846
224.176	153.846
240.049	153.846
246.009	115.385
251.961	115.385
267.834	115.385
277.732	230.769
291.621	230.769
297.596	115.385
505.853	500.000
523.665	730.769
541.522	730.769
614.759	1615.385
668.262	1961.538
678.312	1307.692
717.666	2961.538
749.321	3423.077
771.398	2153.846
790.629	5230.769
810.737	3884.615
907.517	6115.385];
units.tWw   = {'d', 'g'};  label.tWw = {'time since birth', 'wet weight'};  
temp.tWw    = C2K(4);  units.temp.tWw = 'K'; label.temp.tWw = 'temperature';
bibkey.tWw = 'SchwHovi2019';

%% set weights for all real data
weights = setweights(data, []);
weights.tWw = 5 * weights.tWw;
%weights.Wwb = 5 * weights.Wwb;
%weights.Wwp = 5 * weights.Wwp;
weights.Ni = 5 * weights.Ni;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
%weights.psd.p_M = 5 * weights.psd.p_M;
%weights.psd.v = 3 * weights.psd.v;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'LWw_f','LWw_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed not to differ from females';
D2 = 'time-weight data assumes that growth increments of beaks are daily, which is speculative for cold-water species (SchwHovi2019)';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Facts
F1 = 'Programmed death, not by ageing';
metaData.bibkey.F1 = 'Wiki'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '737PS'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '594184'; % Ency of Life
metaData.links.id_Wiki = 'Megaleledone_setebos'; % Wikipedia
metaData.links.id_ADW = 'Megaleledone_senoi'; % ADW
metaData.links.id_Taxo = '1126287'; % Taxonomicon
metaData.links.id_WoRMS = '325324'; % WoRMS
metaData.links.id_molluscabase = '325324'; % molluscabase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Muusoctopus}}';
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
bibkey = 'SchwHovi2019'; type = 'article'; bib = [ ... 
'doi = {10.1371/journal.pone.0219694}, ' ...
'author = {Richard Schwarz and Henk-Jan Hoving and Christoph Noever and Uwe Piatkowski}, ' ... 
'year = {2019}, ' ...
'title = {Life histories of Antarctic incirrate octopods (Cephalopoda: Octopoda)}, ' ...
'journal = {Plos One}, ' ...
'volume = {14(7)}, ' ...
'pages = {e0219694}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'sealifebase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.sealifebase.ca/summary/Muusoctopus-rigbyae.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

