  function [data, auxData, metaData, txtData, weights] = mydata_Esox_niger

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Esociformes'; 
metaData.family     = 'Esocidae';
metaData.species    = 'Esox_niger'; 
metaData.species_en = 'Chain pickerel'; 

metaData.ecoCode.climate = {'Cfa','Dfa','Dfb'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFl'};
metaData.ecoCode.embryo  = {'Fh'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjCi', 'jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(11); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman','Starrlight Augustine'};        
metaData.date_subm = [2020 07 02];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam'}; 

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 03];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 03];
metaData.date_acc    = [2020 07 02]; 

%% set data
% zero-variate data
data.ab = 6;     units.ab = 'd';   label.ab = 'age at birth';           bibkey.ab = 'WallYeag1990'; 
  temp.ab = C2K(11); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tp = 1*365;  units.tp = 'd';   label.tp = 'time since birth at puberty';  bibkey.tp = 'WallYeag1990';
  temp.tp = C2K(11);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 9*365; units.am = 'd';   label.am = 'life span';              bibkey.am = 'fishbase';   
  temp.am = C2K(11); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 18;   units.Lp = 'cm';  label.Lp = 'total length at puberty';bibkey.Lp = 'WallYeag1990'; 
data.Li = 99;    units.Li = 'cm';  label.Li = 'ultimate total length';  bibkey.Li = 'fishbase';

data.Wwb = 8.2e-3; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'WallYeag1990';
  comment.Wwb = 'based on egg diameter of 2.5 mm: pi/6*0.25^3';
data.Wwp = 31.3;    units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';  bibkey.Wwp = {'WallYeag1990','fishbase'};
  comment.Wwp = 'based on 0.00405*Lp^3.098, see F1';
data.Wwi = 6.1e3; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00405*Li^3.098, see F1';
  
data.Ri = 3e4/365;units.Ri = '#/d'; label.Ri = 'maximum reprod rate';    bibkey.Ri = 'fishbase';   
  temp.Ri = C2K(11);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
    
% uni-variate data
% time - length
data.tL_f = [ ... % time since birth (yr), total length (cm)
2 38
3 45
4 59.9
5 55.2];
data.tL_f(:,1) = (0.5 + data.tL_f(:,1)) * 365;  % convert year to d 
units.tL_f = {'d', 'cm'}; label.tL_f = {'time since birth', 'total length', 'female'};
temp.tL_f = C2K(11); units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = {'CranCorn2020'};
comment.tL_f = 'Data for females';
%
data.tL_m = [ ... % time since birth (yr), total length (cm)
1 18
2 34
3 42.2
4 58.1
5 51
6 50.8];
data.tL_m(:,1) = (0.5 + data.tL_m(:,1)) * 365; % convert year to d
units.tL_m = {'d', 'cm'}; label.tL_m= {'time since birth', 'total length', 'male'}; 
temp.tL_m = C2K(11); units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = {'CranCorn2020'};
comment.tL_m = 'Data for males';

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
set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Temperatures were guessed';
D2 = 'males are assumed to differ from females by {p_Am} only';
D3 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);  

%% Facts 
F1 = 'length-weight: Ww in g = 0.00405 *(TL in cm)^3.098';	
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '3BHYN'; % Cat of Life
metaData.links.id_ITIS = '162143'; % ITIS
metaData.links.id_EoL = '223146'; % Ency of Life
metaData.links.id_Wiki = 'Esox_niger'; % Wikipedia
metaData.links.id_ADW = 'Esox_niger'; % ADW
metaData.links.id_Taxo = '42893'; % Taxonomicon
metaData.links.id_WoRMS = '888530'; % WoRMS
metaData.links.id_fishbase = 'Esox-niger'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/wiki/Esox_niger}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Kooy2010'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Kooijman, S.A.L.M.}, ' ...
'year = {2010}, ' ...
'title  = {Dynamic Energy Budget theory for metabolic organisation}, ' ...
'publisher = {Cambridge Univ. Press, Cambridge}, ' ...
'howpublished = {\url{../../../bib/Kooy2010.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'CranCorn2020'; type = 'Article'; bib = [ ...
'doi = {10.1139/cjfas-2018-0404}, ' ...
'author = {A. H. Underhill}, ' ...
'year = {1949}, ' ...
'title = {Studies on the Development, Growth and Maturity of the Chain Pickerel, \emph{Esox niger} {L}esueur}, ' ... 
'journal = {The Journal of Wildlife Management}, ' ...
'volume = {13}, '...
'pages = {377-391}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'WallYeag1990'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Robert Wallus and Bruce L. Yeager and Thomas P. Simon}, ' ...
'year = {1990}, ' ...
'title  = {The reproductive biology and early life history of fishes of the Ohio river}, ' ...
'publisher = {Tennessee Valley Authority}, ' ...
'volume  = {1: Acipenseridae through Esocidae}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Esox-niger.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

