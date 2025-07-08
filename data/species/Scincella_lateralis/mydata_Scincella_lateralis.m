function [data, auxData, metaData, txtData, weights] = mydata_Scincella_lateralis
%% set metaData
metaData.phylum     = 'Chordata';
metaData.class      = 'Reptilia';
metaData.order      = 'Squamata';
metaData.family     = 'Scincidae';
metaData.species    = 'Scincella_lateralis';
metaData.species_en = 'Little brown skink';

metaData.ecoCode.climate = {'BWh'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iTf'};
metaData.ecoCode.embryo  = {'Tns'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(25); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'L-dL'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2023 01 07];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 08];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 08];

%% set data
% zero-variate data;
data.ab = 50;  units.ab = 'd';      label.ab = 'age at birth';             bibkey.ab = 'guess';
  temp.ab = C2K(25); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 4*365;     units.am = 'd'; label.am = 'life span';               bibkey.am = 'Broo1967';
  temp.am = C2K(25);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lb  = 1.9;  units.Lb  = 'cm';  label.Lb  = 'SVL at birth';   bibkey.Lb  = 'Broo1967';
data.Lp  = 4.2;  units.Lp  = 'cm';  label.Lp  = 'SVL at puberty for females';   bibkey.Lp  = 'Broo1967';
data.Lpm  = 3.5; units.Lpm  = 'cm';  label.Lpm  = 'SVL at puberty for males';   bibkey.Lpm  = 'Broo1967';
data.Li  = 4.7;   units.Li  = 'cm';  label.Li  = 'ultimate SVL for females';   bibkey.Li  = 'John1953';
data.Lim = 4.2;  units.Lim  = 'cm';  label.Lim  = 'ultimate SVL for males';   bibkey.Lim  = 'John1953';

data.Wwb = 0.1; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'guess';
  comment.Wwim = 'based on Ctenotus_pantherinus: 15*(1.9/10)^3';
data.Wwi = 4.2; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';  bibkey.Wwi = 'guess';
  comment.Wwi = 'based on Ctenotus_pantherinus: 54*(4.7/11)^3';
data.Wwim = 1.1; units.Wwim = 'g';   label.Wwim = 'ultimate wet weight for males';  bibkey.Wwim = 'guess';
  comment.Wwim = 'based on Ctenotus_pantherinus: 15*(4.2/10)^3';

data.Ri  = 2*2.8/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';   bibkey.Ri  = 'Broo1967';
temp.Ri = C2K(25); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '2.8 eggs per clutch, 2 clutches per yr';

% uni-variate data
% time-length
data.tL_f = [... % time since birth (d), SVL (cm)
  0.000	1.873
 33.919	2.609
 37.270	1.864
 66.785	2.897
132.288	2.591
250.485	3.847
277.059	3.795
304.507	3.697
365-1.032	4.522
365-0.304	3.912
365+33.607	4.810
365+67.027	3.825
365+67.248	4.670
365+131.890	4.463
365+155.852	4.595
365+187.740	4.528
365+219.650	4.550
365+251.550	4.530
365+276.446	4.843
365+306.530	4.657
365+335.825	4.845];
units.tL_f  = {'d', 'cm'};  label.tL_f = {'time since birth', 'SVL', 'female'};  
temp.tL_f   = C2K(25);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'John1953'; 
%
data.tL_m = [... % time since birth (d), SVL (cm)
0.000	1.6658
34.957	2.8298
36.413	1.7870
68.457	2.2413
131.087	2.6740
158.761	2.9423
365+0.000	3.9592
365+34.957	4.2015
365+67.000	4.0414
365+101.228	4.2188
365+131.087	3.8986
365+157.304	3.9938
365+184.250	4.0284
365+218.478	4.1452
365+249.793	4.2924
365+273.826	4.3486
365+303.685	4.0976
365+334.272	4.3919];
units.tL_m  = {'d', 'cm'};  label.tL_m = {'time since birth', 'SVL', 'male'};  
temp.tL_m   = C2K(25);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'John1953'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 3 * weights.tL_f;
weights.tL_m = 3 * weights.tL_m;
weights.Li = 3 * weights.Li;
weights.Lim = 3 * weights.Lim;
weights.Lb = 3 * weights.Lb;
weights.ab = 0 * weights.ab;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} only';
D2 = 'Temperatures are guessed';
D3 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);  

% %% Facts
% F1 = '';
% metaData.bibkey.F1 = ''; 
% metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4VK34'; % Cat of Life
metaData.links.id_ITIS = '174008'; % ITIS
metaData.links.id_EoL = '460646'; % Ency of Life
metaData.links.id_Wiki = 'Scincella_lateralis'; % Wikipedia
metaData.links.id_ADW = 'Scincella_lateralis'; % ADW
metaData.links.id_Taxo = '576153'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_ReptileDB = 'genus=Scincella&species=lateralis'; % ReptileDB
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Scincella_lateralis}}';   
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
bibkey = 'Broo1967'; type = 'Article'; bib = [ ...  
'author = {Garnett R. Brooks}, ' ...
'title = {Population Ecology of the Ground Skink, \emph{Lygosoma laterale} ({S}ay)}, ' ...
'journal = {Ecological Monographs}, ' ...
'volume = {37(2)}, ' ...
'pages = {71-87}, ' ...
'year = {1967}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'John1953'; type = 'Article'; bib = [ ...  
'author = {Johnson, R. M.}, ' ...
'title = {A contribution on the life history of the lizard \emph{Scincella laterale} ({S}ay)}, ' ...
'journal = {Tulane Stud. Zool.}, ' ...
'volume = {1}, ' ...
'pages = {11-27}, ' ...
'year = {1953}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

