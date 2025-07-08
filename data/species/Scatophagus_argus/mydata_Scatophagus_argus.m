function [data, auxData, metaData, txtData, weights] = mydata_Scatophagus_argus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Scatophagiformes'; 
metaData.family     = 'Scatophagidae';
metaData.species    = 'Scatophagus_argus'; 
metaData.species_en = 'Spotted scat'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MI', 'MPW'};
metaData.ecoCode.habitat = {'0jMp', 'jiMr', 'jiFm', 'jiMm'};
metaData.ecoCode.embryo  = {'Mp', 'Fp'};
metaData.ecoCode.migrate = {'Ma'};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(26); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'}; 
metaData.data_1     = {'t-L';'L-N'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};
metaData.date_subm = [2017 04 12]; 
metaData.email    = {'bas.kooijman@vu.nl'}; 
metaData.address  = {'VU University Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2017 04 12]; 

%% set data
% zero-variate data

data.am = 10*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(26);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 14.5; units.Lp  = 'cm';  label.Lp  = 'total length at puberty in females'; bibkey.Lp  = 'Gupt2016'; 
data.Lpm  = 12.5; units.Lpm  = 'cm';  label.Lpm  = 'total length at puberty in males'; bibkey.Lpm  = 'Gupt2016'; 
data.Li  = 38;  units.Li  = 'cm';  label.Li  = 'ultimate total length'; bibkey.Li  = 'fishbase';

data.Wwb = 2.2e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'fishbase';
  comment.Wwb = 'based egg diameter of 0.75 mm: 4/3*pi*0.0375^3'; 
data.Wwp = 93; units.Wwp = 'g';   label.Wwp = 'wet weight at puberty of female';   bibkey.Wwp = 'Gupt2016';
  comment.Wwp = 'based on 0.0377 * Lp^2.922, see F1';
data.Wwpm = 60.5; units.Wwpm = 'g';   label.Wwpm = 'wet weight at puberty of male';   bibkey.Wwpm = 'Gupt2016';
  comment.Wwpm = 'based on 0.0377 * Lpm^2.922, see F1';
data.Wwi = 1558; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.0377 * Li^2.922, see F1';

% uni-variate data
% t-L data 
data.tL = [ ... % time since birth (yr), total length (cm)
0.768	15.285
0.779	15.625
1.013	18.546
1.021	19.293
1.066	19.225
1.321	22.418
1.536	24.456
1.833	25.679];
data.tL(:,1) = 365 * data.tL(:,1);  % convert yr to d
units.tL     = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL      = C2K(26);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Gand1998';

% length-fecundity
data.LN = [ ... % total length (cm), fecundity (1e3 eggs)
19.898	115.429
22.381	121.156
23.368	116.420
23.903	130.907
24.418	117.382
24.428	123.317
24.431	125.453
24.851	119.286
24.923	130.207
25.975	132.118
25.989	124.522
26.471	123.816
26.473	125.003
26.907	127.144
27.475	129.050
27.998	136.178
28.526	130.487
28.969	138.563
29.016	134.054
30.044	154.244];
data.LN(:,2) = 1e3 * data.LN(:,2); % convert 1e3 eggs to eggs
units.LN   = {'cm', '#'};  label.LN = {'total length', 'fecundity'};  
temp.LN    = C2K(26);  units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = 'Gand1998';


%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'males are assumed to differ from females by {E_Hp}  only';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'weight-length relationship: W = 0.0377 * (TL in cm)^2.922';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Marine; freshwater; brackish; reef-associated; amphidromous; depth range 0 - 5 m. Tropical; 20 C - 28 C';
metaData.bibkey.F2 = 'fishbase';
metaData.facts = struct('F1',F1,'F2',F2);

%% Links
metaData.links.id_CoL = '4V435'; % Cat of Life
metaData.links.id_ITIS = '170321'; % ITIS
metaData.links.id_EoL = '46577199'; % Ency of Life
metaData.links.id_Wiki = 'Scatophagus_argus'; % Wikipedia
metaData.links.id_ADW = 'Scatophagus_argus'; % ADW
metaData.links.id_Taxo = '45387'; % Taxonomicon
metaData.links.id_WoRMS = '276970'; % WoRMS
metaData.links.id_fishbase = 'Scatophagus-argus'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Scatophagus_argus}}';
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
bibkey = 'Gupt2016'; type = 'Article'; bib = [ ... 
'author = {S. Gupta}, ' ... 
'year = {2016}, ' ...
'title = {An Overview on Morphology, Biology, and Culture of Spotted Scat \emph{Scatophagus argus} ({L}innaeus 1766)}, ' ...
'journal = {Reviews in Fisheries Science \& Aquaculture}, ' ...
'volume = {24}, ' ...
'pages = {203-212}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/4698}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Gand1998'; type = 'Phdthesis'; bib = [ ... 
'author = {Gandhi, V.}, ' ... 
'year = {1998}, ' ...
'title = {Studies on the ecology and biology of butterfish \emph{Scatophagus argus} in {M}andapam coastal region}, ' ...
'school = {Madurai Kamaraj University, Madurai}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

