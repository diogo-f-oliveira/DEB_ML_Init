function [data, auxData, metaData, txtData, weights] = mydata_Lobodon_carcinophaga
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Carnivora'; 
metaData.family     = 'Phocidae';
metaData.species    = 'Lobodon_carcinophaga'; 
metaData.species_en = 'Crabeater seal'; 

metaData.ecoCode.climate = {'ME'};
metaData.ecoCode.ecozone = {'MS'};
metaData.ecoCode.habitat = {'0iMp'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bxM', 'xiCik'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(37); % K, body temp 
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww';}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman','Starrlight Augustine'};    
metaData.date_subm = [2018 11 01];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 12];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 12];

%% set data
% zero-variate data

data.tg = 259;    units.tg = 'd';    label.tg = 'gestation time';              bibkey.tg = 'AnAge';   
  temp.tg = C2K(37);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 28;   units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'AnAge';   
  temp.tx = C2K(37);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 4*365;    units.tp = 'd';    label.tp = 'time since birth at puberty for females'; bibkey.tp = 'AnAge';
  temp.tp = C2K(37);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tpm = 4.5*365;    units.tpm = 'd';    label.tpm = 'time since birth at puberty for males';   bibkey.tpm = 'AnAge';
  temp.tpm = C2K(37);  units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
data.am = 39*365;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(37);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Wwb = 36e3;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'LawsBair2003';
data.Wwi = 215e3;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'LawsBair2003';
data.Wwim = 200e3;   units.Wwim = 'g';   label.Wwim = 'ultimate wet weight';     bibkey.Wwim = 'LawsBair2003';

data.Ri  = 0.5/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'AnAge';   
temp.Ri = C2K(37);    units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '1 pup per litter, 1 litter each 2 yrs';
 
% uni-variate data
% time-weight
data.tW_f = [ ...  % time since birth (yr), weight (kg)
0.000	35.893
0.508	114.896
1.555	164.995
2.511	171.351
3.528	183.393
4.544	192.028
5.561	191.575
6.547	209.862
7.593	204.301
8.520	210.086
9.537	204.522
10.553	218.836
11.570	198.505
12.586	209.412
13.543	222.016
14.559	215.316
15.575	223.950
16.562	213.271
17.519	217.356
18.505	197.589
19.552	224.402
20.508	221.671];
data.tW_f(:,1) = data.tW_f(:,1)*365; % convert yr to d
data.tW_f(:,2) = data.tW_f(:,2)*1e3; % convert kg to g
units.tW_f   = {'d', 'g'};  label.tW_f = {'time since birth', 'wet weight', 'female'};  
temp.tW_f    = C2K(37);  units.temp.tW_f = 'K'; label.temp.tW_f = 'temperature';
bibkey.tW_f = 'LawsBair2003'; comment.tW_f = 'data for females';
% t-W data males:
data.tW_m = [ ... % time since birth (yr), weight (kg)
0.042	35.383
0.480	123.015
1.461	161.231
2.536	170.453
3.491	183.074
4.538	180.349
5.493	195.813
6.479	197.631
7.586	196.051
8.543	191.610
9.559	194.001
10.544	207.762
11.500	211.852
12.547	205.715
13.535	195.590
14.518	219.588
15.537	199.230
16.493	209.576
17.482	188.077
18.526	208.670
19.514	194.564
20.472	183.867];
data.tW_m(:,1) = data.tW_m(:,1)*365; % convert yr to d
data.tW_m(:,2) = data.tW_m(:,2)*1e3; % convert kg to g
units.tW_m   = {'d', 'g'};  label.tW_m= {'time since birth', 'wet weight', 'male'};  
temp.tW_m    = C2K(37);  units.temp.tW_m = 'K'; label.temp.tW_m = 'temperature';
bibkey.tW_m = 'LawsBair2003'; comment.tW_m = 'data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tW_f = 2 * weights.tW_f;
weights.tW_m = 5 * weights.tW_m;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tW_f'; 'tW_m'}; subtitle1= {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} and E_Hp only';
D2 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Facts
F1 = 'Body temperature is guessed';
metaData.bibkey.F1 = 'AnAge'; 
metaData.facts = struct('F1',F1);

%% Acknowledgment
metaData.acknowledgment = 'The creation of this entry was support by the Norwegian Science Council (NFR 255295)';

%% Links
metaData.links.id_CoL = '3VT8H'; % Cat of Life
metaData.links.id_ITIS = '622023'; % ITIS
metaData.links.id_EoL = '1052723'; % Ency of Life
metaData.links.id_Wiki = 'Lobodon_carcinophaga'; % Wikipedia
metaData.links.id_ADW = 'Lobodon_carcinophaga'; % ADW
metaData.links.id_Taxo = '93681'; % Taxonomicon
metaData.links.id_WoRMS = '344008'; % WoRMS
metaData.links.id_MSW3 = '14001046'; % MSW3
metaData.links.id_AnAge = 'Lobodon_carcinophaga'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Lobodon_carcinophaga}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Pusa_hispida}}';
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
bibkey = 'LawsBair2003'; type = 'Article'; bib = [ ... 
'author = {R. M. Laws and A. Baird and M. M. Bryden}, ' ... 
'year = {2003}, ' ...
'title = {Size and growth of the crabeater seal \emph{Lobodon carcinophagus} ({M}ammalia: {C}arnivora)}, ' ...
'journal = {J. Zool., Lond.}, ' ...
'volume = {259}, ' ...
'doi = {10.1017/S0952836902003072}, '...
'pages = {103-108}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

