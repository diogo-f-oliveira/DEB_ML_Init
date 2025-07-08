function [data, auxData, metaData, txtData, weights] = mydata_Benthosema_glaciale
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Myctophiformes'; 
metaData.family     = 'Myctophidae';
metaData.species    = 'Benthosema_glaciale'; 
metaData.species_en = 'Glacier lanternfish'; 
metaData.ecoCode.climate = {'MA', 'MB', 'MC', 'ME'};
metaData.ecoCode.ecozone = {'MAN', 'MN'};
metaData.ecoCode.habitat = {'0jMpe', 'jiMp'};
metaData.ecoCode.embryo  = {'Mpe'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};
metaData.T_typical  = C2K(5.1); % in K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.3; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman','Starrlight Augustine'}; 
metaData.date_subm = [2019 01 26]; 
metaData.email    = {'bas.kooijman@vu.nl'}; 
metaData.address  = {'VU University, Amsterdam'};

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2019 01 26]; 

%% set data
% zero-variate data
data.am = 8*365; units.am = 'd';    label.am = 'life span';                   bibkey.am = 'fishbase';  
  temp.am = C2K(5.1); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 7.5;   units.Lp = 'cm';   label.Lp = 'standard length at puberty';  bibkey.Lp = 'guess';
data.Li = 10.3;   units.Li = 'cm';   label.Li = 'ultimate standard length';    bibkey.Li = 'fishbase';

data.Wwb = 5.2e-4; units.Wwb = 'g'; label.Wwb = 'wet weight at birth';       bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 1 mm: pi/6*0.1^3 for Benthosema_suborbitale';
data.Wwp = 5.3; units.Wwp = 'g'; label.Wwp = 'wet weight at puberty';       bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.01023*Lp^3.10, see F3';
data.Wwi = 14.1; units.Wwi = 'g'; label.Wwi = 'ultimate wet weight';       bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01023*Li^3.10, see F3';
  
data.Ri = 550/365; units.Ri = '#/d';  label.Ri = 'max reprod rate ';         bibkey.Ri = 'guess';
  temp.Ri = C2K(5.1); units.temp.Ri = 'K'; label.temp.Ri = 'temperature'; 
  comment.Ri = 'based on kap=0.95';

% uni-variate data
% tL data
data.tL = [ ... % time since metam (d), standard length (cm) 
38.801	1.618
74.665	1.512
110.814	1.721
139.819	1.984
175.778	1.983
211.868	2.126
242.517	2.218
276.868	2.427
345.890	3.203
383.671	3.228
416.082	3.280
488.345	3.659
522.648	3.816
556.798	3.802
589.411	4.078
625.441	4.156
695.680	4.285
762.632	4.757
834.622	4.834
902.744	4.607
931.689	4.804
967.589	4.737
1005.904	5.355
1036.410	5.288
1104.934	5.510
1174.948	5.388
1245.484	5.847
1309.903	5.502
1346.313	6.002
1382.332	6.067
1447.153	6.170
1522.467	5.943
1591.311	6.521
1665.407	6.940
1725.898	6.226
1835.812	6.485];
units.tL = {'d', 'cm'}; label.tL = {'time since metam', 'standard length'};  
temp.tL = C2K(5.1);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Gjos1973';
comment.tL = 'in view of SL at zero, this time is assumed to be at metam';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 50*weights.tL;
weights.Ri = 0*weights.Ri;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Facts
F1 = 'Preferred temperature 5.1 C';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Differences between males and females are small';
metaData.bibkey.F2 = 'fishbase'; 
F3 = 'length-weight: Ww in g = 0.01023*(SL in cm)^3.10';
metaData.bibkey.F3 = 'fishbase'; 
metaData.facts = struct('F1',F1,'F2',F2,'F3',F3);

%% Acknowledgment
metaData.acknowledgment = 'The creation of this entry was supported by the Norwegian Science Council (NFR 255295)';

%% Links
metaData.links.id_CoL = 'LHZL'; % Cat of Life
metaData.links.id_ITIS = '162680'; % ITIS
metaData.links.id_EoL = '46564028'; % Ency of Life
metaData.links.id_Wiki = 'Benthosema_glaciale'; % Wikipedia
metaData.links.id_ADW = 'Benthosema_glaciale'; % ADW
metaData.links.id_Taxo = '164099'; % Taxonomicon
metaData.links.id_WoRMS = '126580'; % WoRMS
metaData.links.id_fishbase = 'Benthosema-glaciale'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Benthosema_glaciale}}';
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
bibkey = 'Gjos1973'; type = 'article'; bib = [ ...
'doi = {10.1080/00364827.1973.10411227}, ' ...
'author = {Jakob Gj\"{o}s{\ae}ter}, ' ... 
'year   = {1973}, ' ...
'title  = {Age, growth, and mortality of the mygtophid fish, \emph{Benthosema glaciale} ({R}einhardt), from {W}estern {N}orway}, ' ...
'journal = {Sarsia}, ' ...
'page = {1-14}, ' ...
'volume = {52}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Benthosema-glaciale.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

