function [data, auxData, metaData, txtData, weights] = mydata_Enteroctopus_dofleini
%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Cephalopoda'; 
metaData.order      = 'Octopoda'; 
metaData.family     = 'Enteroctopodidae';
metaData.species    = 'Enteroctopus_dofleini'; 
metaData.species_en = 'Giant Pacific octopus'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MPN'};
metaData.ecoCode.habitat = {'0jMc', 'jiMb'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'Os'};

metaData.T_typical  = C2K(10.5); % K, body temp
metaData.data_0     = {'am'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ni'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2021 03 27];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2021 03 27]; 

%% set data
% zero-variate data

data.am = 4*365;     units.am = 'd';    label.am = 'life span';                bibkey.am = 'Wiki';   
  temp.am = C2K(10.5);     units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = '3-5 yr';
  
data.Wwb = 0.03; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'Wiki';
data.Wwp = 21e3;    units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';   bibkey.Wwp = 'guess';
  comment.Wwp = 'Robi1983: 12.5 kg for male';
data.Wwi = 146e3;   units.Wwi = 'g';   label.Wwi = 'wet weight at 470 d'; bibkey.Wwi = {'Wiki','sealifebase'};
  comment.Wwi = 'seabase gives 272 kg, wiki 71 kg';

data.Ni  = 5e4; units.Ni  = '#';   label.Ni  = 'cum reprod at death';     bibkey.Ni  = 'ADW';   
  temp.Ni = C2K(10.5);    units.temp.Ni = 'K'; label.temp.Ni = 'temperature';
 
% uni-variate data
% t-W data
data.tW = [ ... % time (d), wet weight (g)
3.843	1587.298
110.407	3492.781
175.461	4167.221
178.555	4625.363
189.973	4911.640
203.736	4444.103
219.419	4811.614
243.083	6721.501
251.372	8765.375
252.786	6507.062
261.008	6168.031
261.447	6878.489
265.377	6416.432
271.124	6622.258
281.551	7577.985
284.180	7283.877
285.352	6906.970
296.942	9743.319
298.175	7192.464
298.485	7693.964
298.795	8195.463
303.335	10993.935
304.259	7941.581
308.912	8649.690
310.963	9693.697
311.127	7686.917
314.728	11238.421
316.219	9105.483
317.262	8519.617
333.773	10224.461
338.323	10765.403
338.875	9385.496
338.953	9510.871
349.354	10424.806
353.455	12512.821
354.326	9376.884
355.463	11215.715
356.558	10713.432
364.072	11503.558
366.210	10415.410
377.050	12039.802
377.990	11286.770
380.505	13083.027
380.635	13291.985
382.617	11953.087
386.046	12954.520
386.805	11908.947
386.986	12201.488
394.345	12740.864
400.584	13740.731
401.834	13489.198
407.039	12817.401
408.960	13652.450
409.245	14112.158
420.585	14273.060
432.417	15228.004
448.324	18229.170
469.126	20057.040];
units.tW   = {'d', 'g'};  label.tW = {'time', 'wet weight'};  
temp.tW    = C2K(10.5);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'Robi1983';
comment.tW = 'Data for Jan - June';

%% set weights for all real data
weights = setweights(data, []);
weights.tW = 5 * weights.tW;
weights.am = 5 * weights.am;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.v = 5 * weights.psd.v;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'semelparous: death at first spawning, female ventilates eggs and dies after hatching; No food intake during this period';
metaData.bibkey.F1 = 'Wiki'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '39Y4T'; % Cat of Life
metaData.links.id_ITIS = '557227'; % ITIS
metaData.links.id_EoL = '486386'; % Ency of Life
metaData.links.id_Wiki = 'Enteroctopus_dofleini'; % Wikipedia
metaData.links.id_ADW = 'Enteroctopus_dofleini'; % ADW
metaData.links.id_Taxo = '78547'; % Taxonomicon
metaData.links.id_WoRMS = '342305'; % WoRMS
metaData.links.id_molluscabase = '342305'; % MolluscaBase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Enteroctopus_dofleini}}';
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
bibkey = 'Robi1983'; type = 'phdthesis'; bib = [ ... 
'author = {S. M. C. Robinson}, ' ... 
'year = {1983}, ' ...
'title = {Growth of the giant {P}acific octopus \emph{Octopus dofleini martini} on the west coast of {B}ritish {C}olumbia}, ' ...
'school = {Simon Fraser University}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{https://animaldiversity.org/accounts/Enteroctopus_dofleini/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'sealifebase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.sealifebase.ca/summary/Enteroctopus-dofleini.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

