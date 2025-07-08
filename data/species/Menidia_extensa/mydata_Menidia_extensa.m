function [data, auxData, metaData, txtData, weights] = mydata_Menidia_extensa

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Atheriniformes'; 
metaData.family     = 'Atherinopsidae';
metaData.species    = 'Menidia_extensa'; 
metaData.species_en = 'Waccamaw silverside'; 

metaData.ecoCode.climate = {'Cfa'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFl',};
metaData.ecoCode.embryo  = {'Fpe'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dtfm'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(23.7); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {}; 

metaData.COMPLETE = 2.0; % using criteria of LikaKear2011

metaData.author    = {'Starrlight Augustine'};                             
metaData.date_subm = [2020 06 23];                          
metaData.email     = {'sta@akvaplan.niva.no'};                 
metaData.address   = {'Akvaplan-niva, FRAM, Tromso, Norway'};      

metaData.curator     = {'Bas Kooijman'};
metaData.email_cur   = {'bas.kooijman@vu.nl'}; 
metaData.date_acc    = [2020 06 25]; 


%% set data
% zero-variate data

data.ab = 6;      units.ab = 'd';    label.ab = 'age at birth';              bibkey.ab = 'encyclopedia';   
  temp.ab = C2K(21);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'guessed based on general info on hatch, first feeding of Antheriniformes';
data.tp = 365;     units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'Anon2001';
  temp.tp = C2K(21); units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'temp is guessed';
data.am = 3*365;   units.am = 'd';    label.am = 'life span';                 bibkey.am = 'fishbase';   
  temp.am = C2K(21);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 0.7;    units.Lb  = 'cm';  label.Lb  = 'total length at birth';  bibkey.Lb  = 'encyclopedia'; 
  comment.Lb = 'based on general info on Antherniformes: 6-9 mm';
data.Lp  = 3.5;     units.Lp  = 'cm';  label.Lp  = 'total length at puberty';    bibkey.Lp  = 'guess';
  comment.Lp = 'based on same relative length, compared to M. beryllina: 8*6.5/15 cm';
data.Li  = 6.5;     units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'encyclopedia';

data.Wwb = 2.2e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'EPA2002';
  comment.Wwb = 'based on egg diameter of 0.75 mm: pi/6*0.075^3';
data.Wwp = 0.5; units.Wwp = 'g';   label.Wwp = 'wet weigh at puberty';      bibkey.Wwp = 'guess';
  comment.Wwp = 'based on 0.01122*Lp^3.04, see F3';
data.Wwi = 3.32; units.Wwi = 'g';   label.Wwi = 'ultimate wet weigh';      bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01122*Li^3.04, see F3';
  
data.Ri = 150/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';      bibkey.Ri  = 'Anon2001';   
  temp.Ri = C2K(21); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'temp is guessed'; 

%% set weights for all real data
weights = setweights(data, []);
weights.Lb = 0 * weights.Lb;
weights.Wwi = 5 * weights.Wwi;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Data point Lb is ignorned because of inconsistentcy with Wwb';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'Atheriniform larvae generally are large (0.16-0.35 in; 4-9 mm) at hatching, and although they still possess a yolk sac, they have open mouths and can begin feeding immediately';
metaData.bibkey.F1 = 'encyclopedia';
F2 = 'Menidia repro:  single female-attended by several males-- deposits eggs in aquatic vegetation, and the males leave milt; no courtship has been observed';
metaData.bibkey.F2 = 'encyclopedia';
F3 = 'length-weight: Ww in g  = 0.01122*(TL in cm)^3.04';
metaData.bibkey.F3 = 'fishbase';
F4 = 'sex determination by temperature';
metaData.bibkey.F4 = 'PowlSand2008';
metaData.facts = struct('F1',F1, 'F2',F2, 'F3',F3, 'F4',F4);
 
%% Links
metaData.links.id_CoL = '3ZQL7'; % Cat of Life
metaData.links.id_ITIS = '165997'; % ITIS
metaData.links.id_EoL = '207886'; % Ency of Life
metaData.links.id_Wiki = 'Menidia_extensa'; % Wikipedia
metaData.links.id_ADW = 'Menidia_extensa'; % ADW
metaData.links.id_Taxo = '179845'; % Taxonomicon
metaData.links.id_WoRMS = '1014365'; % WoRMS
metaData.links.id_fishbase = 'Menidia-extensa'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = [...
'howpublished = {\url{https://en.wikipedia.org/wiki/Waccamaw_silverside}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
% 
bibkey = 'fishbase'; type = 'Misc'; bib = [...
'howpublished = {\url{https://www.fishbase.se/summary/Menidia-extensa}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
% 
bibkey = 'encyclopedia'; type = 'Misc'; bib = [...
'howpublished = {\url{https://www.encyclopedia.com/environment/encyclopedias-almanacs-transcripts-and-maps/atheriniformes-rainbowfishes-and-silversides}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
% 
bibkey = 'Anon2001'; type = 'techReport'; bib = [ ... 
'author = {Anonymous}, ' ... 
'year = {2001}, ' ...
'title = {Guide to Federally Listed Endangered and Threatened Species of North Carolina}, ' ...
'institution = {North Carolina Natural Heritage Program, Division of Parks and Recreation, North Carolina Department of Environment and Natural Resources}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EPA2002'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {EPA}, ' ...
'year = {2002}, ' ...
'title  = {Short-term methods for estimating the chronic toxicity of effluents and receiving waters to marine and estuarine organsims}, ' ...
'volume = {EPA-821-R-02-014}, ' ...
'publisher = {U.S. EPA, Washington}'];
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
bibkey = 'PowlSand2008'; type = 'Article'; bib = [ ... 
'doi = {10.1007/s10641-007-9304-8}, ' ...
'author = {Percival M. Powles and Ian M. Sandeman}, ' ... 
'year = {2008}, ' ...
'title = {Growth, summer cohort output, and observations on the reproduction of brook silverside, \emph{Labidesthes sicculus} ({C}ope) in the {K}awartha {L}akes, {O}ntario}, ' ...
'journal = {Environ Biol Fish}, ' ...
'volume = {82}, ' ...
'pages = {421-431}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

