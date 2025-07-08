function [data, auxData, metaData, txtData, weights] = mydata_Macrhybopsis_storeriana
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Leuciscidae';
metaData.species    = 'Macrhybopsis_storeriana'; 
metaData.species_en = 'Silver chub'; 

metaData.ecoCode.climate = {'Cfa','Dfa'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFr'};
metaData.ecoCode.embryo  = {'Fp'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'bpCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(21); % K, body temp
metaData.data_0     = {'tp'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'tL'}; 

metaData.COMPLETE = 2.1; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman', 'Starrlight Augustine'};        
metaData.date_subm = [2020 08 10];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2020 08 10]; 

%% set data
% zero-variate data

data.am = 4*365;   units.am = 'd';  label.am = 'life span';                   bibkey.am = 'guess';   
  temp.am = C2K(21); units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp = 7;    units.Lp = 'cm'; label.Lp = 'total length at puberty';        bibkey.Lp = 'guess'; 
  comment.Lp = 'based on remark that tp < 1yr and tL data';
data.Li = 23.1;    units.Li = 'cm'; label.Li = 'ultimate total length';       bibkey.Li = 'fishesoftexas'; 
  
data.Wwb = 1.8e-4;  units.Wwb = 'g'; label.Wwb = 'wet weight at birth';       bibkey.Wwb = 'DietRobe2006';
  comment.Wwb = 'based on egg diameter of 0.7 mm of M. meeki: pi/6*0.07^3';
data.Wwp = 3.1;   units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';      bibkey.Wwp = {'fishbase','fishesoftexas'};
  comment.Wwi = 'based on  0.00759*Lp^3.09, see F1';
data.Wwi = 124;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';        bibkey.Wwi = {'fishbase','fishesoftexas'};
  comment.Wwi = 'based on  0.00759*Li^3.09, see F1';

  
data.Ri  = 1e4/365; units.Ri  = '#/d';label.Ri  = 'max reprod rate';    bibkey.Ri  = 'guess';   
  temp.Ri = C2K(21); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

%% univariate data
 
% time-length
data.tL = [ ... % time since birth (yr), std length (cm)
    1 12.4
    2 14.7
    3 16.4];
data.tL(:,1) = 365 * (1.3 + data.tL(:,1));
data.tL(:,2) = data.tL(:,2)/ 0.79; % convert SL to TL
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'total length'};  
temp.tL = C2K(21);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'fishesoftexas'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 3 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Facts
F1 = 'length-weight: W in g = 0.00759*(TL in cm)^3.09'; 
metaData.bibkey.F1 = 'fishbase';
F2 = 'length-length: SL = 0.79 * TL'; 
metaData.bibkey.F2 = 'fishbase';
metaData.facts = struct('F1',F1, 'F2',F2); 

%% Links
metaData.links.id_CoL = '732LK'; % Cat of Life
metaData.links.id_ITIS = '163870'; % ITIS
metaData.links.id_EoL = '994830'; % Ency of Life
metaData.links.id_Wiki = 'Macrhybopsis_storeriana'; % Wikipedia
metaData.links.id_ADW = 'Macrhybopsis_storeriana'; % ADW
metaData.links.id_Taxo = '179436'; % Taxonomicon
metaData.links.id_WoRMS = '1022042'; % WoRMS
metaData.links.id_fishbase = 'Macrhybopsis-storeriana'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Macrhybopsis_storeriana}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
% 
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.in/summary/Macrhybopsis-storeriana.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
% 
bibkey = 'fishesoftexas'; type = 'Misc'; bib = ...
'howpublished = {\url{http://txstate.fishesoftexas.org/macrhybopsis storeriana.htm}}';  
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
bibkey = 'DietRobe2006'; type = 'Article'; bib = [ ... 
'doi = {10.1111/jfb.12892}, ' ...
'author = {Douglas J. Dieterman and Eric Roberts and Patrick J. Braaten and David L. Galat}, ' ... 
'year = {2006}, ' ...
'title = {Reproductive Development in the Sicklefin Chub in the {M}issouri and {L}ower {Y}ellowstone {R}ivers}, ' ...
'journal = {The Prairie Naturalist}, ' ...
'volume = {28}, ' ...
'pages = {113-130}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

