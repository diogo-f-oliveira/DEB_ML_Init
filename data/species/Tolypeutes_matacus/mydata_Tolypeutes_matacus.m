function [data, auxData, metaData, txtData, weights] = mydata_Tolypeutes_matacus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Cingulata'; 
metaData.family     = 'Chlamyphoridae';
metaData.species    = 'Tolypeutes_matacus'; 
metaData.species_en = 'Southern three-banded armadillo'; 

metaData.ecoCode.climate = {'Aw', 'Cfa', 'Cwa'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'0iTi', '0iTh'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiCii'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(35.1); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2021 11 10];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'sta@akvaplan.niva.no'}; 
metaData.date_acc    = [2021 11 10]; 

%% set data
% zero-variate data

data.tg = 120;    units.tg = 'd';    label.tg = 'gestation time';             bibkey.tg = 'AnAge';   
  temp.tg = C2K(35.1);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 55;    units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'AnAge';   
  temp.tx = C2K(35.1);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 320;    units.tp = 'd';    label.tp = 'time since birth at puberty';   bibkey.tp = 'AnAge';
  temp.tp = C2K(35.1);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 36.8*365;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(35.1);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 80;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'AnAge';
  comment.Wwb = 'AnAge gives 128 g';
data.Wwi = 1.5e3;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'AnAge';
  comment.Wwi = 'Wiki: max 10 kg';

data.Ri  = 1/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(35.1);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '2 young per litter, 1 litter per yr; ADW says >1 litter per yr';
 
% uni-variate data
% t-W data
data.tW = [ ... % time since birth (d), wet weight (g)
3.058	96.733
12.032	142.963
15.871	278.410
16.901	356.000
25.915	467.614
31.858	532.020
39.709	643.827
46.016	718.776
53.952	823.499
58.975	845.642
63.753	904.939
67.902	962.572
71.048	986.793
71.966	1025.522
75.091	1014.400
77.700	1038.710
80.656	1045.290
82.802	1043.167
85.945	1062.087
87.830	1072.378
89.880	1059.667
92.682	1106.920
96.882	1099.155
99.055	1141.210];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(35.1);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'Meri1971';

%% set weights for all real data
weights = setweights(data, []);
weights.tW = 5 * weights.tW;
weights.tWg = 3 * weights.tg;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
%data.psd.t_0 = 0;  units.psd.t_0 = 'd'; label.psd.t_0 = 'time at start development';
%weights.psd.t_0 = 0.1;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Links
metaData.links.id_CoL = '7CFJZ'; % Cat of Life
metaData.links.id_ITIS = '624905'; % ITIS
metaData.links.id_EoL = '328498'; % Ency of Life
metaData.links.id_Wiki = 'Tolypeutes_matacus'; % Wikipedia
metaData.links.id_ADW = 'Tolypeutes_matacus'; % ADW
metaData.links.id_Taxo = '60590'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '11700053'; % MSW3
metaData.links.id_AnAge = 'Tolypeutes_matacus'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Tolypeutes_matacus}}';
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
bibkey = 'Meri1971'; type = 'Article'; bib = [ ... 
'author = {Meritt, D. A.}, ' ... 
'doi = {10.1111/j.1748-1090.1971.tb01901.x}, ' ...
'year = {1971}, ' ...
'title = {The development of the La Plata three-banded armadillo at {L}incoln {P}ark {Z}oo, {C}hicago}, ' ...
'journal = {International Zoo Yearbook}, ' ...
'volume = {11(1)}, ' ...
'pages = {195–196}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Tolypeutes_matacus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

