  function [data, auxData, metaData, txtData, weights] = mydata_Moxostoma_congestum

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Catostomidae';
metaData.species    = 'Moxostoma_congestum'; 
metaData.species_en = 'Grey jumprock'; 

metaData.ecoCode.climate = {'Cfa'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFr'};
metaData.ecoCode.embryo  = {'Fh'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(14); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L_f'}; 

metaData.COMPLETE = 2.3; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman','Starrlight Augustine'};        
metaData.date_subm = [2020 08 29];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2020 08 29]; 

%% set data
% zero-variate data
data.am = 5*365;   units.am = 'd';  label.am = 'life span';                       bibkey.am = 'fishesoftexas';   
  temp.am = C2K(15); units.temp.am = 'K'; label.temp.am = 'temperature';
  comment.am = 'might live longer';

data.Lp = 39.2;  units.Lp = 'cm'; label.Lp = 'total length at puberty';  bibkey.Lp = 'fishesoftexas'; 
  comment.Lp = ' based on SL 9.33 cm and F2';
data.Li = 65;    units.Li = 'cm'; label.Li = 'ultimate total length';           bibkey.Li = 'fishbase';

data.Wwb = 1.9e-3;  units.Wwb = 'g';  label.Wwb = 'wet weight at birth';       bibkey.Wwb = 'ThomBent2015';
  comment.Wwb = 'based on egg diameter of 1.54 mm of Moxostoma_cervinum: pi/6*0.154^3';
data.Wwp = 426; units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';     bibkey.Wwp = {'fishbase','ThomBent2015'};
  comment.Wwp = 'based on 0.00490*Lp^3.10, see F1';
data.Wwi = 2.03e3; units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';       bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00490*Li^3.10, see F1';

data.Ri = 28.6e3/365;   units.Ri = '#/d';  label.Ri = 'max Reprod rate';    bibkey.Ri = 'guess';
  temp.Ri = C2K(14); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on same relative fecundity, compared to Moxostoma_macrolepidotum: 44e3*(65/75)^3';

% univariate data

% time-length
data.tL_B = [ ... % year class (yr), total length (cm)
    1 13.6
    2 26.2
    3 34.4
    4 40.6];
data.tL_B(:,1) = 365 * (0 + data.tL_B(:,1));
units.tL_B = {'d', 'cm'}; label.tL_B = {'time since birth', 'total length', 'Black River'};  
temp.tL_B = C2K(14);  units.temp.tL_B = 'K'; label.temp.tL_B = 'temperature';
bibkey.tL_B = 'ZymoProp2007';
comment.tL_B = 'Data from Black River';
%
data.tL_S = [ ... % year class (yr), total length (cm)
    1 17.4
    2 28.7
    3 40.0
    4 43.0];
data.tL_S(:,1) = 365 * (0 + data.tL_S(:,1));
units.tL_S = {'d', 'cm'}; label.tL_S = {'time since birth', 'total length', 'Six Mile Lake'};  
temp.tL_S = C2K(14);  units.temp.tL_S = 'K'; label.temp.tL_S = 'temperature';
bibkey.tL_S = 'ZymoProp2007';
comment.tL_S = 'Data from Six Mile Lake';
%
data.tL_P = [ ... % year class (yr), total length (cm)
    1 13.7
    2 28.2
    3 38.0
    4 41.0];
data.tL_P(:,1) = 365 * (0 + data.tL_P(:,1));
units.tL_P = {'d', 'cm'}; label.tL_P = {'time since birth', 'total length', 'Little Pecos River'};  
temp.tL_P = C2K(14);  units.temp.tL_P = 'K'; label.temp.tL_P = 'temperature';
bibkey.tL_P = 'ZymoProp2007';
comment.tL_P = 'Data from Little Pecos River';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_B = 3 * weights.tL_B;
weights.tL_S = 3 * weights.tL_S;
weights.tL_P = 3 * weights.tL_P;
weights.Li = 5 * weights.Li;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.v = 3 * weights.psd.v;
weights.psd.p_M = 3 * weights.psd.p_M;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_S','tL_B','tL_P'}; subtitle1 = {'Data from Six Mile Lake, Black & Little Pecos River'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed not to differ from females';
D2 = 'Temperatures are guessed';
metaData.discussion = struct('D1', D1, 'D2', D2);

%% Facts
F1 = 'length-weight: Ww in g = 0.00490 * (TL in cm)^3.10'; 
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'length-length from photo: SL = 0.85 * TL'; 
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '6S2VM'; % Cat of Life
metaData.links.id_ITIS = '163931'; % ITIS
metaData.links.id_EoL = '204287'; % Ency of Life
metaData.links.id_Wiki = 'Moxostoma_congestum'; % Wikipedia
metaData.links.id_ADW = 'Moxostoma_congestum'; % ADW
metaData.links.id_Taxo = '180407'; % Taxonomicon
metaData.links.id_WoRMS = '1021624'; % WoRMS
metaData.links.id_fishbase = 'Moxostoma-congestum'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Moxostoma_congestum}}';  
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
bibkey = 'ZymoProp2007'; type = 'techreport'; bib = [ ...  
'author = {Nikolas D. Zymonas and David L. Propst}, ' ...
'year = {2007}, ' ...
'title = {Ecology of blue sucker and gray redhorse in the lower Pecos River, New Mexico 2000-2006}, ' ... 
'institution = {Conservation Services Division New Mexico Department of Game and Fish Santa Fe, NM}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Moxostoma-congestum.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishesoftexas'; type = 'Misc'; bib = ...
'howpublished = {\url{http://txstate.fishesoftexas.org/moxostoma congestum.htm}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ThomBent2015'; type = 'Article'; bib = [ ...  
'author = {Dezarai A. Thompson and John S. Bentley and Steven L. Powers}, ' ...
'year = {2015}, ' ...
'title = {Life-history Aspects of \emph{Moxostoma cervinum} (Blacktip Jumprock) in the {R}oanoke River, {V}irginia}, ' ... 
'journal = {Virginia Journal of Science}, ' ...
'volume = {66(4)}, '...
'pages = {391-401}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

