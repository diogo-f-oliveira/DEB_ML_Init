function [data, auxData, metaData, txtData, weights] = mydata_Blepsias_cirrhosus
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Agonidae';
metaData.species    = 'Blepsias_cirrhosus'; 
metaData.species_en = 'Silverspotted sculpin'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MPN'};
metaData.ecoCode.habitat = {'biMd'};
metaData.ecoCode.embryo  = {'Mbs'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(7.1); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'; 't-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 08 09];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 08 09];

%% set data
% zero-variate data
data.ab = 54; units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'guess';   
  temp.ab = C2K(7.1);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 7*365; units.am = 'd';    label.am = 'life span';              bibkey.am = 'KolpDolg2006';   
  temp.am = C2K(7.1);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 13;     units.Lp = 'cm';   label.Lp = 'std length at puberty'; bibkey.Lp = 'KolpDolg2006';
data.Li = 22;  units.Li = 'cm';   label.Li = 'ultimate std length';  bibkey.Li = 'fishbase';

data.Wwb = 0.0109;  units.Wwb = 'g';    label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'KolpDolg2006';
  comment.Wwb = 'based on egg diameter of 2.5-3.0 mm: pi/6*0.275^3';
data.Wwp = 7.6;   units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';    bibkey.Wwp = {'KolpDolg2006','fishbase'};
  comment.Wwp = 'based on 0.00288*Lp^3.07, see F1';
data.Wwi = 38;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00288*Li^3.07, see F1';
 
data.Ri  = 404/365;   units.Ri  = '#/d'; label.Ri  = 'max reproduction rate';   bibkey.Ri  = 'fishbase';   
  temp.Ri = C2K(7.1);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data

% time-length
data.tL_fm = [ ... % time since hatch (yr), total length (cm)
    2 11.3 10.3
    3 13.3 12.9
    4 15.2 NaN
    5 16.4 17.5
    6 NaN  19.0];
data.tL_fm(:,1) = (0.2 + data.tL_fm(:,1)) * 365; % convert yr to d
units.tL_fm = {'d', 'cm'};  label.tL_fm = {'time since birth', 'total length'};  
  temp.tL_fm = C2K(7.1);  units.temp.tL_fm = 'K'; label.temp.tL_fm = 'temperature';
bibkey.tL_fm = 'KolpDolg2006'; treat.tL_fm = {1 {'females','males'}}; 

% time-weight
data.tW_fm = [ ... % time since hatch (yr), total length (cm)
    2 10.8 11.0
    3 22.7 20.8
    4 40.1 NaN
    5 49.1 43.0
    6 NaN  60.0];
data.tW_fm(:,1) = (0.2 + data.tL_fm(:,1)) * 365; % convert yr to d
units.tW_fm = {'d', 'g'};  label.tW_fm = {'time since birth', 'weight'};  
  temp.tW_fm = C2K(7.1);  units.temp.tW_fm = 'K'; label.temp.tW_fm = 'temperature';
bibkey.tW_fm = 'KolpDolg2006'; treat.tW_fm = {1 {'females','males'}}; 

%% set weights for all real data
weights = setweights(data, []);
weights.tL_fm = weights.tL_fm * 10;
weights.tW_fm = weights.tW_fm * 3;
weights.ab = weights.ab * 0;
weights.Li = weights.Li * 0;
weights.Wwi = weights.Wwi * 0;
weights.Ri = weights.Ri * 5;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Group plots
% set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.00288*(TL in cm)^3.07'; 
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Adults inject eggs into the tissue near the gastral cavity of a sponge to use as a spawning bed';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = 'HHCB'; % Cat of Life
metaData.links.id_ITIS = '167439'; % ITIS
metaData.links.id_EoL = '46568874'; % Ency of Life
metaData.links.id_Wiki = 'Blepsias_cirrhosus'; % Wikipedia
metaData.links.id_ADW = 'Blepsias_cirrhosus'; % ADW
metaData.links.id_Taxo = '161943'; % Taxonomicon
metaData.links.id_WoRMS = '159459'; % WoRMS
metaData.links.id_fishbase = 'Blepsias_cirrhosus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/wiki/Blepsias_cirrhosus}}';  
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
bibkey = 'KolpDolg2006'; type = 'Article'; bib = [ ...
'doi = {10.1007/s10641-010-9607-z}, ' ...
'author = {N. V. Kolpakov and N. T. Dolganova}, ' ...
'year = {2006}, ' ...
'title = {On the Biology of \emph{Blepsias cirrhosus} ({H}emitripteridae) from Coastal Waters of {N}orthern {P}rimorye}, ' ... 
'journal = {Journal of Ichthyology}, ' ...
'volume = {46(6)}, '...
'pages = {454–459}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Blepsias_cirrhosus.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

