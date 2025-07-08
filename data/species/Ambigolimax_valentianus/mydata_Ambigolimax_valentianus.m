function [data, auxData, metaData, txtData, weights] = mydata_Ambigolimax_valentianus

%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Gastropoda'; 
metaData.order      = 'Pulmonata'; 
metaData.family     = 'Limacidae';
metaData.species    = 'Ambigolimax_valentianus'; 
metaData.species_en = 'Slug'; 

metaData.ecoCode.climate = {'Cfb', 'Dfb'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iTf', '0iTi', '0iTg'};
metaData.ecoCode.embryo  = {'Tt'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biHl'};
metaData.ecoCode.gender  = {'Hh'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(18.3); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Wwb'; 'Wwp'; 'Ni'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2017 02 10];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'sta@akvaplan.niva.no'}; 
metaData.date_acc    = [2017 02 10]; 

%% set data
% zero-variate data

data.ab = 21;    units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'HommKien2001';   
  temp.ab = C2K(18.3);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = '15 till 20 d, but temp is unkown';
data.tp = 153;   units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'ipm';
  temp.tp = C2K(18.3);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'inspection gives 2 yr for natural populations';
data.am = 2*365; units.am = 'd';    label.am = 'life span';                bibkey.am = 'HommKien2001';   
  temp.am = C2K(18.3);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 3.3e-3;  units.Wwb = 'g'; label.Wwb = 'wet weight at birth'; bibkey.Wwb = 'HommKien2001';
data.Wwp = 1;       units.Wwp = 'g'; label.Wwp = 'wet weight at puberty'; bibkey.Wwp = 'HommKien2001';

data.Ni  =1510; units.Ni  = '#'; label.Ni  = 'cum number of eggs at 600 d';  bibkey.Ni  = 'HommKien2001';   
  temp.Ni = C2K(18.3);  units.temp.Ni = 'K'; label.temp.Ni = 'temperature';
 
% uni-variate data
% time-weight
data.tW = [ ... % time since birth (d), wet weight (mg)
1.273	3.344
3.181	3.880
6.363	4.732
6.999	5.491
6.999	9.168
10.180	6.697
10.180	12.762
13.998	18.362
17.815	28.225
21.633	45.592
25.451	66.690
30.541	95.950
40.085	168.349
61.082	254.534
71.898	315.575
88.441	384.838
103.712	454.037
120.891	601.415
134.252	721.388
147.614	865.293
155.249	1037.906
175.610	1090.692
181.336	1165.272
213.786	1468.811
220.785	1444.723
236.691	1791.191
250.689	1791.191
264.687	1978.016
272.322	2113.271
288.865	2257.774
320.042	2534.835
333.404	2493.265
367.126	2893.346
378.579	3142.729
382.397	3091.190
388.759	3195.129
420.573	3142.729
463.839	3357.626
488.653	3832.507
536.373	3587.217
559.915	3302.562
573.277	2941.587
583.457	3587.217
603.181	3587.217
614.634	3142.729
628.632	3040.496];
data.tW(:,2) = data.tW(:,2)/1e3; % convert mg to g
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(18.3);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'HommKien2001';
comment.tW = 'Isolated slugs; light:dark = 16:8 h, temp: 19:17 C';

%% set weights for all real data
weights = setweights(data, []);
weights.tW = 10 * weights.tW;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Kappa_R = 0.95/2 because of hermaphroditism, self fertilization does occur';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'This species is hermaphroditic';
metaData.bibkey.F1 = 'Wiki'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = 'CL6W'; % Cat of Life
metaData.links.id_ITIS = '77313'; % ITIS
metaData.links.id_EoL = '40043389'; % Ency of Life
metaData.links.id_Wiki = 'Ambigolimax_valentianus'; % Wikipedia
metaData.links.id_ADW = 'Limax_valentianus'; % ADW
metaData.links.id_Taxo = '5242685'; % Taxonomicon
metaData.links.id_WoRMS = '819990'; % WoRMS
metaData.links.id_molluscabase = '819990'; % molluscabase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Ambigolimax_valentianus}}';
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
bibkey = 'HommKien2001'; type = 'Article'; bib = [ ... 
'author = {Hommay, G. and Kienlen, J. C. and Gertz, C. and Hill, A.}, ' ... 
'year = {2001}, ' ...
'title = {Growth and reproduction of the slug \emph{Limax valentianus} {F}erussac in experimental conditions}, ' ...
'journal = {J. Moll. Stud.}, ' ...
'volume = {67}, ' ...
'pages = {191-207}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ipm'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.ipm.msu.edu/uploads/files/Forecasting_invasion_risks/vineyardSnail.pdf}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];