  function [data, auxData, metaData, txtData, weights] = mydata_Hypostomus_albopunctatus
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Siluriformes'; 
metaData.family     = 'Loricariidae';
metaData.species    = 'Hypostomus_albopunctatus'; 
metaData.species_en = 'Armored catfish'; 

metaData.ecoCode.climate = {'A'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'biFr'};
metaData.ecoCode.embryo  = {'Fnf'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(24.5); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'; 't-Ww'}; 
metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 10 22];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 10 22];

%% set data
% zero-variate data
data.ab = 6; units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'guess';   
  temp.ab = C2K(24.5);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 8*365; units.am = 'd';    label.am = 'life span';              bibkey.am = 'guess';   
  temp.am = C2K(24.5);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 20;     units.Lp = 'cm';   label.Lp = 'total length at puberty';bibkey.Lp = 'guess';
data.Li = 40;     units.Li = 'cm';   label.Li = 'ultimate total length';  bibkey.Li = 'fishbase';

data.Wwb = 5.2e-4;  units.Wwb = 'g';    label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 1 mm: pi/6*0.1^3';
data.Wwp = 82;   units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';    bibkey.Wwp = {'fishbase','guess'};
  comment.Wwp = 'based on 0.00912*Lp^3.04, see F1';
data.Wwi = 676.5;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'base on 0.00912*Li^3.04, see F1; max published weight 991 g';
  
data.Ri  = 36e3/365; units.Ri  = '#/d'; label.Ri  = 'max reprod rate'; bibkey.Ri = 'guess';   
  temp.Ri = C2K(28); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on fecundity of Rineloricaria_aequalicuspis: 12*202*676.5/26.9';
  
% uni-variate data

% time-length
data.tL_fm = [ ... % time since birth (yr), total length (cm)
0	11.297 10.541
1	13.497 13.555
2	16.743 16.393
3   NaN    20.515
4	23.993 23.120
5	25.376 25.960
6	26.411 27.226
7   NaN    29.250
8	29.293 31.216];	
data.tL_fm(:,1) = (1.3 + data.tL_fm(:,1)) * 365; % convert yr to d
units.tL_fm = {'d', 'cm'};  label.tL_fm = {'time since birth', 'total length'};  
  temp.tL_fm = C2K(24.5);  units.temp.tL_fm = 'K'; label.temp.tL_fm = 'temperature';
  treat.tL_fm = {1, {'females','males'}};
bibkey.tL_fm = 'AntoRanz1985';
comment.tL_fm = 'data for june 1974 - may 1975';

% time-weight
data.tW_fm = [ ... % time since birth (yr), weight (g)
0	 19.770  19.084
1	 36.204  31.433
2	 57.414  62.861
3    93.619  99.064
4	150.259 154.342
5	195.995 202.130
6	221.975 244.460
7   288.838 306.553
8	346.856 367.285];	
data.tW_fm(:,1) = (1.3 + data.tW_fm(:,1)) * 365; % convert yr to d
units.tW_fm = {'d', 'g'};  label.tW_fm = {'time since birth', 'weight'};  
  temp.tW_fm = C2K(24.5);  units.temp.tW_fm = 'K'; label.temp.tW_fm = 'temperature';
  treat.tW_fm = {1, {'females','males'}};
bibkey.tW_fm = 'AntoRanz1985';
comment.tW_fm = 'data for june 1974 - may 1975';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_fm= weights.tL_fm * 5;
weights.tW_fm= weights.tW_fm * 5;
weights.Wwi= weights.Wwi * 3;
weights.Wwb= weights.Wwb * 3;
weights.ab = weights.ab * 0;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} and E_Hp only';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.00912*(TL in cm)^3.04'; 
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '3NZ5X'; % Cat of Life
metaData.links.id_ITIS = '680136'; % ITIS
metaData.links.id_EoL = '214685'; % Ency of Life
metaData.links.id_Wiki = 'Hypostomus_albopunctatus'; % Wikipedia
metaData.links.id_ADW = 'Hypostomus_albopunctatus'; % ADW
metaData.links.id_Taxo = '177208'; % Taxonomicon
metaData.links.id_WoRMS = '1438502'; % WoRMS
metaData.links.id_fishbase = 'Hypostomus-albopunctatus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/wiki/Hypostomus_albopunctatus}}';  
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
bibkey = 'AntoRanz1985'; type = 'article'; bib = [ ... 
'author = {Antoniutti, D.M. and M.J.T. Ranzani-Paiva and H.M. Godinho and P. de Paiva}, ' ... 
'year = {1985}, ' ...
'title = {Rela\c{c}\~{a}o peso total/comprimento total, crescimento e idade do cascudo \emph{Plecostomus albopunctatus} {R}egan, 1908 ({O}steichthyes, {L}oricariidae) do {R}io {J}aguari, {S}\~{a}o {P}aulo, {B}rasil}, ' ...
'institution = {Boletim do Instituto de Pesca}, ' ...
'volume = {12(4)}, ' ...
'pages = {105-120}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Hypostomus-albopunctatus.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

