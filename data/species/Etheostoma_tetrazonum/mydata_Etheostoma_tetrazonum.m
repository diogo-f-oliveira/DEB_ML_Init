  function [data, auxData, metaData, txtData, weights] = mydata_Etheostoma_tetrazonum
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Percidae';
metaData.species    = 'Etheostoma_tetrazonum'; 
metaData.species_en = 'Missouri saddled darter'; 

metaData.ecoCode.climate = {'Cfa'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFc'};
metaData.ecoCode.embryo  = {'Fg'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(23); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.6; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2020 09 23];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam'}; 

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 07];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 07];

%% set data
% zero-variate data
data.ab = 11;   units.ab = 'd';  label.ab = 'age at birth';              bibkey.ab = 'TabeTabe1983';   
  temp.ab = C2K(23); units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'hatch at 6 d, 5 d post hatch to first feeding assumed';
data.am = 4*365;   units.am = 'd';  label.am = 'life span';                 bibkey.am = 'TabeTabe1983';   
  temp.am = C2K(23); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 4.1;  units.Lp = 'cm'; label.Lp = 'total length at puberty';      bibkey.Lp = 'TabeTabe1983'; 
  comment.Lp = 'based on SL 3.56 and F2';
data.Li = 9;    units.Li = 'cm'; label.Li = 'ultimate total length';      bibkey.Li = 'fishbase';
  comment.Li = 'TabeTabe1983 give SL 7 cm, which corresponds with TL 8 cm';

data.Wwb = 3.6e-3;  units.Wwb = 'g';  label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'TabeTabe1983';
  comment.Wwb = 'based on egg diameter of 1.9 mm: pi/6*0.19^3';
data.Wwi = 5.1; units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';        bibkey.Wwi = 'fishbase';
   comment.Wwi = 'relationship 0.00513*Li^3.14 (see F1)';

data.Ri = 50/365;   units.Ri = '#/d';  label.Ri = 'max reproduction rate'; bibkey.Ri = 'TabeTabe1983';
  temp.Ri = C2K(23); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% univariate data
% time-length
data.tL_f = [ ... % time since birth (yr), std length (cm)
    1 3.56
    2 4.37
    3 5.01];
data.tL_f(:,1) = 365 * (0.8 + data.tL_f(:,1));  % convert mnth to d
data.tL_f(:,2) = data.tL_f(:,2)/ 0.85; % convert SL to TL
units.tL_f = {'d', 'cm'}; label.tL_f = {'time since birth', 'total length', 'female'};  
temp.tL_f = C2K(23);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'TabeTabe1983';
comment.tL_f = 'Data for females from Niangua River';
%
data.tL_m = [ ... % time since birth (yr), std length (cm)
    1 3.78
    2 4.56
    3 5.26
    4 5.61];
data.tL_m(:,1) = 365 * (0.8 + data.tL_m(:,1));  % convert mnth to d
data.tL_m(:,2) = data.tL_m(:,2)/ 0.85; % convert SL to TL
units.tL_m = {'d', 'cm'}; label.tL_m = {'time since birth', 'total length', 'male'};  
temp.tL_m = C2K(23);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'TabeTabe1983';
comment.tL_m = 'Data for males from Niangua River';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f =  50 * weights.tL_f;
weights.tL_m =  50 * weights.tL_m;
weights.Wwb =  5 * weights.Wwb;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
%weights.psd.v =  2 * weights.psd.v;
%weights.psd.p_M =  3 * weights.psd.p_M;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_f', 'tL_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
D2 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Facts
F1 = 'length-weight: Ww in g = 0.00513 * (TL in cm)^3.14';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'length-length: SL = 0.875 * TL';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1,'F2',F2);

%% Links
metaData.links.id_CoL = '3BL7L'; % Cat of Life
metaData.links.id_ITIS = '168441'; % ITIS
metaData.links.id_EoL = '203740'; % Ency of Life
metaData.links.id_Wiki = 'Etheostoma_tetrazonum'; % Wikipedia
metaData.links.id_ADW = 'Etheostoma_tetrazonum'; % ADW
metaData.links.id_Taxo = '174162'; % Taxonomicon
metaData.links.id_WoRMS = '1525215'; % WoRMS
metaData.links.id_fishbase = 'Etheostoma-tetrazonum'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Etheostoma_tetrazonum}}';  
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
bibkey = 'TabeTabe1983'; type = 'article'; bib = [ ...  
'author = {Charles A. Taber and Barbara A. Taber}, ' ...
'year = {1983}, ' ...
'title = {Reproductive Biology and Age and Growth of the {M}issouri Saddled Darter \emph{Etheostoma tetrazonum}}, ' ... 
'journal = {The American Midland Naturalist}, ' ...
'volume = {109(2)}, '...
'pages = {222-229}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Etheostoma-tetrazonum.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
