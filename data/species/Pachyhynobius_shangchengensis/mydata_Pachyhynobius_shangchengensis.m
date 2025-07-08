function [data, auxData, metaData, txtData, weights] = mydata_Pachyhynobius_shangchengensis

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Amphibia'; 
metaData.order      = 'Caudata'; 
metaData.family     = 'Hynobiidae';
metaData.species    = 'Pachyhynobius_shangchengensis'; 
metaData.species_en = 'Shangcheng stout salamander'; 

metaData.ecoCode.climate = {'Cfa'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0jFc'};
metaData.ecoCode.embryo  = {'Fc'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(15); % K, body temp
metaData.data_0     = {'ab'; 'aj'; 'ap'; 'am'; 'Lb'; 'Lj'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L';}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2019 06 18];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.author_mod_1  = {'Bas Kooijman'};    
metaData.date_mod_1    = [2023 02 13];              
metaData.email_mod_1   = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1 = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 02 13];

%% set data
% zero-variate data

data.ab = 36;      units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'PasmJans2012';   
  temp.ab = C2K(15);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'start of development 16 d after deposition';
data.tj = 423;  units.tj = 'd';    label.tj = 'time since birth at metam'; bibkey.tj = 'PasmJans2012';
  temp.tj = C2K(15);  units.temp.tj = 'K'; label.temp.tj = 'temperature';
data.tp = 5*365;  units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';
  temp.tp = C2K(15);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 24.2*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(15);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.Wwi = 'based on Onychodactylus_japonicus';

data.Lb  = 1.9;      units.Lb  = 'cm';  label.Lb  = 'total length at birth';   bibkey.Lb  = 'PasmJans2012';
data.Lj  = 9.6;     units.Lj  = 'cm';  label.Lj  = 'total length at metam'; bibkey.Lj  = 'PasmJans2012'; 
data.Li  = 18.4;    units.Li  = 'cm';  label.Li  = 'ultimate total length for females';   bibkey.Li  = 'Wiki';
data.Lim  = 17.6;    units.Lim  = 'cm';  label.Lim  = 'ultimate total length for males';   bibkey.Lim  = 'Wiki';

data.Wwb = 0.0188;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'PasmJans2012';
  comment.Wwi = 'based on egg diameter of 3.3 mm: pi/6*0.33^3';
data.Wwi = 52;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'XionGou2020';

data.Ri  = 55/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';   bibkey.Ri  = 'PasmJans2012';
  temp.Ri = C2K(15); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '32 and 22 eggs per sag, 2 sacs per yr of a single salamander';

% univariate data
% time - length
data.tL = [... % time since birth (d), total length (cm)
0.000	1.922
15.571	2.745
19.981	3.176
50.536	3.294
59.348	4.078
76.848	4.510
96.542	5.059
129.360	5.922
183.960	6.471
225.445	6.784
258.207	7.137
295.346	7.608
325.957	8.235
360.914	8.706
395.871	9.176
450.424	9.294
511.530	9.490
581.371	9.765
627.215	10.039
659.943	10.078
699.254	10.471
729.857	11.020
771.346	11.373
828.123	11.882
893.597	12.118
950.335	12.275
1009.273	12.588
1066.046	13.059
1107.556	13.608
1164.333	14.118
1210.194	14.549
1290.922	14.627
1360.733	14.627
1443.651	14.784
1546.186	14.784
1613.824	14.863
1683.657	15.059
1740.396	15.216
1832.061	15.569];
units.tL  = {'d', 'cm'}; label.tL = {'time since birth', 'total length'};  
temp.tL   = C2K(15); units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'PasmJans2012';
comment.tL = 'Temperature ranges from 2 to 18.5 C';

data.tL_fm = [ ... time since birth (yr), SVL (cm)
    5  9.03  8.02
    6  7.80  8.17
    7  9.28  8.93
    8  9.80  9.92
    9 10.16 10.20
   10 10.38 10.81
   11 11.00 11.46
   12 10.82 11.72
   13 11.42 12.01];
data.tL_fm(:,2:3) = data.tL_fm(:,2:3)/ 0.66; % convert SVL to TL
data.tL_fm(:,1) = (data.tL_fm(:,1) + 0) * 365; % convert yr to d
units.tL_fm  = {'d', 'cm'}; label.tL_fm = {'time since birth', 'total length'};  
temp.tL_fm   = C2K(7); units.temp.tL_fm = 'K'; label.temp.tL_fm = 'temperature';
bibkey.tL_fm = 'XionGou2020'; treat.tL_fm = {1, {'females','males'}};
comment.tL_fm = 'converted from SVL using F3, temperature guessed';
%
data.tW_fm = [ ... time since birth (yr), weight (g)
    5  28.2 15.7
    6  24.2 19.3
    7  26.8 24.0
    8  29.3 30.6
    9  32.7 35.0
   10  35.4 39.7
   11  37.5 46.9
   12  36.6 44.2
   13  43.0 50.1];
data.tW_fm(:,1) = (data.tW_fm(:,1) + 0) * 365; % convert yr to d
units.tW_fm  = {'d', 'g'}; label.tW_fm = {'time since birth', 'wet weight'};  
temp.tW_fm   = C2K(7); units.temp.tW_fm = 'K'; label.temp.tW_fm = 'temperature';
bibkey.tW_fm = 'XionGou2020'; treat.tW_fm = {1, {'females','males'}};
comment.tW_fm = 'temperature guessed';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 3 * weights.tL;
weights.tL_fm = 3 * weights.tL_fm;
weights.tW_fm = 3 * weights.tW_fm;
weights.Lb = 0 * weights.Lb;
weights.Li = 3 * weights.Li;
weights.Lim = 3 * weights.Lim;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am}  only'; 
D2 = 'mod_1: tL_fm and tW_fm data added, Wwi revised';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Facts
F1 = 'Eggs are led in sags';
metaData.bibkey.F1 = 'PasmJans2012'; 
F2 = 'endemic to Dabie Mountains in central China';
metaData.bibkey.F2 = 'Wiki'; 
F3 = 'SVL = TL * 0.58364, based on photo';
metaData.bibkey.F3 = 'zootierliste'; 
metaData.facts = struct('F1',F1, 'F2',F2, 'F3',F3);

%% Links
metaData.links.id_CoL = '75HVH'; % Cat of Life
metaData.links.id_ITIS = '668232'; % ITIS
metaData.links.id_EoL = '332108'; % Ency of Life
metaData.links.id_Wiki = 'Pachyhynobius_shangchengensis'; % Wikipedia
metaData.links.id_ADW = 'Pachyhynobius_shangchengensis'; % ADW
metaData.links.id_Taxo = '138795'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_amphweb = 'Pachyhynobius+shangchengensis'; % AmphibiaWeb

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Pachyhynobius_shangchengensis}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'zootierliste'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.zootierliste.de/imagedb/3060419/6689782d/Pachyhynobius%%20shangchengensis.JPG}}';
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
bibkey = 'PasmJans2012'; type = 'Article'; bib = [ ...
'doi = {10.3724/SP.J.1245.2012.00192}, ' ...
'author = {Frank Pasmans and Geert P. J. Janssens and Max Sparreboom and Jianping Jiang and Kanto Nischikawa}, ' ... 
'year = {2012}, ' ...
'title = {Reproduction, Development, and Growth Response to Captive Diets in the {S}hangcheng Stout Salamander, \emph{Pachyhynobius shangchengensis} ({A}mphibia, {U}rodela, {H}ynobiidae)}, ' ...
'journal = {Asian Herpetological Research}, ' ...
'volume = {3(3)}, ' ...
'pages = {192-197}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'XionGou2020'; type = 'Article'; bib = [ ...
'doi = {10.16373/j.cnki.ahr.190069}, ' ...
'author = {Jianli Xiong and Jianping Gou and Yong Huang and Baowei Zhang and Hongtao Ren and Tao Pan}, ' ... 
'year = {2020}, ' ...
'title = {Age and Body Size of the {S}hangcheng Stout Salamander \emph{Pachyhynobius shangchengensis} ({C}audata: {H}ynobiidae) from Southeastern {C}hina}, ' ...
'journal = {Asian Herpetological Research}, ' ...
'volume = {11(3)}, ' ...
'pages = {219–224}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'amphibiaweb'; type = 'Misc'; bib = ...
'howpublished = {\url{http://amphibiaweb.org/species/3890}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

