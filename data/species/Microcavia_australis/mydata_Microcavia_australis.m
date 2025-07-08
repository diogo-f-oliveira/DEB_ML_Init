function [data, auxData, metaData, txtData, weights] = mydata_Microcavia_australis
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Rodentia'; 
metaData.family     = 'Caviidae';
metaData.species    = 'Microcavia_australis'; 
metaData.species_en = 'Southern mountain cavy'; 

metaData.ecoCode.climate = {'BSh','BSk','BWk','Cwa'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'0iTg'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiH'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(39); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2021 11 19];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2021 11 19]; 

%% set data
% zero-variate data

data.tg = 54;    units.tg = 'd';    label.tg = 'gestation time';                bibkey.tg = 'Wiki';   
  temp.tg = C2K(39);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 21;    units.tx = 'd';    label.tx = 'time since birth at weaning';   bibkey.tx = 'Wiki';   
  temp.tx = C2K(39);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 45;    units.tp = 'd';    label.tp = 'time since birth at puberty female';  bibkey.tp = 'Wiki';
  temp.tp = C2K(39);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = '40-50 d';
data.am = 6*365; units.am = 'd';    label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(39);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 30; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';              bibkey.Wwb = 'Wiki';
data.Wwi = 326;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';  bibkey.Wwi = 'Wiki';

data.Ri  = 5*2.5/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'Wiki';   
  temp.Ri = C2K(39);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '1-5 pups per litter; 5 litters per yr assumed';
   
% univariate data
% time-weight
data.tW = [ ... % time since birth (d), weight (g)
2.227	20.868
4.454	37.198
10.022	46.263
27.282	108.845
30.065	87.062
45.098	152.371
47.882	132.402
54.563	171.410
58.461	143.273
60.131	128.751
60.131	119.676
62.915	162.321
62.915	162.321
63.472	162.320
83.515	167.729
87.969	158.647
89.083	166.812
89.640	200.386
115.808	209.414
120.262	285.631
149.214	234.763
150.884	214.796
180.950	244.688
300.655	320.700
381.943	263.387
454.880	281.406];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(39);  units.temp.tW = 'K'; label.temp.tW = 'temperature'; 
bibkey.tW = 'Rood1972';

%% set weights for all real data
weights = setweights(data, []);
weights.tW = 5 * weights.tW;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Links
metaData.links.id_CoL = '42SBB'; % Cat of Life
metaData.links.id_ITIS = '584719'; % ITIS
metaData.links.id_EoL = '1038697'; % Ency of Life
metaData.links.id_Wiki = 'Microcavia_australis'; % Wikipedia
metaData.links.id_ADW = 'Microcavia_australis'; % ADW
metaData.links.id_Taxo = '63454'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '13400202'; % MSW3
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Microcavia_australis}}';
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
bibkey = 'Rood1972'; type = 'Article'; bib = [ ... 
'author = {Rood, J. P.}, ' ... 
'year = {1972}, ' ...
'title = {Ecological and behavioral comparisons of three genera of {A}rgentine cavies}, ' ...
'journal = {Anim. Behav. Monogr.}, ' ...
'volume = {5}, ' ...
'pages = {1-83}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

