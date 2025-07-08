function [data, auxData, metaData, txtData, weights] = mydata_Redunca_fulvorufula

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Cetartiodactyla'; 
metaData.family     = 'Bovidae';
metaData.species    = 'Redunca_fulvorufula'; 
metaData.species_en = 'Mountain reedbuck'; 

metaData.ecoCode.climate = {'Cwb'};
metaData.ecoCode.ecozone = {'TPa'};
metaData.ecoCode.habitat = {'0iTi', '0iTg'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiHl'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(39.4); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2018 11 03];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 13];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 13];

%% set data
% zero-variate data

data.tg = 216;  units.tg = 'd';    label.tg = 'gestation time for female calves';    bibkey.tg = 'AnAge';   
  temp.tg = C2K(39.4);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 121;    units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'guess';   
  temp.tx = C2K(39.4);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
  comment.tx = 'guess based on Antidorcas';
data.tp = 388;    units.tp = 'd';    label.tp = 'time since birth at puberty for females'; bibkey.tp = 'AnAge';
  temp.tp = C2K(39.4);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tpm = 335; units.tpm = 'd';    label.tpm = 'time since birth at puberty for males'; bibkey.tpm = 'AnAge';
  temp.tpm = C2K(39.4);  units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
data.am = 15*365; units.am = 'd';    label.am = 'life span';                   bibkey.am = 'AnAge';   
  temp.am = C2K(39.4);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 3000;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth for female';      bibkey.Wwb = 'AnAge';
data.Wwi = 30e3;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';   bibkey.Wwi = 'NortFair1991';
data.Wwim = 32e3; units.Wwim = 'g';   label.Wwim = 'ultimate wet weight for males';   bibkey.Wwim = 'NortFair1991';

data.Ri  = 1.1/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(39.4); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '1 calf per litter, 1.1 litters per yr';
  
% uni-variate data
% time-weight
data.tW_f = [ ... % time since birth (d), wet weight (kg)
89.843	11.863
142.716	11.390
243.667	18.347
287.004	20.258
355.478	20.740
455.113	23.199
602.543	26.889
723.022	28.328
848.622	27.996
913.051	28.477
1276.640	29.251
1631.891	30.433
2012.528	29.777
2371.989	30.687
2731.119	32.142
2731.491	31.529
3112.335	30.533
3464.905	29.466];
data.tW_f(:,2) = data.tW_f(:,2) * 1e3; % convert kg to g
units.tW_f   = {'d', 'g'};  label.tW_f = {'time since birth', 'wet weight', 'female'};  
temp.tW_f    = C2K(39.4);  units.temp.tW_f = 'K'; label.temp.tW_f = 'temperature';
bibkey.tW_f = 'NortFair1991';
comment.tW_f = 'Data for females';
%
data.tW_m = [ ... % time since birth (d), wet weight (kg)
83.065	10.396
151.146	14.679
243.906	17.266
300.205	19.647
364.547	22.368
465.831	22.918
615.304	25.848
732.233	29.251
857.742	30.346
918.566	30.418
1287.409	31.597
1640.277	31.553
2021.659	30.899
2373.990	33.504
2743.040	33.664
2743.123	33.257
3119.899	35.319];
data.tW_m(:,2) = data.tW_m(:,2) * 1e3; % convert kg to g
units.tW_m   = {'d', 'kg'};  label.tW_m = {'time since birth', 'wet weight', 'male'};  
temp.tW_m    = C2K(39.4);  units.temp.tW_m = 'K'; label.temp.tW_m = 'temperature';
bibkey.tW_m = 'NortFair1991';
comment.tW_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tW_f = 5 * weights.tW_f;
weights.tW_m = 5 * weights.tW_m;

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

%% Group plots
set1 = {'tW_f','tW_m'}; subtitle1 = {'Data for females and males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} and E_Hp only';
D2 = 'Slow foetal development is assumed';     
D3 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);  

%% Links
metaData.links.id_CoL = '6X4HW'; % Cat of Life
metaData.links.id_ITIS = '625186'; % ITIS
metaData.links.id_EoL = '331083'; % Ency of Life
metaData.links.id_Wiki = 'Redunca_fulvorufula'; % Wikipedia
metaData.links.id_ADW = 'Redunca_fulvorufula'; % ADW
metaData.links.id_Taxo = '68331'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '14200997'; % MSW3
metaData.links.id_AnAge = 'Redunca_fulvorufula'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Redunca_fulvorufula}}';
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
bibkey = 'NortFair1991'; type = 'Article'; bib = [ ... 
'author = {P. M. Norton and N. Fairall}, ' ... 
'year = {1991}, ' ...
'title = {Mountain reedbuck \emph{Redunca fuhorufula} growth and age determination using dentition}, ' ...
'journal = {J. Zool., Lond.}, ' ...
'volume = {225}, ' ...
'pages = {293-307}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Redunca_fulvorufula}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{https://animaldiversity.org/accounts/Redunca_fulvorufula/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


