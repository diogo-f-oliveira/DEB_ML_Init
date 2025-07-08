function [data, auxData, metaData, txtData, weights] = mydata_Rupicapra_rupicapra

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Cetartiodactyla'; 
metaData.family     = 'Bovidae';
metaData.species    = 'Rupicapra_rupicapra'; 
metaData.species_en = 'Alipine chamois'; 

metaData.ecoCode.climate = {'ET', 'Cfa'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iTd', '0iTht'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiHl'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(38.6); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am';'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2016 12 29];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 14];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 14];

%% set data
% zero-variate data

data.tg = 122;    units.tg = 'd';    label.tg = 'gestation time';             bibkey.tg =  'AnAge';   
  temp.tg = C2K(38.6);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 76;    units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'AnAge';   
  temp.tx = C2K(38.6);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 674;    units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'AnAge';
  temp.tp = C2K(38.6);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 17.6*365;    units.am = 'd';    label.am = 'life span';              bibkey.am = 'AnAge';   
  temp.am = C2K(38.6);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Wwb = 2400;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';       bibkey.Wwb = 'AnAge';
data.Wwi = 32600;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight females'; bibkey.Wwi = 'Wiki';
  comment.Wwi = '200 till 490 kg';
data.Wwim = 41700;  units.Wwim = 'g';   label.Wwim = 'ultimate wet weight males'; bibkey.Wwim = 'Wiki';
  comment.Wwim = '380 till 700 kg';
  
data.Ri  = 1/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';       bibkey.Ri  = {'AnAge'};   
  temp.Ri = C2K(38.6);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'If food is abundant, 2 calves are possible';

% uni-variate data
% time-weight
data.tW_f = [ % time since birth (yr), eviscerated carcass weight (kg)
0.366	11.150
1.288	17.399
2.339	20.948
3.308	21.868
4.278	22.362
5.375	22.429
6.302	23.847
7.315	23.346
8.328	22.987
9.341	22.912
10.354	22.696
11.367	21.910
12.337	22.546
13.392	22.116
14.320	23.250
15.334	21.186
16.348	20.401
17.357	23.381
18.327	24.372
19.341	22.877]; 
data.tW_f(:,1) = data.tW_f(:,1)*365; % convert yr to d
data.tW_f(:,2) = data.tW_f(:,2)*1e3/ .72; % convert eviscerated carcass weight to total weight in g
units.tW_f  = {'d', 'g'};  label.tW_f = {'time since birth', 'total weight', 'female'};  
temp.tW_f  = C2K(38.6);  units.temp.tW_f = 'K'; label.temp.tW_f = 'temperature';
bibkey.tW_f = 'GareLois2009';
comment.tW_f = 'Data for females';
% 
data.tW_m = [ ... % time since birth (yr), carcass weight (kg)
0.396	11.815
1.380	18.642
2.405	23.481
3.385	26.685
4.406	29.250
5.425	29.186
6.361	30.827
7.423	30.479
8.399	30.415
9.377	31.061
10.395	30.003
11.416	31.857
12.347	29.377
13.411	31.943
14.386	29.818
15.398	23.005]; 
data.tW_m(:,1) = data.tW_m(:,1)*365; % convert yr to d
data.tW_m(:,2) = data.tW_m(:,2)*1e3/ .72; % convert eviscerated carcass weight to total weight in g
units.tW_m  = {'d', 'g'};  label.tW_m = {'time since birth', 'total weight', 'male'};  
temp.tW_m  = C2K(38.6);  units.temp.tW_m = 'K'; label.temp.tW_m = 'temperature';
bibkey.tW_m = 'GareLois2009';

%% set weights for all real data
weights = setweights(data, []);
weights.tW_m(end) = 0; % exclude last data point of tW_m data

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
D1 = 'Slow foetal development is assumed';
D2 = 'Males are assumend to differ from females by {p_Am} only';
D3 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);  

%% Links
metaData.links.id_CoL = '4TQLC'; % Cat of Life
metaData.links.id_ITIS = '625159'; % ITIS
metaData.links.id_EoL = '331073'; % Ency of Life
metaData.links.id_Wiki = 'Rupicapra_rupicapra'; % Wikipedia
metaData.links.id_ADW = 'Rupicapra_rupicapra'; % ADW
metaData.links.id_Taxo = '68532'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '14200859'; % MSW3
metaData.links.id_AnAge = 'Rupicapra_rupicapra'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Rupicapra_rupicapra}}';
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
bibkey = 'GareLois2009'; type = 'Article'; bib = [ ... 
'author = {M. Garel and A. Loison and J.-M. Jullien and D. Dubray and D. Maillard and J.-M. Gaillard}, ' ... 
'year = {2008}, ' ...
'title = {SEX-SPECIFIC GROWTH IN ALPINE CHAMOIS}, ' ...
'journal = {J. Mammal}, ' ...
'volume = {90}, ' ...
'pages = {954-960}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Rupicapra_rupicapra}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{http://animaldiversity.org/accounts/Rupicapra_rupicapra/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

