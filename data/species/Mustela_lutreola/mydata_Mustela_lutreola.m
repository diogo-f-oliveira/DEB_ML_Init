function [data, auxData, metaData, txtData, weights] = mydata_Mustela_lutreola

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Carnivora'; 
metaData.family     = 'Mustelidae';
metaData.species    = 'Mustela_lutreola'; 
metaData.species_en = 'European mink'; 

metaData.ecoCode.climate = {'Dfb','Dfc'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iTf', '0iTh','biF'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {'TT'};
metaData.ecoCode.food    = {'bxM', 'xiCv', 'xiCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(39.6); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2020 04 27];              
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

data.tg = 41.4;    units.tg = 'd';    label.tg = 'gestation time';               bibkey.tg = 'lutreola';   
  temp.tg = C2K(39.6);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 57;    units.tx = 'd';    label.tx = 'time since birth at weaning';  bibkey.tx = 'AnAge';   
  temp.tx = C2K(39.6);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 323;    units.tp = 'd';    label.tp = 'time since birth at puberty for females'; bibkey.tp = 'AnAge';
  temp.tp = C2K(39.6);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tpm = 323;    units.tpm = 'd';    label.tpm = 'time since birth at puberty for males'; bibkey.tpm = 'AnAge';
  temp.tpm = C2K(39.6);  units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
data.am = 8.4*365;    units.am = 'd';    label.am = 'life span';            bibkey.am = 'AnAge';   
  temp.am = C2K(39.6);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 8;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'AnAge';
data.Wwi = 540.3;units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';       bibkey.Wwi = 'lutreola';
  comment.Wwi = 'Wiki: till 180 g';
data.Wwim = 814.6;units.Wwim = 'g';   label.Wwim = 'ultimate wet weight';    bibkey.Wwim = 'lutreola';
  comment.Wwim = 'Wiki: till 258 g';

data.Ri  = 3.6/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';    bibkey.Ri  = 'lutreola';   
  temp.Ri = C2K(39.6);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data
% time-weight
tWW = [... % time since birth (d), weight females (g), males (g)
1 	 	8.8 		10.0 
2 	 	11.3 	 	11.9
3 	 	13.6 	 	15.7
4 	 	16.1 	 	18.6
5 	 	19.2 	 	22.7
6 	 	22.7 		27.2
7 	 	27.4 		31.5
8 	 	30.4 	 	35.7
9 	 	34.2 	 	41.2
10 	 	38.9 	 	46.6
11 	 	43.3 	 	52.2
12 	 	49.5 		60.6
13 	 	53.9 	 	64.8 
14 	 	58.7 		69.2
15 	 	63.6 		74.9
16 	 	70.0 	 	81.8
17 	 	75.7 		87.6 
18 	 	81.3 	 	94.4
19 	 	89.0 		101.6 
20 	 	91.8 	 	106.2
21 	 	98.5 	 	111.1
22  	105.6 	 	117.0 
23 	 	115.8 	 	126.1
24 	 	120.7 		131.4
25 	 	125.8 		139.6
26 	 	133.2 	 	149.2 
27 	 	143.3 	 	159.2
28 	 	153.5 	 	169.2
29 	 	162.9 	 	179.1
30 	 	171.7 	 	190.6
40 	 	274.0 	 	284.4
50 	 	369.5 	 	438.3 
60 	 	465.1 		515.3];
%
data.tW_f = tWW(:,1:2);
units.tW_f = {'d', 'g'};  label.tW_f = {'time since birth', 'wet weight', 'female'};  
temp.tW_f  = C2K(39.6);  units.temp.tW_f = 'K'; label.temp.tW_f = 'temperature';
bibkey.tW_f = 'lutreola';
comment.tW_f = 'Data for females';
%
data.tW_m = tWW(:,[1 3]);
units.tW_m  = {'d', 'g'};  label.tW_m = {'time since birth', 'wet weight', 'male'};  
temp.tW_m   = C2K(39.6);  units.temp.tW_m = 'K'; label.temp.tW_m = 'temperature';
bibkey.tW_m = 'lutreola';
comment.tW_m = 'Data for males';
  
%% set weights for all real data
weights = setweights(data, []);
weights.tW_f = 5 * weights.tW_f;
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
set1 = {'tW_f','tW_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} and E_Hp only';
D2 = 'Weight at weaning ignored because of inconsistency with tW data';
D3 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);  

%% Facts
F1 = 'The implantation cannot be delayed';
metaData.bibkey.F1 = 'lutreola'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '44QXK'; % Cat of Life
metaData.links.id_ITIS = '621951'; % ITIS
metaData.links.id_EoL = '311519'; % Ency of Life
metaData.links.id_Wiki = 'Mustela_lutreola'; % Wikipedia
metaData.links.id_ADW = 'Mustela_lutreola'; % ADW
metaData.links.id_Taxo = '66683'; % Taxonomicon
metaData.links.id_WoRMS = '1461490'; % WoRMS
metaData.links.id_MSW3 = '14001428'; % MSW3
metaData.links.id_AnAge = 'Mustela_lutreola'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Mustela_lutreola}}';
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
bibkey = 'lutreola'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.lutreola.ee/lutreola/html/english/husbandry-06.html#ternovskij}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{https://genomics.senescence.info/species/entry.php?species=Mustela_lutreola}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

