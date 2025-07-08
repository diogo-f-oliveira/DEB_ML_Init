function [data, auxData, metaData, txtData, weights] = mydata_Galago_senegalensis

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Primates'; 
metaData.family     = 'Galagidae';
metaData.species    = 'Galago_senegalensis'; 
metaData.species_en = 'Senegal bushbaby'; 

metaData.ecoCode.climate = {'Aw', 'BSh'};
metaData.ecoCode.ecozone = {'TPa'};
metaData.ecoCode.habitat = {'0iTf'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {'TW'};
metaData.ecoCode.food    = {'bxM', 'xiO'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(37.9); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Li'; 'Wwb'; 'Wwx'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2014 06 07];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1  = {'Bas Kooijman'};    
metaData.date_mod_1    = [2018 09 01];              
metaData.email_mod_1   = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1 = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2018 09 01]; 


%% set data
% zero-variate data

data.tg = 126;   units.tg = 'd';    label.tg = 'age at birth';             bibkey.tg = 'AnAge';   
  temp.tg = C2K(37.9);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 89;    units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'AnAge';   
  temp.tx = C2K(37.9);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 240;   units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'AnAge';
  temp.tp = C2K(37.9);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 17.1*365;    units.am = 'd';    label.am = 'life span';             bibkey.am = 'AnAge';   
  temp.am = C2K(37.9);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Li  = 13;   units.Li  = 'cm';  label.Li  = 'ultimate body length';   bibkey.Li  = 'Wiki';

data.Wwb = 12.2; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'AnAge';
data.Wwx = 100;  units.Wwx = 'g';   label.Wwx = 'wet weight at weaning';   bibkey.Wwx = 'AnAge';
data.Wwi = 192.2; units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'AnAge';

data.Ri  = 2/225; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';    bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(37.9);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% univariate data
% time-weight
data.tW_f = [ ... % time since birth (d), weight (g)
5.907	21.953
6.923	22.217
8.099	24.624
9.451	25.899
9.785	26.911
10.715	27.678
11.646	27.940
14.601	30.746
16.633	31.399
17.981	33.556
19.081	33.947
21.360	36.366
23.050	37.772
23.300	38.782
26.839	43.736
26.844	42.728
27.431	44.247
27.849	45.512
31.395	48.954
31.643	50.468
32.742	51.111
33.918	53.896
36.113	55.937
37.040	57.207
37.544	58.347
37.624	59.608
38.298	60.497
38.807	60.503
39.653	60.765
42.683	66.091
42.930	67.732
44.963	68.133
47.912	72.450
48.592	71.954
50.450	73.739];
units.tW_f  = {'d', 'g'}; label.tW_f = {'time', 'wet weight', 'female'};  
temp.tW_f   = C2K(37.9);  units.temp.tW_f = 'K'; label.temp.tW_f = 'temperature';
bibkey.tW_f = 'Brow1979';
comment.tW_f = 'data for females';
%
data.tW_m = [ ... % time since birth (d), weight (g)
5.816	23.338
6.494	23.346
6.915	23.981
7.253	24.236
7.671	25.627
8.346	26.517
8.939	26.649
10.627	28.432
11.640	29.326
12.483	30.469
13.918	31.998
14.763	32.637
16.535	34.673
19.156	36.341
20.760	37.997
21.682	40.402
22.612	40.916
24.216	42.572
24.799	44.973
27.414	48.152
30.867	53.483
31.965	54.504
34.410	57.681
35.760	59.334
35.925	60.344
38.453	63.901
39.970	66.060
41.160	65.318
41.489	67.715
41.990	69.485
42.999	71.512
44.017	71.398
46.377	74.574
47.055	74.708
48.146	77.366
49.420	76.625
51.025	78.155];
units.tW_m  = {'d', 'g'}; label.tW_m = {'time', 'wet weight', 'male'};  
temp.tW_m   = C2K(37.9);  units.temp.tW_m = 'K'; label.temp.tW_m = 'temperature';
bibkey.tW_m = 'Brow1979';
comment.tW_m = 'data for males';

%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
data.psd.t_0 = 0;  units.psd.t_0 = 'd'; label.psd.t_0 = 'time at start development';
weights.psd.t_0 = 3;

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
metaData.discussion = struct('D1', D1);

%% Links
metaData.links.id_CoL = '3F2DM'; % Cat of Life
metaData.links.id_ITIS = '572899'; % ITIS
metaData.links.id_EoL = '311208'; % Ency of Life
metaData.links.id_Wiki = 'Galago_senegalensis'; % Wikipedia
metaData.links.id_ADW = 'Galago_senegalensis'; % ADW
metaData.links.id_Taxo = '65569'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '12100144'; % MSW3
metaData.links.id_AnAge = 'Galago_senegalensis'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Galago_senegalensis}}';
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
bibkey = 'Brow1979'; type = 'Article'; bib = [ ... 
'author = {Brown, C.}, ' ... 
'doi = {10.1111/j.1748-1090.1979.tb00577.x}, ' ...
'year = {1979}, ' ...
'title = {Hand-rearing Senegal bushbabies}, ' ...
'journal = {International Zoo Yearbook}, ' ...
'volume = {19}, ' ...
'number = {1}, '...
'pages = {261-262}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Galago_senegalensis}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

