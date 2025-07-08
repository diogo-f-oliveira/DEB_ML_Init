  function [data, auxData, metaData, txtData, weights] = mydata_Chirocentrus_nudus

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Clupeiformes'; 
metaData.family     = 'Chirocentridae';
metaData.species    = 'Chirocentrus_nudus'; 
metaData.species_en = 'Whitefin wolf herring'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MIE', 'MPW'};
metaData.ecoCode.habitat = {'0iMpe'};
metaData.ecoCode.embryo  = {'Mpe'};
metaData.ecoCode.migrate = {'Ma'};
metaData.ecoCode.food    = {'biPz', 'jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(25); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2023 08 22];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 08 22];

%% set data
% zero-variate data
data.ab = 2;      units.ab = 'd';    label.ab = 'age at birth';         bibkey.ab = 'Dels1930'; 
  temp.ab = C2K(27); units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'temp EOL: 26-29C; Dels1930: probably 1.5 or 2 d';
data.ap = 8*30.5;    units.ap = 'd';    label.ap = 'age at puberty';       bibkey.ap = 'AbduPill2011';
  temp.ap = C2K(25); units.temp.ap = 'K'; label.temp.ap = 'temperature';
  comment.ap = 'read from growth curve for Lp';
data.am = 13*365; units.am = 'd';    label.am = 'life span';              bibkey.am = 'fishbase';   
  temp.am = C2K(25); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lb = 0.68;   units.Lb = 'cm';   label.Lb = 'total length at birth';  bibkey.Lb = 'guess';
  comment.Lb = 'based on Chirocentrus_dorab, which is very similar';
data.Lp = 43.4;   units.Lp = 'cm';   label.Lp = 'total length at puberty for female'; bibkey.Lp = 'AbduPill2011'; 
data.Lpm = 41.7;   units.Lpm = 'cm';   label.Lpm = 'total length at puberty for male'; bibkey.Lpm = 'AbduPill2011'; 
data.Li = 100;    units.Li = 'cm';   label.Li = 'ultimate total length';  bibkey.Li = 'guess';
  comment.Li = 'based on Chirocentrus_dorab, which is very similar';
data.Lim = 100;    units.Lim = 'cm';   label.Lim = 'ultimate total length';  bibkey.Lim = 'guess';
  comment.Lim = 'based on Chirocentrus_dorab, which is very similar';

data.Wwi = 1200;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'guess';
  comment.Wwi = 'based on Chirocentrus_dorab, which is very similar. Fishbase gives 410 g as max published weight; Fact F1 leads to 5750 g';
  
data.Ri = 60268/365;   units.Ri = '#/d';  label.Ri = 'reprod rate at TL 58.7 cm';    bibkey.Ri = 'AbduPill2011'; 
  temp.Ri = C2K(25); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data 
% time-length
data.tL = [ ... % time since birth (yr), total length (cm)
0.15 12.3
0.3  21.4
0.34 24.3
0.53 34.8
1    54.2
2    78.2
3    89.4
4    94.4];
data.tL(:,1) = data.tL(:,1) * 365; % convert yr to d
units.tL = {'d', 'cm'};     label.tL = {'time since birth', 'total length'};  
  temp.tL = C2K(25); units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'AbduPill2011'; 
 
%% set weights for all real data
weights = setweights(data, []);
weights.tL = 3 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.1;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} and E_Hp only';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'weight-length: weight (g) = 0.00575 * (TL in cm)^3';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '5Y4T7'; % Cat of Life
metaData.links.id_ITIS = '161884'; % ITIS
metaData.links.id_EoL = '46562711'; % Ency of Life
metaData.links.id_Wiki = 'Chirocentrus'; % Wikipedia
metaData.links.id_ADW = 'Chirocentrus_nudus'; % ADW
metaData.links.id_Taxo = '170842'; % Taxonomicon
metaData.links.id_WoRMS = '212258'; % WoRMS
metaData.links.id_fishbase = 'Chirocentrus-nudus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Chirocentrus_nudus}}';  
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
bibkey = 'Rich2008'; type = 'Book'; bib = [ ...    
'author = {W. J. Richards}, ' ...
'year  = {2008}, ' ...
'title = {Identification Guide of The early life history stages of fishes from the Waters of {K}uwait in the {A}rabian {G}ulf, {I}ndian {O}cean}, ' ...  
'publisher = {Kuwait Institute for Scientific Research}, ' ...
'ISBN = {978-99906-41-94-3}, ' ...
'address = {P.O.Box 24885, 13109 Safat, Kuwait}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AbduPill2011'; type = 'Article'; bib = [ ...    
'author = {E. M. Abdussamad and N. G. K. Pillai and P. U. Zacharia AND K. Jeyabalan}, ' ...
'year  = {2011}, ' ...
'title = {Dorab fishery of {G}ulf of {M}annar waters and population characteristics of the species \emph{Chirocentrus dorab} (Forsk\r{a}l, 1775) and \emph{Chirocentrus nudus} {S}wainson, 1839}, ' ...  
'journal = {Indian J. Fish.}, ' ...
'volume = {58}, ' ...
'pages = {19--23}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EOL'; type = 'Misc'; bib = ...
'howpublished = {\url{https://eol.org/pages/46562711}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Chirocentrus-nudus}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

