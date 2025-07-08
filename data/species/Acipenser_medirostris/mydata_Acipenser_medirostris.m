function [data, auxData, metaData, txtData, weights] = mydata_Acipenser_transmontanus

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Acipenseriformes'; 
metaData.family     = 'Acipenseridae';
metaData.species    = 'Acipenser_medirostris'; 
metaData.species_en = 'Green sturgeon'; 

metaData.ecoCode.climate = {'MC','BSk','Dfc'};
metaData.ecoCode.ecozone = {'MPNE','MPNW','TH'};
metaData.ecoCode.habitat = {'0iMcd', '0iFr'};
metaData.ecoCode.embryo  = {'Fg'};
metaData.ecoCode.migrate = {'Mda'};
metaData.ecoCode.food    = {'biCi', 'biCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(13); % K, body temp - this is not sure as the species  migrates from sea to fresh water
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman','Starrlight Augustine'};                             
metaData.date_subm = [2020 07 12];                          
metaData.email     = {'sta@akvaplan.niva.no'};                 
metaData.address   = {'Akvaplan-niva, FRAM, Tromso, Norway'};      

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 01];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 01];

%% set data
% zero-variate data;
data.ab = 20; units.ab = 'd';      label.ab = 'age at birth';   bibkey.ab = 'MoseIsra2016';    
  temp.ab = C2K(13); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 60*365; units.am = 'd';  label.am = 'life span';      bibkey.am = 'fishbase';   
  temp.am = C2K(13);units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp  = 166;      units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'fishbase';
data.Li  = 270;      units.Li  = 'cm';  label.Li  = 'ultimate total length'; bibkey.Li  = 'fishbase';

data.Wwb = 4.31e-2;    units.Wwb = 'g';   label.Wwb = 'wet weight birth';   bibkey.Wwb = 'MoseIsra2016';
  comment.Wwb = 'based on egg diameter of 4.35 mm: pi/6*0.435^3';
data.Wwi = 117e3;    units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';   bibkey.Wwi = 'Wiki';
  comment.Wwi = 'based on 0.00593*Li^3, see F1, fishbase/wiki reports 159 kg for TL 210';
 
data.Ri  = 242e3/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';   bibkey.Ri  = 'MoseIsra2016';   
  temp.Ri = C2K(13);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  
% uni-variate data
% time-weight - change in weight
data.tWw_f = [ ... % time since birth, (yr), weight (g)
    16 29e3
    40 73e3];
data.tWw_f(:,1) = 365 *data.tWw_f(:,1); % convert yr to d
units.tWw_f = {'d', 'g'};     label.tWw_f = {'time since birth', 'wet weight', 'female'};  
  temp.tWw_f = C2K(13);  units.temp.tWw_f = 'K'; label.temp.tWw_f = 'temperature';
bibkey.tWw_f = 'MoseIsra2016';
comment.tWw_f = 'Data for females in Klamath River';
%
data.tWw_m = [ ... % time since birth, (yr), weight (g)
     14 19e3
     32 56e3];
data.tWw_m(:,1) = 365 *data.tWw_m(:,1); % convert yr to d
units.tWw_m = {'d', 'g'};     label.tWw_m = {'time since birth', 'wet weight', 'male'};  
  temp.tWw_m = C2K(13);  units.temp.tWw_m = 'K'; label.temp.tWw_m = 'temperature';
bibkey.tWw_m = 'MoseIsra2016';
comment.tWw_m = 'Data for males in Klamath River';

%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
 
%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tWw_f','tWw_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are supposed to differ from females by {p_Am} only';
D2 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Facts
F1 = 'Length-weight: Ww (in g) = 0.00593 * (TL in cm)^3';
metaData.bibkey.F1 = 'fishbase';
F2 = 'Length-length from photo: FL = 0.85 * TL';
metaData.bibkey.F2 = 'Wiki';
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '9C6H'; % Cat of Life
metaData.links.id_ITIS = '161067'; % ITIS
metaData.links.id_EoL = '46561178'; % Ency of Life
metaData.links.id_Wiki = 'Acipenser_medirostris'; % Wikipedia
metaData.links.id_ADW = 'Acipenser_medirostris'; % ADW
metaData.links.id_Taxo = '42435'; % Taxonomicon
metaData.links.id_WoRMS = '271695'; % WoRMS
metaData.links.id_fishbase = 'Acipenser-medirostris'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Acipenser_medirostris}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'MoseIsra2016'; type = 'Article'; bib = [ ...  
'author = {M. L. Moser and J. A. Israel and M. Neuman and S. T. Lindley and D. L. Erickson and B. W. McCovey and A. P. Klimley}, ' ...
'doi = {10.1111/jai.13238}, ' ...
'year = {2016}, ' ...
'title = {Biology and life history of Green Sturgeon (\emph{Acipenser medirostris} {A}yres, 1854): state of the science}, ' ... 
'journal = {J. Appl. Ichthyol.}, ' ...
'volume = {32}, ' ...
'pages = {67-86}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'BoriMose2017'; type = 'Article'; bib = [ ...  
'author = {Joshua M. Borin and Mary L. Moser and Adam G. Hansen and David A. Beauchamp and Stephen C. Corbett and Brett R. Dumbauld and Casey Pruitt and Jennifer L. Ruesink and Cinde Donoghue}, ' ...
'doi = {10.1007/s10641-017-0665-3}, ' ...
'year = {2017}, ' ...
'title = {Energetic requirements of green sturgeon (\emph{Acipenser medirostris}) feeding on burrowing shrimp (\emph{Neotrypaea californiensis}) in estuaries: importance of temperature, reproductive investment, and residence time}, ' ... 
'journal = {Environ Biol Fish}, ' ...
'volume = {100}, ' ...
'pages = {1561-1573}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AlleCech2007'; type = 'Article'; bib = [ ...
'doi = {10.1007/s10641-006-9049-9}, ' ...
'author = {Peter J. Allen and Joseph J. Cech}, ' ...
'year = {2007}, ' ...
'title = {Age/size effects on juvenile green sturgeon, \emph{Acipenser medirostris}, oxygen consumption, growth, and osmoregulation in saline environments}, ' ... 
'journal = {Environ Biol Fish}, ' ...
'volume = {79}, ' ...
'pages = {211-229}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Acipenser_medirostris}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

