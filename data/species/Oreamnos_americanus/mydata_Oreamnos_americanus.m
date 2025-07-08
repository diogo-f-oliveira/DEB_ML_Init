function [data, auxData, metaData, txtData, weights] = mydata_Oreamnos_americanus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Cetartiodactyla'; 
metaData.family     = 'Bovidae';
metaData.species    = 'Oreamnos_americanus'; 
metaData.species_en = 'Mountain goat'; 

metaData.ecoCode.climate = {'Dsc', 'Dfc'};
metaData.ecoCode.ecozone = {'THn'};
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
metaData.date_subm   = [2018 07 10];              
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

data.tg = 184;    units.tg = 'd';    label.tg = 'gestation time';             bibkey.tg =  'AnAge';   
  temp.tg = C2K(38.6);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 122;    units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'AnAge';   
  temp.tx = C2K(38.6);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 912;    units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'AnAge';
  temp.tp = C2K(38.6);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 20.8*365;    units.am = 'd';    label.am = 'life span';              bibkey.am = 'AnAge';   
  temp.am = C2K(38.6);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Wwb = 3200;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';       bibkey.Wwb = 'AnAge';
data.Wwi = 73e3;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight females'; bibkey.Wwi = 'CoteFest2001';
data.Wwim = 105e3;  units.Wwim = 'g';   label.Wwim = 'ultimate wet weight males'; bibkey.Wwim = 'CoteFest2001';
  
data.Ri  = 1.2/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';    bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(38.6);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '1.2 calves per litter, 1 litter per yr';

% uni-variate data
% time-weight data
data.tW_f = [ % time since birth (yr), wet weight (kg)
0.978	31.827
1.991	45.304
2.997	54.974
3.988	61.662
4.994	66.033]; 
data.tW_f(:,1) = data.tW_f(:,1)*365; % convert yr to d
data.tW_f(:,2) = data.tW_f(:,2)*1e3; % convert kg to g
units.tW_f  = {'d', 'g'};  label.tW_f = {'time since birth', 'total weight', 'female'};  
temp.tW_f  = C2K(38.6);  units.temp.tW_f = 'K'; label.temp.tW_f = 'temperature';
bibkey.tW_f = 'CoteFest2001';
comment.tW_f = 'Data for females';
% 
data.tW_m = [ ... % time since birth (yr), wet weight (kg)
1.007	34.809
1.984	52.754
2.997	64.907
3.996	78.881
4.987	88.384]; 
data.tW_m(:,1) = data.tW_m(:,1)*365; % convert yr to d
data.tW_m(:,2) = data.tW_m(:,2)*1e3; % convert kg to g
units.tW_m  = {'d', 'g'};  label.tW_m = {'time since birth', 'total weight', 'male'};  
temp.tW_m  = C2K(38.6);  units.temp.tW_m = 'K'; label.temp.tW_m = 'temperature';
bibkey.tW_m = 'CoteFest2001';

%% set weights for all real data
weights = setweights(data, []);
weights.tW_f = 5*weights.tW_f; 
weights.tW_m = 5*weights.tW_m; 

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
data.psd.k = 0.3; units.psd.k = '-'; label.psd.k = 'maintenance ratio';
weights.psd.k = 5 * weights.psd.k_J; weights.psd.k_J = 0;
weights.psd.p_M = 5 * weights.psd.p_M;

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
D3 = 'Body temperature is guessed based on Rupicapra';
D4 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3, 'D4',D4);

%% Links
metaData.links.id_CoL = '6T4ZD'; % Cat of Life
metaData.links.id_ITIS = '180713'; % ITIS
metaData.links.id_EoL = '328659'; % Ency of Life
metaData.links.id_Wiki = 'Oreamnos_americanus'; % Wikipedia
metaData.links.id_ADW = 'Oreamnos_americanus'; % ADW
metaData.links.id_Taxo = '68526'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '14200811'; % MSW3
metaData.links.id_AnAge = 'Oreamnos_americanus'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Oreamnos_americanus}}';
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
bibkey = 'CoteFest2001'; type = 'article'; bib = [ ... 
'author = {Cote, S. and Festa-Bianchet, M.}, ' ... 
'year = {2001}, ' ...
'title = {Offspring sex ratio in relation to maternal age and social rank in mountain goats (\emph{Oreamnos americanus})}, ' ...
'howpublished = {\url{https://www.uwsp.edu/wildlife/Ungulates/Pages/Mountain Goat/Morphology.aspx}}, ' ...
'journal = {Behavioral Ecology and Sociobiology}, ' ...
'volume = {49}, ' ...
'pages = {260--265}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Oreamnos_americanus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{http://animaldiversity.org/accounts/Oreamnos_americanus/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

