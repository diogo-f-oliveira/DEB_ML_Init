  function [data, auxData, metaData, txtData, weights] = mydata_Stolephorus_waitei
%% set other metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Clupeiformes'; 
metaData.family     = 'Engraulidae';
metaData.species    = 'Stolephorus_waitei'; 
metaData.species_en = 'Spotty-face anchovy'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MI', 'MPSW'};
metaData.ecoCode.habitat = {'piMpe', '0jFr'};
metaData.ecoCode.embryo  = {'Fg'};
metaData.ecoCode.migrate = {'Mda'};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(28.5); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 
metaData.COMPLETE = 2.3; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 06 08];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 06 08];

%% set data
% zero-variate data
data.ab = 3; units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'guess';   
  temp.ab = C2K(28.5);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 1.53*365; units.am = 'd';    label.am = 'life span';  bibkey.am = 'DoddRame2002';   
  temp.am = C2K(28.5);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 8.4;     units.Lp = 'cm';   label.Lp = 'total length at puberty';bibkey.Lp = 'guess';
data.Li = 11.7;     units.Li = 'cm';   label.Li = 'ultimate total length';  bibkey.Li = 'DoddRame2002';
  comment.Li = 'fishbase gives 9.4 cm';

data.Wwb = 1.8e-4;   units.Wwb = 'g';    label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'DoddRame2002';
  comment.Wwb = 'based on egg diameter of 0.7 mm: pi/6*0.07^3';
data.Wwp = 3.45;   units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'guess';
  comment.Wwp = 'based on 0.00501*Lp^3.07, see F1';
data.Wwi = 9.53;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00501*Li^3.07, see F1';

data.Ri  = 2436/365; units.Ri  = '#/d';label.Ri  = 'max reprod rate';    bibkey.Ri  = 'DoddRame2002';   
  temp.Ri = C2K(28.4); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data
% length at t, length at t+dt
data.LL = [ ... % total length at t (cm), total length at t + 1 mnth (cm)
1.861	3.307
3.338	4.514
4.634	5.584
5.681	6.584
6.567	7.358
7.477	8.154
8.184	8.926
8.977	9.406
9.432	9.815
9.772	10.043
9.932	10.248
10.182	10.498];
units.LL = {'cm', 'cm'};  label.LL = {'total length at t', 'total length at t+30d'};  
  temp.LL = C2K(28.4);  units.temp.LL = 'K'; label.temp.LL = 'temperature'; 
bibkey.LL = 'DoddRame2002';

%% set weights for all real data
weights = setweights(data, []);
weights.LL = weights.LL * 3;
weights.Li = weights.Li * 3;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'males are assumed not to differ from females';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.00501*(TL in cm)^3.07'; 
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '52TDN'; % Cat of Life
metaData.links.id_ITIS = '551399'; % ITIS
metaData.links.id_EoL = '46562656'; % Ency of Life
metaData.links.id_Wiki = 'Stolephorus_waitei'; % Wikipedia
metaData.links.id_ADW = 'Stolephorus_waitei'; % ADW
metaData.links.id_Taxo = '188306'; % Taxonomicon
metaData.links.id_WoRMS = '212282'; % WoRMS
metaData.links.id_fishbase = 'Stolephorus-waitei'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/wiki/Stolephorus_waitei}}';  
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
bibkey = 'DoddRame2002'; type = 'Article'; bib = [ ... 
'author = {M. Doddamani and T.J. Ramesha and M.T. Laxmipathi and T.S. Annappaswamy and S.L. Shanbhogue}, ' ...
'year = {2002}, ' ...
'title = {Reproductive potential and growth of \emph{Stolephorus bataviensis} from {D}akshina {K}annada coast}, ' ... 
'journal = {Indian J. Fish.}, ' ...
'volume = {49(3}, '...
'pages = {321-325}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Stolephorus-waitei}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
  