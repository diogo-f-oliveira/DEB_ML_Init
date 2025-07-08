function [data, auxData, metaData, txtData, weights] = mydata_Okapia_johnstoni
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Cetartiodactyla'; 
metaData.family     = 'Giraffidae';
metaData.species    = 'Okapia_johnstoni'; 
metaData.species_en = 'Okapi'; 

metaData.ecoCode.climate = {'A'};
metaData.ecoCode.ecozone = {'TPa'};
metaData.ecoCode.habitat = {'0iTf'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiHl'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(38.1); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwx'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2017 12 26];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2017 12 26]; 

%% set data
% zero-variate data

data.tg = 485;    units.tg = 'd';    label.tg = 'gestation time';             bibkey.tg =  'AnAge';   
  temp.tg = C2K(38.1);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 194;    units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'AnAge';   
  temp.tx = C2K(38.1);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 578;    units.tp = 'd';    label.tp = 'time since birth at puberty for females'; bibkey.tp = 'AnAge';
  temp.tp = C2K(38.1);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tpm = 790;    units.tpm = 'd';    label.tpm = 'time since birth at puberty for males'; bibkey.tpm = 'AnAge';
  temp.tpm = C2K(38.1);  units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
data.am = 33.5*365;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(38.1);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am =  'life span between 15 and 25 yr ';
  
data.Wwb = 16e3;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'AnAge';
data.Wwx = 77e3;   units.Wwx = 'g';   label.Wwx = 'wet weight at weaning';     bibkey.Wwx = 'AnAge';
data.Wwi = 300e3;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight females'; bibkey.Wwi = 'sandiegozoo';
  comment.Wwi = '240 till 356 kg';
data.Wwim = 220e3;  units.Wwim = 'g';   label.Wwim = 'ultimate wet weight males'; bibkey.Wwim = 'sandiegozoo';
  comment.Wwim = '180 till 260 kg';  

data.Ri  = 0.8/395;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(38.1);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '1 calve per litter, 0.8 litters per yr';
  
% uni-variate data
% time-weight data
data.tW1 = [ % time since birth (d), weight (kg)
3.614	15.306
13.251	18.707
21.081	23.810
30.116	23.810
49.992	34.014
62.640	40.816
79.505	47.052
89.142	51.020
113.837	68.027
146.964	83.333
172.863	100.907
203.581	118.481
284.290	151.927
361.386	172.902]; 
units.tW1  = {'d', 'kg'};  label.tW1 = {'time since birth', 'weight'};  
temp.tW1  = C2K(38.1);  units.temp.tW1 = 'K'; label.temp.tW1 = 'temperature';
bibkey.tW1 = 'nagonline';
%
data.tW2 = [ % time since birth (d), weight (kg)
1.807	15.873
10.842	19.274
22.285	27.211
30.116	33.447
42.764	45.351
49.992	48.753
55.413	54.422
60.833	58.957
67.459	58.957
75.891	67.460
81.914	73.696
113.234	90.703
126.485	100.340
146.361	117.914
154.191	121.882
185.512	139.456
209.604	149.660
238.515	155.896
269.835	163.265
310.792	170.635
325.248	174.603
356.568	176.304];
units.tW2  = {'d', 'kg'};  label.tW2 = {'time since birth', 'weight'};  
temp.tW2  = C2K(38.1);  units.temp.tW2 = 'K'; label.temp.tW2 = 'temperature';
bibkey.tW2 = 'nagonline';
%
data.tW3 = [ % time since birth (d), weight (kg)
4.818	16.440
18.069	23.243
25.297	31.746
35.536	39.116
45.173	44.785
56.617	54.422
69.868	60.091
108.416	92.971
118.053	100.907
146.361	117.347
165.033	126.417
180.693	132.086
197.558	140.590
226.469	140.023
257.186	149.660
289.109	154.195
314.406	165.533
340.305	167.800
361.386	174.603];
units.tW3  = {'d', 'kg'};  label.tW3 = {'time since birth', 'weight'};  
temp.tW3  = C2K(38.1);  units.temp.tW3 = 'K'; label.temp.tW3 = 'temperature';
bibkey.tW3 = 'nagonline';

%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
data.psd.t_0 = 0; units.psd.t_0 = 'd'; label.psd.t_0 = 'time at start development'; 
weights.psd.t_0 = 0.1;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tW1','tW2','tW3'}; subtitle1 = {'Individuals at Disney''s Animal Kingdom'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumend to differ from females by {p_Am} and E_Hp only';
metaData.discussion = struct('D1', D1);

%% Links
metaData.links.id_CoL = '492B3'; % Cat of Life
metaData.links.id_ITIS = '625037'; % ITIS
metaData.links.id_EoL = '308387'; % Ency of Life
metaData.links.id_Wiki = 'Okapia_johnstoni'; % Wikipedia
metaData.links.id_ADW = 'Okapia_johnstoni'; % ADW
metaData.links.id_Taxo = '68116'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '14200484'; % MSW3
metaData.links.id_AnAge = 'Okapia_johnstoni'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Okapia_johnstoni}}';
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
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Okapia_johnstoni}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'sandiegozoo'; type = 'Misc'; bib = ...
'howpublished = {\url{http://library.sandiegozoo.org/factsheets/okapi/okapi.htm}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'nagonline'; type = 'Misc'; bib = ...
'howpublished = {\url{https://nagonline.net/wp-content/uploads/2016/03/40_Livingston2.pdf}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

