function [data, auxData, metaData, txtData, weights] = mydata_Monachus_monachus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Carnivora'; 
metaData.family     = 'Phocidae';
metaData.species    = 'Monachus_monachus'; 
metaData.species_en = 'Mediterranean monk seal'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MAm'};
metaData.ecoCode.habitat = {'0iMc'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiCvf'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(37); % K
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Lb'; 'Li'; 'Wwb';  'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2021 12 06];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 12];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 12];

%% set data
% zero-variate data

data.tg = 289;    units.tg = 'd';    label.tg = 'gestation time';              bibkey.tg = 'AnAge';   
  temp.tg = C2K(37);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 18*7;   units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'Wiki';   
  temp.tx = C2K(37);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 1461 ;    units.tp = 'd';    label.tp = 'time since birth at puberty (female)';           bibkey.tp = 'AnAge';
  temp.tp = C2K(37);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tpm = 1461 ;    units.tpm = 'd';    label.tpm = 'time since birth at puberty (male)';           bibkey.tpm = 'AnAge';
  temp.tpm = C2K(37);  units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
data.am = 37*365;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'MurpSprad2012';   
  temp.am = C2K(37);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 100;   units.Lb  = 'cm';  label.Lb  = 'total length at birth';   bibkey.Lb  = 'Wiki';  
data.Li  = 211.5;   units.Li  = 'cm';  label.Li  = 'total length fem.';   bibkey.Li  = 'MurpSprad2012';
data.Lim  = 222;   units.Lim  = 'cm';  label.Lim  = 'total length male';   bibkey.Lim  = 'MurpSprad2012';
  
data.Wwb = 19e3;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'AnAge';
  comment.Wwb = 'Wiki gives 15-18 kg; ADW gives 17-24 kg';
data.Wwi = 300e3;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight fem.';     bibkey.Wwi = 'Wiki';
data.Wwim = 320e3;   units.Wwim = 'g';   label.Wwim = 'ultimate wet weight male';     bibkey.Wwim = 'Wiki';

data.Ri  = 0.5/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(37);    units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '1 pup per litter, 1 litter per 2 yr';
 
% uni-variate data

% time-length
data.tL_f = [ ... % time since birth (yr), standard length (cm)
 0.209	141.158
0.586	152.920
0.921	163.842
1.423	142.010
1.799	148.733
8.828	239.516
25.983	206.940
28.870	202.771
36.025	204.106];  
data.tL_f(:,1) = data.tL_f(:,1) * 365; % yr to d
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since birth', 'standard length', 'female'};  
temp.tL_f    = C2K(37);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'MurpSprad2012';
comment.tL_f = 'Data for females';
% 
data.tL_m = [ ... % time since birth (yr), standard length (cm)
0.335	131.500
0.628	124.784
1.004	158.804
2.218	168.895
2.887	182.340
6.067	167.256
7.908	205.910
7.950	197.932
8.870	249.595
8.912	221.039
9.079	217.681
12.887	224.020
16.862	229.941
20.879	206.466];  
data.tL_m(:,1) = data.tL_m(:,1) * 365; % yr to d
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time since birth', 'standard length', 'male'};  
temp.tL_m    = C2K(37);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'MurpSprad2012';
comment.tL_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 3 * weights.tL_f;
weights.tL_m = 3 * weights.tL_m;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_f'; 'tL_m'}; subtitle1 = {'data for female, male'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} only';
D2 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Links
metaData.links.id_CoL = '43ZLW'; % Cat of Life
metaData.links.id_ITIS = '180659'; % ITIS
metaData.links.id_EoL = '46559158'; % Ency of Life
metaData.links.id_Wiki = 'Monachus_monachus'; % Wikipedia
metaData.links.id_ADW = 'Monachus_monachus'; % ADW
metaData.links.id_Taxo = '67489'; % Taxonomicon
metaData.links.id_WoRMS = '137081'; % WoRMS
metaData.links.id_MSW3 = '14001051'; % MSW3
metaData.links.id_AnAge = 'Monachus_monachus'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Monachus_monachus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/Monachus_monachus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{https://animaldiversity.org/accounts/Monachus_monachus/}}';
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
bibkey = 'MurpSprad2012'; type = 'Article'; bib = [ ... 
'doi = {10.3354/esr00392}, ' ...
'author = {Sin\''{e}ad Murphy and Trevor R. Spradlin and Beth Mackey and Jill McVee and Evgenia Androukaki and Eleni Tounta and Alexandros A. Karamanlidis and Panagiotis Dendrinos and Emily Joseph and Christina Lockyer and Jason Matthiopoulos}, ' ... 
'year = {2012}, ' ...
'title = {Age estimation, growth and age-related mortality of {M}editerranean monkseals \emph{Monachus monachus}}, ' ...
 'journal = {Endang. Species Res.}, ' ...
'volume = {16}, ' ...
'pages = {149–163}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

