function [data, auxData, metaData, txtData, weights] = mydata_Ulvaria_subbifurcata

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Stichaeidae';
metaData.species    = 'Ulvaria_subbifurcata'; 
metaData.species_en = 'Radiated shanny'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MANE'};
metaData.ecoCode.habitat = {'biMd'};
metaData.ecoCode.embryo  = {'Mnm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(6.4); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2023 12 08];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2023 12 08];

%% set data
% zero-variate data
data.ab = 35; units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'LeDrGree1975';   
  temp.ab = C2K(7);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'temp increased from 4 to 9 C during incubation';
data.am = 11*365; units.am = 'd';    label.am = 'life span';              bibkey.am = 'LeDrGree1975';   
  temp.am = C2K(6.4);  units.temp.am = 'K'; label.temp.am = 'temperature';
  comment.am = 'based on tL data';

data.Lp = 9;     units.Lp = 'cm';   label.Lp = 'std length at puberty'; bibkey.Lp = 'guess';
data.Li = 18;  units.Li = 'cm';   label.Li = 'ultimate std length';  bibkey.Li = 'fishbase';

data.Wwb = 1.9e-3;  units.Wwb = 'g';    label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'LeDrGree1975';
  comment.Wwb = 'based on egg diameter of 1.55 mm: pi/6*0.155^3';
data.Wwp = 3.9;   units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.00380*Lp^3.16, see F1';
data.Wwi = 35.2;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00380*Li^3.16, see F1';
 
data.Ri = 1512/365; units.Ri = '#/d';  label.Ri = 'max reproduction rate';    bibkey.Ri = 'LeDrGree1975';
  temp.Ri = C2K(6.4); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data

% time-length
data.tL_fm = [ ... % time since birth (yr), total length (cm)
  1	 3.820  4.129
  2	 5.522  5.632
  3	 7.157  7.311
  4	 8.417  9.498
  5	 9.942 10.891
  6	10.761 11.136
  7	10.719 13.323
 10 NaN    15.426];
data.tL_fm(:,1) = (0 + data.tL_fm(:,1)) * 365; % convert yr to d
units.tL_fm = {'d', 'cm'};  label.tL_fm = {'time since birth', 'total length'};  
  temp.tL_fm = C2K(6.4);  units.temp.tL_fm = 'K'; label.temp.tL_fm = 'temperature';
  treat.tL_fm = {1 {'females','males'}};
bibkey.tL_fm = 'LeDrGree1975';

% length-weight
data.LW = [ ... % total length (cm), weight (g)
 2.983	 0.374
 4.106	 0.711
 5.022	 1.148
 5.909	 1.683
 6.885	 2.660
 7.921	 4.030
 8.869	 5.598
 9.818	 7.755
10.857	10.601
11.837	12.955
12.848	16.982
14.823	30.051];
units.LW = {'cm', 'g'};  label.LW = {'total length','weight'};  
bibkey.LW = 'LeDrGree1975';

%% set weights for all real data
weights = setweights(data, []);
weights.Wwb = weights.Wwb * 5;
weights.Wwi = weights.Wwi * 5;
weights.Li = weights.Li * 5;
weights.tL_fm = weights.tL_fm * 3;
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
D1 = 'males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.00380*(TL in cm)^3.16'; 
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '7DGS5'; % Cat of Life
metaData.links.id_ITIS = '171616'; % ITIS
metaData.links.id_EoL = '46574611'; % Ency of Life
metaData.links.id_Wiki = 'Ulvaria_subbifurcata'; % Wikipedia
metaData.links.id_ADW = 'Ulvaria_subbifurcata'; % ADW
metaData.links.id_Taxo = '189708'; % Taxonomicon
metaData.links.id_WoRMS = '159821'; % WoRMS
metaData.links.id_fishbase = 'Ulvaria-subbifurcata'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/wiki/Ulvaria_subbifurcata}}';  
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
bibkey = 'LeDrGree1975'; type = 'Article'; bib = [ ...
'doi = {10.1111/j.1095-8649.1975.tb04623.x}, ' ...
'author = {Bevin R. LeDrew and John M. Green}, ' ...
'year = {1975}, ' ...
'title = {Biology of the radiated shanny \emph{Ulvaria subbifurcata} {S}torer in {N}ewfoundland ({P}isces: {S}tichaeidae)}, ' ... 
'journal = {Fish Biology}, ' ...
'volume = {7(4)}, '...
'pages = {485–495}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Ulvaria-subbifurcata.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

