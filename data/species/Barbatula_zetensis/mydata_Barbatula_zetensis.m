  function [data, auxData, metaData, txtData, weights] = mydata_Barbatula_zetensis
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Nemacheilidae';
metaData.species    = 'Barbatula_zetensis'; 
metaData.species_en = 'Zeta stone loach'; 

metaData.ecoCode.climate = {'Cfb', 'Dfa', 'Dfb'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iFm', '0iFp'};
metaData.ecoCode.embryo  = {'Fh'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(22); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2024 11 09];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 11 09];

%% set data
% zero-variate data
data.am = 10*365;   units.am = 'd';  label.am = 'life span';                       bibkey.am = 'BohlSlec2003';   
  temp.am = C2K(22); units.temp.am = 'K'; label.temp.am = 'temperature';
  comment.am = 'fishbase gives 2 yrs';

data.Lp = 4.9;    units.Lp = 'cm'; label.Lp = ' total length at puberty'; bibkey.Lp = 'BohlSlec2003';
data.Li = 8.3;    units.Li = 'cm'; label.Li = 'ultimate total length for females'; bibkey.Li = 'BohlSlec2003';
  comment.Li = 'fishbase gives TL 6.6 cm';

data.Wwb = 1.1e-4;  units.Wwb = 'g';  label.Wwb = 'wet weight at birth';            bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.6 mm Barbatula barbatula: pi/6*0.06^3';
data.Wwp = 0.85;  units.Wwp = 'g';  label.Wwp = 'wet weight at puberty for females';    bibkey.Wwp = {'BohlSlec2003','fishbase'};
  comment.Wwp = 'Based on 0.00708*Lp^3.01, see F1';
data.Wwi = 4.13; units.Wwi = 'g';  label.Wwi = 'ultimate wet weight for females';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'Based on 0.00708*Li^3.01, see F1';

data.Ri = 1e4/365;   units.Ri = '#/d';  label.Ri = 'max reprod rate';    bibkey.Ri = 'guess';
  temp.Ri = C2K(22); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on Barbatula barbatula';

% univariate data

% time-length
data.tL = [ ... % time since birth (yr), total length (cm)
1	3.648
2	7.170
3	8.417];
data.tL(:,1) = 365 * (0.3+data.tL(:,1)); % convert yr to d
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'total length'};  
temp.tL = C2K(22);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'BohlSlec2003'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 3 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.2; 

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'length-weight: Ww (in g) = 0.00708*(TL in cm)^3.01';
metaData.bibkey.F1 = 'fishbase';
F2 = 'known from River Moraea and River Zeta, Montenegro';
metaData.bibkey.F2 = 'fishbase';
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '5WC59'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = ''; % Ency of Life
metaData.links.id_Wiki = 'Barbatula_zetensis'; % Wikipedia
metaData.links.id_ADW = 'Barbatula_zetensis'; % ADW
metaData.links.id_Taxo = '1682519'; % Taxonomicon
metaData.links.id_WoRMS = '1525492'; % WoRMS
metaData.links.id_fishbase = 'Barbatula-zetensis'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Barbatula_zetensis}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%73167
bibkey = 'Kooy2010'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Kooijman, S.A.L.M.}, ' ...
'year = {2010}, ' ...
'title  = {Dynamic Energy Budget theory for metabolic organisation}, ' ...
'publisher = {Cambridge Univ. Press, Cambridge}, ' ...
'pages = {Table 4.2 (page 150), 8.1 (page 300)}, ' ...
'howpublished = {\url{../../../bib/Kooy2010.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'BohlSlec2003'; type = 'Article'; bib = [ ...  
'doi = {10.1111/j.1095-8649.2010.02653.}, ' ...
'author = {Bohlen, J. and V. Slechtova and R. \v{S}anda and L. Kalous and J. Freyhof and J. Vuki\''{c} and D. Mrdak}, ' ...
'year = {2003}, ' ...
'title = {Cobitis ohridana and Barbatula zetensis in the River Moraèa basin, Montenegro: distribution, habitat, population structure and conservation needs}, ' ... 
'journal = {Folia biol. (Krak\''{o}w)}, ' ...
'volume = {51(Suppl.)}, '...
'pages = {147-153}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Barbatula-zetensis}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

