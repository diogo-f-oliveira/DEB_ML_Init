function [data, auxData, metaData, txtData, weights] = mydata_Cottus_carolinae

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Cottidae';
metaData.species    = 'Cottus_carolinae'; 
metaData.species_en = 'Banded sculpin'; 

metaData.ecoCode.climate = {'Cfa','Dfa'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFr','0iFl'};
metaData.ecoCode.embryo  = {'Fnm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(13); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman','Starrlight Augustine'};    
metaData.date_subm = [2020 08 25];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2020 08 25];


%% set data
% zero-variate data

data.am = 4 * 365; units.am = 'd';   label.am = 'life span';                 bibkey.am = 'ADW';   
  temp.am = C2K(13);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 9.5;     units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'GebhPerk2017'; 
data.Li  = 18;      units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase';

data.Wwb = 6.4e-3;     units.Wwb = 'g';   label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'GebhPerk2017';
  comment.Wwb = 'based on egg diameter of 2.3 mm : pi/6*0.23^3';
data.Wwp = 8.1;  units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';     bibkey.Wwp = {'fishbase','GebhPerk2017'};
  comment.Wwp = 'based on 0.00708*Lp^3.13, see F1';
data.Wwi = 60.1;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00708*Li^3.13, see F1';

data.Ri = 475/365; units.Ri = '#/d'; label.Ri = 'reproduction rate'; bibkey.Ri = 'ADW';
  temp.Ri = C2K(13); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data
% time-length
data.tL = [ ... % total length (cm), time (d), 
3.245	 0.000
4.212	28.523
4.727	61.154
4.959	90.665
5.077	119.733
6.271	151.891
6.503	182.296
6.734	210.018
7.249	242.649
7.650	272.154
7.881	302.112
8.623	334.734
8.056	365
8.576	365+60.116
8.684	365+30.146
9.039	365+120.927
9.091	365+89.617
10.182	365+181.265
10.413	365+212.117
10.516	365+152.180
11.098	365+242.506];
data.tL = data.tL(:,[2 1]);
data.tL(:,1) = (150 + data.tL(:,1)); % set origin at birth
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'total length'};  
temp.tL = C2K(13);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'GebhPerk2017';
comment.tL = 'data from frequency distributions';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = weights.tL * 3;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed not to differ from females';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.00708*(TL in cm)^3.13'; 
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = 'YYG7'; % Cat of Life
metaData.links.id_ITIS = '167239'; % ITIS
metaData.links.id_EoL = '204556'; % Ency of Life
metaData.links.id_Wiki = 'Cottus_carolinae'; % Wikipedia
metaData.links.id_ADW = 'Cottus_carolinae'; % ADW
metaData.links.id_Taxo = '172055'; % Taxonomicon
metaData.links.id_WoRMS = '1044999'; % WoRMS
metaData.links.id_fishbase = 'Cottus-carolinae'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Cottus_carolinae}}';
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
bibkey = 'GebhPerk2017'; type = 'Article'; bib = [ ... 
'doi = {10.1007/s10641-017-0651-9}, ' ...
'author = {Amy E. Gebhard and Joshuah S. Perkin}, ' ... 
'year = {2017}, ' ...
'title = {Assessing riverscape-scale variation in fish life history using banded sculpin (\emph{Cottus carolinae})}, ' ...
'journal = {Environ Biol Fish}, ' ...
'volume = {100}, ' ...
'pages = {1397-1410}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Cottus_carolinae.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{https://animaldiversity.org/accounts/Cottus_carolinae/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

