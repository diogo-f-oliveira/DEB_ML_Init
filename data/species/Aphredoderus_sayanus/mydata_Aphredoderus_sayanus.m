  function [data, auxData, metaData, txtData, weights] = mydata_Aphredoderus_sayanus
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Percopsiformes'; 
metaData.family     = 'Aphredoderidae';
metaData.species    = 'Aphredoderus_sayanus'; 
metaData.species_en = 'Pirate perch'; 

metaData.ecoCode.climate = {'Cfa','Dfa'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFr', '0iFc'};
metaData.ecoCode.embryo  = {'Ft'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi','biCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(15); % K, body temp
metaData.data_0     = {'ap'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman','Starrlight Augustine'};        
metaData.date_subm = [2020 07 06];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam'}; 

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 03];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 03];

%% set data
% zero-variate data
data.tp = 170;   units.tp = 'd';  label.tp = 'time since birth at puberty';  bibkey.tp = 'guess';   
  temp.tp = C2K(15); units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'based on Lp and tL data';
data.am = 4*365;   units.am = 'd';  label.am = 'life span';                  bibkey.am = 'fishbase';   
  temp.am = C2K(15); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 6.1;  units.Lp = 'cm'; label.Lp = 'standard length at puberty';    bibkey.Lp = 'guess'; 
data.Li = 14;   units.Li = 'cm'; label.Li = 'ultimate standard length'; bibkey.Li = 'fishbase';

data.Wwb = 5.2e-4;  units.Wwb = 'g';  label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'McCa2012';
  comment.Wwb = 'based on egg diameter of 1 mm: pi/6*0.1^3';
data.Wwi = 16.4;  units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';        bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00447*L_i^3.11';
  
data.Ri = 30.4/365;   units.Ri = '#/d';  label.Ri = 'max reprod rate';       bibkey.Ri = 'McCa2012';   
  temp.Ri = C2K(15); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% univariate data
% time-length
data.tL_f = [ ... % time since birth (d), total length (cm)
1 6.8
2 8.3
3 9.4]; 
data.tL_f(:,1) = 365 * (0 + data.tL_f(:,1)); % convert yr to d
units.tL_f = {'d', 'cm'}; label.tL_f = {'time since birth', 'total length', 'female'};  
temp.tL_f = C2K(15); units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'ShepHuish1978';
comment.tL_f = 'Data for females';
%
data.tL_m = [ ... % time since birth (d), total length (cm)
1 6.9
2 7.9
3 8.5]; 
data.tL_m(:,1) = 365 * (0 + data.tL_m(:,1)); % convert yr to d
units.tL_m = {'d', 'cm'}; label.tL_m = {'time since birth', 'total length', 'male'};  
temp.tL_m = C2K(15); units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'ShepHuish1978';
comment.tL_m = 'Data for males';
    
%% set weights for all real data
weights = setweights(data, []);
weights.tL_f =  5 * weights.tL_f;
weights.tL_m =  5 * weights.tL_m;
weights.Li =  3 * weights.Li;

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
D1 = 'Males are assumed to differ from females by {p_Am} only';
D2 = 'Temperature are guessed; varied from 0 to 25.6 C';
D3 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);

%% Facts
F1 = 'length-weight: Ww in g =  0.00447*(TL in cm)^3.11';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = 'FK24'; % Cat of Life
metaData.links.id_ITIS = '164405'; % ITIS
metaData.links.id_EoL = '218744'; % Ency of Life
metaData.links.id_Wiki = 'Aphredoderus_sayanus'; % Wikipedia
metaData.links.id_ADW = 'Aphredoderus_sayanus'; % ADW
metaData.links.id_Taxo = '44202'; % Taxonomicon
metaData.links.id_WoRMS = '1026973'; % WoRMS
metaData.links.id_fishbase = 'Aphredoderus-sayanus'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Aphredoderus_sayanus}}';  
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
bibkey = 'ShepHuish1978'; type = 'article'; bib = [ ... 
'doi = {10.1577/1548-8659(1978)107<457:AGADOT>2.0.CO;2}, ' ...
'author = {Marsha E. Shepherd and  Melvin T. Huish}, ' ...
'year = {1978}, ' ...
'title = {Age, Growth, and Diet of the Pirate Perch in a Coastal Plain Stream of {N}orth {C}arolina}, ' ... 
'journal = {Transactions of the American Fisheries Society}, ' ...
'volume = {107}, ' ...
'pages = {457-459}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'McCa2012'; type = 'article'; bib = [ ... 
'doi = {10.1577/1548-8659(1978)107<457:AGADOT>2.0.CO;2}, ' ...
'author = {Malcolm L. McCallum}, ' ...
'year = {2012}, ' ...
'title = {Notes on the Diet and Egg Clutches of the Pirate Perch (\emph{Aphredoderus Sayanus}) from {C}entral {A}rkansas}, ' ... 
'journal = {Southeastern Naturalist}, ' ...
'volume = {11}, ' ...
'pages = {543-545}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Aphredoderus-sayanus.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
