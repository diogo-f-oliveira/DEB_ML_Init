function [data, auxData, metaData, txtData, weights] = mydata_Clarias_anguillaris

%% set metaData

metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Siluriformes'; 
metaData.family     = 'Clariidae';
metaData.species    = 'Clarias_anguillaris'; 
metaData.species_en = 'Mudfish'; 

metaData.ecoCode.climate = {'Am'};
metaData.ecoCode.ecozone = {'TPa'};
metaData.ecoCode.habitat = {'0iFr'};
metaData.ecoCode.embryo  = {'Fs'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'biCi', 'biCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(29.5); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 07 23];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 07 23];

%% set data
% zero-variate data;

data.ab = 1.5;      units.ab = 'd';    label.ab = 'age at birth';  bibkey.ab = 'guess';
  temp.ab = C2K(29.5);  units.temp.ab = 'K'; label.temp.ab = 'temperature';  
data.am = 15*365;     units.am = 'd';    label.am = 'life span';     bibkey.am = 'guess';
  temp.am = C2K(29.5);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 13.5;   units.Lp  = 'cm';	label.Lp  = 'total length at puberty';    bibkey.Lp  = 'guess'; 
  comment.Lp = 'based on Clarias_gariepinus: (150/60e3)^(1/3)*100 cm';
data.Li  = 100;   units.Li  = 'cm';	label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase'; 
  
data.Wwb = 1.2e-3; units.Wwb = 'g';	label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'guess'; 
  comment.Wwb = 'based on egg diameter of 1.3 mm of Clarias_gariepinus: pi/6*0.13^3';
data.Wwp = 18;   units.Wwp = 'g';	label.Wwp = 'wet weight at puberty';    bibkey.Wwp = {'fishbase','guess'}; 
  comment.Wwp = 'based on 0.00794*Lp^2.97, see F1';
data.Wwi = 6.9e3; units.Wwi = 'g';	label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00794*Li^2.97, see F1';

data.Ri = 391*6.9e3/365; units.Ri = '#/d';  label.Ri = 'max reprod rate';          bibkey.Ri = 'EkeOdo2017';
  temp.Ri = C2K(29.5); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on relative fecundity of 391.26 #/g';
 
% uni-variate data
% time-length
data.tL = [ ... % time since birth (yr), total length (cm)
0    0.260
1	32.683
2	47.750
3	61.770];
data.tL(:,1) = 365 * data.tL(:,1); % convert yr to d
units.tL   = {'d', 'cm'};  label.tL = {'time', 'total length'};  bibkey.tL = 'MeroHech1988';
temp.tL    = C2K(29.5);  units.temp.tL = 'K'; label.temp.tL = 'temperature';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.ab = 0 * weights.ab;
weights.Li = 3 * weights.Li;
weights.Wwi = 3 * weights.Wwi;
weights.Wwb = 3 * weights.Wwb;
weights.Ri = 3 * weights.Ri;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed to not differ from females';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.00794*(TL in cm)^2.97';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = 'VR9C'; % Cat of Life
metaData.links.id_ITIS = '681159'; % ITIS
metaData.links.id_EoL = '207613'; % Ency of Life
metaData.links.id_Wiki = 'Clarias_anguillaris'; % Wikipedia
metaData.links.id_ADW = 'Clarias_anguillaris'; % ADW
metaData.links.id_Taxo = '171381'; % Taxonomicon
metaData.links.id_WoRMS = '581700'; % WoRMS
metaData.links.id_fishbase = 'Clarias-anguillaris'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Clarias_anguillaris}}';
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
bibkey = 'MeroHech1988'; type = 'Misc'; bib = [ ... 
'title = {Growth of African freshwater fishes},'...
'author = {B. de Merona and T. Hecht and J. Moreau},'...
'year = {1988},'...
'howpublished = {\url{https://horizon.documentation.ird.fr/exl-doc/pleins_textes/pleins_textes_5/pt5/travaux_d/26396.pdf}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EkeOdo2017'; type = 'Misc'; bib = [ ... 
'doi = {10.4172/2150-3508.1000229}, ' ...
'title = {Fecundity and Condition Factor of \emph{Clarias anguillaris} of {O}guta {L}ake, {N}igeria},'...
'author = {Eke, F.N. and Odo, G.E. and Agwu, J.E. and Anya, C.B. },'...
'year = {2017},'...
'journal = {Fish Aqua J}', ... 
'volume = {8}, ' ...
'pages = {229}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.de/summary/Clarias-anguillaris.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
