function [data, auxData, metaData, txtData, weights] = mydata_Hexaprotodon_liberiensis

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Cetartiodactyla'; 
metaData.family     = 'Hippopotamidae';
metaData.species    = 'Hexaprotodon_liberiensis'; 
metaData.species_en = 'Pygmy hippopotamus'; 

metaData.ecoCode.climate = {'Am'};
metaData.ecoCode.ecozone = {'TPa'};
metaData.ecoCode.habitat = {'0iFr', '0iFl', '0iTf'};
metaData.ecoCode.embryo  = {'Fv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiHl', 'xiHs'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(36.1); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2018 08 28];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2018 08 28]; 

%% set data
% zero-variate data

data.tg = 199;      units.tg = 'd';    label.tg = 'gestation time';             bibkey.tg = 'AnAge';   
  temp.tg = C2K(36.1);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
  comment.tg = 'temp from wiki.answers';
data.tx = 198;      units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'AnAge';   
  temp.tx = C2K(36.1);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 1278;     units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'AnAge';
  temp.tp = C2K(36.1);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'AnAge: males have 1644 d, but confirmation is not found';
data.am = 42.3*365; units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(36.1);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'Wiki: 18 yr';

data.Wwb = 5e3;    units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'LangSchm1982';
data.Wwi = 240e3;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'Wiki';
  comment.Wwi = '180 till 275 kg';

data.Ri  = 0.4/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(36.1);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  
% uni-variate data
% t-W data
data.tW1 = [ ... % time since birth (d), wet weight (kg)
0.171	6.067
0.534	6.096
2.141	6.529
3.817	6.875
6.966	8.055
12.222	9.410
17.168	12.653
21.329	13.748
26.607	15.876
30.406	16.971
31.933	17.174];
units.tW1   = {'d', 'kg'};  label.tW1 = {'time since birth', 'wet weight'};  
temp.tW1    = C2K(36.1);  units.temp.tW1 = 'K'; label.temp.tW1 = 'temperature';
bibkey.tW1 = 'LangSchm1982';
comment.tW1 = 'Data for calf 1';
%
data.tW2 = [ ... % time since birth (d), wet weight (kg)
0.187	4.064
4.360	5.589
7.348	6.195
11.160	7.748
15.911	9.188
19.790	10.540
24.539	11.923
29.727	13.449
31.914	13.911];
units.tW2   = {'d', 'kg'};  label.tW2 = {'time since birth', 'wet weight'};  
temp.tW2    = C2K(36.1);  units.temp.tW2 = 'K'; label.temp.tW2 = 'temperature';
bibkey.tW2 = 'LangSchm1982';
comment.tW2 = 'Data for calf 2';
  
   
%% set weights for all real data
weights = setweights(data, []);
weights.tW1 = 3*weights.tW1;
weights.tW2 = 3*weights.tW2;
weights.Wwb = 2*weights.Wwb;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
data.psd.t_0 = 0; units.psd.t_0   = 'd'; label.psd.t_0 = 'time at start development'; weights.psd.t_0 = 0.3;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tW1','tW2'}; subtitle1 = {'Data for calf 1,2'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Links
metaData.links.id_CoL = '3LGQL'; % Cat of Life
metaData.links.id_ITIS = '625022'; % ITIS
metaData.links.id_EoL = '317313'; % Ency of Life
metaData.links.id_Wiki = 'Hexaprotodon_liberiensis'; % Wikipedia
metaData.links.id_ADW = 'Hexaprotodon_liberiensis'; % ADW
metaData.links.id_Taxo = '67730'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '14200102'; % MSW3
metaData.links.id_AnAge = 'Hexaprotodon_liberiensis'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Hexaprotodon_liberiensis}}';
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
bibkey = 'LangSchm1982'; type = 'Article'; bib = [ ... 
'author = {D. Langdon and K. Schmidt}, ' ... 
'year = {1982}, ' ...
'doi = {10.1111/j.1748-1090.1982.tb02048.x}, ' ...
'title = {Hand-rearing a pygmy hippopotamus \emph{Choeropsis liberiensis} at {M}elbourne {Z}oo}, ' ...
'journal = {Int. Zoo Yb.}, ' ...
'volume = {22}, ' ...
'pages = {268--269}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Hexaprotodon_liberiensis}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

