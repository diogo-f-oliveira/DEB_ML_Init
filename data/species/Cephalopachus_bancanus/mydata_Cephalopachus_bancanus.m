function [data, auxData, metaData, txtData, weights] = mydata_Cephalopachus_bancanus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Primates'; 
metaData.family     = 'Tarsiidae';
metaData.species    = 'Cephalopachus_bancanus'; 
metaData.species_en = 'Western tarsier'; 

metaData.ecoCode.climate = {'Af'};
metaData.ecoCode.ecozone = {'TPi'};
metaData.ecoCode.habitat = {'0iTf'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiCii', 'xiCvr'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(36.0); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2021 12 26];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2021 12 26]; 

%% set data
% zero-variate data

data.tg = 178;    units.tg = 'd';    label.tg = 'gestation time';              bibkey.tg = 'AnAge';   
  temp.tg = C2K(36.0);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 80;    units.tx = 'd';    label.tx = 'time since birth at weaning';  bibkey.tx = 'AnAge';   
  temp.tx = C2K(36.0);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 150;    units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'Robe1994';
  temp.tp = C2K(36.0);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 16.3*365;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(36.0);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Li  = 14;   units.Li  = 'cm';  label.Li  = 'ultimate head-body length';   bibkey.Li  = 'Wiki';
  comment.Li = '121–154 mm';

data.Wwb = 24.6;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'AnAge';
data.Wwi = 122.5;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'AnAge';

data.Ri  = 1.5/153;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(36.0);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
   
% univariate data
% time-weight
data.tW = [ ... % time since birth (d), weight (g)
3.510	26.250
5.487	23.625
13.113	33.250
19.910	32.813
19.946	30.188
28.512	42.000
33.290	47.250
40.080	47.250
49.719	51.625
60.238	62.563
63.160	61.688
63.191	59.500
68.065	57.750
74.734	66.500
75.619	72.625
76.722	63.000
82.379	74.813
88.193	75.250
90.066	80.063
94.965	76.563
98.790	80.500
100.561	92.750
100.815	74.375
102.622	84.000
103.683	77.438
119.033	89.688
125.854	87.500
133.578	90.125
137.403	94.063
149.164	85.313
156.749	98.000
165.509	95.813
178.119	95.813
184.934	94.063
249.852	99.313
300.123	111.563
400.854	122.500
456.327	109.375
462.880	126.438
501.790	118.563
522.943	132.125];
units.tW   = {'d', 'g'};  label.tW = {'time', 'weight'};  
temp.tW    = C2K(36.0);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'Robe1994';

%% set weights for all real data
weights = setweights(data, []);
weights.tW = 10 * weights.tW;
weights.Wwi = 5 * weights.Wwi;

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

%% Discussion points
D1 = 'mod_3: tW data included';   
metaData.discussion = struct('D1', D1);

%% Links
metaData.links.id_CoL = 'SDLD'; % Cat of Life
metaData.links.id_ITIS = '944113'; % ITIS
metaData.links.id_EoL = '32000577'; % Ency of Life
metaData.links.id_Wiki = 'Cephalopachus_bancanus'; % Wikipedia
metaData.links.id_ADW = 'Tarsius_bancanus'; % ADW
metaData.links.id_Taxo = '4731060'; % Taxonomicon 
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '12100167'; % MSW3
metaData.links.id_AnAge = 'Cephalopachus_bancanus'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Cephalopachus_bancanus}}';
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
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Cephalopachus_bancanus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Robe1994'; type = 'Article'; bib = [ ... 
'doi = {10.1007/bf02735232}, ' ...
'author = {Roberts, M.}, ' ... 
'year = {1994}, ' ...
'title = {Growth, development, and parental care in the western tarsier (\emph{Tarsius bancanus}) in captivity: Evidence for a “slow” life-history and nonmonogamous mating system}, ' ...
'journal = {International Journal of Primatology}, ' ...
'volume = {15(1)}, ' ...
'pages = {1–28}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

